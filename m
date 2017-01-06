From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: [PATCH v2 3/7] nios2: put setup.h in uapi
Date: Fri,  6 Jan 2017 10:43:55 +0100
Message-ID: <1483695839-18660-4-git-send-email-nicolas.dichtel__9955.71245807714$1483696500$gmane$org@6wind.com>
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
 arch/nios2/include/asm/setup.h      | 2 +-
 arch/nios2/include/uapi/asm/setup.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 arch/nios2/include/uapi/asm/setup.h

diff --git a/arch/nios2/include/asm/setup.h b/arch/nios2/include/asm/setup.h
index dcbf8cf1a344..d49e9e91bf55 100644
--- a/arch/nios2/include/asm/setup.h
+++ b/arch/nios2/include/asm/setup.h
@@ -19,7 +19,7 @@
 #ifndef _ASM_NIOS2_SETUP_H
 #define _ASM_NIOS2_SETUP_H
 
-#include <asm-generic/setup.h>
+#include <uapi/asm/setup.h>
 
 #ifndef __ASSEMBLY__
 #ifdef __KERNEL__
diff --git a/arch/nios2/include/uapi/asm/setup.h b/arch/nios2/include/uapi/asm/setup.h
new file mode 100644
index 000000000000..8d8285997ba8
--- /dev/null
+++ b/arch/nios2/include/uapi/asm/setup.h
@@ -0,0 +1,6 @@
+#ifndef _UAPI_ASM_NIOS2_SETUP_H
+#define _UAPI_ASM_NIOS2_SETUP_H
+
+#include <asm-generic/setup.h>
+
+#endif /* _UAPI_ASM_NIOS2_SETUP_H */
-- 
2.8.1
