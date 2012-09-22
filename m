From: <gerg@snapgear.com>
Subject: [PATCH 5/5] m68knommu: fix inconsistent formating in ColdFire 5407 definitions
Date: Sat, 22 Sep 2012 21:08:27 +1000
Message-ID: <1348312107-29294-6-git-send-email-gerg@snapgear.com>
References: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:64900 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753108Ab2IVLIM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Sep 2012 07:08:12 -0400
In-Reply-To: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Fix tab broken address defines to be consistent with others in this file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5407sim.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index cc485ba..a7550bc 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -102,9 +102,9 @@
 /*
  * Generic GPIO support
  */
-#define MCFGPIO_PIN_MAX			16
-#define MCFGPIO_IRQ_MAX			-1
-#define MCFGPIO_IRQ_VECBASE		-1
+#define MCFGPIO_PIN_MAX		16
+#define MCFGPIO_IRQ_MAX		-1
+#define MCFGPIO_IRQ_VECBASE	-1
 
 /*
  *	Some symbol defines for the above...
@@ -130,9 +130,9 @@
 /*
  *       Defines for the IRQPAR Register
  */
-#define IRQ5_LEVEL4	0x80
-#define IRQ3_LEVEL6	0x40
-#define IRQ1_LEVEL2	0x20
+#define IRQ5_LEVEL4		0x80
+#define IRQ3_LEVEL6		0x40
+#define IRQ1_LEVEL2		0x20
 
 /*
  *	Define system peripheral IRQ usage.
-- 
1.7.0.4
