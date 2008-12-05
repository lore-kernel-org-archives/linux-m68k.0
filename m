From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k: define __fls (was: Re: Yet more ARM breakage in linux-next
 (fwd))
Date: Fri, 5 Dec 2008 09:58:57 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812050957510.4875@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:42539 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbYLEI67 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 5 Dec 2008 03:58:59 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>, uClinux list <uclinux-dev@uclinux.org>

---------- Forwarded message ----------
Date: Fri, 5 Dec 2008 00:42:27 +1030
From: Rusty Russell <rusty@rustcorp.com.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
    Russell King <rmk+lkml@arm.linux.org.uk>, linux-kernel@vger.kernel.org
Subject: Re: Yet more ARM breakage in linux-next

On Thursday 04 December 2008 19:48:06 Geert Uytterhoeven wrote:
> Also broke m68k (a bit more hidden due to other build failures).

And m68knommu has similar issues.

Here's what I have for m68k for tomorrow's linux-next.  Please steal.

m68k: define __fls

Like fls, but can't be handed 0 and returns the bit number.

(I broke this arch in linux-next by using __fls in generic code).

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>

diff --git a/include/asm-m68k/bitops.h b/include/asm-m68k/bitops.h
--- a/include/asm-m68k/bitops.h
+++ b/include/asm-m68k/bitops.h
@@ -315,6 +315,11 @@ static inline int fls(int x)
 	return 32 - cnt;
 }
 
+static inline int __fls(int x)
+{
+	return fls(x) - 1;
+}
+
 #include <asm-generic/bitops/fls64.h>
 #include <asm-generic/bitops/sched.h>
 #include <asm-generic/bitops/hweight.h>



--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
