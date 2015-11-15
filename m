From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Wire up mlock2
Date: Sun, 15 Nov 2015 12:09:07 +0100
Message-ID: <1447585747-20316-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This depends on series "[PATCH 0/4] m68k/mm: Add missing initialization of
max_pfn and {min,max}_low_pfn" to work.

 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 0793a7f174176e6d..f9d96bf869109c02 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		375
+#define NR_syscalls		376
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 5e6fae6c275f9b11..36cf129de663a7ca 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -380,5 +380,6 @@
 #define __NR_sendmmsg		372
 #define __NR_userfaultfd	373
 #define __NR_membarrier		374
+#define __NR_mlock2		375
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index 5dd0e80042f51107..282cd903f4c46919 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -395,3 +395,4 @@ ENTRY(sys_call_table)
 	.long sys_sendmmsg
 	.long sys_userfaultfd
 	.long sys_membarrier
+	.long sys_mlock2		/* 375 */
-- 
1.9.1
