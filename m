From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k: skip futex_atomic_cmpxchg_inatomic() test
Date: Tue, 4 Mar 2014 18:28:09 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403041740580.17377@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


The futex_atomic_cmpxchg_inatomic() test in futex_init() causes a fatal 
exception on 68030 (and presumably 68020 also).

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

Ingo Molnar has committed Heiko Carstens' patch to the -tip repo:
http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=03b8c7b623c80af264c4c8d6111e5c6289933666

I downloaded that patch and tested it along with the patch below, and 
together these fix the boot crash.

What's the best way to merge this? Perhaps it should be sent on to the 
-tip maintainers?

Index: linux-m68k/arch/m68k/Kconfig
===================================================================
--- linux-m68k.orig/arch/m68k/Kconfig
+++ linux-m68k/arch/m68k/Kconfig
@@ -17,6 +17,7 @@ config M68K
 	select FPU if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
+	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
 	select HAVE_MOD_ARCH_SPECIFIC
 	select MODULES_USE_ELF_REL
 	select MODULES_USE_ELF_RELA
