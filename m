From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: no need to set register marker on traps
Date: Fri, 18 Nov 2011 16:19:16 +1000
Message-ID: <1321597156-23570-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:16563 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754869Ab1KRGTK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Nov 2011 01:19:10 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Commit 61619b12078dc8b85a3d4cbfa16f650daa341bd1 ("m68k: merge mmu and
non-mmu include/asm/entry.h files") made the trap entry code basically
the same for mmu and non-mmu builds. This means we no longer need code
to mark the stack frame as "system-call" type or other in the non-mmu
trap handling entry points. This is done in the SAVE_ALL_INT macro now.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_no.S |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
index 1b42890..ac86a9f 100644
--- a/arch/m68k/kernel/entry_no.S
+++ b/arch/m68k/kernel/entry_no.S
@@ -44,8 +44,6 @@
 
 ENTRY(buserr)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	buserr_c
 	addql	#4,%sp
@@ -53,8 +51,6 @@ ENTRY(buserr)
 
 ENTRY(trap)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	trap_c
 	addql	#4,%sp
@@ -65,8 +61,6 @@ ENTRY(trap)
 .globl dbginterrupt
 ENTRY(dbginterrupt)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	dbginterrupt_c
 	addql	#4,%sp
-- 
1.7.0.4
