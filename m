From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: remove extern definitions of memory_start/memory_end from mm/init
Date: Tue, 23 Aug 2011 16:05:03 +1000
Message-ID: <1314079503-26758-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:19914 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWGFE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 02:05:04 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We do not need to have local extern definitions of memory_start and
memory_end in mm/init_no.c. There are definitions already in asm/page_no.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init_no.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/mm/init_no.c b/arch/m68k/mm/init_no.c
index 66512da..3cf5a50 100644
--- a/arch/m68k/mm/init_no.c
+++ b/arch/m68k/mm/init_no.c
@@ -45,9 +45,6 @@
  */
 void *empty_zero_page;
 
-extern unsigned long memory_start;
-extern unsigned long memory_end;
-
 /*
  * paging_init() continues the virtual memory environment setup which
  * was begun by the code in arch/head.S.
-- 
1.7.0.4
