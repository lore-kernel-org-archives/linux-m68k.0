From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Wire up copy_file_range
Date: Sat, 23 Jan 2016 11:05:15 +0100
Message-ID: <1453543515-18781-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index f9d96bf869109c02..bafaff6dcd7bda8a 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		376
+#define NR_syscalls		377
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 36cf129de663a7ca..0ca729665f29e9d6 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -381,5 +381,6 @@
 #define __NR_userfaultfd	373
 #define __NR_membarrier		374
 #define __NR_mlock2		375
+#define __NR_copy_file_range	376
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index 282cd903f4c46919..8bb94261ff97d953 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -396,3 +396,4 @@ ENTRY(sys_call_table)
 	.long sys_userfaultfd
 	.long sys_membarrier
 	.long sys_mlock2		/* 375 */
+	.long sys_copy_file_range
-- 
1.9.1
