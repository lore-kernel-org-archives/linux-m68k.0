From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Mon, 13 Jan 2014 00:56:38 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51516 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbaALN4r (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Jan 2014 08:56:47 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


For SCC initialization we cannot assume that the control register is in 
the correct state to accept a register pointer. So first read from the 
control register in order to "sync" up.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

This patch fixes a boot failure (presumably caused by unhandled SCC 
interrupt) on PowerBook 180 with CONFIG_EARLY_PRINTK and with the 
bootloader not configured to wake up the serial ports. AFAIK this happens 
only on PowerBooks. Even with this fix, Penguin still has to wake the 
serial ports or else they don't function on PowerBooks like this one.

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -2909,7 +2909,9 @@ func_start	serial_init,%d0/%d1/%a0/%a1
 
 #if defined(MAC_USE_SCC_A) || defined(MAC_USE_SCC_B)
 	movel	%pc@(L(mac_sccbase)),%a0
-	/* Reset SCC device */
+	/* Reset SCC register pointer */
+	moveb	%a0@(mac_scc_cha_a_ctrl_offset),%d0
+	/* Reset SCC device: write register pointer then register value */
 	moveb	#9,%a0@(mac_scc_cha_a_ctrl_offset)
 	moveb	#0xc0,%a0@(mac_scc_cha_a_ctrl_offset)
 	/* Wait for 5 PCLK cycles, which is about 68 CPU cycles */
