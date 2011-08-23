From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: use generic section names in setup code
Date: Tue, 23 Aug 2011 15:59:47 +1000
Message-ID: <1314079187-26488-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:26124 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWGDR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 02:03:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We should be including and using sections.h to get at the extern
definitions of the linker sections in the m68knommu startup code.
Not defining them locally.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/sections.h |    2 ++
 arch/m68k/kernel/setup_no.c      |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/sections.h b/arch/m68k/include/asm/sections.h
index d64967e..5277e52 100644
--- a/arch/m68k/include/asm/sections.h
+++ b/arch/m68k/include/asm/sections.h
@@ -3,4 +3,6 @@
 
 #include <asm-generic/sections.h>
 
+extern char _sbss[], _ebss[];
+
 #endif /* _ASM_M68K_SECTIONS_H */
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 16b2de7..d5a616f 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -36,6 +36,7 @@
 #include <asm/irq.h>
 #include <asm/machdep.h>
 #include <asm/pgtable.h>
+#include <asm/sections.h>
 
 unsigned long memory_start;
 unsigned long memory_end;
@@ -80,7 +81,6 @@ void (*mach_power_off)(void);
 #define	CPU_INSTR_PER_JIFFY	16
 #endif
 
-extern int _stext, _etext, _sdata, _edata, _sbss, _ebss, _end;
 extern int _ramstart, _ramend;
 
 #if defined(CONFIG_UBOOT)
-- 
1.7.0.4
