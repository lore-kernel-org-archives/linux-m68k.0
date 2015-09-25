From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 3/3] m68k: Wire up membarrier
Date: Fri, 25 Sep 2015 09:08:09 +0200
Message-ID: <1443164889-6217-4-git-send-email-geert@linux-m68k.org>
References: <1443164889-6217-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1443164889-6217-1-git-send-email-geert@linux-m68k.org>
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
Acked-by: Greg Ungerer <gerg@uclinux.org>
---
v3:
  - Add Acked-by,
  - Move before "m68k: Wire up direct ipc calls",

v2:
  - New.
---
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/syscalltable.S     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index d25d5a5c83cb6d6b..0793a7f174176e6d 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		374
+#define NR_syscalls		375
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 0eebb28488eced36..5e6fae6c275f9b11 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -379,5 +379,6 @@
 #define __NR_recvmmsg		371
 #define __NR_sendmmsg		372
 #define __NR_userfaultfd	373
+#define __NR_membarrier		374
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index 7b5a315f6df2c770..5dd0e80042f51107 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -394,3 +394,4 @@ ENTRY(sys_call_table)
 	.long sys_recvmmsg
 	.long sys_sendmmsg
 	.long sys_userfaultfd
+	.long sys_membarrier
-- 
1.9.1
