From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Wire up preadv2 and pwritev2
Date: Mon, 21 Mar 2016 11:40:07 +0100
Message-ID: <1458556807-18503-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 2 ++
 arch/m68k/kernel/syscalltable.S     | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index bafaff6dcd7bda8a..a857d82ec5094abc 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		377
+#define NR_syscalls		379
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 0ca729665f29e9d6..9fe674bf911fd2a4 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -382,5 +382,7 @@
 #define __NR_membarrier		374
 #define __NR_mlock2		375
 #define __NR_copy_file_range	376
+#define __NR_preadv2		377
+#define __NR_pwritev2		378
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index 8bb94261ff97d953..d6fd6d9ced2474ab 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -397,3 +397,5 @@ ENTRY(sys_call_table)
 	.long sys_membarrier
 	.long sys_mlock2		/* 375 */
 	.long sys_copy_file_range
+	.long sys_preadv2
+	.long sys_pwritev2
-- 
1.9.1
