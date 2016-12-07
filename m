From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/22] m68k/atari: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:08:59 +0100
Message-ID: <1481123360-10978-2-git-send-email-geert__13157.6911117465$1481123930$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Add missing continuations, to fix user-visible breakage,
  - Drop useless WARNING prefix,
  - Move trailing spaces to start of continuations.

Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/atari/atakeyb.c | 14 ++++++------
 arch/m68k/atari/config.c  | 56 +++++++++++++++++++++++------------------------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index 264db11268039329..37091898adb3d3b5 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -149,7 +149,7 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
 	if (acia_stat & ACIA_OVRN) {
 		/* a very fast typist or a slow system, give a warning */
 		/* ...happens often if interrupts were disabled for too long */
-		printk(KERN_DEBUG "Keyboard overrun\n");
+		pr_debug("Keyboard overrun\n");
 		scancode = acia.key_data;
 		if (ikbd_self_test)
 			/* During self test, don't do resyncing, just process the code */
@@ -228,14 +228,14 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
 					keytyp = KTYP(keyval) - 0xf0;
 					keyval = KVAL(keyval);
 
-					printk(KERN_WARNING "Key with scancode %d ", scancode);
+					pr_warn("Key with scancode %d ", scancode);
 					if (keytyp == KT_LATIN || keytyp == KT_LETTER) {
 						if (keyval < ' ')
-							printk("('^%c') ", keyval + '@');
+							pr_cont("('^%c') ", keyval + '@');
 						else
-							printk("('%c') ", keyval);
+							pr_cont("('%c') ", keyval);
 					}
-					printk("is broken -- will be ignored.\n");
+					pr_cont("is broken -- will be ignored.\n");
 					break;
 				} else if (test_bit(scancode, broken_keys))
 					break;
@@ -299,7 +299,7 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
 #endif
 
 	if (acia_stat & (ACIA_FE | ACIA_PE)) {
-		printk("Error in keyboard communication\n");
+		pr_err("Error in keyboard communication\n");
 	}
 
 	/* handle_scancode() can take a lot of time, so check again if
@@ -553,7 +553,7 @@ int atari_keyb_init(void)
 		barrier();
 	/* if not incremented: no 0xf1 received */
 	if (ikbd_self_test == 1)
-		printk(KERN_ERR "WARNING: keyboard self test failed!\n");
+		pr_err("Keyboard self test failed!\n");
 	ikbd_self_test = 0;
 
 	ikbd_mouse_disable();
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index 97a3c38cd1f550cc..fdfc2c3cf1457f82 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -234,44 +234,44 @@ void __init config_atari(void)
 	 * Determine hardware present
 	 */
 
