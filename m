From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k-queue
Date: Mon, 13 May 2013 11:56:39 +0200
Message-ID: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:53913 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751620Ab3EMJ4k (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 May 2013 05:56:40 -0400
Received: by mail-ie0-f170.google.com with SMTP id aq17so12200234iec.29
        for <linux-m68k@vger.kernel.org>; Mon, 13 May 2013 02:56:39 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

m68k-queue is at a historical low:

$ git cherry -v v3.10-rc1 m68k-queue | wc -l
11
$

and of course I want to keep that, and improve it!

  - m68k/irq: Add handle_polled_irq() for timer based soft interrupts
    Still no response from tglx :-(
  - m68k/atari: use polled interrupt handler for timer D interrupts
    Depends on above
  - m68k/atari: EtherNAT - ethernet support (smc91x)
    m68k/atari: EtherNEC - ethernet support (ne)
    Michael will submit
  - m68k/atari: USB - add ISP1160 USB host controller support
    Michael WIP?
  - m68k/atari: Update defconfigs for new features
    m68k/mac: Update defconfig
    I'm working on the defconfigs
  - fs/fat: Revert "msdos fs: remove unsettable atari option"
    fs/fat: Atari FAT updates
    fs/fat: Use correct logical sector size for Atari GEMDOS FAT
    Who dares to stand in front of the fat maintainer and will submit these?
    Michael, too?
  - mac: ADB raw packets
    I guess this can be dropped?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
