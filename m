From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] [RFC] m68k: Wire up direct socket calls
Date: Sun,  6 Sep 2015 12:06:30 +0200
Message-ID: <1441533991-23853-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/unistd.h      |  2 +-
 arch/m68k/include/uapi/asm/unistd.h | 15 +++++++++++++++
 arch/m68k/kernel/syscalltable.S     | 16 +++++++++++++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 244e0dbe45dbeda3..47d6b7153960274e 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		356
+#define NR_syscalls		371
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 61fb6cb9d2ae3c66..bf168d5ec3d96d32 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -361,5 +361,20 @@
 #define __NR_memfd_create	353
 #define __NR_bpf		354
 #define __NR_execveat		355
+#define __NR_socket		356
+#define __NR_socketpair		357
+#define __NR_bind		358
+#define __NR_connect		359
+#define __NR_listen		360
+#define __NR_accept4		361
+#define __NR_getsockopt		362
+#define __NR_setsockopt		363
+#define __NR_getsockname	364
+#define __NR_getpeername	365
+#define __NR_sendto		366
+#define __NR_sendmsg		367
+#define __NR_recvfrom		368
+#define __NR_recvmsg		369
+#define __NR_shutdown		370
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index a0ec4303f2c8e57a..2cec7cdc8e440f08 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -376,4 +376,18 @@ ENTRY(sys_call_table)
 	.long sys_memfd_create
 	.long sys_bpf
 	.long sys_execveat		/* 355 */
-
+	.long sys_socket
+	.long sys_socketpair
+	.long sys_bind
+	.long sys_connect
+	.long sys_listen		/* 360 */
+	.long sys_accept4
+	.long sys_getsockopt
+	.long sys_setsockopt
+	.long sys_getsockname
+	.long sys_getpeername		/* 365 */
+	.long sys_sendto
+	.long sys_sendmsg
+	.long sys_recvfrom
+	.long sys_recvmsg
+	.long sys_shutdown		/* 370 */
-- 
1.9.1
