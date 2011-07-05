From: <gerg@snapgear.com>
Subject: [PATCH] m68k: fix some atomic operation asm address modes for ColdFire
Date: Tue, 5 Jul 2011 10:48:15 +1000
Message-ID: <1309826895-7951-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:23329 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895Ab1GEAsY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Jul 2011 20:48:24 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire processors have a much more limited set of addressing modes
that can be used for most instructions. A number of the atomic operations
have already been fixed to limit the addressing modes used with add and
sub instructions when building for ColdFire. But we missed a few.
Fix the remaining atomic operations to be clean for ColdFire processors.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/atomic.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/atomic.h
index 03ae3d1..307a573 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -169,18 +169,18 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 	char c;
 	__asm__ __volatile__("addl %2,%1; smi %0"
 			     : "=d" (c), "+m" (*v)
-			     : "id" (i));
+			     : ASM_DI (i));
 	return c != 0;
 }
 
 static inline void atomic_clear_mask(unsigned long mask, unsigned long *v)
 {
-	__asm__ __volatile__("andl %1,%0" : "+m" (*v) : "id" (~(mask)));
+	__asm__ __volatile__("andl %1,%0" : "+m" (*v) : ASM_DI (~(mask)));
 }
 
 static inline void atomic_set_mask(unsigned long mask, unsigned long *v)
 {
-	__asm__ __volatile__("orl %1,%0" : "+m" (*v) : "id" (mask));
+	__asm__ __volatile__("orl %1,%0" : "+m" (*v) : ASM_DI (mask));
 }
 
 static __inline__ int atomic_add_unless(atomic_t *v, int a, int u)
-- 
1.7.0.4
