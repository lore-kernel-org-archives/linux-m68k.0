From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Tue, 01 Nov 2011 21:34:23 +0100
Message-ID: <m2d3dbd1kg.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:55603 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291Ab1KAUe3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Nov 2011 16:34:29 -0400
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id B2024188B591
	for <linux-m68k@vger.kernel.org>; Tue,  1 Nov 2011 21:35:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 9487C1C00044
	for <linux-m68k@vger.kernel.org>; Tue,  1 Nov 2011 21:34:25 +0100 (CET)
Received: from mail.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new, port 10024)
	with ESMTP id 6W2bZdoqms+M for <linux-m68k@vger.kernel.org>;
	Tue,  1 Nov 2011 21:34:25 +0100 (CET)
Received: from igel.home (ppp-88-217-113-127.dynamic.mnet-online.de [88.217.113.127])
	by mail.mnet-online.de (Postfix) with ESMTP
	for <linux-m68k@vger.kernel.org>; Tue,  1 Nov 2011 21:34:24 +0100 (CET)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Define again the syscalls that are used by glibc so that it is possible to
compile a feature-complete glibc with the newest kernel headers.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/include/asm/unistd.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unistd.h
index 43f984e..d97234b 100644
--- a/arch/m68k/include/asm/unistd.h
+++ b/arch/m68k/include/asm/unistd.h
@@ -132,10 +132,10 @@
 #define __NR_adjtimex		124
 #define __NR_mprotect		125
 #define __NR_sigprocmask	126
-/*#define __NR_create_module	127*/
+#define __NR_create_module	127
 #define __NR_init_module	128
 #define __NR_delete_module	129
-/*#define __NR_get_kernel_syms	130*/
+#define __NR_get_kernel_syms	130
 #define __NR_quotactl		131
 #define __NR_getpgid		132
 #define __NR_fchdir		133
@@ -172,7 +172,7 @@
 #define __NR_setresuid		164
 #define __NR_getresuid		165
 #define __NR_getpagesize	166
-/*#define __NR_query_module	167*/
+#define __NR_query_module	167
 #define __NR_poll		168
 #define __NR_nfsservctl		169
 #define __NR_setresgid		170
@@ -193,8 +193,8 @@
 #define __NR_capset		185
 #define __NR_sigaltstack	186
 #define __NR_sendfile		187
-/*#define __NR_getpmsg		188*/	/* some people actually want streams */
-/*#define __NR_putpmsg		189*/	/* some people actually want streams */
+#define __NR_getpmsg		188	/* some people actually want streams */
+#define __NR_putpmsg		189	/* some people actually want streams */
 #define __NR_vfork		190
 #define __NR_ugetrlimit		191
 #define __NR_mmap2		192
-- 
1.7.7.1


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
