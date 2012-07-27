From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: make sys_atomic_cmpxchg_32 work on classic m68k
Date: Sat, 28 Jul 2012 00:20:34 +0200
Message-ID: <m2r4rwongt.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47015 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882Ab2G0WUh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Jul 2012 18:20:37 -0400
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WkPkq5GBTz4KK3N
	for <linux-m68k@vger.kernel.org>; Sat, 28 Jul 2012 00:20:35 +0200 (CEST)
Received: from igel.home (ppp-93-104-129-67.dynamic.mnet-online.de [93.104.129.67])
	by mail.mnet-online.de (Postfix) with ESMTPA id 3WkPkq3dN8zbbj3
	for <linux-m68k@vger.kernel.org>; Sat, 28 Jul 2012 00:20:35 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

User space access must always go through uaccess accessors, since on
classic m68k user space and kernel space are completely separate.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/kernel/sys_m68k.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
index 8623f8d..9a5932e 100644
--- a/arch/m68k/kernel/sys_m68k.c
+++ b/arch/m68k/kernel/sys_m68k.c
@@ -479,9 +479,13 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
 			goto bad_access;
 		}
 
-		mem_value = *mem;
+		/*
+		 * No need to check for EFAULT; we know that the page is
+		 * present and writable.
+		 */
+		__get_user(mem_value, mem);
 		if (mem_value == oldval)
-			*mem = newval;
+			__put_user(newval, mem);
 
 		pte_unmap_unlock(pte, ptl);
 		up_read(&mm->mmap_sem);
-- 
1.7.11.3


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
