From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 10/12] m68k: Implement ndelay() based on the existing udelay() logic
Date: Sat,  6 Apr 2013 13:26:44 +1300
Message-ID: <1365208006-16227-11-git-send-email-schmitz@debian.org>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:34653 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1163104Ab3DFA11 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Apr 2013 20:27:27 -0400
Received: by mail-pb0-f54.google.com with SMTP id xa7so2259469pbc.27
        for <linux-m68k@vger.kernel.org>; Fri, 05 Apr 2013 17:27:26 -0700 (PDT)
In-Reply-To: <1365208006-16227-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

Add a ndelay macro modeled after the Coldfire udelay(). The ISP1160
driver needs a 150ns delay, so we need to have ndelay().

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 arch/m68k/include/asm/delay.h |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 12d8fe4..8a9971d 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -92,5 +92,25 @@ static inline void __udelay(unsigned long usecs)
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
+ */
+
+/*
+ * The simpler m68k and ColdFire processors do not have a 32*32->64
+ * multiply instruction. So we need to handle them a little differently.
+ * We use a bit of shifting and a single 32*32->32 multiply to get close.
+ * This is a macro so that the const version can factor out the first
+ * multiply and shift.
+ */
+#define	HZSCALE		(268435456 / (1000000 / HZ))
+
+#define ndelay(n) __delay(DIV_ROUND_UP((n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000));
 
 #endif /* defined(_M68K_DELAY_H) */
-- 
1.7.0.4
