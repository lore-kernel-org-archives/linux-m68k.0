From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 1/5] m68knommu: move EXPORT of dump_fpu to function definition
Date: Fri, 8 Apr 2011 22:16:58 +1000
Message-ID: <1302265022-6614-2-git-send-email-gerg@uclinux.org>
References: <1302265022-6614-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49490 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756133Ab1DHMju (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Apr 2011 08:39:50 -0400
In-Reply-To: <1302265022-6614-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The EXPORT_SYMBOL(dump_fpu) belongs at the definition of the function,
not in some other random code file. So move it there.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c |    4 ----
 arch/m68k/kernel/process_no.c    |    1 +
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index c26717b..ab747e4 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -16,12 +16,8 @@
 #include <asm/checksum.h>
 #include <asm/current.h>
 
-extern int dump_fpu(struct pt_regs *, elf_fpregset_t *);
-
 /* platform dependent support */
 
-EXPORT_SYMBOL(dump_fpu);
-
 EXPORT_SYMBOL(ip_fast_csum);
 
 EXPORT_SYMBOL(kernel_thread);
diff --git a/arch/m68k/kernel/process_no.c b/arch/m68k/kernel/process_no.c
index e2a63af..eedadc2 100644
--- a/arch/m68k/kernel/process_no.c
+++ b/arch/m68k/kernel/process_no.c
@@ -283,6 +283,7 @@ int dump_fpu(struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 #endif
 	return 1;
 }
+EXPORT_SYMBOL(dump_fpu);
 
 /*
  *	Generic dumping code. Used for panic and debug.
-- 
1.7.0.4
