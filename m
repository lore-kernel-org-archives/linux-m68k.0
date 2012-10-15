From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 2/4] Permit to read/write to shared page
Date: Mon, 15 Oct 2012 14:54:38 +0200
Message-ID: <1350305680-5441-2-git-send-email-stany.marcel@novasys-ingenierie.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:52442 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab2JOMy4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 08:54:56 -0400
Received: by mail-wi0-f172.google.com with SMTP id hq12so2050930wib.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 05:54:55 -0700 (PDT)
In-Reply-To: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

When flags are READ WRITE SHARED the page is now PAGE_SHARED defined as :
VALID | ACCESSED | DIRTY | READABLE | WRITABLE | ACCESSED
instead of
VALID | ACCESSED | SHARED

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---
 arch/m68k/include/asm/mcf_pgtable.h |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index 3c79368..a7f53eb 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -64,8 +64,10 @@
 				 | CF_PAGE_ACCESSED)
 
 #define PAGE_SHARED     __pgprot(CF_PAGE_VALID \
-				 | CF_PAGE_ACCESSED \
-				 | CF_PAGE_SHARED)
+				 | CF_PAGE_DIRTY \
+				 | CF_PAGE_READABLE \
+				 | CF_PAGE_WRITABLE \
+				 | CF_PAGE_ACCESSED)
 
 #define PAGE_INIT	__pgprot(CF_PAGE_VALID \
 				 | CF_PAGE_READABLE \
@@ -124,10 +126,7 @@
 				 | CF_PAGE_ACCESSED \
 				 | CF_PAGE_READABLE)
 #define __S010		PAGE_SHARED
-#define __S011		__pgprot(CF_PAGE_VALID \
-				 | CF_PAGE_ACCESSED \
-				 | CF_PAGE_SHARED \
-				 | CF_PAGE_READABLE)
+#define __S011		PAGE_SHARED
 #define __S100		__pgprot(CF_PAGE_VALID \
 				 | CF_PAGE_ACCESSED \
 				 | CF_PAGE_EXEC)
-- 
1.7.9.5
