From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Unify arch/m68k/include/asm/unistd.h
Date: Mon, 2 Feb 2009 22:47:20 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0902022246320.15898@anakin>
References: <Pine.LNX.4.64.0902011114410.30504@anakin>
	<498599A6.7080202@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <498599A6.7080202@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Sun, 1 Feb 2009, Greg Ungerer wrote:
>       m68k: use non-mmu version of unaligned.h for all m68k

And another one. The rest looks OK.

>From f94c9409356de883fd343cc7c0f25dd955bcad42 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Feb 2009 22:12:36 +0100
Subject: [PATCH] m68k: Restore correct include guards for <asm/unaligned.h>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/unaligned.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/unaligned.h b/arch/m68k/include/asm/unaligned.h
index eb1ea4c..019caa7 100644
--- a/arch/m68k/include/asm/unaligned.h
+++ b/arch/m68k/include/asm/unaligned.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_M68KNOMMU_UNALIGNED_H
-#define _ASM_M68KNOMMU_UNALIGNED_H
+#ifndef _ASM_M68K_UNALIGNED_H
+#define _ASM_M68K_UNALIGNED_H
 
 
 #ifdef CONFIG_COLDFIRE
@@ -22,4 +22,4 @@
 
 #endif
 
-#endif /* _ASM_M68KNOMMU_UNALIGNED_H */
+#endif /* _ASM_M68K_UNALIGNED_H */
-- 
1.5.6.5


Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
