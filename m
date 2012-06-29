From: <gerg@snapgear.com>
Subject: [PATCH 1/3] m68knommu: move the badly named mcfne.h to a better mcf8390.h
Date: Fri, 29 Jun 2012 10:09:22 +1000
Message-ID: <1340928564-12116-2-git-send-email-gerg@snapgear.com>
References: <1340928564-12116-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:31945 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753018Ab2F2AKV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 28 Jun 2012 20:10:21 -0400
In-Reply-To: <1340928564-12116-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The mcfne.h include contains definitions to support NS8390 eth based hardware
on ColdFire based CPU boards. So change its name to reflect that better.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/{mcfne.h => mcf8390.h} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/m68k/include/asm/{mcfne.h => mcf8390.h} (98%)

diff --git a/arch/m68k/include/asm/mcfne.h b/arch/m68k/include/asm/mcf8390.h
similarity index 98%
rename from arch/m68k/include/asm/mcfne.h
rename to arch/m68k/include/asm/mcf8390.h
index bf638be..bf3d97b 100644
--- a/arch/m68k/include/asm/mcfne.h
+++ b/arch/m68k/include/asm/mcf8390.h
@@ -1,7 +1,7 @@
 /****************************************************************************/
 
 /*
- *	mcfne.h -- NE2000 in ColdFire eval boards.
+ *	mcf8390.h -- NS8390 support for ColdFire eval boards.
  *
  *	(C) Copyright 1999-2000, Greg Ungerer (gerg@snapgear.com)
  *	(C) Copyright 2000,      Lineo (www.lineo.com)
@@ -14,8 +14,8 @@
  */
 
 /****************************************************************************/
-#ifndef	mcfne_h
-#define	mcfne_h
+#ifndef	mcf8390_h
+#define	mcf8390_h
 /****************************************************************************/
 
 
@@ -239,4 +239,4 @@ void ne2000_outsw(unsigned int addr, const void *vbuf, unsigned long len)
 #endif /* NE2000_OFFOFFSET */
 
 /****************************************************************************/
-#endif	/* mcfne_h */
+#endif	/* mcf8390_h */
-- 
1.7.0.4
