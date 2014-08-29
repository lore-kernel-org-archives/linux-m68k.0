From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k: Wire up memfd_create
Date: Fri, 29 Aug 2014 18:08:03 +0200
Message-ID: <1409328483-8460-2-git-send-email-geert__42727.818087633$1409328533$gmane$org@linux-m68k.org>
References: <1409328483-8460-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1409328483-8460-1-git-send-email-geert@linux-m68k.org>
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
index fbf8792f4179..4ef7a54813e6 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -4,7 +4,7 @@
 #include <uapi/asm/unistd.h>
 
 
-#define NR_syscalls		353
+#define NR_syscalls		354
 
 #define __ARCH_WANT_OLD_READDIR
 #define __ARCH_WANT_OLD_STAT
diff --git a/arch/m68k/include/uapi/asm/unistd.h b/arch/m68k/include/uapi/asm/unistd.h
index e906e3c1542e..b419c6b7ac37 100644
--- a/arch/m68k/include/uapi/asm/unistd.h
+++ b/arch/m68k/include/uapi/asm/unistd.h
@@ -358,5 +358,6 @@
 #define __NR_sched_getattr	350
 #define __NR_renameat2		351
 #define __NR_getrandom		352
+#define __NR_memfd_create	353
 
 #endif /* _UAPI_ASM_M68K_UNISTD_H_ */
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index 9307b488ce14..05b46c2b08b8 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -373,4 +373,5 @@ ENTRY(sys_call_table)
 	.long sys_sched_getattr		/* 350 */
 	.long sys_renameat2
 	.long sys_getrandom
+	.long sys_memfd_create
 
-- 
1.9.1
