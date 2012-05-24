From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 1/11] Atari: change number of interrupt sources
Date: Thu, 24 May 2012 02:45:45 +0200
Message-ID: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:54633 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755052Ab2EXBpt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 21:45:49 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I000004SA0X00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:45:46 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From ba9a4e5fa15ff96072495c7f27d69c8e02a04fb2 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Mon, 30 Apr 2012 19:05:23 +1200
Subject: [PATCH 01/11] [m68k] Atari: change number of interrupt sources to include EtherNAT interrupts

---
 arch/m68k/include/asm/atariints.h |    2 +-
 arch/m68k/include/asm/irq.h       |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/atariints.h b/arch/m68k/include/asm/atariints.h
index 5fc13bd..12c759a 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -32,7 +32,7 @@
 #define VME_SOURCE_BASE    56
 #define VME_MAX_SOURCES    16
 
-#define NUM_ATARI_SOURCES   (VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
+#define NUM_ATARI_SOURCES  141
 
 /* convert vector number to int source number */
 #define IRQ_VECTOR_TO_SOURCE(v)	((v) - ((v) < 0x20 ? 0x18 : (0x40-8)))
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index c1155f0..8bd9c7f 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -9,9 +9,11 @@
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
-#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
+#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X) 
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
