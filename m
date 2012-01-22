From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Sun, 22 Jan 2012 19:37:49 +0100
Message-ID: <4F1C577D.3040908@sigon.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080106030308020900020701"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:57489 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752030Ab2AVSqP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2012 13:46:15 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------080106030308020900020701
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi there,

thanks to some hardware upgrades to my Amiga A600 (A603 chip memory
expansion to 2MB, Kickstart 3.1 rom, CF-IDE-Adapter with 4GB CF-card,
PCMCIA network card and ACA630 CPU replacement board containig a 68030,
but no FPU) i decided i could finally try to get Linux running on that
machine. So i debootstrapped a basic system to my CF-card, compiled a
standard amiga-kernel 3.1.4 (with CONFIG_M68KFPU_EMU_ONLY activated) and
tried to start it. At first, the Amiga froze every time i started
amiboot, so i tried supplying my cpu type by hand (with "-p 202") and it
worked, but after loading the kernel the amiga fired off a "guru
meditation" 00000004 (illegal instruction). After messing around with
some kconfig-options and rebuilding the kernel several time without
getting anywhere i looked at the build process for the NetBSD-kernel i
successfully built for the Amiga before and noticed, that the
NetBSD-guys are building their Amiga-kernel with -msoft-float. So after
applying that to the Linux-kernel (patch attached) the kernel booted,
but died directly after initializing the the framebuffer, just at
activating the serial console, with a very long panic message. I
couldn't get any output via the serial port (with console=ttyS0), so i
made a video of the Amiga booting with my (very bad) handy camera. I'm
sorry i can't give you a proper boot log becaus of that. If you would
need one i could try to make a video of the boot process with the
digital camera of my father and either upload that somewhere or write
the messages in the video down. I could make out some of the first lines
in the panic:

Data Read fault at 0x00000020 in Super Data (pcb0xb7e08)
BAD KERNEL BUSERR
Oops: 00000000
PC: (...) internal_create_group+...

The first command in the trace was a call to mm_release, so i figured
the fpu emulator was crashing something inside the sysfs-part of the
kernel. So i tried recompiling the kernel with CONFIG_EXPERT activated
and CONFIG_SYSFS deactivated and it works! After uninstalling udev from
the debian system and mknod'ing all needed device-files everything seems
to be running fine, with the exception of the RTC (i think that's my
fault, something i missed while configuring my kernel, is there
something needed besides of genrtc to get the A600/A603-clock working?)
and the PCMCIA network card (some card with NE2000-chip, it works
flawlessly under AmigaOS with cnet.device and NetBSD, when inserting the
apne module i get "ethernet PCMCIA card inserted", followed by "device
not found". Maybe i'm missing a device file here?).

So, i wanted to thank all of you linux-m68k-staff here for making it
possible to get my favorite OS running on my favorite little computer
pal :-)
If you are interested, i could give you further information (my
kernel-config, for example) or get you updated, if i get the last
missing parts to run. And, like i said before, if you are interested i
could try to get that kernel panic in a readable form, so you could try
to analyze the error.

Thanks again, and bye!



Regards,
Patrick

--------------080106030308020900020701
Content-Type: text/plain;
 name="linux-m68k-nofpu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-m68k-nofpu.patch"

--- linux-source-3.1.orig/arch/m68k/Makefile_mm	2011-11-28 23:48:14.000000000 +0100
+++ linux-source-3.1/arch/m68k/Makefile_mm	2012-01-14 17:34:55.000000000 +0100
@@ -33,6 +33,10 @@
 # without -fno-strength-reduce the 53c7xx.c driver fails ;-(
 KBUILD_CFLAGS += -pipe -fno-strength-reduce -ffixed-a2
 
+ifdef CONFIG_M68KFPU_EMU_ONLY
+KBUILD_CFLAGS += -msoft-float
+endif
+
 # enable processor switch if compiled only for a single cpu
 ifndef CONFIG_M68020
 ifndef CONFIG_M68030

--------------080106030308020900020701--
