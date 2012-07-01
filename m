From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Sun,  1 Jul 2012 16:20:56 +1200 (NZST)
Message-ID: <20120701042056.8ED4D3600FE@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40175 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEVC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:21:02 -0400
Received: by pbbrp8 with SMTP id rp8so6169091pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:21:02 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

>From 72cce075197cce09678b28f9ee7232549e3e8b9b Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Sat, 30 Jun 2012 15:11:16 +1200
Subject: [PATCH 1/6] [m68k] Atari: increase number of Atari interrupt sources for EtherNAT


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/atariints.h |    6 +++++-
 arch/m68k/include/asm/irq.h       |    4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 5fc13bd..f79a381 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -32,7 +32,11 @@
 #define VME_SOURCE_BASE    56
 #define VME_MAX_SOURCES    16
 
-#define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
+/*
+** EtherNAT CPLD interrupts are at irq 139 (vector 0xc3) and 140
+** (vector 0xc4) so the total number is 141 now (including irq 0).
+*/
+#define NUM_ATARI_SOURCES  141
 
 /* convert vector number to int source number */
 #define IRQ_VECTOR_TO_SOURCE(v)	((v) - ((v) < 0x20 ? 0x18 : (0x40-8)))
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index c1155f0..9030877 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -11,7 +11,9 @@
 #define NR_IRQS 256
 #elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
 #define NR_IRQS 200
-#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
+#elif defined(CONFIG_ATARI)
+#define NR_IRQS 141
+#elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
 #define NR_IRQS	43
-- 
1.7.0.4
