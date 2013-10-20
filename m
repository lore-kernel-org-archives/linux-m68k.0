From: Laurent Vivier <Laurent@Vivier.EU>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Sun, 20 Oct 2013 11:25:25 +0200
Message-ID: <5263A185.1040303@Vivier.EU>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:61423 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab3JTJZm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Oct 2013 05:25:42 -0400
In-Reply-To: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Le 20/10/2013 10:52, Geert Uytterhoeven a =C3=A9crit :
> On Sat, Oct 19, 2013 at 6:13 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> [...]
>
> Apart from that, (probably both) configs need more stripping in the c=
ommon
> part. I want to have bootable (i.e. < 4 MiB) defconfig kernels.
>
Moreover, a compressed kernel fitting on a floppy would be better :=20
there is no USB port on this kind of machine, and the floppy is the=20
easiest way to boot a kernel.

Do you think it is possible ?

(With 2.2 kernel we were able to put kernel AND ramdisk on the SAME=20
floppy !)

Regards,
Laurent
