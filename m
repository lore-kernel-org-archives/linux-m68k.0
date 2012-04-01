From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 6/5] m68k/atari: set up timer D and register dummy handler
 if either EtherNEC or EtherNAT found
Date: Sun, 01 Apr 2012 17:57:45 +1200
Message-ID: <4F77EE59.9040408@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg> <4F77C726.9020106@gmail.com> <4F77E029.1090605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:32876 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291Ab2DAF5w (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Apr 2012 01:57:52 -0400
Received: by dake40 with SMTP id e40so1135901dak.11
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 22:57:52 -0700 (PDT)
In-Reply-To: <4F77E029.1090605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

this may clash somewhat with the patch you sent a few days ago (return 
-ENODEV if not running on Atari), the last hunk probably needs manual 
merging.

Probe for EtherNEC as well by checking the base register is accessible. 
If either EtherNEC or EtherNAT are found, set up MFP timer D as 200 Hz 
timer, and register a dummy interrupt handler to ensure the unhandled 
interrupt watchdog does not kick in.

Without the dummy handler, your only chance of keeping the ethernet 
device alive is keeping traffic up (ping your router) or rely on 
CONFIG_NETPOLL being active (that operates off the 100 Hz jiffies timer 
so it's going to be slower).

Also, enable the EtherNAT 91C111 interrupt so we could switch to 
interrupt driven operation there (will happen on one of the next patches 
converting EtherNAT to use smc91x.c). Also enabling the ISP1160 
interrupt will hang the system, alas.

I'd love to defer setting up the timer until the first timer D interrupt 
handler is registered, same with the EtherNAT interrupts. What's the 
best way to go about that?

Cheers,

  Michael

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/atari/config.c |   49 
+++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index aceebc2..22375e0 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -663,6 +663,8 @@ static void atari_get_hardware_list(struct seq_file *m)
  * MSch: initial platform device support for Atari, required for EtherNAT
  */
 
+#define ATARI_ETHERNEC_PHYS_ADDR    0xfffa0000
+
 #define ATARI_ETHERNAT_PHYS_ADDR    0x80000000
 #define ATARI_ETHERNAT_IRQ        196
 
@@ -746,24 +748,61 @@ static struct platform_device isp1160_device = {
 
 };
 
-static struct platform_device *atari_platform_devices[] __initdata = {
+static struct platform_device *atari_ethernat_devices[] __initdata = {
     &smc91x_device,
     &isp1160_device
 };
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC) || IS_ENABLED(CONFIG_ATARI_ETHERNAT)
+irqreturn_t atari_timerd_interrupt(int irq, void *dev_id)
+{
+    return IRQ_HANDLED;
+}
+#endif
+
 int __init atari_platform_init(void)
 {
-    int rv = -ENODEV;
-    unsigned char *enatc_virt;
+    int rv = -ENODEV, ret, need_timer = 0;
+    unsigned char *enatc_virt, *enec_virt;
 
     if (!MACH_IS_ATARI)
         return -ENODEV;
 
+#if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
+    enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
+    if (hwreg_present(enec_virt)) {
+        need_timer = 1;
+    }
+    iounmap(enec_virt);
+#endif
+
+#if IS_ENABLED(CONFIG_ATARI_ETHERNAT)
     enatc_virt = (unsigned char 
*)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
-    if (hwreg_present(enatc_virt))
-        rv = platform_add_devices(atari_platform_devices, 
ARRAY_SIZE(atari_platform_devices));
+    if (hwreg_present(enatc_virt)) {
+        need_timer = 1;        /* for now */
+        /* possibly defer until interrupt is registered ? */
+        *enatc_virt |= 0x2;    /* 91C111 int only, use 0x6 to enable 
both interrupts */
+        rv = platform_add_devices(atari_ethernat_devices, 
ARRAY_SIZE(atari_ethernat_devices));
+    }
     iounmap(enatc_virt);
+#endif
+
+    if (need_timer) {
+        const char *name = "Timer D dummy interrupt";
+
+        /* timer routine set up in atari_ethernec_probe() */
+        /* set Timer D data Register */
+        st_mfp.tim_dt_d = 123;    /* 200 Hz */
+        /* start timer D, div = 1:100 */
+        st_mfp.tim_ct_cd = (st_mfp.tim_ct_cd & 0xf0) | 0x6;
+        /* Must make this shared in case other timer ints are needed */
+        ret = request_irq(IRQ_MFP_TIMD, atari_timerd_interrupt, 
IRQF_SHARED, name, atari_timerd_interrupt);
+        if (ret) {
+            printk(KERN_ERR "atari_platform_init: failed to register 
dummy timer interrupt for EtherNEC/EtherNAT!\n");
+        }
+    }
 
+    if (ret) return ret;
     return rv;   
 }
 
