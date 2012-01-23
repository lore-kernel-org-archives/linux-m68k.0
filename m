From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Mon, 23 Jan 2012 21:42:17 +0100
Message-ID: <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:34308 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753107Ab2AWUmS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 Jan 2012 15:42:18 -0500
Received: by werb13 with SMTP id b13so2457566wer.19
        for <linux-m68k@vger.kernel.org>; Mon, 23 Jan 2012 12:42:17 -0800 (PST)
In-Reply-To: <4F1C577D.3040908@sigon.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: linux-m68k@vger.kernel.org

Hi Patrick,

On Sun, Jan 22, 2012 at 19:37, Patrick Bottelberger
<patrick.bottelberger@sigon.net> wrote:
> tried to start it. At first, the Amiga froze every time i started
> amiboot, so i tried supplying my cpu type by hand (with "-p 202") and=
 it
> worked, but after loading the kernel the amiga fired off a "guru

What did Amiboot detect without the `-p` option (you may want ti try `-=
d')?
Does it assume a 68882 FPU?

> meditation" 00000004 (illegal instruction). After messing around with
> some kconfig-options and rebuilding the kernel several time without
> getting anywhere i looked at the build process for the NetBSD-kernel =
i
> successfully built for the Amiga before and noticed, that the
> NetBSD-guys are building their Amiga-kernel with -msoft-float. So aft=
er
> applying that to the Linux-kernel (patch attached) the kernel booted,

Strange, -msoft-float should not be needed, as the kernel shouldn't use=
 any
floating point instructions (besides saving/restoring FPU state, which
it shouldn't do with CONFIG_M68KFPU_EMU_ONLY).

> but died directly after initializing the the framebuffer, just at
> activating the serial console, with a very long panic message. I
> couldn't get any output via the serial port (with console=3DttyS0), s=
o i
> made a video of the Amiga booting with my (very bad) handy camera. I'=
m
> sorry i can't give you a proper boot log becaus of that. If you would

Have you tried `debug=3Dmem', and running the AmigaOS dmesg afterwards?

> need one i could try to make a video of the boot process with the
> digital camera of my father and either upload that somewhere or write
> the messages in the video down. I could make out some of the first li=
nes
> in the panic:
>
> Data Read fault at 0x00000020 in Super Data (pcb0xb7e08)
> BAD KERNEL BUSERR
> Oops: 00000000
> PC: (...) internal_create_group+...
>
> The first command in the trace was a call to mm_release, so i figured
> the fpu emulator was crashing something inside the sysfs-part of the
> kernel. So i tried recompiling the kernel with CONFIG_EXPERT activate=
d
> and CONFIG_SYSFS deactivated and it works! After uninstalling udev fr=
om

I'd expected this to be the topology issue, but that change doesn't see=
m
to be in 3.1.4. I'll see whether I can reproduce this.

> the debian system and mknod'ing all needed device-files everything se=
ems
> to be running fine, with the exception of the RTC (i think that's my
> fault, something i missed while configuring my kernel, is there
> something needed besides of genrtc to get the A600/A603-clock working=
?)

Do you know what clock chip is used on the A603? I had a quick look on =
the
net, but couldn't find it (I did see a picture of an A604 with a partia=
lly
covered chip that said M6242). If you can't find it, I can ask Jens.

Currently, Linux assumes an A2000 clock chip, which is an Oki MSM6242.
If it's a Ricoh RP5C01, you have to modify arch/m68k/amiga/config.c to
select an A3000 clock chip on A600.

> and the PCMCIA network card (some card with NE2000-chip, it works
> flawlessly under AmigaOS with cnet.device and NetBSD, when inserting =
the
> apne module i get "ethernet PCMCIA card inserted", followed by "devic=
e
> not found". Maybe i'm missing a device file here?).

Sorry, cannot help you there.

Thanks for your report!

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
