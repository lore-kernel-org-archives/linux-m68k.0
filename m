From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 9/11] Atari: add ndelay() (used by isp116x-hcd)
Date: Thu, 24 May 2012 02:53:06 +0200
Message-ID: <E1SXMIc-0002Y2-NB@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:38749 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752289Ab2EXAxI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 20:53:08 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00N0054J4J00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:53:07 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From f41b89ed1731e50edc5da100c0a5d8a0ba3b66b1 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 13:34:09 +1200
Subject: [PATCH 09/11] [m68k] Implement ndelay() based on the existing udelay() logic (needed for ISP1160)

---
 arch/m68k/include/asm/delay.h |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 9c09bec..a37abf5 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -92,5 +92,31 @@ static inline void __udelay(unsigned long usecs)
 #define udelay(n) (__builtin_constant_p(n) ? \
 	((n) > 20000 ? __bad_udelay() : __const_udelay(n)) : __udelay(n))
 
+/*
+ * nanosecond delay: 
+ *
+ * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) is the number of loops per microsecond
+ *
+ * 1000 / ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) is the number of nanoseconds per loop
+ *
+ * So n / ( 1000 / ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) ) would be the number of loops for n nanoseconds
+ * 
+ * ndelay(n) = __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000 ) )
+ */
+
+
+#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+/*
+ * The simpler m68k and ColdFire processors do not have a 32*32->64
+ * multiply instruction. So we need to handle them a little differently.
+ * We use a bit of shifting and a single 32*32->32 multiply to get close.
+ * This is a macro so that the const version can factor out the first
+ * multiply and shift.
+ */
+#define	HZSCALE		(268435456 / (1000000 / HZ))
+
+#define ndelay(n) __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000 ) );
+
+#endif
 
 #endif /* defined(_M68K_DELAY_H) */
-- 
1.7.0.4
