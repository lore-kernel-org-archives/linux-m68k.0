From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Thu, 24 Apr 2014 12:24:48 +0200
Message-ID: <87ppk7m3db.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:54419 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753264AbaDXKYw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Apr 2014 06:24:52 -0400
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3gDvlQ1k8mz4KK7F
	for <linux-m68k@vger.kernel.org>; Thu, 24 Apr 2014 12:24:49 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3gDvlP6KnzzbbtG
	for <linux-m68k@vger.kernel.org>; Thu, 24 Apr 2014 12:24:49 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new, port 10024)
	with ESMTP id dFiGtQ4mp-VW for <linux-m68k@vger.kernel.org>;
	Thu, 24 Apr 2014 12:24:48 +0200 (CEST)
Received: from igel.home (ppp-188-174-154-23.dynamic.mnet-online.de [188.174.154.23])
	by mail.mnet-online.de (Postfix) with ESMTPA
	for <linux-m68k@vger.kernel.org>; Thu, 24 Apr 2014 12:24:48 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

If the size of the first memory chunk is at least 16MB increase the
initial mapping to 16MB instead of 4MB.  This makes it possible to map
more memory in the first node without running out of space for the page
tables.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/kernel/head.S | 9 ++++++++-
 arch/m68k/mm/motorola.c | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index ac85f16..23091ea 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -941,7 +941,14 @@ L(nocon):
  *	First map the first 4 MB of kernel code & data
  */
 
-	mmu_map	#PAGE_OFFSET,%pc@(L(phys_kernel_start)),#4*1024*1024,\
+	get_bi_record BI_MEMCHUNK
+	movel	%a0@(4),%d0
+	movel	#16*1024*1024,%d1
+	cmpl	%d0,%d1
+	jls	1f
+	lsrl	#2,%d1
+1:
+	mmu_map	#PAGE_OFFSET,%pc@(L(phys_kernel_start)),%d1,\
 		%pc@(m68k_supervisor_cachemode)
 
 	putc	'C'
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 251c543..0e4c3a9 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -45,7 +45,7 @@ EXPORT_SYMBOL(mm_cachebits);
 #endif
 
 /* size of memory already mapped in head.S */
-#define INIT_MAPPED_SIZE	(4UL<<20)
+#define INIT_MAPPED_SIZE	(m68k_memory[0].size >= 16UL<<20 ? 16UL<<20 : 4UL<<20)
 
 extern unsigned long availmem;
 
-- 
1.9.2


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
