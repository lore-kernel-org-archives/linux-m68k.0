From: <gerg@snapgear.com>
Subject: [PATCH 12/36] m68k: add ColdFire paging exception handling code
Date: Tue, 25 Oct 2011 17:19:04 +1000
Message-ID: <1319527168-11166-13-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25113 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab1JYHTY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:24 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to traps.c to handle MMU exceptions for the ColdFire.
Most of this code is from the 2.6.25 kernel BSP code released by
Freescale.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/traps.c |  104 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 104 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 89362f2..2ced994 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -706,8 +706,94 @@ create_atc_entry:
 #endif /* CPU_M68020_OR_M68030 */
 #endif /* !CONFIG_SUN3 */
 
+#if defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
+#include <asm/mcfmmu.h>
+
+/*
+ *	The following table converts the FS encoding of a ColdFire
+ *	exception stack frame into the error_code value needed by
+ *	do_fault.
+*/
+static const unsigned char fs_err_code[] = {
+	0,  /* 0000 */
+	0,  /* 0001 */
+	0,  /* 0010 */
+	0,  /* 0011 */
+	1,  /* 0100 */
+	0,  /* 0101 */
+	0,  /* 0110 */
+	0,  /* 0111 */
+	2,  /* 1000 */
+	3,  /* 1001 */
+	2,  /* 1010 */
+	0,  /* 1011 */
+	1,  /* 1100 */
+	1,  /* 1101 */
+	0,  /* 1110 */
+	0   /* 1111 */
+};
+
+static inline void access_errorcf(unsigned int fs, struct frame *fp)
+{
+	unsigned long int mmusr, complainingAddress;
+	unsigned int err_code;
+	int need_page_fault;
+
+	mmusr = mmu_read(MMUSR);
+	complainingAddress = mmu_read(MMUAR);
+
+	/*
+	 * error_code:
+	 *	bit 0 == 0 means no page found, 1 means protection fault
+	 *	bit 1 == 0 means read, 1 means write
+	 */
+	switch (fs) {
+	case  5:  /* 0101 TLB opword X miss */
+		need_page_fault = cf_tlb_miss(&fp->ptregs, 0, 0, 0);
+		complainingAddress = fp->ptregs.pc;
+		break;
+	case  6:  /* 0110 TLB extension word X miss */
+		need_page_fault = cf_tlb_miss(&fp->ptregs, 0, 0, 1);
+		complainingAddress = fp->ptregs.pc + sizeof(long);
+		break;
+	case 10:  /* 1010 TLB W miss */
+		need_page_fault = cf_tlb_miss(&fp->ptregs, 1, 1, 0);
+		break;
+	case 14: /* 1110 TLB R miss */
+		need_page_fault = cf_tlb_miss(&fp->ptregs, 0, 1, 0);
+		break;
+	default:
+		/* 0000 Normal  */
+		/* 0001 Reserved */
+		/* 0010 Interrupt during debug service routine */
+		/* 0011 Reserved */
+		/* 0100 X Protection */
+		/* 0111 IFP in emulator mode */
+		/* 1000 W Protection*/
+		/* 1001 Write error*/
+		/* 1011 Reserved*/
+		/* 1100 R Protection*/
+		/* 1101 R Protection*/
+		/* 1111 OEP in emulator mode*/
+		need_page_fault = 1;
+		break;
+	}
+
+	if (need_page_fault) {
+		err_code = fs_err_code[fs];
+		if ((fs == 13) && (mmusr & MMUSR_WF)) /* rd-mod-wr access */
+			err_code |= 2; /* bit1 - write, bit0 - protection */
+		do_page_fault(&fp->ptregs, complainingAddress, err_code);
+	}
+}
+#endif /* CONFIG_COLDFIRE CONFIG_MMU */
+
 asmlinkage void buserr_c(struct frame *fp)
 {
+#if defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
+	unsigned int fs;
+#endif
+
 	/* Only set esp0 if coming from user mode */
 	if (user_mode(&fp->ptregs))
 		current->thread.esp0 = (unsigned long) fp;
@@ -716,6 +802,24 @@ asmlinkage void buserr_c(struct frame *fp)
 	printk ("*** Bus Error *** Format is %x\n", fp->ptregs.format);
 #endif
 
+#if defined(CONFIG_COLDFIRE) && defined(CONFIG_MMU)
+	fs = (fp->ptregs.vector & 0x3) | ((fp->ptregs.vector & 0xc00) >> 8);
+	switch (fs) {
+	case 0x5:
+	case 0x6:
+	case 0x7:
+	case 0x9:
+	case 0xa:
+	case 0xd:
+	case 0xe:
+	case 0xf:
+		access_errorcf(fs, fp);
+		return;
+	default:
+		break;
+	}
+#endif /* CONFIG_COLDFIRE CONFIG_MMU */
+
 	switch (fp->ptregs.format) {
 #if defined (CONFIG_M68060)
 	case 4:				/* 68060 access error */
-- 
1.7.0.4
