From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [-next] FATAL: drivers/gpu/drm/udl/udl: sizeof(struct
 usb_device_id)=24 is not a modulo of the size of section __mod_usb_device_table=44.
Date: Sat, 16 Jun 2012 21:30:48 +0200
Message-ID: <CAMuHMdWobY63O6jSuET1MzuQ80N8xjJA7ny6n0tCdc29Z3vKpA@mail.gmail.com>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
	<CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
	<20120615231220.GC8205@kroah.com>
	<87lijns84s.fsf@nemi.mork.no>
	<20120616191114.GA10098@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20120616191114.GA10098@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sat, Jun 16, 2012 at 9:11 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Jun 16, 2012 at 03:23:31PM +0200, Bj=C3=B8rn Mork wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> > On Fri, Jun 15, 2012 at 11:02:55PM +0200, Geert Uytterhoeven wrote=
:
>> >
>> >> As "kernel_ulong_t =C2=A0driver_info" is no longer naturally alig=
ned, the
>> >> compiler will
>> >> add implicit padding. But the padding depends on the architecture=
=2E
>> >
>> > Ah, so we were "lucky" before, nice.
>>
>> I don't really believe in luck :-) =C2=A0I think someone has been re=
ally
>> smart here. =C2=A0Maybe too smart...
>
> No, I think the previous structure was just "lucky" in that it just
> happened to be the right alignment. =C2=A0I say this as I think I was=
 the one
> who created that structure years ago. =C2=A0Or maybe not, this was ba=
ck in
> the 2.3 kernel days, I can't remember what patches I wrote last week.=
=2E.
>
>> >> It can be fixed by adding explicit padding. Probably it should be=
 padded by
>> >> 7 bytes (not 3), as kernel_ulong_t may require 8-byte alignment o=
n some 64-bit
>> >> platforms. Or by an explicit alignment attribute.
>> >>
>> >> See also
>> >> =C2=A0 * commit 8175fe2dda1c93a9c596921c8ed4a0b4baccdefe ("HID: f=
ix
>> >> hid_device_id for cross compiling")
>> >> =C2=A0 * commit 7492d4a416d68ab4bd254b36ffcc4e0138daa8ff ("sdio: =
fix module
>> >> device table definition for m68k")
>> >> =C2=A0 * commit 9e2d3cd34a159948dc753a14573e16bffc04dba8 ("[PATCH=
]
>> >> mod_devicetable.h fixes")
>> >
>> > So would the patch below fix this? =C2=A0It should force alignment=
 of the
>> > driver_data field, which is all you want here, right?
>> >
>> >> Still, there's a bug in file2alias (which is compiled by the host
>> >> compiler), in that
>> >> it may use different padding than the target platform when cross-=
compiling.
>> >
>> > That's not good, but outside of this specific issue, right? =C2=A0=
Have we
>> > just been fortunate it hasn't really hit us yet?
>> >
>> > thanks,
>> >
>> > greg k-h
>> >
>> > diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_d=
evicetable.h
>> > index 7771d45..6955045 100644
>> > --- a/include/linux/mod_devicetable.h
>> > +++ b/include/linux/mod_devicetable.h
>> > @@ -122,7 +122,8 @@ struct usb_device_id {
>> > =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bInter=
faceNumber;
>> >
>> > =C2=A0 =C2=A0 /* not matched against */
>> > - =C2=A0 kernel_ulong_t =C2=A0driver_info;
>> > + =C2=A0 kernel_ulong_t =C2=A0driver_info
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __attribute__((aligned(sizeof=
(kernel_ulong_t))));
>> > =C2=A0};
>>
>>
>> This feels a lot like papering over the real problem. =C2=A0It will =
solve
>> this instance, but the list of such previous "paper work" that Geert
>> provided should be enough evidence that this will happen again the n=
ext
>> time someone modifies a device id struct for some subsystem.
>
> Hopefully not, if you add another field here, the alignment force wil=
l
> keep things lined up properly, from what I can tell. =C2=A0Is that no=
t true?

=2E.. for struct usb_device_id.
But not for all other existing and future device ID types.

We have kernel_ulong_t to tell the host compiler what the target's
unsigned long type (actually only its size, not alignment) is.

scripts/mod/file2alias.c handles this with:

#if KERNEL_ELFCLASS =3D=3D ELFCLASS32
typedef Elf32_Addr      kernel_ulong_t;
#define BITS_PER_LONG 32
#else
typedef Elf64_Addr      kernel_ulong_t;
#define BITS_PER_LONG 64
#endif

To fix the misalignment issue, can't we add
"__attribute__((aligned(2)))" to the typedef when cross-compiling for m=
68k?

Still, that only solves the problem for "kernel_ulong_t". Not for all o=
ther
4 or 8 bytes types (in practice just "u32") that are used in
include/linux/mod_devicetable.h. So we would also need "kernel_u32".
And "kernel_u16" for consistency.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