-	printk("Atari hardware found: ");
+	pr_info("Atari hardware found:");
 	if (MACH_IS_MEDUSA) {
 		/* There's no Atari video hardware on the Medusa, but all the
 		 * addresses below generate a DTACK so no bus error occurs! */
 	} else if (hwreg_present(f030_xreg)) {
 		ATARIHW_SET(VIDEL_SHIFTER);
-		printk("VIDEL ");
+		pr_cont(" VIDEL");
 		/* This is a temporary hack: If there is Falcon video
 		 * hardware, we assume that the ST-DMA serves SCSI instead of
 		 * ACSI. In the future, there should be a better method for
 		 * this...
 		 */
 		ATARIHW_SET(ST_SCSI);
-		printk("STDMA-SCSI ");
+		pr_cont(" STDMA-SCSI");
 	} else if (hwreg_present(tt_palette)) {
 		ATARIHW_SET(TT_SHIFTER);
-		printk("TT_SHIFTER ");
+		pr_cont(" TT_SHIFTER");
 	} else if (hwreg_present(&shifter.bas_hi)) {
 		if (hwreg_present(&shifter.bas_lo) &&
 		    (shifter.bas_lo = 0x0aau, shifter.bas_lo == 0x0aau)) {
 			ATARIHW_SET(EXTD_SHIFTER);
-			printk("EXTD_SHIFTER ");
+			pr_cont(" EXTD_SHIFTER");
 		} else {
 			ATARIHW_SET(STND_SHIFTER);
-			printk("STND_SHIFTER ");
+			pr_cont(" STND_SHIFTER");
 		}
 	}
 	if (hwreg_present(&st_mfp.par_dt_reg)) {
 		ATARIHW_SET(ST_MFP);
-		printk("ST_MFP ");
+		pr_cont(" ST_MFP");
 	}
 	if (hwreg_present(&tt_mfp.par_dt_reg)) {
 		ATARIHW_SET(TT_MFP);
-		printk("TT_MFP ");
+		pr_cont(" TT_MFP");
 	}
 	if (hwreg_present(&tt_scsi_dma.dma_addr_hi)) {
 		ATARIHW_SET(SCSI_DMA);
-		printk("TT_SCSI_DMA ");
+		pr_cont(" TT_SCSI_DMA");
 	}
 	/*
 	 * The ST-DMA address registers aren't readable
@@ -284,27 +284,27 @@ void __init config_atari(void)
 	     (st_dma.dma_vhi = 0xaa) && (st_dma.dma_hi = 0x55) &&
 	     st_dma.dma_vhi == 0xaa && st_dma.dma_hi == 0x55)) {
 		ATARIHW_SET(EXTD_DMA);
-		printk("EXTD_DMA ");
+		pr_cont(" EXTD_DMA");
 	}
 	if (hwreg_present(&tt_scsi.scsi_data)) {
 		ATARIHW_SET(TT_SCSI);
-		printk("TT_SCSI ");
+		pr_cont(" TT_SCSI");
 	}
 	if (hwreg_present(&sound_ym.rd_data_reg_sel)) {
 		ATARIHW_SET(YM_2149);
-		printk("YM2149 ");
+		pr_cont(" YM2149");
 	}
 	if (!MACH_IS_MEDUSA && hwreg_present(&tt_dmasnd.ctrl)) {
 		ATARIHW_SET(PCM_8BIT);
-		printk("PCM ");
+		pr_cont(" PCM");
 	}
 	if (hwreg_present(&falcon_codec.unused5)) {
 		ATARIHW_SET(CODEC);
-		printk("CODEC ");
+		pr_cont(" CODEC");
 	}
 	if (hwreg_present(&dsp56k_host_interface.icr)) {
 		ATARIHW_SET(DSP56K);
-		printk("DSP56K ");
+		pr_cont(" DSP56K");
 	}
 	if (hwreg_present(&tt_scc_dma.dma_ctrl) &&
 #if 0
@@ -316,33 +316,33 @@ void __init config_atari(void)
 #endif
 	    ) {
 		ATARIHW_SET(SCC_DMA);
-		printk("SCC_DMA ");
+		pr_cont(" SCC_DMA");
 	}
 	if (scc_test(&atari_scc.cha_a_ctrl)) {
 		ATARIHW_SET(SCC);
-		printk("SCC ");
+		pr_cont(" SCC");
 	}
 	if (scc_test(&st_escc.cha_b_ctrl)) {
 		ATARIHW_SET(ST_ESCC);
-		printk("ST_ESCC ");
+		pr_cont(" ST_ESCC");
 	}
 	if (hwreg_present(&tt_scu.sys_mask)) {
 		ATARIHW_SET(SCU);
 		/* Assume a VME bus if there's a SCU */
 		ATARIHW_SET(VME);
-		printk("VME SCU ");
+		pr_cont(" VME SCU");
 	}
 	if (hwreg_present((void *)(0xffff9210))) {
 		ATARIHW_SET(ANALOG_JOY);
-		printk("ANALOG_JOY ");
+		pr_cont(" ANALOG_JOY");
 	}
 	if (hwreg_present(blitter.halftone)) {
 		ATARIHW_SET(BLITTER);
-		printk("BLITTER ");
+		pr_cont(" BLITTER");
 	}
 	if (hwreg_present((void *)0xfff00039)) {
 		ATARIHW_SET(IDE);
-		printk("IDE ");
+		pr_cont(" IDE");
 	}
 #if 1 /* This maybe wrong */
 	if (!MACH_IS_MEDUSA && hwreg_present(&tt_microwire.data) &&
@@ -355,31 +355,31 @@ void __init config_atari(void)
 		ATARIHW_SET(MICROWIRE);
 		while (tt_microwire.mask != 0x7ff)
 			;
-		printk("MICROWIRE ");
+		pr_cont(" MICROWIRE");
 	}
 #endif
 	if (hwreg_present(&tt_rtc.regsel)) {
 		ATARIHW_SET(TT_CLK);
-		printk("TT_CLK ");
+		pr_cont(" TT_CLK");
 		mach_hwclk = atari_tt_hwclk;
 		mach_set_clock_mmss = atari_tt_set_clock_mmss;
 	}
 	if (hwreg_present(&mste_rtc.sec_ones)) {
 		ATARIHW_SET(MSTE_CLK);
-		printk("MSTE_CLK ");
+		pr_cont(" MSTE_CLK");
 		mach_hwclk = atari_mste_hwclk;
 		mach_set_clock_mmss = atari_mste_set_clock_mmss;
 	}
 	if (!MACH_IS_MEDUSA && hwreg_present(&dma_wd.fdc_speed) &&
 	    hwreg_write(&dma_wd.fdc_speed, 0)) {
 		ATARIHW_SET(FDCSPEED);
-		printk("FDC_SPEED ");
+		pr_cont(" FDC_SPEED");
 	}
 	if (!ATARIHW_PRESENT(ST_SCSI)) {
 		ATARIHW_SET(ACSI);
-		printk("ACSI ");
+		pr_cont(" ACSI");
 	}
-	printk("\n");
+	pr_cont("\n");
 
 	if (CPU_IS_040_OR_060)
 		/* Now it seems to be safe to turn of the tt0 transparent
-- 
1.9.1
