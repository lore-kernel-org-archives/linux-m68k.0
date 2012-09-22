From: <gerg@snapgear.com>
Subject: [PATCH 2/5] m68knommu: fix inconsistent formating in ColdFire 5272 definitions
Date: Sat, 22 Sep 2012 21:08:24 +1000
Message-ID: <1348312107-29294-3-git-send-email-gerg@snapgear.com>
References: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:64892 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725Ab2IVLII (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Sep 2012 07:08:08 -0400
In-Reply-To: <1348312107-29294-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Fix tab broken defines to be consistent with others in this file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5272sim.h |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 52d1a33..1fb01bb 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -132,8 +132,9 @@
 /*
  * Generic GPIO support
  */
-#define MCFGPIO_PIN_MAX			48
-#define MCFGPIO_IRQ_MAX			-1
-#define MCFGPIO_IRQ_VECBASE		-1
+#define MCFGPIO_PIN_MAX		48
+#define MCFGPIO_IRQ_MAX		-1
+#define MCFGPIO_IRQ_VECBASE	-1
+
 /****************************************************************************/
 #endif	/* m5272sim_h */
-- 
1.7.0.4
