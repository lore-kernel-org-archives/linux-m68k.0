Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE15FC07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7672613C9
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhGIHFF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHFF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:05:05 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17324C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=dHPlRL3NH55IZNgpSQvfzrVYg6/KQ8mHK/80/am7w9o=; b=kn7llS9aenVBYaKFm9DDQ7mpRL
        VTyOMbvj4l0N8JkE7r5Fnrt+n1WRxCBV34IGeepEotHOuFUwZL+S4HxTB3xc2YYd4z9q21Gvsz/RF
        v7tzm9CLZVfoEEtvF4L0VsVWZf4FW2uI0QM175gCxkc43TQElnTSaQLGzOSsWqBpvFOS8b2YRv92s
        yrgFj0pm6hMRzOFGfTcHiluuhJtm6EOj9eVwa0BnYqw4q/PCoqwq9pumyB3ewCMsUGqgaGnMt3Ql0
        4K3eKcsmwlboWVdn1/vxgc7pZyYtjxkROuOBqKuLTA4CGz6CygeWm8HvMdq/FPwUHc+DWl9oj+jy9
        eL6geMdQ==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWZ-00EFOE-B7; Fri, 09 Jul 2021 07:02:14 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 6/7] m68k: provide __{get,put}_kernel_nofault
Date:   Fri,  9 Jul 2021 09:01:31 +0200
Message-Id: <20210709070132.3387689-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Allow non-faulting access to kernel addresses without overriding the
address space.  Implemented by passing the instruction name to the
low-level assembly macros as an argument, and force the use of the
normal move instructions for kernel access.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 90 ++++++++++++++++++++++++++-------
 1 file changed, 72 insertions(+), 18 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 384b2a6b135c..2bedb1b8c4bf 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -39,9 +39,9 @@ static inline int access_ok(const void __user *addr,
 #define	MOVES	"move"
 #endif
 
-#define __put_user_asm(res, x, ptr, bwl, reg)		\
+#define __put_user_asm(inst, res, x, ptr, bwl, reg)	\
 asm volatile ("\n"					\
-	"1:	"MOVES"."#bwl"	%2,%1\n"		\
+	"1:	"inst"."#bwl"	%2,%1\n"		\
 	"2:\n"						\
 	"	.section .fixup,\"ax\"\n"		\
 	"	.even\n"				\
@@ -57,13 +57,13 @@ asm volatile ("\n"					\
 	: "+d" (res), "=m" (*(ptr))			\
 	: #reg (x), "i" (-EFAULT))
 
-#define __put_user_asm8(res, x, ptr)				\
+#define __put_user_asm8(inst, res, x, ptr)			\
 do {								\
 	const void *__pu_ptr = (const void __force *)(ptr);	\
 								\
 	asm volatile ("\n"					\
-		"1:	"MOVES".l %2,(%1)+\n"			\
-		"2:	"MOVES".l %R2,(%1)\n"			\
+		"1:	"inst".l %2,(%1)+\n"			\
+		"2:	"inst".l %R2,(%1)\n"			\
 		"3:\n"						\
 		"	.section .fixup,\"ax\"\n"		\
 		"	.even\n"				\
@@ -94,16 +94,16 @@ do {								\
 	__chk_user_ptr(ptr);						\
 	switch (sizeof (*(ptr))) {					\
 	case 1:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, b, d);		\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, b, d);	\
 		break;							\
 	case 2:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, w, r);		\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, w, r);	\
 		break;							\
 	case 4:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, l, r);		\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, l, r);	\
 		break;							\
 	case 8:								\
-		__put_user_asm8(__pu_err, __pu_val, ptr);		\
+		__put_user_asm8(MOVES, __pu_err, __pu_val, ptr);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -113,10 +113,10 @@ do {								\
 #define put_user(x, ptr)	__put_user(x, ptr)
 
 
-#define __get_user_asm(res, x, ptr, type, bwl, reg) ({			\
+#define __get_user_asm(inst, res, x, ptr, type, bwl, reg) ({		\
 	type __gu_val;							\
 	asm volatile ("\n"						\
-		"1:	"MOVES"."#bwl"	%2,%1\n"			\
+		"1:	"inst"."#bwl"	%2,%1\n"			\
 		"2:\n"							\
 		"	.section .fixup,\"ax\"\n"			\
 		"	.even\n"					\
@@ -134,7 +134,7 @@ do {								\
 	(x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;	\
 })
 
-#define __get_user_asm8(res, x, ptr)					\
+#define __get_user_asm8(inst, res, x, ptr) 				\
 do {									\
 	const void *__gu_ptr = (const void __force *)(ptr);		\
 	union {								\
@@ -143,8 +143,8 @@ do {									\
 	} __gu_val;							\
 									\
 	asm volatile ("\n"						\
-		"1:	"MOVES".l	(%2)+,%1\n"			\
-		"2:	"MOVES".l	(%2),%R1\n"			\
+		"1:	"inst".l (%2)+,%1\n"				\
+		"2:	"inst".l (%2),%R1\n"				\
 		"3:\n"							\
 		"	.section .fixup,\"ax\"\n"			\
 		"	.even\n"					\
@@ -172,16 +172,16 @@ do {									\
 	__chk_user_ptr(ptr);						\
 	switch (sizeof(*(ptr))) {					\
 	case 1:								\
-		__get_user_asm(__gu_err, x, ptr, u8, b, d);		\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u8, b, d);	\
 		break;							\
 	case 2:								\
-		__get_user_asm(__gu_err, x, ptr, u16, w, r);		\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u16, w, r);	\
 		break;							\
 	case 4:								\
-		__get_user_asm(__gu_err, x, ptr, u32, l, r);		\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u32, l, r);	\
 		break;							\
 	case 8:								\
-		__get_user_asm8(__gu_err, x, ptr);			\
+		__get_user_asm8(MOVES, __gu_err, x, ptr);		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -190,6 +190,60 @@ do {									\
 })
 #define get_user(x, ptr) __get_user(x, ptr)
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	type __gk_dst = *(type *)(dst);					\
+	type *__gk_src = (type *)(src);					\
+	int __gk_err = 0;						\
+									\
+	switch (sizeof(type)) {						\
+	case 1:								\
+		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d); \
+		break;							\
+	case 2:								\
+		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u16, w, r); \
+		break;							\
+	case 4:								\
+		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u32, l, r); \
+		break;							\
+	case 8:								\
+		__get_user_asm8("move", __gk_err, __gk_dst, __gk_src);	\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	if (unlikely(__gk_err))						\
+		goto err_label;						\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	type __pk_src = *(type *)(src);					\
+	type *__pk_dst = (type *)(dst);					\
+	int __pk_err = 0;						\
+									\
+	switch (sizeof(type)) {						\
+	case 1:								\
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst, b, d); \
+		break;							\
+	case 2:								\
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst, w, r); \
+		break;							\
+	case 4:								\
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst, l, r); \
+		break;							\
+	case 8:								\
+		__put_user_asm8("move", __pk_err, __pk_src, __pk_dst);	\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+	if (unlikely(__pk_err))						\
+		goto err_label;						\
+} while (0)
+
 unsigned long raw_copy_from_user(void *to, const void __user *from,
 		unsigned long n);
 unsigned long raw_copy_to_user(void __user *to, const void *from,
-- 
2.30.2

