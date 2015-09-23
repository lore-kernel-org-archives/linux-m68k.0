From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: define asmlinkage_protect
Date: Wed, 23 Sep 2015 23:12:09 +0200
Message-ID: <876130j0wm.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:56868 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753905AbbIWVMN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Sep 2015 17:12:13 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nLsdl26SCz3hjDZ
	for <linux-m68k@vger.kernel.org>; Wed, 23 Sep 2015 23:12:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3nLsdl1pGXzvhQG
	for <linux-m68k@vger.kernel.org>; Wed, 23 Sep 2015 23:12:11 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new, port 10024)
	with ESMTP id fOmdkWaZGsOP for <linux-m68k@vger.kernel.org>;
	Wed, 23 Sep 2015 23:12:10 +0200 (CEST)
Received: from igel.home (ppp-93-104-61-136.dynamic.mnet-online.de [93.104.61.136])
	by mail.mnet-online.de (Postfix) with ESMTPA
	for <linux-m68k@vger.kernel.org>; Wed, 23 Sep 2015 23:12:10 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Make sure the compiler does not modify arguments of syscall functions.
This can happen if the compiler generates a tailcall to another
function.  For example, without asmlinkage_protect sys_openat is compiled
into this function:

sys_openat:
	clr.l %d0
	move.w 18(%sp),%d0
	move.l %d0,16(%sp)
	jbra do_sys_open

Note how the fourth argument is modified in place, modifying the register
%d4 that gets restored from this stack slot when the function returns to
user-space.  The caller may expect the register to be unmodified across
system calls.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/include/asm/linkage.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/m68k/include/asm/linkage.h b/arch/m68k/include/asm/linkage.h
index 5a822bb..066e74f 100644
--- a/arch/m68k/include/asm/linkage.h
+++ b/arch/m68k/include/asm/linkage.h
@@ -4,4 +4,34 @@
 #define __ALIGN .align 4
 #define __ALIGN_STR ".align 4"
 
+/*
+ * Make sure the compiler doesn't do anything stupid with the
+ * arguments on the stack - they are owned by the *caller*, not
+ * the callee. This just fools gcc into not spilling into them,
+ * and keeps it from doing tailcall recursion and/or using the
+ * stack slots for temporaries, since they are live and "used"
+ * all the way to the end of the function.
+ */
+#define asmlinkage_protect(n, ret, args...) \
+	__asmlinkage_protect##n(ret, ##args)
+#define __asmlinkage_protect_n(ret, args...) \
+	__asm__ __volatile__ ("" : "=r" (ret) : "0" (ret), ##args)
+#define __asmlinkage_protect0(ret) \
+	__asmlinkage_protect_n(ret)
+#define __asmlinkage_protect1(ret, arg1) \
+	__asmlinkage_protect_n(ret, "m" (arg1))
+#define __asmlinkage_protect2(ret, arg1, arg2) \
+	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2))
+#define __asmlinkage_protect3(ret, arg1, arg2, arg3) \
+	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3))
+#define __asmlinkage_protect4(ret, arg1, arg2, arg3, arg4) \
+	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3), \
+			      "m" (arg4))
+#define __asmlinkage_protect5(ret, arg1, arg2, arg3, arg4, arg5) \
+	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3), \
+			      "m" (arg4), "m" (arg5))
+#define __asmlinkage_protect6(ret, arg1, arg2, arg3, arg4, arg5, arg6) \
+	__asmlinkage_protect_n(ret, "m" (arg1), "m" (arg2), "m" (arg3), \
+			      "m" (arg4), "m" (arg5), "m" (arg6))
+
 #endif
-- 
2.5.3


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
