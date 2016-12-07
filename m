From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 17/22] m68k/kernel: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:15 +0100
Message-ID: <1481123360-10978-18-git-send-email-geert__10226.3765912086$1481123881$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Use pr_err_ratelimited() instead of deprecated printk_ratelimit(),
  - Add dummies for validating format strings when debugging is
    disabled,
  - Convert from printk() to pr_*(),
  - Correct printf()-style format specifiers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/dma.c     |  4 ++--
 arch/m68k/kernel/module.c  | 12 ++++++------
 arch/m68k/kernel/process.c | 20 ++++++++++----------
 arch/m68k/kernel/signal.c  | 24 +++++++-----------------
 arch/m68k/kernel/uboot.c   |  3 +--
 5 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 8cf97cbadc91a705..805c6ccb23ef1bd5 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -110,8 +110,8 @@ static void m68k_dma_sync_single_for_device(struct device *dev,
 		cache_clear(handle, size);
 		break;
 	default:
-		if (printk_ratelimit())
-			printk("dma_sync_single_for_device: unsupported dir %u\n", dir);
+		pr_err_ratelimited("dma_sync_single_for_device: unsupported dir %u\n",
+				   dir);
 		break;
 	}
 }
diff --git a/arch/m68k/kernel/module.c b/arch/m68k/kernel/module.c
index eb46fd6038cac73a..aaac2da318ffd377 100644
--- a/arch/m68k/kernel/module.c
+++ b/arch/m68k/kernel/module.c
@@ -12,9 +12,9 @@
 #include <linux/kernel.h>
 
 #if 0
-#define DEBUGP printk
+#define DEBUGP(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #else
-#define DEBUGP(fmt...)
+#define DEBUGP(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #endif
 
 #ifdef CONFIG_MODULES
@@ -51,8 +51,8 @@ int apply_relocate(Elf32_Shdr *sechdrs,
 			*location += sym->st_value - (uint32_t)location;
 			break;
 		default:
-			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
-			       me->name, ELF32_R_TYPE(rel[i].r_info));
+			pr_err("module %s: Unknown relocation: %u\n", me->name,
+			       ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
 	}
@@ -91,8 +91,8 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 			*location = rel[i].r_addend + sym->st_value - (uint32_t)location;
 			break;
 		default:
-			printk(KERN_ERR "module %s: Unknown relocation: %u\n",
-			       me->name, ELF32_R_TYPE(rel[i].r_info));
+			pr_err("module %s: Unknown relocation: %u\n", me->name,
+			       ELF32_R_TYPE(rel[i].r_info));
 			return -ENOEXEC;
 		}
 	}
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 4ba1ae7345c324c9..2be5720e649ff42e 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -87,17 +87,17 @@ void machine_power_off(void)
 
 void show_regs(struct pt_regs * regs)
 {
-	printk("\n");
-	printk("Format %02x  Vector: %04x  PC: %08lx  Status: %04x    %s\n",
-	       regs->format, regs->vector, regs->pc, regs->sr, print_tainted());
-	printk("ORIG_D0: %08lx  D0: %08lx  A2: %08lx  A1: %08lx\n",
-	       regs->orig_d0, regs->d0, regs->a2, regs->a1);
-	printk("A0: %08lx  D5: %08lx  D4: %08lx\n",
-	       regs->a0, regs->d5, regs->d4);
-	printk("D3: %08lx  D2: %08lx  D1: %08lx\n",
-	       regs->d3, regs->d2, regs->d1);
+	pr_info("Format %02x  Vector: %04x  PC: %08lx  Status: %04x    %s\n",
+		regs->format, regs->vector, regs->pc, regs->sr,
+		print_tainted());
+	pr_info("ORIG_D0: %08lx  D0: %08lx  A2: %08lx  A1: %08lx\n",
+		regs->orig_d0, regs->d0, regs->a2, regs->a1);
+	pr_info("A0: %08lx  D5: %08lx  D4: %08lx\n", regs->a0, regs->d5,
+		regs->d4);
+	pr_info("D3: %08lx  D2: %08lx  D1: %08lx\n", regs->d3, regs->d2,
+		regs->d1);
 	if (!(regs->sr & PS_S))
-		printk("USP: %08lx\n", rdusp());
+		pr_info("USP: %08lx\n", rdusp());
 }
 
 void flush_thread(void)
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index 58507edbdf1d5fa8..ef471c87776d92c7 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -598,9 +598,7 @@ static int mangle_kernel_stack(struct pt_regs *regs, int formatvec,
 		/*
 		 * user process trying to return with weird frame format
 		 */
-#ifdef DEBUG
-		printk("user process returning with weird frame format\n");
-#endif
+		pr_debug("user process returning with weird frame format\n");
 		return 1;
 	}
 	if (!fsize) {
@@ -846,10 +844,8 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 	int err = 0, sig = ksig->sig;
 
 	if (fsize < 0) {
-#ifdef DEBUG
-		printk ("setup_frame: Unknown frame format %#x\n",
-			regs->format);
-#endif
+		pr_debug("setup_frame: Unknown frame format %#x\n",
+			 regs->format);
 		return -EFAULT;
 	}
 
@@ -905,9 +901,7 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 	if (regs->stkadj) {
 		struct pt_regs *tregs =
 			(struct pt_regs *)((ulong)regs + regs->stkadj);
-#ifdef DEBUG
-		printk("Performing stackadjust=%04x\n", regs->stkadj);
-#endif
+		pr_debug("Performing stackadjust=%04lx\n", regs->stkadj);
 		/* This must be copied with decreasing addresses to
                    handle overlaps.  */
 		tregs->vector = 0;
@@ -926,10 +920,8 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	int err = 0, sig = ksig->sig;
 
 	if (fsize < 0) {
-#ifdef DEBUG
-		printk ("setup_frame: Unknown frame format %#x\n",
-			regs->format);
-#endif
+		pr_debug("setup_frame: Unknown frame format %#x\n",
+			 regs->format);
 		return -EFAULT;
 	}
 
@@ -993,9 +985,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	if (regs->stkadj) {
 		struct pt_regs *tregs =
 			(struct pt_regs *)((ulong)regs + regs->stkadj);
-#ifdef DEBUG
-		printk("Performing stackadjust=%04x\n", regs->stkadj);
-#endif
+		pr_debug("Performing stackadjust=%04lx\n", regs->stkadj);
 		/* This must be copied with decreasing addresses to
                    handle overlaps.  */
 		tregs->vector = 0;
diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index b3536a82a26202b6..b29c3b241e1bb590 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -83,8 +83,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 		initrd_start = uboot_initrd_start;
 		initrd_end = uboot_initrd_end;
 		ROOT_DEV = Root_RAM0;
-		printk(KERN_INFO "initrd at 0x%lx:0x%lx\n",
-			initrd_start, initrd_end);
+		pr_info("initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 	}
 #endif /* if defined(CONFIG_BLK_DEV_INITRD) */
 }
-- 
1.9.1
