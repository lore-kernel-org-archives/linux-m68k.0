From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 14/17] [m68k] Implement ndelay() based on the existing udelay() logic (needed for ISP1160)
Date: Thu, 31 Jan 2013 13:30:15 +1300 (NZDT)
Message-ID: <20130131003015.DCCF4360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:36040 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755390Ab3AaAaV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:30:21 -0500
Received: by mail-pa0-f42.google.com with SMTP id rl6so1396991pac.29
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:30:20 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 14/17] [m68k] Implement ndelay() based on the existing udelay() logic (needed for ISP1160)


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/delay.h |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 12d8fe4..b18b667 100644
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
