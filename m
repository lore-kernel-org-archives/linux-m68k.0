From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 3/8] m68k: add dummy dump_fpu() when FPU is not present
Date: Wed,  8 Jul 2015 11:51:27 +0200
Message-ID: <1436349092-2214-4-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35560 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933547AbbGHJvv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:51 -0400
Received: by wiga1 with SMTP id a1so279958779wig.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:50 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.50
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:50 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This is requirement from elfcore.h
No other arch put this one under flag, so this alignment
for build with elf binary support to succeed.

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/kernel/process.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index c55ff71..03e29a4 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -203,9 +203,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 }
 
 /* Fill in the fpu structure for a core dump.  */
-#ifdef CONFIG_FPU
 int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 {
+#ifdef CONFIG_FPU
 	char fpustate[216];
 
 	if (FPU_IS_EMU) {
@@ -250,9 +250,11 @@ int dump_fpu (struct pt_regs *regs, struct user_m68kfp_struct *fpu)
 	}
 
 	return 1;
+#else
+	return 0;
+#endif /* CONFIG_FPU */
 }
 EXPORT_SYMBOL(dump_fpu);
-#endif /* CONFIG_FPU */
 
 unsigned long get_wchan(struct task_struct *p)
 {
-- 
1.9.1.286.g5172cb3
