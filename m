From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix linker script exported name sections
Date: Wed, 8 Jun 2011 14:14:28 +1000
Message-ID: <1307506468-18189-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:29643 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759Ab1FHEUS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jun 2011 00:20:18 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The recent commit titled "module: Sort exported symbols" (f02e8a65)
changed the exported symbol name sections. Bring the m68knommu linker
script into line with those changes - including the sorting of the
symbol names.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/vmlinux.lds_no.S |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/kernel/vmlinux.lds_no.S b/arch/m68k/kernel/vmlinux.lds_no.S
index f4d715c..7dc4087 100644
--- a/arch/m68k/kernel/vmlinux.lds_no.S
+++ b/arch/m68k/kernel/vmlinux.lds_no.S
@@ -84,52 +84,52 @@ SECTIONS {
 		/* Kernel symbol table: Normal symbols */
 		. = ALIGN(4);
 		__start___ksymtab = .;
-		*(__ksymtab)
+		*(SORT(___ksymtab+*))
 		__stop___ksymtab = .;
 
 		/* Kernel symbol table: GPL-only symbols */
 		__start___ksymtab_gpl = .;
-		*(__ksymtab_gpl)
+		*(SORT(___ksymtab_gpl+*))
 		__stop___ksymtab_gpl = .;
 
 		/* Kernel symbol table: Normal unused symbols */
 		__start___ksymtab_unused = .;
-		*(__ksymtab_unused)
+		*(SORT(___ksymtab_unused+*))
 		__stop___ksymtab_unused = .;
 
 		/* Kernel symbol table: GPL-only unused symbols */
 		__start___ksymtab_unused_gpl = .;
-		*(__ksymtab_unused_gpl)
+		*(SORT(___ksymtab_unused_gpl+*))
 		__stop___ksymtab_unused_gpl = .;
 
 		/* Kernel symbol table: GPL-future symbols */
 		__start___ksymtab_gpl_future = .;
-		*(__ksymtab_gpl_future)
+		*(SORT(___ksymtab_gpl_future+*))
 		__stop___ksymtab_gpl_future = .;
 
 		/* Kernel symbol table: Normal symbols */
 		__start___kcrctab = .;
-		*(__kcrctab)
+		*(SORT(___kcrctab+*))
 		__stop___kcrctab = .;
 
 		/* Kernel symbol table: GPL-only symbols */
 		__start___kcrctab_gpl = .;
-		*(__kcrctab_gpl)
+		*(SORT(___kcrctab_gpl+*))
 		__stop___kcrctab_gpl = .;
 
 		/* Kernel symbol table: Normal unused symbols */
 		__start___kcrctab_unused = .;
-		*(__kcrctab_unused)
+		*(SORT(___kcrctab_unused+*))
 		__stop___kcrctab_unused = .;
 
 		/* Kernel symbol table: GPL-only unused symbols */
 		__start___kcrctab_unused_gpl = .;
-		*(__kcrctab_unused_gpl)
+		*(SORT(___kcrctab_unused_gpl+*))
 		__stop___kcrctab_unused_gpl = .;
 
 		/* Kernel symbol table: GPL-future symbols */
 		__start___kcrctab_gpl_future = .;
-		*(__kcrctab_gpl_future)
+		*(SORT(___kcrctab_gpl_future+*))
 		__stop___kcrctab_gpl_future = .;
 
 		/* Kernel symbol table: strings */
-- 
1.7.0.4
