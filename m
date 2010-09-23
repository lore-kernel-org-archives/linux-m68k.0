From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH 07/20] m68k: change to new flag variables
Date: Wed, 22 Sep 2010 23:50:38 -0700
Message-ID: <1285224638-29684-1-git-send-email-mfm__28472.182682208$1285225046$gmane$org@muteddisk.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/m68k/math-emu/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/math-emu/Makefile b/arch/m68k/math-emu/Makefile
index a0935bf..547c23c 100644
--- a/arch/m68k/math-emu/Makefile
+++ b/arch/m68k/math-emu/Makefile
@@ -2,8 +2,8 @@
 # Makefile for the linux kernel.
 #
 
-#EXTRA_AFLAGS += -DFPU_EMU_DEBUG
-#EXTRA_CFLAGS += -DFPU_EMU_DEBUG
+#asflags-y := -DFPU_EMU_DEBUG
+#ccflags-y := -DFPU_EMU_DEBUG
 
 obj-y		:= fp_entry.o fp_scan.o fp_util.o fp_move.o fp_movem.o \
 			fp_cond.o fp_arith.o fp_log.o fp_trig.o
-- 
1.7.2.1
