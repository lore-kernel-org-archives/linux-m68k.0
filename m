From: <gerg@snapgear.com>
Subject: [PATCH v2 2/3] m68k: use jbsr to call functions instead of bsrl
Date: Fri, 18 May 2012 14:22:50 +1000
Message-ID: <1337314971-11087-3-git-send-email-gerg@snapgear.com>
References: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:45256 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636Ab2EREW6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 May 2012 00:22:58 -0400
In-Reply-To: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is a few places that the m68k entry code uses the bsrl instruction
to call other functions. That instruction is only supported on 68020 and
higher CPU types. If we use jbsr instead the code will be clean for all
68k and ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_mm.S |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry_mm.S
index f3cd173..2385539 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry_mm.S
@@ -55,7 +55,7 @@ ENTRY(buserr)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
 	movel	%sp,%sp@-		| stack frame pointer argument
-	bsrl	buserr_c
+	jbsr	buserr_c
 	addql	#4,%sp
 	jra	ret_from_exception
 
@@ -63,7 +63,7 @@ ENTRY(trap)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
 	movel	%sp,%sp@-		| stack frame pointer argument
-	bsrl	trap_c
+	jbsr	trap_c
 	addql	#4,%sp
 	jra	ret_from_exception
 
-- 
1.7.0.4
