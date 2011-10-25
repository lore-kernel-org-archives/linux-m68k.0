From: <gerg@snapgear.com>
Subject: [PATCH 32/36] m68k: use new style interrupt handling for ColdFire with MMU enabled
Date: Tue, 25 Oct 2011 17:19:24 +1000
Message-ID: <1319527168-11166-33-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25152 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754342Ab1JYHTq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:46 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We want to use the same interrupt processing code for all ColdFire CPU
types, even when the MMU is enabled. The current m68k MMU interrupt
processing still uses old style code, not generic interrupts. Choose to
compile the generic interrupt support used by the non-MMU ColdFire for
all ColdFire configurations.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/Makefile |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 01ae30e..59794a1 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -2,20 +2,27 @@
 # Makefile for the linux kernel.
 #
 
+ifndef CONFIG_COLDFIRE
 extra-$(CONFIG_MMU)	:= head.o
 extra-$(CONFIG_SUN3)	:= sun3-head.o
+endif
 extra-y			+= vmlinux.lds
 
 obj-y	:= entry.o init_task.o m68k_ksyms.o module.o process.o ptrace.o
 obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 
-obj-$(CONFIG_MMU)	+= ints.o devres.o vectors.o
-devres-$(CONFIG_MMU)	= ../../../kernel/irq/devres.o
+ifdef CONFIG_COLDFIRE
+obj-y			+= irq.o
+else
+ifdef CONFIG_MMU
+obj-y			+= ints.o devres.o vectors.o
+devres-y		= ../../../kernel/irq/devres.o
+else
+obj-y			+= irq.o
+endif
+endif
 
 ifndef CONFIG_MMU_SUN3
 obj-y			+= dma.o
 endif
-ifndef CONFIG_MMU
-obj-y			+= irq.o
-endif
 
-- 
1.7.0.4
