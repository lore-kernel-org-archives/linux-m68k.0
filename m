From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 17/17] [m68k] Atari: NetUSBee tweaks for ISP1160 USB HCD driver
Date: Thu, 31 Jan 2013 13:36:53 +1300 (NZDT)
Message-ID: <20130131003653.A8152360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:42617 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752703Ab3AaAg7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:36:59 -0500
Received: by mail-pb0-f49.google.com with SMTP id xa12so1275984pbc.8
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:36:59 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 17/17] [m68k] Atari: NetUSBee tweaks for ISP1160 USB HCD driver
	Some tweaks necessary to make the NetUSBee driver work with 
	both USB ports - something in the NetUSBee design makes the
	second port shut down due to overcurrent otherwise. As all
	NetUSBee stuff, this is provided by David. 


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/usb/host/isp116x-hcd.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index cb0745d..dd13b05 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -1307,8 +1307,11 @@ static int isp116x_reset(struct usb_hcd *hcd)
 	struct isp116x *isp116x = hcd_to_isp116x(hcd);
 	unsigned long t;
 	u16 clkrdy = 0;
+#ifdef CONFIG_ATARI
+	int ret, timeout = 200 /* ms */ ;
+#else
 	int ret, timeout = 15 /* ms */ ;
-
+#endif
 	ret = isp116x_sw_reset(isp116x);
 	if (ret)
 		return ret;
@@ -1410,6 +1413,12 @@ static int isp116x_start(struct usb_hcd *hcd)
 	val |= RH_A_PSM;
 	/* Report overcurrent per port */
 	val |= RH_A_OCPM;
+#ifdef CONFIG_ATARI
+        /* Galvez: For NetUSBee, Overcurrent protection disable,
+           to stop interrupt storm because OC events */
+        if ((unsigned long) hcd->rsrc_start > 0x80000000UL)
+            val |= RH_A_NOCP;
+#endif
 	isp116x_write_reg32(isp116x, HCRHDESCA, val);
 	isp116x->rhdesca = isp116x_read_reg32(isp116x, HCRHDESCA);
 
-- 
1.7.0.4
