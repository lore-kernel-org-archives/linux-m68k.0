From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Sun, 20 Oct 2013 11:34:28 +0200
Message-ID: <CAMuHMdWdEKFUHwZ1gzH4h3UbT41VLVq0xyS_MVpFrdrtbD6-vQ@mail.gmail.com>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
	<5263A185.1040303@Vivier.EU>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:56088 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859Ab3JTJe3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Oct 2013 05:34:29 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so5261070pab.8
        for <linux-m68k@vger.kernel.org>; Sun, 20 Oct 2013 02:34:28 -0700 (PDT)
In-Reply-To: <5263A185.1040303@Vivier.EU>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@vivier.eu>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Oct 20, 2013 at 11:25 AM, Laurent Vivier <Laurent@vivier.eu> wr=
ote:
> Le 20/10/2013 10:52, Geert Uytterhoeven a =C3=A9crit :
>>
>> On Sat, Oct 19, 2013 at 6:13 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>> [...]
>>
>>
>> Apart from that, (probably both) configs need more stripping in the =
common
>> part. I want to have bootable (i.e. < 4 MiB) defconfig kernels.
>>
> Moreover, a compressed kernel fitting on a floppy would be better : t=
here is
> no USB port on this kind of machine, and the floppy is the easiest wa=
y to
> boot a kernel.
>
> Do you think it is possible ?

With a custom kerel, that should still be possible.
=46or a v3.12-rc6 mac_defconfig kernel, the figures are:

-rwxr-xr-x 1 geert geert 4873408 okt 20 11:31 /tmp/vmlinux*
-rwxr-xr-x 1 geert geert 2333743 okt 20 11:31 /tmp/vmlinux.gz*
-rwxr-xr-x 1 geert geert 2190667 okt 20 11:31 /tmp/vmlinux.bz2*
-rwxr-xr-x 1 geert geert 1802956 okt 20 11:31 /tmp/vmlinux.xz*

With some stripping, you should be able to fit (at least the xz version=
 of)
the kernel on a floppy again.

> (With 2.2 kernel we were able to put kernel AND ramdisk on the SAME f=
loppy
> !)

I know.

I even booted Linux with X and twm on an Amiga with 2 MiB chip RAM and
2 MiB Fast RAM (+ swap, of course). The uncompressed kernel fit
easily in 2 MiB.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
