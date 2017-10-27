From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 1/4] m68k/mac: More printk modernization
Date: Thu, 26 Oct 2017 22:45:24 -0400 (EDT)
Message-ID: <afe6ecb8fcbe726eecc42bd967e5d71502658f40.1509071937.git.fthain@telegraphics.com.au>
References: <cover.1509071937.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509071937.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Log message fragments used to be printed on one line but now get split up.
Fix this. Also, suppress log spam that merely prints known pointer values.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/baboon.c |  2 +-
 arch/m68k/mac/iop.c    |  4 ++--
 arch/m68k/mac/psc.c    |  6 ++----
 arch/m68k/mac/via.c    | 18 +++++-------------
 4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/mac/baboon.c b/arch/m68k/mac/baboon.c
index 514acde3cd40..0d154c909e17 100644
--- a/arch/m68k/mac/baboon.c
+++ b/arch/m68k/mac/baboon.c
@@ -36,7 +36,7 @@ void __init baboon_init(void)
 	baboon = (struct baboon *) BABOON_BASE;
 	baboon_present = 1;
 
-	printk("Baboon detected at %p\n", baboon);
+	pr_debug("Baboon detected at %p\n", baboon);
 }
 
 /*
diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 4c1e606e7d03..a2ea52db7d18 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -273,10 +273,10 @@ void __init iop_init(void)
 	int i;
 
 	if (iop_scc_present) {
-		pr_info("IOP: detected SCC IOP at %p\n", iop_base[IOP_NUM_SCC]);
+		pr_debug("SCC IOP detected at %p\n", iop_base[IOP_NUM_SCC]);
 	}
 	if (iop_ism_present) {
-		pr_info("IOP: detected ISM IOP at %p\n", iop_base[IOP_NUM_ISM]);
+		pr_debug("ISM IOP detected at %p\n", iop_base[IOP_NUM_ISM]);
 		iop_start(iop_base[IOP_NUM_ISM]);
 		iop_alive(iop_base[IOP_NUM_ISM]); /* clears the alive flag */
 	}
diff --git a/arch/m68k/mac/psc.c b/arch/m68k/mac/psc.c
index 439a2a2e5874..8d547df4e16c 100644
--- a/arch/m68k/mac/psc.c
+++ b/arch/m68k/mac/psc.c
@@ -42,7 +42,7 @@ static void psc_debug_dump(void)
 		return;
 
 	for (i = 0x30 ; i < 0x70 ; i += 0x10) {
-		printk("PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
+		printk(KERN_DEBUG "PSC #%d:  IFR = 0x%02X IER = 0x%02X\n",
 			i >> 4,
 			(int) psc_read_byte(pIFRbase + i),
 			(int) psc_read_byte(pIERbase + i));
@@ -59,14 +59,12 @@ static __init void psc_dma_die_die_die(void)
 {
 	int i;
 
-	printk("Killing all PSC DMA channels...");
 	for (i = 0 ; i < 9 ; i++) {
 		psc_write_word(PSC_CTL_BASE + (i << 4), 0x8800);
 		psc_write_word(PSC_CTL_BASE + (i << 4), 0x1000);
 		psc_write_word(PSC_CMD_BASE + (i << 5), 0x1100);
 		psc_write_word(PSC_CMD_BASE + (i << 5) + 0x10, 0x1100);
 	}
-	printk("done!\n");
 }
 
 /*
@@ -92,7 +90,7 @@ void __init psc_init(void)
 
 	psc = (void *) PSC_BASE;
 
-	printk("PSC detected at %p\n", psc);
+	pr_debug("PSC detected at %p\n", psc);
 
 	psc_dma_die_die_die();
 
diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 16629e91feba..05021381af0b 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -121,18 +121,21 @@ void via_debug_dump(void);
 
 void __init via_init(void)
 {
+	via1 = (void *)VIA1_BASE;
+	pr_debug("VIA1 detected at %p\n", via1);
+
 	switch(macintosh_config->via_type) {
 
 		/* IIci, IIsi, IIvx, IIvi (P6xx), LC series */
 
 		case MAC_VIA_IICI:
-			via1 = (void *) VIA1_BASE;
 			if (macintosh_config->ident == MAC_MODEL_IIFX) {
 				via2 = NULL;
 				rbv_present = 0;
 				oss_present = 1;
 			} else {
 				via2 = (void *) RBV_BASE;
+				pr_debug("VIA2 (RBV) detected at %p\n", via2);
 				rbv_present = 1;
 				oss_present = 0;
 			}
@@ -154,8 +157,8 @@ void __init via_init(void)
 
 		case MAC_VIA_QUADRA:
 		case MAC_VIA_II:
-			via1 = (void *) VIA1_BASE;
 			via2 = (void *) VIA2_BASE;
+			pr_debug("VIA2 detected at %p\n", via2);
 			rbv_present = 0;
 			oss_present = 0;
 			rbv_clear = 0x00;
@@ -168,17 +171,6 @@ void __init via_init(void)
 			panic("UNKNOWN VIA TYPE");
 	}
 
-	printk(KERN_INFO "VIA1 at %p is a 6522 or clone\n", via1);
-
-	printk(KERN_INFO "VIA2 at %p is ", via2);
-	if (rbv_present) {
-		printk("an RBV\n");
-	} else if (oss_present) {
-		printk("an OSS\n");
-	} else {
-		printk("a 6522 or clone\n");
-	}
-
 #ifdef DEBUG_VIA
 	via_debug_dump();
 #endif
-- 
2.13.6
