From: <gerg@snapgear.com>
Subject: [PATCH 08/36] m68k: init the MMU hardware for the 54xx ColdFire
Date: Tue, 25 Oct 2011 17:19:00 +1000
Message-ID: <1319527168-11166-9-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25111 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab1JYHTW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:22 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we want to run with the MMU enabled on the 54xx ColdFire CPUs then
we need to initialize it at startup. We also need to reserve some space
for the kernel's page table directory.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/head.S |   38 +++++++++++++++++++++++++++++++++++-
 1 files changed, 37 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index c334838..00ba371 100644
--- a/arch/m68k/platform/coldfire/head.S
+++ b/arch/m68k/platform/coldfire/head.S
@@ -3,7 +3,7 @@
 /*
  *	head.S -- common startup code for ColdFire CPUs.
  *
- *	(C) Copyright 1999-2010, Greg Ungerer <gerg@snapgear.com>.
+ *	(C) Copyright 1999-2011, Greg Ungerer <gerg@snapgear.com>.
  */
 
 /*****************************************************************************/
@@ -13,6 +13,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfmmu.h>
 #include <asm/thread_info.h>
 
 /*****************************************************************************/
@@ -135,6 +136,14 @@ _init_sp:
 
 __HEAD
 
+#ifdef CONFIG_MMU
+_start0:
+	jmp	_start
+.global kernel_pg_dir
+.equ	kernel_pg_dir,_start0
+.equ	.,_start0+0x1000
+#endif
+
 /*
  *	This is the codes first entry point. This is where it all
  *	begins...
@@ -193,6 +202,26 @@ _start:
 	movec	%d0,%CACR
 	nop
 
+#ifdef CONFIG_MMU
+	/*
+	 *	Identity mapping for the kernel region.
+	 */
+	movel	#(MMUBASE+1),%d0		/* enable MMUBAR registers */
+	movec	%d0,%MMUBAR
+	movel	#MMUOR_CA,%d0			/* clear TLB entries */
+	movel	%d0,MMUOR
+	movel	#0,%d0				/* set ASID to 0 */
+	movec	%d0,%asid
+
+	movel	#MMUCR_EN,%d0			/* Enable the identity map */
+	movel	%d0,MMUCR
+	nop					/* sync i-pipeline */
+
+	movel	#_vstart,%a0			/* jump to "virtual" space */
+	jmp	%a0@
+_vstart:
+#endif /* CONFIG_MMU */
+
 #ifdef CONFIG_ROMFS_FS
 	/*
 	 *	Move ROM filesystem above bss :-)
@@ -238,6 +267,13 @@ _clear_bss:
 	lea	init_thread_union,%a0
 	lea	THREAD_SIZE(%a0),%sp
 
+#ifdef CONFIG_MMU
+.global m68k_machtype
+	movel	#MACH_M54XX,%d0
+	movel	%d0,m68k_machtype		/* Mark us as a ColdFire */
+	lea	init_task,%a2			/* Set "current" init task */
+#endif
+
 	/*
 	 *	Assember start up done, start code proper.
 	 */
-- 
1.7.0.4
