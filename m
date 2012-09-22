From: <gerg@snapgear.com>
Subject: [PATCH 3/5] m68knommu: fix inconsistent formating in ColdFire 527x definitions
Date: Sat, 22 Sep 2012 21:08:25 +1000
Message-ID: <1348312107-29294-4-git-send-email-gerg@snapgear.com>
References: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:64895 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753973Ab2IVLIK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Sep 2012 07:08:10 -0400
In-Reply-To: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Fix tab broken address defines to be consistent with others in this file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 6335e42..1bebbe7 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -184,15 +184,15 @@
 /*
  * Generic GPIO support
  */
-#define MCFGPIO_PODR			MCFGPIO_PODR_ADDR
-#define MCFGPIO_PDDR			MCFGPIO_PDDR_ADDR
-#define MCFGPIO_PPDR			MCFGPIO_PPDSDR_ADDR
-#define MCFGPIO_SETR			MCFGPIO_PPDSDR_ADDR
-#define MCFGPIO_CLRR			MCFGPIO_PCLRR_ADDR
+#define MCFGPIO_PODR		MCFGPIO_PODR_ADDR
+#define MCFGPIO_PDDR		MCFGPIO_PDDR_ADDR
+#define MCFGPIO_PPDR		MCFGPIO_PPDSDR_ADDR
+#define MCFGPIO_SETR		MCFGPIO_PPDSDR_ADDR
+#define MCFGPIO_CLRR		MCFGPIO_PCLRR_ADDR
 
-#define MCFGPIO_PIN_MAX			100
-#define MCFGPIO_IRQ_MAX			8
-#define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
+#define MCFGPIO_PIN_MAX		100
+#define MCFGPIO_IRQ_MAX		8
+#define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
 
 /*
  * Port Pin Assignment registers.
@@ -293,15 +293,15 @@
 /*
  * Generic GPIO support
  */
-#define MCFGPIO_PODR			MCFGPIO_PODR_BUSCTL
-#define MCFGPIO_PDDR			MCFGPIO_PDDR_BUSCTL
-#define MCFGPIO_PPDR			MCFGPIO_PPDSDR_BUSCTL
-#define MCFGPIO_SETR			MCFGPIO_PPDSDR_BUSCTL
-#define MCFGPIO_CLRR			MCFGPIO_PCLRR_BUSCTL
-
-#define MCFGPIO_PIN_MAX			148
-#define MCFGPIO_IRQ_MAX			8
-#define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
+#define MCFGPIO_PODR		MCFGPIO_PODR_BUSCTL
+#define MCFGPIO_PDDR		MCFGPIO_PDDR_BUSCTL
+#define MCFGPIO_PPDR		MCFGPIO_PPDSDR_BUSCTL
+#define MCFGPIO_SETR		MCFGPIO_PPDSDR_BUSCTL
+#define MCFGPIO_CLRR		MCFGPIO_PCLRR_BUSCTL
+
+#define MCFGPIO_PIN_MAX		148
+#define MCFGPIO_IRQ_MAX		8
+#define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
 
 /*
  * Port Pin Assignment registers.
-- 
1.7.0.4
