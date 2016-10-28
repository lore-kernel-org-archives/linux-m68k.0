From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH] m68k: Fix ndelay() macro
Date: Fri, 28 Oct 2016 17:12:28 +0200
Message-ID: <1477667548-740-1-git-send-email-boris.brezillon__41390.0040825412$1477667583$gmane$org@free-electrons.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>

The current ndelay() macro definition has an extra semi-colon at the
end of the line thus leading to a compilation error when ndelay is used
in a conditional block with curly braces like this one:

	if (cond)
		ndelay(t);
	else
		...

which, after the preprocessor pass gives:

	if (cond)
		m68k_ndelay(t);;
	else
		...

thus leading to the following gcc error:

	error: 'else' without a previous 'if'

Remove this extra semi-colon.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Fixes: c8ee038bd1488 ("m68k: Implement ndelay() based on the existing udelay() logic")
---
 arch/m68k/include/asm/delay.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index d28fa8fe26fe..c598d847d56b 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -114,6 +114,6 @@ static inline void __udelay(unsigned long usecs)
  */
 #define	HZSCALE		(268435456 / (1000000 / HZ))
 
-#define ndelay(n) __delay(DIV_ROUND_UP((n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000));
+#define ndelay(n) __delay(DIV_ROUND_UP((n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000))
 
 #endif /* defined(_M68K_DELAY_H) */
-- 
2.7.4
