From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 04/17] [m68k] Atari: change number of interrupt sources to include EtherNAT interrupts
Date: Thu, 31 Jan 2013 13:18:01 +1300 (NZDT)
Message-ID: <20130131001801.55510360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:38291 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751736Ab3AaASH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:18:07 -0500
Received: by mail-pa0-f44.google.com with SMTP id hz11so1382470pad.31
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:18:06 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 04/17] [m68k] Atari: change number of interrupt sources to include EtherNAT interrupts


Signed-off-by: Michael Schmitz <schmitz@debian.org>
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
