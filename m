From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: fix sigset_t accessor functions
Date: Sat, 17 Nov 2012 22:27:04 +0100
Message-ID: <m28v9zzzrr.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40664 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752137Ab2KQV1H (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Nov 2012 16:27:07 -0500
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3Y3qBy1CVTz4KK29
	for <linux-m68k@vger.kernel.org>; Sat, 17 Nov 2012 22:27:06 +0100 (CET)
Received: from igel.home (ppp-88-217-102-62.dynamic.mnet-online.de [88.217.102.62])
	by mail.mnet-online.de (Postfix) with ESMTPA id 3Y3qBx4n4LzbbfZ
	for <linux-m68k@vger.kernel.org>; Sat, 17 Nov 2012 22:27:05 +0100 (CET)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

The sigaddset/sigdelset/sigismember functions that are implemented with
bitfield insn cannot allow the sigset argument to be placed in a data
register since the sigset is wider than 32 bits.  Remove the "d"
constraint from the asm statements.

The effect of the bug is that sending RT signals does not work, the signal
number is truncated modulo 32.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/include/asm/signal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/signal.h b/arch/m68k/include/asm/signal.h
index 60e8866..93fe83e 100644
--- a/arch/m68k/include/asm/signal.h
+++ b/arch/m68k/include/asm/signal.h
@@ -156,7 +156,7 @@ typedef struct sigaltstack {
 static inline void sigaddset(sigset_t *set, int _sig)
 {
 	asm ("bfset %0{%1,#1}"
-		: "+od" (*set)
+		: "+o" (*set)
 		: "id" ((_sig - 1) ^ 31)
 		: "cc");
 }
@@ -164,7 +164,7 @@ static inline void sigaddset(sigset_t *set, int _sig)
 static inline void sigdelset(sigset_t *set, int _sig)
 {
 	asm ("bfclr %0{%1,#1}"
-		: "+od" (*set)
+		: "+o" (*set)
 		: "id" ((_sig - 1) ^ 31)
 		: "cc");
 }
@@ -180,7 +180,7 @@ static inline int __gen_sigismember(sigset_t *set, int _sig)
 	int ret;
 	asm ("bfextu %1{%2,#1},%0"
 		: "=d" (ret)
-		: "od" (*set), "id" ((_sig-1) ^ 31)
+		: "o" (*set), "id" ((_sig-1) ^ 31)
 		: "cc");
 	return ret;
 }
-- 
1.8.0


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
