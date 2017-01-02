From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/3] Remove interrupt debug code
Date: Mon,  2 Jan 2017 04:53:54 -0500 (EST)
Message-ID: <cover.1483350483.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

This patch series removes some interrupt debug code:
printk statements, associated macros, dead code, etc.


Finn Thain (3):
  m68k/mac: Improve NMI handler
  m68k/mac: Remove SHUTUP_SONIC interrupt hack
  m68k/mac: Clean up interrupt debug macros and printk statements

 arch/m68k/include/asm/macints.h | 16 --------
 arch/m68k/mac/baboon.c          | 16 --------
 arch/m68k/mac/macints.c         | 87 ++++-------------------------------------
 arch/m68k/mac/oss.c             | 20 ----------
 arch/m68k/mac/psc.c             | 11 ------
 arch/m68k/mac/via.c             |  8 ----
 6 files changed, 8 insertions(+), 150 deletions(-)

-- 
2.10.2
