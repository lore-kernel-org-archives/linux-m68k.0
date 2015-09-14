From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 4/4] m68k: Wire up membarrier
Date: Mon, 14 Sep 2015 10:56:46 +0200
Message-ID: <1442221006-2027-5-git-send-email-geert@linux-m68k.org>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

$ ./membarrier_test
membarrier MEMBARRIER_CMD_QUERY syscall available.
membarrier: MEMBARRIER_CMD_SHARED success.
membarrier: tests done!
$

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
--
v2:
  - New.
---
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 887667ad6a2f9536..b38c32fd7d96ab6a 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		385
+#define NR_syscalls		386
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 98298206127d0930..239fefc60e737343 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -390,5 +390,6 @@
 #define __NR_shmctl		382
 #define __NR_shmat		383
 #define __NR_shmdt		384
+#define __NR_membarrier		385
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index dd6de8bb9b7c7aa4..42dca8613ef02b38 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -405,3 +405,4 @@ ENTRY(sys_call_table)
 	.long sys_shmctl
 	.long sys_shmat
 	.long sys_shmdt
+	.long sys_membarrier		/* 385 */
-- 
1.9.1
