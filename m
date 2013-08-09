From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: truncate base in do_div
Date: Fri, 09 Aug 2013 15:14:08 +0200
Message-ID: <871u633t27.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58434 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758293Ab3HINOL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Aug 2013 09:14:11 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

Explicitly truncate the second operand of do_div to 32 bits to guard
against bogus code calling it with a 64bit divisor.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/include/asm/div64.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/div64.h
index 444ea8a..ef881cf 100644
--- a/arch/m68k/include/asm/div64.h
+++ b/arch/m68k/include/asm/div64.h
@@ -15,16 +15,17 @@
 		unsigned long long n64;				\
 	} __n;							\
 	unsigned long __rem, __upper;				\
+	unsigned long __base = (base);				\
 								\
 	__n.n64 = (n);						\
 	if ((__upper = __n.n32[0])) {				\
 		asm ("divul.l %2,%1:%0"				\
-			: "=d" (__n.n32[0]), "=d" (__upper)	\
-			: "d" (base), "0" (__n.n32[0]));	\
+		     : "=d" (__n.n32[0]), "=d" (__upper)	\
+		     : "d" (__base), "0" (__n.n32[0]));		\
 	}							\
 	asm ("divu.l %2,%1:%0"					\
-		: "=d" (__n.n32[1]), "=d" (__rem)		\
-		: "d" (base), "1" (__upper), "0" (__n.n32[1]));	\
+	     : "=d" (__n.n32[1]), "=d" (__rem)			\
+	     : "d" (__base), "1" (__upper), "0" (__n.n32[1]));	\
 	(n) = __n.n64;						\
 	__rem;							\
 })
-- 
1.8.3.4


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
