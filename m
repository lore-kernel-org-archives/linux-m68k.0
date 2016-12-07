From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 22/22] m68k/include: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:20 +0100
Message-ID: <1481123360-10978-23-git-send-email-geert__37215.2015254416$1481123866$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Add dummies for validating format strings when debugging is
    disabled.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/bug.h      |  4 ++--
 arch/m68k/include/asm/floppy.h   |  6 +++---
 arch/m68k/include/asm/math-emu.h | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/bug.h b/arch/m68k/include/asm/bug.h
index ef9a2e47352f0d8a..5bc8d91d68d42bf0 100644
--- a/arch/m68k/include/asm/bug.h
+++ b/arch/m68k/include/asm/bug.h
@@ -6,12 +6,12 @@
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #ifndef CONFIG_SUN3
 #define BUG() do { \
-	printk("kernel BUG at %s:%d!\n", __FILE__, __LINE__); \
+	pr_crit("kernel BUG at %s:%d!\n", __FILE__, __LINE__); \
 	__builtin_trap(); \
 } while (0)
 #else
 #define BUG() do { \
-	printk("kernel BUG at %s:%d!\n", __FILE__, __LINE__); \
+	pr_crit("kernel BUG at %s:%d!\n", __FILE__, __LINE__); \
 	panic("BUG!"); \
 } while (0)
 #endif
diff --git a/arch/m68k/include/asm/floppy.h b/arch/m68k/include/asm/floppy.h
index 47365b1ccbecfeb9..c3b9ad6732fc68cc 100644
--- a/arch/m68k/include/asm/floppy.h
+++ b/arch/m68k/include/asm/floppy.h
@@ -234,9 +234,9 @@ asmlinkage irqreturn_t floppy_hardint(int irq, void *dev_id)
 		virtual_dma_residue += virtual_dma_count;
 		virtual_dma_count=0;
 #ifdef TRACE_FLPY_INT
-		printk("count=%x, residue=%x calls=%d bytes=%d dma_wait=%d\n",
-		       virtual_dma_count, virtual_dma_residue, calls, bytes,
-		       dma_wait);
+		pr_info("count=%x, residue=%x calls=%d bytes=%d dma_wait=%d\n",
+			virtual_dma_count, virtual_dma_residue, calls, bytes,
+			dma_wait);
 		calls = 0;
 		dma_wait=0;
 #endif
diff --git a/arch/m68k/include/asm/math-emu.h b/arch/m68k/include/asm/math-emu.h
index 5e9249b0014ca0fc..b062696d5a0d99aa 100644
--- a/arch/m68k/include/asm/math-emu.h
+++ b/arch/m68k/include/asm/math-emu.h
@@ -105,21 +105,21 @@ struct fp_data {
 #ifdef FPU_EMU_DEBUG
 extern unsigned int fp_debugprint;
 
-#define dprint(bit, fmt, args...) ({			\
+#define dprint(bit, fmt, ...) ({			\
 	if (fp_debugprint & (1 << (bit)))		\
-		printk(fmt, ## args);			\
+		pr_info(fmt, ##__VA_ARGS__);		\
 })
 #else
-#define dprint(bit, fmt, args...)
+#define dprint(bit, fmt, ...)	no_printk(fmt, ##__VA_ARGS__)
 #endif
 
 #define uprint(str) ({					\
 	static int __count = 3;				\
 							\
 	if (__count > 0) {				\
-		printk("You just hit an unimplemented "	\
+		pr_err("You just hit an unimplemented "	\
 		       "fpu instruction (%s)\n", str);	\
-		printk("Please report this to ....\n");	\
+		pr_err("Please report this to ....\n");	\
 		__count--;				\
 	}						\
 })
-- 
1.9.1
