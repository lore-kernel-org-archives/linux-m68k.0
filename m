From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 03/12] m68knommu: remove bogus definition of MBAR for ColdFire 532x family
Date: Tue, 8 Mar 2011 23:04:00 +1000
Message-ID: <1299589449-24974-4-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51447 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754468Ab1CHNHn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:07:43 -0500
In-Reply-To: <1299589449-24974-3-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

Remove the bogus definition of the MBAR register for the ColdFire 532x
family. It doesn't have an MBAR register, its peripheral registers are
at fixed addresses and are not relative to a settable base.

All the code that relyed on this definition existing has been cleaned
up. The register address definitions now include the base as required.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index 9167645..8daea2c 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -41,9 +41,6 @@
     defined(CONFIG_M520x)
 #undef MCF_MBAR
 #define	MCF_MBAR	MCF_IPSBAR
-#elif defined(CONFIG_M532x)
-#undef MCF_MBAR
-#define MCF_MBAR	0x00000000
 #endif
 
 /****************************************************************************/
-- 
1.7.0.4
