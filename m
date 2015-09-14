From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/4] m68k: Wire up direct socket calls
Date: Mon, 14 Sep 2015 10:56:43 +0200
Message-ID: <1442221006-2027-2-git-send-email-geert@linux-m68k.org>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Greg Ungerer <gerg@uclinux.org>
---
v2:
  - Drop RFC state,
  - Add Acked-by,
  - Add missing recvmmsg and sendmmsg.
---
 arch/m68k/include/asm/unistd.h      |  2 +-
 arch/m68k/include/uapi/asm/unistd.h | 17 +++++++++++++++++
 arch/m68k/kernel/syscalltable.S     | 18 +++++++++++++++++-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 244e0dbe45dbeda3..7599cb94f9a0edea 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		356
+#define NR_syscalls		373
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index 61fb6cb9d2ae3c66..b29ef18adb4aa8c5 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -361,5 +361,22 @@
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
+#define __NR_recvmmsg		371
+#define __NR_sendmmsg		372
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index a0ec4303f2c8e57a..e0fe52b62a3e8bec 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -376,4 +376,20 @@ ENTRY(sys_call_table)
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
+	.long sys_recvmmsg
+	.long sys_sendmmsg
-- 
1.9.1
