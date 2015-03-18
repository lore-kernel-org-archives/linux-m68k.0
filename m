From: gerg@uclinux.org
Subject: [PATCH] m68knommu: ColdFire 5271 only has a single FEC controller
Date: Wed, 18 Mar 2015 11:56:40 +1000
Message-ID: <1426643800-27130-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas06p.mx.bigpond.com ([61.9.189.152]:45066 "EHLO
	nschwmtas06p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754605AbbCRB4q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 17 Mar 2015 21:56:46 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The inclusion of multiple FEC ethernet platform devices is based around
the FEC address definitions in the platform headers. The ColdFire m527x
platform is defining 2 FEC modules, but the 5271 SoC only has a single
FEC hardware module. The attempt to probe and init a second FEC module
causes a trap and dump on boot on this platform.

Fix the definitions so that only the 5275 SoC platform (which has 2 FEC
hardware modules) defines the second base address.

Reported-by: ertheb <3rth3bnospam@ethe.fr>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 1bebbe7..2c648a0 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -103,8 +103,10 @@
  */
 #define	MCFFEC_BASE0		(MCF_IPSBAR + 0x1000)
 #define	MCFFEC_SIZE0		0x800
+#ifdef CONFIG_M5275
 #define	MCFFEC_BASE1		(MCF_IPSBAR + 0x1800)
 #define	MCFFEC_SIZE1		0x800
+#endif
 
 /*
  *	QSPI module.
-- 
1.9.1
