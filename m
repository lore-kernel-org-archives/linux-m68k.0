From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: [PATCH v2 2/7] h8300: put bitsperlong.h in uapi
Date: Fri,  6 Jan 2017 10:43:54 +0100
Message-ID: <1483695839-18660-3-git-send-email-nicolas.dichtel__19464.5931399011$1483696503$gmane$org@6wind.com>
References: <bf83da6b-01ef-bf44-b3e1-ca6fc5636818@6wind.com>
 <1483695839-18660-1-git-send-email-nicolas.dichtel@6wind.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1483695839-18660-1-git-send-email-nicolas.dichtel@6wind.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: arnd@arndb.de
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, linux-c6x-dev@linux-c6x.org, linux-cris-kernel@axis.com, uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-metag@vger.kernel.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.

This header file is exported, thus move it to uapi.

Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 arch/h8300/include/asm/bitsperlong.h      | 10 +---------
 arch/h8300/include/uapi/asm/bitsperlong.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 arch/h8300/include/uapi/asm/bitsperlong.h

diff --git a/arch/h8300/include/asm/bitsperlong.h b/arch/h8300/include/asm/bitsperlong.h
index e140e46729ac..c0a8e2ee531e 100644
--- a/arch/h8300/include/asm/bitsperlong.h
+++ b/arch/h8300/include/asm/bitsperlong.h
@@ -1,14 +1,6 @@
 #ifndef __ASM_H8300_BITS_PER_LONG
 #define __ASM_H8300_BITS_PER_LONG
 
-#include <asm-generic/bitsperlong.h>
-
-#if !defined(__ASSEMBLY__)
-/* h8300-unknown-linux required long */
-#define __kernel_size_t __kernel_size_t
-typedef unsigned long	__kernel_size_t;
-typedef long		__kernel_ssize_t;
-typedef long		__kernel_ptrdiff_t;
-#endif
+#include <uapi/asm/bitsperlong.h>
 
 #endif /* __ASM_H8300_BITS_PER_LONG */
diff --git a/arch/h8300/include/uapi/asm/bitsperlong.h b/arch/h8300/include/uapi/asm/bitsperlong.h
new file mode 100644
index 000000000000..e56cf72369b6
--- /dev/null
+++ b/arch/h8300/include/uapi/asm/bitsperlong.h
@@ -0,0 +1,14 @@
+#ifndef _UAPI_ASM_H8300_BITS_PER_LONG
+#define _UAPI_ASM_H8300_BITS_PER_LONG
+
+#include <asm-generic/bitsperlong.h>
+
+#if !defined(__ASSEMBLY__)
+/* h8300-unknown-linux required long */
+#define __kernel_size_t __kernel_size_t
+typedef unsigned long	__kernel_size_t;
+typedef long		__kernel_ssize_t;
+typedef long		__kernel_ptrdiff_t;
+#endif
+
+#endif /* _UAPI_ASM_H8300_BITS_PER_LONG */
-- 
2.8.1
