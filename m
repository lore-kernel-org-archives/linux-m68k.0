From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: add KMAP definitions for non-MMU definitions
Date: Mon, 22 Oct 2012 15:52:32 +1000
Message-ID: <1350885152-20537-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:63551 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589Ab2JVFr1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 01:47:27 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

To be consistent with the set of MMU definitions we should define KMAP_START
and KMAP_END. Future common m68k code will use their values.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/pgtable_no.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index bf86b29..037028f 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -64,6 +64,8 @@ extern unsigned int kobjsize(const void *objp);
  */
 #define	VMALLOC_START	0
 #define	VMALLOC_END	0xffffffff
+#define	KMAP_START	0
+#define	KMAP_END	0xffffffff
 
 #include <asm-generic/pgtable.h>
 
-- 
1.7.0.4
