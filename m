From: <gerg@snapgear.com>
Subject: [PATCH 09/11] m68knommu: fix multi-function pin setup for FEC module on ColdFire 523x
Date: Fri, 21 Sep 2012 16:51:11 +1000
Message-ID: <1348210273-31246-10-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28558 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754562Ab2IUGvm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:42 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The multi-function pin setup code for the FEC ethernet module is using just
plain wrong. Looks like it was cut-and-pasted from other init code. It has
hard coded register addresses that are incorrect for the 523x, and it is
manipulating bits that don't make sense.

Add proper register definitions for the Pin Assignment registers of the 532x,
and then use them to fix the setup code for the FEC hardware module.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h    |    8 ++++++++
 arch/m68k/platform/coldfire/m523x.c |    8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 91d3abc..d1d4ec7 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -189,8 +189,16 @@
 /*
  * Pin Assignment
 */
+#define	MCFGPIO_PAR_AD		(MCF_IPSBAR + 0x100040)
+#define	MCFGPIO_PAR_BUSCTL	(MCF_IPSBAR + 0x100042)
+#define	MCFGPIO_PAR_BS		(MCF_IPSBAR + 0x100044)
+#define	MCFGPIO_PAR_CS		(MCF_IPSBAR + 0x100045)
+#define	MCFGPIO_PAR_SDRAM	(MCF_IPSBAR + 0x100046)
+#define	MCFGPIO_PAR_FECI2C	(MCF_IPSBAR + 0x100047)
+#define	MCFGPIO_PAR_UART	(MCF_IPSBAR + 0x100048)
 #define	MCFGPIO_PAR_QSPI	(MCF_IPSBAR + 0x10004A)
 #define	MCFGPIO_PAR_TIMER	(MCF_IPSBAR + 0x10004C)
+#define	MCFGPIO_PAR_ETPU	(MCF_IPSBAR + 0x10004E)
 
 /*
  * DMA unit base addresses.
diff --git a/arch/m68k/platform/coldfire/m523x.c b/arch/m68k/platform/coldfire/m523x.c
index d47dfd8..ff37fe9 100644
--- a/arch/m68k/platform/coldfire/m523x.c
+++ b/arch/m68k/platform/coldfire/m523x.c
@@ -42,14 +42,8 @@ static void __init m523x_qspi_init(void)
 
 static void __init m523x_fec_init(void)
 {
-	u16 par;
-	u8 v;
-
 	/* Set multi-function pins to ethernet use */
-	par = readw(MCF_IPSBAR + 0x100082);
-	writew(par | 0xf00, MCF_IPSBAR + 0x100082);
-	v = readb(MCF_IPSBAR + 0x100078);
-	writeb(v | 0xc0, MCF_IPSBAR + 0x100078);
+	writeb(readb(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
