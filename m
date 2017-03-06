From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Wire up statx
Date: Mon,  6 Mar 2017 11:22:05 +0100
Message-ID: <1488795725-1648-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index a857d82ec5094abc..aab1edd0d4bade51 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		379
+#define NR_syscalls		380
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 9fe674bf911fd2a4..25589f5b8669631d 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -384,5 +384,6 @@
 #define __NR_copy_file_range	376
 #define __NR_preadv2		377
 #define __NR_pwritev2		378
+#define __NR_statx		379
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index d6fd6d9ced2474ab..8c9fcfafe0dd90ba 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -399,3 +399,4 @@ ENTRY(sys_call_table)
 	.long sys_copy_file_range
 	.long sys_preadv2
 	.long sys_pwritev2
+	.long sys_statx
-- 
2.7.4
