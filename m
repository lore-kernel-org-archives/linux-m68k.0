From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: amiserial - kill warn_unused_result warnings
Date: Fri,  2 Jan 2009 11:41:26 +0100
Message-ID: <1230892892-25751-14-git-send-email-geert@linux-m68k.org>
References: <1230892892-25751-1-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-2-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-3-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-4-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-5-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-6-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-7-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-8-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-9-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-10-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-11-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-12-git-send-email-geert@linux-m68k.org>
 <1230892892-25751-13-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:47532 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757051AbZABKli (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Jan 2009 05:41:38 -0500
In-Reply-To: <1230892892-25751-13-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

warning: ignoring return value of 'request_irq', declared with attribute
warn_unused_result

and clean up the error path handling.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
---
 drivers/char/amiserial.c |   36 ++++++++++++++++++++++++++++++------
 1 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
index b97aebd..d08aa64 100644
--- a/drivers/char/amiserial.c
+++ b/drivers/char/amiserial.c
@@ -1963,6 +1963,7 @@ static int __init rs_init(void)
 {
 	unsigned long flags;
 	struct serial_state * state;
+	int error;
 
 	if (!MACH_IS_AMIGA || !AMIGAHW_PRESENT(AMI_SERIAL))
 		return -ENODEV;
@@ -1975,8 +1976,11 @@ static int __init rs_init(void)
 	 *  We request SERDAT and SERPER only, because the serial registers are
 	 *  too spreaded over the custom register space
 	 */
-	if (!request_mem_region(CUSTOM_PHYSADDR+0x30, 4, "amiserial [Paula]"))
-		return -EBUSY;
+	if (!request_mem_region(CUSTOM_PHYSADDR+0x30, 4,
+				"amiserial [Paula]")) {
+		error = -EBUSY;
+		goto fail_put_tty_driver;
+	}
 
 	IRQ_ports = NULL;
 
@@ -1997,8 +2001,9 @@ static int __init rs_init(void)
 	serial_driver->flags = TTY_DRIVER_REAL_RAW;
 	tty_set_operations(serial_driver, &serial_ops);
 
-	if (tty_register_driver(serial_driver))
-		panic("Couldn't register serial driver\n");
+	error = tty_register_driver(serial_driver);
+	if (error)
+		goto fail_release_mem_region;
 
 	state = rs_table;
 	state->magic = SSTATE_MAGIC;
@@ -2024,8 +2029,14 @@ static int __init rs_init(void)
 	local_irq_save(flags);
 
 	/* set ISRs, and then disable the rx interrupts */
-	request_irq(IRQ_AMIGA_TBE, ser_tx_int, 0, "serial TX", state);
-	request_irq(IRQ_AMIGA_RBF, ser_rx_int, IRQF_DISABLED, "serial RX", state);
+	error = request_irq(IRQ_AMIGA_TBE, ser_tx_int, 0, "serial TX", state);
+	if (error)
+		goto fail_unregister;
+
+	error = request_irq(IRQ_AMIGA_RBF, ser_rx_int, IRQF_DISABLED,
+			    "serial RX", state);
+	if (error)
+		goto fail_free_irq;
 
 	/* turn off Rx and Tx interrupts */
 	custom.intena = IF_RBF | IF_TBE;
@@ -2045,6 +2056,16 @@ static int __init rs_init(void)
 	ciab.ddra &= ~(SER_DCD | SER_CTS | SER_DSR);  /* inputs */
 
 	return 0;
+
+fail_free_irq:
+	free_irq(IRQ_AMIGA_TBE, state);
+fail_unregister:
+	tty_unregister_driver(serial_driver);
+fail_release_mem_region:
+	release_mem_region(CUSTOM_PHYSADDR+0x30, 4);
+fail_put_tty_driver:
+	put_tty_driver(serial_driver);
+	return error;
 }
 
 static __exit void rs_exit(void) 
@@ -2064,6 +2085,9 @@ static __exit void rs_exit(void)
 	  kfree(info);
 	}
 
+	free_irq(IRQ_AMIGA_TBE, rs_table);
+	free_irq(IRQ_AMIGA_RBF, rs_table);
+
 	release_mem_region(CUSTOM_PHYSADDR+0x30, 4);
 }
 
-- 
1.5.6.5

