From: Lanttor <lanttor.guo@freescale.com>
Subject: [PATCH]: fix CACHE_ENABLE macro on mcf532x platform
Date: Thu, 30 Jul 2009 17:29:44 +0800
Message-ID: <4A716808.9030705@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080208060902040002070508"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:57680 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbZG3JaL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jul 2009 05:30:11 -0400
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n6U9Tqoa020604
	for <linux-m68k@vger.kernel.org>; Thu, 30 Jul 2009 02:30:03 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n6U9U52s026274
	for <linux-m68k@vger.kernel.org>; Thu, 30 Jul 2009 04:30:05 -0500 (CDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jin Zhengxiong-R64188 <Jason.Jin@freescale.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------080208060902040002070508
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

This patch is to fix CACHE_ENABLE macro on the mcf532x platform, which
is defined in the file: arch/m68k/include/asm/mcfcache.h.
This patch is based on Linus' current git tree.

Thanks,

-- 
Best Regards,
Lanttor



--------------080208060902040002070508
Content-Type: text/x-diff;
 name="0001-Modify-the-CACHE_ENABLE-macro-on-mcf5329-platform.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-Modify-the-CACHE_ENABLE-macro-on-mcf5329-platform.patch"

>From 042e0e34bd5a293383e480955df2fecf0770b54f Mon Sep 17 00:00:00 2001
From: Lanttor Guo <lanttor.guo@freescale.com>
Date: Thu, 30 Jul 2009 16:58:41 +0800
Subject: [PATCH] Modify the CACHE_ENABLE macro on mcf5329 platform

Setting ACR0[ADDR_MASK] correctly.

For a given request address, if the ACR is valid and the
request mode matches the mode specified in the supervisor
mode field(ACRn[S]), hit determination is specified as:

ACRx_hit = 0;
if ((address[31:24] & ~ACRn[23:16]) == (ACRn[31:24] & ~ACRn[23:16]))
	ACRx_hit = 1;

Signed-off-by: Lanttor Guo <lanttor.guo@freescale.com>
---
 arch/m68k/include/asm/mcfcache.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/mcfcache.h b/arch/m68k/include/asm/mcfcache.h
index c042634..dc8c14c 100644
--- a/arch/m68k/include/asm/mcfcache.h
+++ b/arch/m68k/include/asm/mcfcache.h
@@ -97,7 +97,7 @@
 	movel	#0x01000000,%d0		/* invalidate cache cmd */
 	movec	%d0,%CACR		/* do invalidate cache */
 	nop
-	movel	#0x4001C000,%d0		/* set SDRAM cached (write-thru) */
+	movel	#0x400FC000,%d0		/* set SDRAM cached (write-thru) */
 	movec	%d0,%ACR0
 	movel	#0x00000000,%d0		/* no other regions cached */
 	movec	%d0,%ACR1
-- 
1.6.3.2


--------------080208060902040002070508--
