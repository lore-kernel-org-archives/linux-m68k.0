From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 06/22] m68k/coldfire: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:04 +0100
Message-ID: <1481123360-10978-7-git-send-email-geert__42407.9733937562$1481123943$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Introduce helpers for printing debug messages, incl. dummies for
    validating format strings when debugging is disabled,
  - Convert from printk() to pr_*(),
  - Correct printf()-style format specifiers,
  - Drop superfluous casts,

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/coldfire/m528x.c          |  4 +-
 arch/m68k/coldfire/sltimers.c       |  4 +-
 arch/m68k/coldfire/timers.c         |  4 +-
 arch/m68k/coldfire/vectors.c        |  2 +-
 arch/m68k/include/asm/dma.h         | 98 +++++++++++++------------------------
 arch/m68k/include/asm/mcf_pgtable.h |  9 ++--
 6 files changed, 44 insertions(+), 77 deletions(-)

diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 12f9e370d8dde8d8..fcdf6b3d427c3ca0 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -99,7 +99,7 @@ void wildfire_halt(void)
 #ifdef CONFIG_WILDFIREMOD
 void wildfiremod_halt(void)
 {
-	printk(KERN_INFO "WildFireMod hibernating...\n");
+	pr_info("WildFireMod hibernating...\n");
 
 	/* Set portE.5 to Digital IO */
 	writew(readw(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
@@ -111,7 +111,7 @@ void wildfiremod_halt(void)
 	writeb(readb(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
 	writeb(readb(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
 
-	printk(KERN_EMERG "Failed to hibernate. Halting!\n");
+	pr_emerg("Failed to hibernate. Halting!\n");
 }
 #endif
 
diff --git a/arch/m68k/coldfire/sltimers.c b/arch/m68k/coldfire/sltimers.c
index 831a08cf6f40d7e6..e1c66a4a53d2d285 100644
--- a/arch/m68k/coldfire/sltimers.c
+++ b/arch/m68k/coldfire/sltimers.c
@@ -57,8 +57,8 @@ irqreturn_t mcfslt_profile_tick(int irq, void *dummy)
 
 void mcfslt_profile_init(void)
 {
-	printk(KERN_INFO "PROFILE: lodging TIMER 1 @ %dHz as profile timer\n",
-	       PROFILEHZ);
+	pr_info("PROFILE: lodging TIMER 1 @ %dHz as profile timer\n",
+		PROFILEHZ);
 
 	setup_irq(MCF_IRQ_PROFILER, &mcfslt_profile_irq);
 
diff --git a/arch/m68k/coldfire/timers.c b/arch/m68k/coldfire/timers.c
index cd496a20fcc7ced7..b849e40c97b1a408 100644
--- a/arch/m68k/coldfire/timers.c
+++ b/arch/m68k/coldfire/timers.c
@@ -177,8 +177,8 @@ irqreturn_t coldfire_profile_tick(int irq, void *dummy)
 
 void coldfire_profile_init(void)
 {
-	printk(KERN_INFO "PROFILE: lodging TIMER2 @ %dHz as profile timer\n",
-	       PROFILEHZ);
+	pr_info("PROFILE: lodging TIMER2 @ %dHz as profile timer\n",
+		PROFILEHZ);
 
 	/* Set up TIMER 2 as high speed profile clock */
 	__raw_writew(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
index 08923fe600e013d9..a185df5963d4ae50 100644
--- a/arch/m68k/coldfire/vectors.c
+++ b/arch/m68k/coldfire/vectors.c
@@ -24,7 +24,7 @@
 asmlinkage void dbginterrupt_c(struct frame *fp)
 {
 	extern void dump(struct pt_regs *fp);
-	printk(KERN_DEBUG "%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
+	pr_debug("%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
 	dump((struct pt_regs *) fp);
 	asm("halt");
 }
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 208b4daa14b334f4..c20ed384da6520dd 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -1,6 +1,12 @@
 #ifndef _M68K_DMA_H
 #define _M68K_DMA_H 1
 
+#ifdef DMA_DEBUG
+#define pr_dma(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#else
+#define pr_dma(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
+#endif
+
 #ifdef CONFIG_COLDFIRE
 /*
  * ColdFire DMA Model:
@@ -126,9 +132,7 @@ static __inline__ void enable_dma(unsigned int dmanr)
 {
   volatile unsigned short *dmawp;
 
-#ifdef DMA_DEBUG
-  printk("enable_dma(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("enable_dma(dmanr=%d)\n", dmanr);
 
   dmawp = (unsigned short *) dma_base_addr[dmanr];
   dmawp[MCFDMA_DCR] |= MCFDMA_DCR_EEXT;
@@ -139,9 +143,7 @@ static __inline__ void disable_dma(unsigned int dmanr)
   volatile unsigned short *dmawp;
   volatile unsigned char  *dmapb;
 
-#ifdef DMA_DEBUG
-  printk("disable_dma(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("disable_dma(dmanr=%d)\n", dmanr);
 
   dmawp = (unsigned short *) dma_base_addr[dmanr];
   dmapb = (unsigned char *) dma_base_addr[dmanr];
@@ -172,9 +174,7 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
   volatile unsigned char  *dmabp;
   volatile unsigned short *dmawp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
-#endif
+  pr_dma("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
 
   dmabp = (unsigned char *) dma_base_addr[dmanr];
   dmawp = (unsigned short *) dma_base_addr[dmanr];
@@ -201,11 +201,9 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
      ((mode & DMA_MODE_LONG_BIT) ? MCFDMA_DCR_DSIZE_LONG :
                                    MCFDMA_DCR_DSIZE_BYTE));
 
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DSR[%x]=%x DCR[%x]=%x\n", __FILE__, __LINE__,
-         dmanr, (int) &dmabp[MCFDMA_DSR], dmabp[MCFDMA_DSR],
-	 (int) &dmawp[MCFDMA_DCR], dmawp[MCFDMA_DCR]);
-#endif
+  pr_dma("%s(%u): dmanr=%d DSR[%p]=%x DCR[%p]=%x\n", __FILE__, __LINE__, dmanr,
+	 &dmabp[MCFDMA_DSR], dmabp[MCFDMA_DSR], &dmawp[MCFDMA_DCR],
+	 dmawp[MCFDMA_DCR]);
 }
 
 /* Set transfer address for specific DMA channel */
@@ -214,9 +212,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
   volatile unsigned short *dmawp;
   volatile unsigned int   *dmalp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
+  pr_dma("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
 
   dmawp = (unsigned short *) dma_base_addr[dmanr];
   dmalp = (unsigned int *) dma_base_addr[dmanr];
@@ -234,12 +230,10 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
     dmalp[MCFDMA_SAR] = dma_device_address[dmanr];
   }
 
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DCR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
-	__FILE__, __LINE__, dmanr, (int) &dmawp[MCFDMA_DCR], dmawp[MCFDMA_DCR],
-	(int) &dmalp[MCFDMA_SAR], dmalp[MCFDMA_SAR],
-	(int) &dmalp[MCFDMA_DAR], dmalp[MCFDMA_DAR]);
-#endif
+  pr_dma("%s(%u): dmanr=%d DCR[%p]=%x SAR[%p]=%08x DAR[%p]=%08x\n", __FILE__,
+	 __LINE__, dmanr, &dmawp[MCFDMA_DCR], dmawp[MCFDMA_DCR],
+	 &dmalp[MCFDMA_SAR], dmalp[MCFDMA_SAR], &dmalp[MCFDMA_DAR],
+	 dmalp[MCFDMA_DAR]);
 }
 
 /*
@@ -248,9 +242,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
  */
 static __inline__ void set_dma_device_addr(unsigned int dmanr, unsigned int a)
 {
-#ifdef DMA_DEBUG
-  printk("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
+  pr_dma("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
 
   dma_device_address[dmanr] = a;
 }
@@ -262,9 +254,7 @@ static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
 {
   volatile unsigned short *dmawp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
-#endif
+  pr_dma("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
 
   dmawp = (unsigned short *) dma_base_addr[dmanr];
   dmawp[MCFDMA_BCR] = (unsigned short)count;
@@ -281,9 +271,7 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
   volatile unsigned short *dmawp;
   unsigned short count;
 
-#ifdef DMA_DEBUG
-  printk("get_dma_residue(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("get_dma_residue(dmanr=%d)\n", dmanr);
 
   dmawp = (unsigned short *) dma_base_addr[dmanr];
   count = dmawp[MCFDMA_BCR];
@@ -319,9 +307,7 @@ static __inline__ void enable_dma(unsigned int dmanr)
 {
   volatile unsigned int  *dmalp;
 
-#ifdef DMA_DEBUG
-  printk("enable_dma(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("enable_dma(dmanr=%d)\n", dmanr);
 
   dmalp = (unsigned int *) dma_base_addr[dmanr];
   dmalp[MCFDMA_DMR] |= MCFDMA_DMR_EN;
@@ -331,9 +317,7 @@ static __inline__ void disable_dma(unsigned int dmanr)
 {
   volatile unsigned int   *dmalp;
 
-#ifdef DMA_DEBUG
-  printk("disable_dma(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("disable_dma(dmanr=%d)\n", dmanr);
 
   dmalp = (unsigned int *) dma_base_addr[dmanr];
 
@@ -363,9 +347,7 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
   volatile unsigned int   *dmalp;
   volatile unsigned short *dmawp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
-#endif
+  pr_dma("set_dma_mode(dmanr=%d,mode=%d)\n", dmanr, mode);
   dmalp = (unsigned int *) dma_base_addr[dmanr];
   dmawp = (unsigned short *) dma_base_addr[dmanr];
 
@@ -387,11 +369,9 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
 
   dmawp[MCFDMA_DIR] |= MCFDMA_DIR_ASCEN;   /* Enable completion interrupts */
 
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DMR[%x]=%x DIR[%x]=%x\n", __FILE__, __LINE__,
-         dmanr, (int) &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR],
-	 (int) &dmawp[MCFDMA_DIR], dmawp[MCFDMA_DIR]);
-#endif
+  pr_dma("%s(%u): dmanr=%d DMR[%p]=%x DIR[%p]=%x\n", __FILE__, __LINE__, dmanr,
+	 &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR], &dmawp[MCFDMA_DIR],
+	 dmawp[MCFDMA_DIR]);
 }
 
 /* Set transfer address for specific DMA channel */
@@ -399,9 +379,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
 {
   volatile unsigned int   *dmalp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
+  pr_dma("set_dma_addr(dmanr=%d,a=%x)\n", dmanr, a);
 
   dmalp = (unsigned int *) dma_base_addr[dmanr];
 
@@ -418,12 +396,10 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
     dmalp[MCFDMA_DSAR] = dma_device_address[dmanr];
   }
 
-#ifdef DEBUG_DMA
-  printk("%s(%d): dmanr=%d DMR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
-	__FILE__, __LINE__, dmanr, (int) &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
-	(int) &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR],
-	(int) &dmalp[MCFDMA_DDAR], dmalp[MCFDMA_DDAR]);
-#endif
+  pr_dma("%s(%u): dmanr=%d DMR[%p]=%x SAR[%p]=%08x DAR[%p]=%08x\n", __FILE__,
+	 __LINE__, dmanr, &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
+	 &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR], &dmalp[MCFDMA_DDAR],
+	 dmalp[MCFDMA_DDAR]);
 }
 
 /*
@@ -432,9 +408,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
  */
 static __inline__ void set_dma_device_addr(unsigned int dmanr, unsigned int a)
 {
-#ifdef DMA_DEBUG
-  printk("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
-#endif
+  pr_dma("set_dma_device_addr(dmanr=%d,a=%x)\n", dmanr, a);
 
   dma_device_address[dmanr] = a;
 }
@@ -448,9 +422,7 @@ static __inline__ void set_dma_count(unsigned int dmanr, unsigned int count)
 {
   volatile unsigned int *dmalp;
 
-#ifdef DMA_DEBUG
-  printk("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
-#endif
+  pr_dma("set_dma_count(dmanr=%d,count=%d)\n", dmanr, count);
 
   dmalp = (unsigned int *) dma_base_addr[dmanr];
   dmalp[MCFDMA_DBCR] = count;
@@ -467,9 +439,7 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
   volatile unsigned int *dmalp;
   unsigned int count;
 
-#ifdef DMA_DEBUG
-  printk("get_dma_residue(dmanr=%d)\n", dmanr);
-#endif
+  pr_dma("get_dma_residue(dmanr=%d)\n", dmanr);
 
   dmalp = (unsigned int *) dma_base_addr[dmanr];
   count = dmalp[MCFDMA_DBCR];
diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index 2500ce04fcc412ea..43a8b7a1cba4b2c1 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -203,14 +203,11 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 static inline void pgd_clear(pgd_t *pgdp) {}
 
 #define pte_ERROR(e) \
-	printk(KERN_ERR "%s:%d: bad pte %08lx.\n",	\
-	__FILE__, __LINE__, pte_val(e))
+	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-	printk(KERN_ERR "%s:%d: bad pmd %08lx.\n",	\
-	__FILE__, __LINE__, pmd_val(e))
+	pr_err("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
 #define pgd_ERROR(e) \
-	printk(KERN_ERR "%s:%d: bad pgd %08lx.\n",	\
-	__FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
 /*
  * The following only work if pte_present() is true.
-- 
1.9.1
