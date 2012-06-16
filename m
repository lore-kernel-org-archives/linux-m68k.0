From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [-next] FATAL: drivers/gpu/drm/udl/udl: sizeof(struct
 usb_device_id)=24 is not a modulo of the size of section __mod_usb_device_table=44.
Date: Sat, 16 Jun 2012 20:51:26 +0200
Message-ID: <CAMuHMdUopmbT5vsSTC-6oysr7FhnOrCfEVHZbBwtD7amrhzxqA@mail.gmail.com>
References: <CAMuHMdXk6pByz14JcDgY+UE6QM0sHD8cbXye9CgOVSRRtr7J+Q@mail.gmail.com>
	<20120615201021.GB14544@kroah.com>
	<CAMuHMdUj6tAcWhkSkV43Kw3-2-3+JzgP6W=2w3fjL2KBfRh9ZQ@mail.gmail.com>
	<20120615231220.GC8205@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:53034 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754439Ab2FPSv1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 16 Jun 2012 14:51:27 -0400
In-Reply-To: <20120615231220.GC8205@kroah.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Sat, Jun 16, 2012 at 1:12 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Jun 15, 2012 at 11:02:55PM +0200, Geert Uytterhoeven wrote:
>> On Fri, Jun 15, 2012 at 10:10 PM, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> > On Fri, Jun 15, 2012 at 07:42:08PM +0200, Geert Uytterhoeven wrote=
:
>> >> commit 81df2d594340dcb6d1a02191976be88a1ca8120c ("USB: allow matc=
h
>> >> on bInterfaceNumber") added a byte to the interior of struct usb_=
device_id,
>> >> enabling implicit padding:
>> >>
>> >> --- a/include/linux/mod_devicetable.h
>> >> +++ b/include/linux/mod_devicetable.h
>> >> @@ -115,6 +118,9 @@ struct usb_device_id {
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bInterfaceSubClass;
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bInterfaceProtocol;
>> >>
>> >> + =C2=A0 =C2=A0 =C2=A0 /* Used for vendor-specific interface matc=
hes */
>> >> + =C2=A0 =C2=A0 =C2=A0 __u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bInterfaceNumber;
>> >> +
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* not matched against */
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_ulong_t =C2=A0driver_info;
>> >> =C2=A0};
>> >>
>> >> On m68k, this causes failures like:
>> >>
>> >> | FATAL: drivers/gpu/drm/udl/udl: sizeof(struct usb_device_id)=3D=
24 is
>> >> not a modulo of the size of section __mod_usb_device_table=3D44.
>> >> | Fix definition of struct usb_device_id in mod_devicetable.h
>> >>
>> >> M68k is special in that it uses 2 for the alignment of 32-bit ent=
ities, hence
>> >> sizeof(struct usb_device_id) =3D 22.
>> >>
>> >> However, when cross-compiling on amd64, sizeof(struct usb_device_=
id) =3D 24
>> >> in scripts/mod/file2alias.c.
>> >
>> > I don't really understand, what is the problem here? =C2=A0The fac=
t that we
>> > added one byte to the structure? =C2=A0And now something breaks? =C2=
=A0How?
>> >
>> > What can we do to resolve it?
>>
>> As "kernel_ulong_t =C2=A0driver_info" is no longer naturally aligned=
, the
>> compiler will
>> add implicit padding. But the padding depends on the architecture.
>
> Ah, so we were "lucky" before, nice.
>
>> It can be fixed by adding explicit padding. Probably it should be pa=
dded by
>> 7 bytes (not 3), as kernel_ulong_t may require 8-byte alignment on s=
ome 64-bit
>> platforms. Or by an explicit alignment attribute.
>>
>> See also
>> =C2=A0 * commit 8175fe2dda1c93a9c596921c8ed4a0b4baccdefe ("HID: fix
>> hid_device_id for cross compiling")
>> =C2=A0 * commit 7492d4a416d68ab4bd254b36ffcc4e0138daa8ff ("sdio: fix=
 module
>> device table definition for m68k")
>> =C2=A0 * commit 9e2d3cd34a159948dc753a14573e16bffc04dba8 ("[PATCH]
>> mod_devicetable.h fixes")
>
> So would the patch below fix this? =C2=A0It should force alignment of=
 the
> driver_data field, which is all you want here, right?

Yes, it's fixes it, so

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>> Still, there's a bug in file2alias (which is compiled by the host
>> compiler), in that
>> it may use different padding than the target platform when cross-com=
piling.
>
> That's not good, but outside of this specific issue, right? =C2=A0Hav=
e we
> just been fortunate it hasn't really hit us yet?
>
> thanks,
>
> greg k-h
>
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devi=
cetable.h
> index 7771d45..6955045 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -122,7 +122,8 @@ struct usb_device_id {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bInterfaceNumber;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not matched against */
> - =C2=A0 =C2=A0 =C2=A0 kernel_ulong_t =C2=A0driver_info;
> + =C2=A0 =C2=A0 =C2=A0 kernel_ulong_t =C2=A0driver_info
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __attribute__((ali=
gned(sizeof(kernel_ulong_t))));
> =C2=A0};
>
> =C2=A0/* Some useful macros to use to create struct usb_device_id */

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
