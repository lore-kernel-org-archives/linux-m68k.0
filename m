From: <gerg@snapgear.com>
Subject: [PATCH v2 1/3] m68k: use some direct calls to ret_from_exception in entry code
Date: Fri, 18 May 2012 14:22:49 +1000
Message-ID: <1337314971-11087-2-git-send-email-gerg@snapgear.com>
References: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:45255 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753349Ab2EREW4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 May 2012 00:22:56 -0400
In-Reply-To: <1337314971-11087-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ret_from_excption code is referenced by its function name, or by a label
set at the start of its code. The non-MMU code can share some of this code
if we make direct calls to ret_from_exception instead of the associated label.
The effected function paths are: buserr, trap and ret_from_fork. So change
these to branch directly to ret_from_exception.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_mm.S |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry_mm.S
index 675a854..f3cd173 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry_mm.S
@@ -57,7 +57,7 @@ ENTRY(buserr)
 	movel	%sp,%sp@-		| stack frame pointer argument
 	bsrl	buserr_c
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 ENTRY(trap)
 	SAVE_ALL_INT
@@ -65,7 +65,7 @@ ENTRY(trap)
 	movel	%sp,%sp@-		| stack frame pointer argument
 	bsrl	trap_c
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 	| After a fork we jump here directly from resume,
 	| so that %d1 contains the previous task
@@ -74,7 +74,7 @@ ENTRY(ret_from_fork)
 	movel	%d1,%sp@-
 	jsr	schedule_tail
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
-- 
1.7.0.4
