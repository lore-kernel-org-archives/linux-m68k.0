From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 1/5] m68knommu: remove unused kernel_set_cachemode()
Date: Thu, 31 Mar 2011 14:19:27 +1000
Message-ID: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
References: <1301545171-19204-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31855 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab1CaEWC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:22:02 -0400
In-Reply-To: <1301545171-19204-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

None of the m68knommu platforms will ever use kernel_set_cachemode().
And it is specific to a couple of m68k devices. So remove it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/kmap_no.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/mm/kmap_no.c b/arch/m68k/mm/kmap_no.c
index ece8d5a..38b2abe 100644
--- a/arch/m68k/mm/kmap_no.c
+++ b/arch/m68k/mm/kmap_no.c
@@ -35,11 +35,3 @@ void iounmap(void *addr)
 {
 }
 
-/*
- * Set new cache mode for some kernel address space.
- * The caller must push data for that range itself, if such data may already
- * be in the cache.
- */
-void kernel_set_cachemode(void *addr, unsigned long size, int cmode)
-{
-}
-- 
1.7.0.4
