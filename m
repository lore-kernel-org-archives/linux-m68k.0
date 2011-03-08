From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 11/12] m68knommu: clean up definitions of ColdFire peripheral base registers
Date: Tue, 8 Mar 2011 23:04:08 +1000
Message-ID: <1299589449-24974-12-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
 <1299589449-24974-6-git-send-email-gerg@uclinux.org>
 <1299589449-24974-7-git-send-email-gerg@uclinux.org>
 <1299589449-24974-8-git-send-email-gerg@uclinux.org>
 <1299589449-24974-9-git-send-email-gerg@uclinux.org>
 <1299589449-24974-10-git-send-email-gerg@uclinux.org>
 <1299589449-24974-11-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51468 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754370Ab1CHNIJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:09 -0500
In-Reply-To: <1299589449-24974-11-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

Different ColdFire CPUs have different ways of defining where their
internal peripheral registers sit in their address space. Some use an
MBAR register, some use and IPSBAR register, some have a fixed mapping.

Now that most of the peripheral address definitions have been cleaned up
we can clean up the setting of the MBAR and IPSBAR defines to limit them
to just where they are needed (and where they actually exist).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index c7dce7e..f06a0a4 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -27,15 +27,20 @@
 #endif
 
 /*
- *	Define the processor support peripherals base address.
+ *	Define the processor internal peripherals base address.
+ *
+ *	The majority of ColdFire parts use an MBAR register to set
+ *	the base address. Some have an IPSBAR register instead, and it
+ *	has slightly different rules on its size and alignment. Some
+ *	parts have fixed addresses and the internal peripherals cannot
+ *	be relocated in the address space.
+ *
  *	This is generally setup by the boards start up code.
  */
-#define	MCF_MBAR	0x10000000
-#define	MCF_IPSBAR	0x40000000
-
 #if defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
-#undef MCF_MBAR
-#define	MCF_MBAR	MCF_IPSBAR
+#define	MCF_IPSBAR	0x40000000
+#else
+#define	MCF_MBAR	0x10000000
 #endif
 
 /****************************************************************************/
-- 
1.7.0.4
