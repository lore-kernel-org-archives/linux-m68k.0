From: <gerg@snapgear.com>
Subject: [PATCH 33/36 v5] m68k: do not use m68k startup or interrupt code for ColdFire CPUs
Date: Thu, 29 Dec 2011 11:59:45 +1000
Message-ID: <1325123985-8492-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:19840 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754688Ab1L2CAI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 21:00:08 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire CPUs have their own startup and interrupt code (in the
platform/coldfire directory), and do not use the general m68k startup and
interrupt code. In fact the use of the arch/m68k/kernel/head.o is not about
CONFIG_MMU or not, it is really about the machine type we are compiling for.

Modify the selection and use of head.o to be based on the machine type.
Only select the local ints.o and vectors.o code if we are using the classic
68k CPU types (that use the conventional Morotola MMU or SUN3 MMU).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/kernel/Makefile |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index ea0a396..40d29a7 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -2,16 +2,24 @@
 # Makefile for the linux kernel.
 #
 
-extra-$(CONFIG_MMU)	:= head.o
+extra-$(CONFIG_AMIGA)	:= head.o
+extra-$(CONFIG_ATARI)	:= head.o
+extra-$(CONFIG_MAC)	:= head.o
+extra-$(CONFIG_APOLLO)	:= head.o
+extra-$(CONFIG_VME)	:= head.o
+extra-$(CONFIG_HP300)	:= head.o
+extra-$(CONFIG_Q40)	:= head.o
+extra-$(CONFIG_SUN3X)	:= head.o
 extra-$(CONFIG_SUN3)	:= sun3-head.o
 extra-y			+= vmlinux.lds
 
 obj-y	:= entry.o init_task.o irq.o m68k_ksyms.o module.o process.o ptrace.o
 obj-y	+= setup.o signal.o sys_m68k.o syscalltable.o time.o traps.o
 
-obj-$(CONFIG_MMU)	+= ints.o vectors.o
+obj-$(CONFIG_MMU_MOTOROLA) += ints.o vectors.o
+obj-$(CONFIG_MMU_SUN3) += ints.o vectors.o
 
 ifndef CONFIG_MMU_SUN3
-obj-y			+= dma.o
+obj-y	+= dma.o
 endif
 
-- 
1.7.0.4
