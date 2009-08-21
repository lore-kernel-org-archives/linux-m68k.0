From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k,m68knommu: Wire up rt_tgsigqueueinfo and
 perf_counter_open
Date: Fri, 21 Aug 2009 22:07:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0908212205300.15620@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
Cc: uClinux list <uclinux-dev@uclinux.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/unistd.h       |    4 +++-
 arch/m68k/kernel/entry.S             |    2 ++
 arch/m68knommu/kernel/syscalltable.S |    2 ++
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index aa29a86..946d869 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -334,10 +334,12 @@
 #define __NR_inotify_init1	328
 #define __NR_preadv		329
 #define __NR_pwritev		330
+#define __NR_rt_tgsigqueueinfo	331
+#define __NR_perf_counter_open	332
 
 #ifdef __KERNEL__
 
-#define NR_syscalls		331
+#define NR_syscalls		333
 
 #define __ARCH_WANT_IPC_PARSE_VERSION
 #define __ARCH_WANT_OLD_READDIR
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 8744f60..c3735cd 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -755,4 +755,6 @@ sys_call_table:
 	.long sys_inotify_init1
 	.long sys_preadv
 	.long sys_pwritev		/* 330 */
+	.long sys_rt_tgsigqueueinfo
+	.long sys_perf_counter_open
 
diff --git a/arch/m68knommu/kernel/syscalltable.S b/arch/m68knommu/kernel/syscalltable.S
index c0b8782..0ae123e 100644
--- a/arch/m68knommu/kernel/syscalltable.S
+++ b/arch/m68knommu/kernel/syscalltable.S
@@ -349,6 +349,8 @@ ENTRY(sys_call_table)
 	.long sys_inotify_init1
 	.long sys_preadv
 	.long sys_pwritev		/* 330 */
+	.long sys_rt_tgsigqueueinfo
+	.long sys_perf_counter_open
 
 	.rept NR_syscalls-(.-sys_call_table)/4
 		.long sys_ni_syscall
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
