From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 7/8] m68k: mmu: add u-boot command line support in setup_arch()
Date: Wed,  8 Jul 2015 11:51:31 +0200
Message-ID: <1436349092-2214-8-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:36799 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933962AbbGHJvy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:54 -0400
Received: by widjy10 with SMTP id jy10so212031593wid.1
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:53 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.52
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:53 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This part was ported from setup_no.c

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/kernel/setup_mm.c | 80 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 0bc6f77..94be970 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -225,6 +225,68 @@ static void __init m68k_parse_bootinfo(const struct bi_record *record)
 #endif
 }
 
+#if defined(CONFIG_UBOOT)
+/*
+ * parse_uboot_commandline
+ *
+ * Copies u-boot commandline arguments and store them in the proper linux
+ * variables.
+ *
+ * Assumes:
+ *	_init_sp global contains the address in the stack pointer when the
+ *	kernel starts (see head.S::_start)
+ *
+ *	U-Boot calling convention:
+ *	(*kernel) (kbd, initrd_start, initrd_end, cmd_start, cmd_end);
+ *
+ *	_init_sp can be parsed as such
+ *
+ *	_init_sp+00 = u-boot cmd after jsr into kernel (skip)
+ *	_init_sp+04 = &kernel board_info (residual data)
+ *	_init_sp+08 = &initrd_start
+ *	_init_sp+12 = &initrd_end
+ *	_init_sp+16 = &cmd_start
+ *	_init_sp+20 = &cmd_end
+ *
+ *	This also assumes that the memory locations pointed to are still
+ *	unmodified. U-boot places them near the end of external SDRAM.
+ *
+ * Argument(s):
+ *	commandp = the linux commandline arg container to fill.
+ *	size     = the sizeof commandp.
+ *
+ * Returns:
+ */
+static void __init parse_uboot_commandline(char *commandp, int size)
+{
+	extern unsigned long _init_sp;
+	unsigned long *sp;
+	unsigned long uboot_kbd;
+	unsigned long uboot_initrd_start, uboot_initrd_end;
+	unsigned long uboot_cmd_start, uboot_cmd_end;
+
+
+	sp = (unsigned long *)_init_sp;
+	uboot_kbd = sp[1];
+	uboot_initrd_start = sp[2];
+	uboot_initrd_end = sp[3];
+	uboot_cmd_start = sp[4];
+	uboot_cmd_end = sp[5];
+
+	if (uboot_cmd_start && uboot_cmd_end)
+		strncpy(commandp, (const char *)uboot_cmd_start, size);
+#if defined(CONFIG_BLK_DEV_INITRD)
+	if (uboot_initrd_start && uboot_initrd_end &&
+		(uboot_initrd_end > uboot_initrd_start)) {
+		initrd_start = uboot_initrd_start;
+		initrd_end = uboot_initrd_end;
+		printk(KERN_INFO "initrd at 0x%lx:0x%lx\n",
+			initrd_start, initrd_end);
+	}
+#endif /* if defined(CONFIG_BLK_DEV_INITRD) */
+}
+#endif /* #if defined(CONFIG_UBOOT) */
+
 void __init setup_arch(char **cmdline_p)
 {
 #ifndef CONFIG_SUN3
@@ -274,6 +336,24 @@ void __init setup_arch(char **cmdline_p)
 	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
 	m68k_command_line[CL_SIZE - 1] = 0;
 #endif /* CONFIG_BOOTPARAM */
+
+#if defined(CONFIG_UBOOT)
+	/* CONFIG_UBOOT and CONFIG_BOOTPARAM defined, concatenate cmdline */
+	#if defined(CONFIG_BOOTPARAM)
+		/* Add the whitespace separator */
+		m68k_command_line[strlen(CONFIG_BOOTPARAM_STRING)] = ' ';
+		/* Parse uboot command line into the rest of the buffer */
+		parse_uboot_commandline(
+			&m68k_command_line[(strlen(CONFIG_BOOTPARAM_STRING)+1)],
+			(sizeof(m68k_command_line) -
+			(strlen(CONFIG_BOOTPARAM_STRING)+1)));
+	/* Only CONFIG_UBOOT defined, create cmdline */
+	#else
+		parse_uboot_commandline(&m68k_command_line[0], sizeof(m68k_command_line));
+	#endif /* CONFIG_BOOTPARAM */
+	m68k_command_line[sizeof(m68k_command_line) - 1] = 0;
+#endif /* CONFIG_UBOOT */
+
 	*cmdline_p = m68k_command_line;
 	memcpy(boot_command_line, *cmdline_p, CL_SIZE);
 
-- 
1.9.1.286.g5172cb3
