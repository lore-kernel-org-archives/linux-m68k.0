From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k-bootinfo
Date: Sun, 3 Nov 2013 11:24:53 +0100
Message-ID: <CAMuHMdX+jckyyuZc0tTvgwVTKr5BpR-uPF+qGT8abq+GyDW9hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:47205 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430Ab3KCKYy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Nov 2013 05:24:54 -0500
Received: by mail-pd0-f169.google.com with SMTP id q10so5664021pdj.0
        for <linux-m68k@vger.kernel.org>; Sun, 03 Nov 2013 02:24:53 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

I wrote a small tool to decode and dump bootinfo files.
It does not support editing yet (we all know how to use a hex editor,
don't we? ;-)

On ARAnyM:

# m68k-bootinfo
machtype = atari
cputype = 68040
fputype = 68040
mmutype = 68040
memchunk of 0x00e00000 bytes at 0x00000000
memchunk of 0x10000000 bytes at 0x01000000
command_line = "root=/dev/hda1 video=atafb:tthigh debug=par
console=tty0 BOOT_IMAGE=vmlinux"
atari.mch_cookie = FALCON
atari.mch_type = AB40
# m68k-bootinfo -f ../bootinfo/bootinfo.cassandra
machtype = amiga
cputype = 68040
fputype = 68040
mmutype = 68040
memchunk of 0x00c00000 bytes at 0x07400000
command_line = "root=/dev/hda3 fbcon=font:PEARL8x8 console=tty0
debug=mem BOOT_IMAGE=t4"
amiga.model = A4000
amiga.autocon board 0x0877:0xffffffc9 at 0x00e90000
amiga.chip_size = 0x00200000
amiga.vblank = 50
amiga.psfreq = 50
amiga.eclock = 0x000ad303
amiga.chipset = AGA
amiga.serper = 368
#

https://github.com/geertu/m68k-bootinfo

Have fun!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
