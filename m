From: Steven King <sfking@fdwdc.com>
Subject: [PATCH] m68knommu: Fix the 5249/525x qspi base address.
Date: Wed, 14 May 2014 10:06:46 -0700
Message-ID: <201405141006.46618.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp103.biz.mail.bf1.yahoo.com ([98.139.221.62]:29286 "HELO
	smtp103.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756485AbaENRN2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 14 May 2014 13:13:28 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Use the correct base address for the QSPI module on the 5249/525x.

Signed-off-by: Steven King <sfking@fdwdc.com>

---
 arch/m68k/include/asm/m525xsim.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m525xsim.h 
b/arch/m68k/include/asm/m525xsim.h
index c2b22a6..8980b1a 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -105,7 +105,7 @@
 /*
  *	QSPI module.
  */
-#define MCFQSPI_BASE		(MCF_MBAR + 0x300)	/* Base address QSPI */
+#define MCFQSPI_BASE		(MCF_MBAR + 0x400)	/* Base address QSPI */
 #define MCFQSPI_SIZE		0x40			/* Register set size */
 
 #ifdef CONFIG_M5249
