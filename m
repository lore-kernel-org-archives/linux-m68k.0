From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [-next] FATAL: drivers/gpu/drm/udl/udl: sizeof(struct
 usb_device_id)=24 is not a modulo of the size of section __mod_usb_device_table=44.
Date: Fri, 15 Jun 2012 23:02:55 +0200
Message-ID: <CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120615201021.GB14544-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

Hi Greg,

On Fri, Jun 15, 2012 at 10:10 PM, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Fri, Jun 15, 2012 at 07:42:08PM +0200, Geert Uytterhoeven wrote:
>> commit 81df2d594340dcb6d1a02191976be88a1ca8120c ("USB: allow match
>> on bInterfaceNumber") added a byte to the interior of struct usb_dev=
ice_id,
>> enabling implicit padding:
>>
>> --- a/include/linux/mod_devicetable.h
>> +++ b/include/linux/mod_devicetable.h
>> @@ -115,6 +118,9 @@ struct usb_device_id {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bInterfaceSubClass;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bInterfaceProtocol;
>>
>> + =C2=A0 =C2=A0 =C2=A0 /* Used for vendor-specific interface matches=
 */
>> + =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bInterfaceNumber;
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* not matched against */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_ulong_t =C2=A0driver_info;
>> =C2=A0};
>>
>> On m68k, this causes failures like:
>>
>> | FATAL: drivers/gpu/drm/udl/udl: sizeof(struct usb_device_id)=3D24 =
is
>> not a modulo of the size of section __mod_usb_device_table=3D44.
>> | Fix definition of struct usb_device_id in mod_devicetable.h
>>
>> M68k is special in that it uses 2 for the alignment of 32-bit entiti=
es, hence
>> sizeof(struct usb_device_id) =3D 22.
>>
>> However, when cross-compiling on amd64, sizeof(struct usb_device_id)=
 =3D 24
>> in scripts/mod/file2alias.c.
>
> I don't really understand, what is the problem here? =C2=A0The fact t=
hat we
> added one byte to the structure? =C2=A0And now something breaks? =C2=A0=
How?
>
> What can we do to resolve it?

As "kernel_ulong_t =C2=A0driver_info" is no longer naturally aligned, t=
he
compiler will
add implicit padding. But the padding depends on the architecture.

It can be fixed by adding explicit padding. Probably it should be padde=
d by
7 bytes (not 3), as kernel_ulong_t may require 8-byte alignment on some=
 64-bit
platforms. Or by an explicit alignment attribute.

See also
  * commit 8175fe2dda1c93a9c596921c8ed4a0b4baccdefe ("HID: fix
hid_device_id for cross compiling")
  * commit 7492d4a416d68ab4bd254b36ffcc4e0138daa8ff ("sdio: fix module
device table definition for m68k")
  * commit 9e2d3cd34a159948dc753a14573e16bffc04dba8 ("[PATCH]
mod_devicetable.h fixes")

Still, there's a bug in file2alias (which is compiled by the host
compiler), in that
it may use different padding than the target platform when cross-compil=
ing.

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
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
