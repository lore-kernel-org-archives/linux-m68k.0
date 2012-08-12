From: Fengguang Wu <fengguang.wu@intel.com>
Subject: [PATCH] m68k: add generic atomic64_t support
Date: Sun, 12 Aug 2012 22:23:55 +0800
Message-ID: <20120812142355.GA16664@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

This fixes build errors like:

fs/namespace.c:2290:1: error: unknown type name 'atomic64_t'
fs/namespace.c:2290:1: error: implicit declaration of function 'ATOMIC64_INIT' [-Werror=implicit-function-declaration]
fs/namespace.c:2290:1: error: initializer element is not constant
fs/namespace.c: In function 'alloc_mnt_ns':
fs/namespace.c:2299:2: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 arch/m68k/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux.orig/arch/m68k/Kconfig	2012-08-12 21:15:49.730533572 +0800
+++ linux/arch/m68k/Kconfig	2012-08-12 22:19:56.202624988 +0800
@@ -12,6 +12,7 @@ config M68K
 	select FPU if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
+	select GENERIC_ATOMIC64
 
 config RWSEM_GENERIC_SPINLOCK
 	bool
