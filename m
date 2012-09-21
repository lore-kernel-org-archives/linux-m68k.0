From: <gerg@snapgear.com>
Subject: [PATCH 04/11] m68knommu: use definitions for the ColdFire 528x FEC multi-function pins
Date: Fri, 21 Sep 2012 16:51:06 +1000
Message-ID: <1348210273-31246-5-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28477 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021Ab2IUGv2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:28 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Currently the setup code for the FEC multi-function pins on the ColdFire 528x
has the addresses hard coded in the code. Use the register defines that
already exist for this.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/m528x.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/platform/coldfire/m528x.c b/arch/m68k/platform/coldfire/m528x.c
index f1319e5..f9f7e6a 100644
--- a/arch/m68k/platform/coldfire/m528x.c
+++ b/arch/m68k/platform/coldfire/m528x.c
@@ -53,9 +53,9 @@ static void __init m528x_fec_init(void)
 	u16 v16;
 
 	/* Set multi-function pins to ethernet mode for fec0 */
-	v16 = readw(MCF_IPSBAR + 0x100056);
-	writew(v16 | 0xf00, MCF_IPSBAR + 0x100056);
-	writeb(0xc0, MCF_IPSBAR + 0x100058);
+	v16 = readw(MCFGPIO_PASPAR);
+	writew(v16 | 0xf00, MCFGPIO_PASPAR);
+	writeb(0xc0, MCFGPIO_PEHLPAR);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
