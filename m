From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/6] m68k/defconfig: Update defconfigs
Date: Sun, 25 Jan 2015 15:30:33 +0100
Message-ID: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: debian-68k@lists.debian.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi all,

Here are the defconfig updates I plan to queue for v3.20.

Thanks for reviewing!

Geert Uytterhoeven (6):
  m68k/defconfig: Refresh defconfigs for v3.16-rc1--v3.19-rc2
  m68k/defconfig: Enable test modules
  m68k/defconfig: Enable early printk support
  m68k/defconfig: Enable automounting of devtmpfs at /dev
  m68k/defconfig: Enable Atari EtherNAT and EtherNEC Ethernet support
  m68k/defconfig: Enable Ethernet bridging

 arch/m68k/configs/amiga_defconfig    | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/apollo_defconfig   | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/atari_defconfig    | 78 +++++++++++++++++++++++++++++++-----
 arch/m68k/configs/bvme6000_defconfig | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/hp300_defconfig    | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/mac_defconfig      | 72 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/multi_defconfig    | 78 ++++++++++++++++++++++++++++++------
 arch/m68k/configs/mvme147_defconfig  | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/mvme16x_defconfig  | 72 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/q40_defconfig      | 73 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/sun3_defconfig     | 72 ++++++++++++++++++++++++++++-----
 arch/m68k/configs/sun3x_defconfig    | 73 ++++++++++++++++++++++++++++-----
 12 files changed, 750 insertions(+), 133 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
