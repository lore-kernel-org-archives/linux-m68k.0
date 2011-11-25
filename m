From: <gerg@snapgear.com>
Subject: [PATCH 19/35] m68k: MMU enabled ColdFire needs 8k ELF alignment
Date: Fri, 25 Nov 2011 13:41:04 +1000
Message-ID: <1322192480-22822-20-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53465 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752647Ab1KYDjg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:36 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Like the SUN3 hardware MMU the ColdFire MMU uses 8k pages. So we want
our ELF page size alingment to also be 8k. Modify the ELF alignment
setting.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/elf.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
index 01c193d..e9b7cda 100644
--- a/arch/m68k/include/asm/elf.h
+++ b/arch/m68k/include/asm/elf.h
@@ -59,10 +59,10 @@ typedef struct user_m68kfp_struct elf_fpregset_t;
    is actually used on ASV.  */
 #define ELF_PLAT_INIT(_r, load_addr)	_r->a1 = 0
 
-#ifndef CONFIG_SUN3
-#define ELF_EXEC_PAGESIZE	4096
-#else
+#if defined(CONFIG_SUN3) || defined(CONFIG_COLDFIRE)
 #define ELF_EXEC_PAGESIZE	8192
+#else
+#define ELF_EXEC_PAGESIZE	4096
 #endif
 
 /* This is the location that an ET_DYN program is loaded if exec'ed.  Typical
-- 
1.7.0.4
