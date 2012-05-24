From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 10/11] Atari: conditional isp16x register access macros (BE vs.
 LE interface)
Date: Thu, 24 May 2012 02:54:25 +0200
Message-ID: <E1SXMJt-0002Y7-Om@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:38911 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751000Ab2EXAy1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 20:54:27 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I0000256Q0I00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:54:26 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From c6fb3c101a15817290090cb54dbb52c2dc706044 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 13:35:23 +1200
Subject: [PATCH 10/11] [m68k] Atari: conditionalize isp116x.h access macros to cater for hardware
        that byte swaps word accesses in silicon (seems to be all the rage on Falcon)

---
 drivers/usb/host/isp116x.h |   32 +++++++++++++++++++++++---------
 1 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
index 9a2c400..8674b29 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -364,22 +364,36 @@ struct isp116x_ep {
 #define	IRQ_TEST()	do{}while(0)
 #endif
 
+#ifdef CONFIG_ATARI
+  /* 16 bit data bus byte swapped in hardware */
+#define isp_readw		 __raw_readw
+#define isp_writew		 __raw_writew
+#define isp_raw_readw		 readw
+#define isp_raw_writew		 writew
+#else
+  /* sane hardware */
+#define isp_readw		 readw
+#define isp_writew		 writew
+#define isp_raw_readw		 __raw_readw
+#define isp_raw_writew		 __raw_writew
+#endif
+
 static inline void isp116x_write_addr(struct isp116x *isp116x, unsigned reg)
 {
 	IRQ_TEST();
-	writew(reg & 0xff, isp116x->addr_reg);
+	isp_writew(reg & 0xff, isp116x->addr_reg);
 	isp116x_delay(isp116x, 300);
 }
 
 static inline void isp116x_write_data16(struct isp116x *isp116x, u16 val)
 {
-	writew(val, isp116x->data_reg);
+	isp_writew(val, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
 static inline void isp116x_raw_write_data16(struct isp116x *isp116x, u16 val)
 {
-	__raw_writew(val, isp116x->data_reg);
+	isp_raw_writew(val, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
@@ -387,7 +401,7 @@ static inline u16 isp116x_read_data16(struct isp116x *isp116x)
 {
 	u16 val;
 
-	val = readw(isp116x->data_reg);
+	val = isp_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 	return val;
 }
@@ -396,16 +410,16 @@ static inline u16 isp116x_raw_read_data16(struct isp116x *isp116x)
 {
 	u16 val;
 
-	val = __raw_readw(isp116x->data_reg);
+	val = isp_raw_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 	return val;
 }
 
 static inline void isp116x_write_data32(struct isp116x *isp116x, u32 val)
 {
-	writew(val & 0xffff, isp116x->data_reg);
+	isp_writew(val & 0xffff, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
-	writew(val >> 16, isp116x->data_reg);
+	isp_writew(val >> 16, isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
 }
 
@@ -413,9 +427,9 @@ static inline u32 isp116x_read_data32(struct isp116x *isp116x)
 {
 	u32 val;
 
-	val = (u32) readw(isp116x->data_reg);
+	val = (u32) isp_readw(isp116x->data_reg);
 	isp116x_delay(isp116x, 150);
-	val |= ((u32) readw(isp116x->data_reg)) << 16;
+	val |= ((u32) isp_readw(isp116x->data_reg)) << 16;
 	isp116x_delay(isp116x, 150);
 	return val;
 }
-- 
1.7.0.4
