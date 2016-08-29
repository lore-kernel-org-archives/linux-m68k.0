From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 8/8] m68k: don't panic if no hardware FPU defined
Date: Mon, 29 Aug 2016 21:43:24 +1000
Message-ID: <1472471004-4580-9-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49463
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932820AbcH2LmW (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:22 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

If we boot up and find no hardware FPU we panic and die.

Change this behavior to be that if we boot up and we _expect_ a hardware
FPU to be present then panic. Don't panic if we don't actually expect to
have any hardware FPU.

This lets us compile a kernel without FPU if we really choose too.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 00290c4..a01d4a0 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -549,7 +549,7 @@ module_init(proc_hardware_init);
 
 void check_bugs(void)
 {
-#ifndef CONFIG_M68KFPU_EMU
+#if defined(CONFIG_FPU) && !defined(CONFIG_M68KFPU_EMU)
 	if (m68k_fputype == 0) {
 		pr_emerg("*** YOU DO NOT HAVE A FLOATING POINT UNIT, "
 			"WHICH IS REQUIRED BY LINUX/M68K ***\n");
-- 
1.9.1
