From: <gerg@snapgear.com>
Subject: [PATCH 1/5] m68knommu: fix inconsistent formating in ColdFire 523x definitions
Date: Sat, 22 Sep 2012 21:08:23 +1000
Message-ID: <1348312107-29294-2-git-send-email-gerg@snapgear.com>
References: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:64891 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753437Ab2IVLIH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Sep 2012 07:08:07 -0400
In-Reply-To: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Fix tab broken address defines to be consistent with others in this file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index d1d4ec7..5e06b4e 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -176,15 +176,15 @@
 /*
  * Generic GPIO support
  */
-#define MCFGPIO_PODR			MCFGPIO_PODR_ADDR
-#define MCFGPIO_PDDR			MCFGPIO_PDDR_ADDR
-#define MCFGPIO_PPDR			MCFGPIO_PPDSDR_ADDR
-#define MCFGPIO_SETR			MCFGPIO_PPDSDR_ADDR
-#define MCFGPIO_CLRR			MCFGPIO_PCLRR_ADDR
-
-#define MCFGPIO_PIN_MAX			107
-#define MCFGPIO_IRQ_MAX			8
-#define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
+#define MCFGPIO_PODR		MCFGPIO_PODR_ADDR
+#define MCFGPIO_PDDR		MCFGPIO_PDDR_ADDR
+#define MCFGPIO_PPDR		MCFGPIO_PPDSDR_ADDR
+#define MCFGPIO_SETR		MCFGPIO_PPDSDR_ADDR
+#define MCFGPIO_CLRR		MCFGPIO_PCLRR_ADDR
+
+#define MCFGPIO_PIN_MAX		107
+#define MCFGPIO_IRQ_MAX		8
+#define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
 
 /*
  * Pin Assignment
-- 
1.7.0.4
