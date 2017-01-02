From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 2/3] m68k/mac: Remove SHUTUP_SONIC interrupt hack
Date: Mon,  2 Jan 2017 04:53:54 -0500 (EST)
Message-ID: <6644f8a3fbab7aa31f01452adb170754aa998991.1483350483.git.fthain@telegraphics.com.au>
References: <cover.1483350483.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47134 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932660AbdABJx5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2017 04:53:57 -0500
In-Reply-To: <cover.1483350483.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

In macints.c there is some startup code which disables the SONIC interrupt
in an attempt to avoid an unhandled slot interrupt, which would be fatal.
This only works on those machines where the SONIC device is on-board.

When the mac_sonic driver is built-in, there's little point in doing this,
because the device will be initialized a few seconds later anyway. But
when mac_sonic is a module, the window for an unhandled interrupt is
longer.

Either way, we've already run the gauntlet for 5 or 10 seconds by the time
we get around to disabling this particular device. It's only by sheer luck
that we got this far.

Really, this is too little too late. The general problem of unhandled
early interrupts also affects other devices on other models. There are
better ways to resolve this problem.

1) When using the Penguin bootloader, boot Mac OS with extensions disabled
   (by holding down the shift key at startup or by use of the Extensions
   Manager control panel). The Penguin docs already contain this advice,
   as it is always effective.

2) Have the Penguin bootloader disable the device. It already attempts
   to disable slot interrupts. But since some hardware cannot mask slot
   interrupts, Penguin should probably close the relevant device
   drivers.

3) Use Emile instead of Penguin. AFAIK the boot ROM never enables network
   device interrupts and hence they don't need to be disabled.

Remove this hack. It requires maintenance and it doesn't solve the
problem. It improves the odds for a few models, but so does setting
CONFIG_MAC_SONIC=y.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 arch/m68k/mac/macints.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/m68k/mac/macints.c b/arch/m68k/mac/macints.c
index f9672bb..1244d36 100644
--- a/arch/m68k/mac/macints.c
+++ b/arch/m68k/mac/macints.c
@@ -125,8 +125,6 @@
 #include <asm/hwtest.h>
 #include <asm/irq_regs.h>
 
-#define SHUTUP_SONIC
-
 extern void show_registers(struct pt_regs *);
 
 irqreturn_t mac_nmi_handler(int, void *);
@@ -151,16 +149,6 @@ void __init mac_init_IRQ(void)
 #endif
 	m68k_setup_irq_controller(&mac_irq_chip, handle_simple_irq, IRQ_USER,
 				  NUM_MAC_SOURCES - IRQ_USER);
-	/* Make sure the SONIC interrupt is cleared or things get ugly */
-#ifdef SHUTUP_SONIC
-	printk("Killing onboard sonic... ");
-	/* This address should hopefully be mapped already */
-	if (hwreg_present((void*)(0x50f0a000))) {
-		*(long *)(0x50f0a014) = 0x7fffL;
-		*(long *)(0x50f0a010) = 0L;
-	}
-	printk("Done.\n");
-#endif /* SHUTUP_SONIC */
 
 	/*
 	 * Now register the handlers for the master IRQ handlers
-- 
2.10.2
