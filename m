From: <gerg@snapgear.com>
Subject: [PATCH 08/35] m68k: init the MMU hardware for the 54xx ColdFire
Date: Fri, 23 Dec 2011 13:15:21 +1000
Message-ID: <1324610148-20666-9-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39232 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756330Ab1LWDOl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:41 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The 54xx ColdFire CPU family has an internal MMU. Up to now though we
have only supported running on them with the MMU disabled.

Add code to the 54xx ColdFire init sequence to initialize the bootmem
used by the usual MMU m68k code for paging init.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/platform/coldfire/head.S |   47 +++++++++++++++++++++++++++++++++++-
 1 files changed, 46 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index 0ed41ed..c3db70e 100644
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
@@ -197,6 +206,26 @@ _start:
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
@@ -242,6 +271,22 @@ _clear_bss:
 	lea	init_thread_union,%a0
 	lea	THREAD_SIZE(%a0),%sp
 
+#ifdef CONFIG_MMU
+.global m68k_cputype
+.global m68k_mmutype
+.global m68k_fputype
+.global m68k_machtype
+	movel	#CPU_COLDFIRE,%d0
+	movel	%d0,m68k_cputype		/* Mark us as a ColdFire */
+	movel	#MMU_COLDFIRE,%d0
+	movel	%d0,m68k_mmutype
+	movel	#FPU_COLDFIRE,%d0
+	movel	%d0,m68k_fputype
+	movel	#MACH_M54XX,%d0
+	movel	%d0,m68k_machtype		/* Mark us as a 54xx machine */
+	lea	init_task,%a2			/* Set "current" init task */
+#endif
+
 	/*
 	 *	Assember start up done, start code proper.
 	 */
-- 
1.7.0.4
