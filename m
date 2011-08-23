From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: create common externs for _ram* vars
Date: Tue, 23 Aug 2011 16:06:13 +1000
Message-ID: <1314079573-26816-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:29459 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWGJN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 02:09:13 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Create common extern definitions of _rambase, _ramstart and _ramend
instead of them being externed when used in code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/page_no.h |    3 +++
 arch/m68k/kernel/setup_no.c     |    2 --
 arch/m68k/mm/init_no.c          |    1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 9059572..a8d1c60 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -5,6 +5,9 @@
  
 extern unsigned long memory_start;
 extern unsigned long memory_end;
+extern unsigned long _rambase;
+extern unsigned long _ramstart;
+extern unsigned long _ramend;
 
 #define get_user_page(vaddr)		__get_free_page(GFP_KERNEL)
 #define free_user_page(page, addr)	free_page(addr)
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index d5a616f..2ed8c0f 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -81,8 +81,6 @@ void (*mach_power_off)(void);
 #define	CPU_INSTR_PER_JIFFY	16
 #endif
 
-extern int _ramstart, _ramend;
-
 #if defined(CONFIG_UBOOT)
 /*
  * parse_uboot_commandline
diff --git a/arch/m68k/mm/init_no.c b/arch/m68k/mm/init_no.c
index 3cf5a50..1e33d39 100644
--- a/arch/m68k/mm/init_no.c
+++ b/arch/m68k/mm/init_no.c
@@ -76,7 +76,6 @@ void __init mem_init(void)
 {
 	int codek = 0, datak = 0, initk = 0;
 	unsigned long tmp;
-	extern unsigned int _ramend, _rambase;
 	unsigned long len = _ramend - _rambase;
 	unsigned long start_mem = memory_start; /* DAVIDM - these must start at end of kernel */
 	unsigned long end_mem   = memory_end; /* DAVIDM - this must not include kernel stack at top */
-- 
1.7.0.4
