Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6578BC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3638461029
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHI4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHIz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:08:55 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE96C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=j8G0Qw1OqMPcWgsI54a+i3ZvID2rz/bU9IASzI7zYTw=; b=X4ysEW3QH+tcsL2bcXnH5F0XUI
        xw4tpFZaAFk6Bmp0W/hiUZM5TPTZaiLB1QkB/Q2Qq/dNQwT7cqMPAvNs9DS6tSZtNpNknGq7w1ehq
        YH+vBSAd7m0ipLoQ5FeMgLvO6/X2GtptppMOjRLZyXvE+3Uhgrdl35mMevcsX+m8ZYZ2UikpngUeX
        cKOgGW4WSmOPViWQDJt3TQFB8dWPgk+WvmB/eyZPblFsOp4PdHFco4LOocrk8DYJD9s7KZyx7rzRn
        7V6DKf6R8CWulKwCXVtB7veO8vpuuP+a3oYQHDu3t9x/s/wW8CrEQdcBddN++RKuq7SUWHmtaYQjv
        hTuTQfGQ==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlUB-00GP6z-5c; Thu, 16 Sep 2021 07:07:13 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 5/6] m68k: provide __{get,put}_kernel_nofault
Date:   Thu, 16 Sep 2021 09:04:04 +0200
Message-Id: <20210916070405.52750-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
References: <20210916070405.52750-1-hch@lst.de>
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
 arch/m68k/include/asm/uaccess.h | 105 +++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 21 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 288ef7d11a7a3..65581a7874d4d 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -39,9 +39,9 @@ static inline int access_ok(const void __user *addr,
 #define	MOVES	"move"
 #endif
 
-#define __put_user_asm(res, x, ptr, bwl, reg, err)	\
+#define __put_user_asm(inst, res, x, ptr, bwl, reg, err) \
 asm volatile ("\n"					\
-	"1:	"MOVES"."#bwl"	%2,%1\n"		\
+	"1:	"inst"."#bwl"	%2,%1\n"		\
 	"2:\n"						\
 	"	.section .fixup,\"ax\"\n"		\
 	"	.even\n"				\
@@ -57,13 +57,13 @@ asm volatile ("\n"					\
 	: "+d" (res), "=m" (*(ptr))			\
 	: #reg (x), "i" (err))
 
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
-		__put_user_asm(__pu_err, __pu_val, ptr, b, d, -EFAULT);	\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, b, d, -EFAULT); \
 		break;							\
 	case 2:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, w, r, -EFAULT);	\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, w, r, -EFAULT); \
 		break;							\
 	case 4:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, l, r, -EFAULT);	\
+		__put_user_asm(MOVES, __pu_err, __pu_val, ptr, l, r, -EFAULT); \
 		break;							\
 	case 8:								\
-		__put_user_asm8(__pu_err, __pu_val, ptr);		\
+		__put_user_asm8(MOVES, __pu_err, __pu_val, ptr);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -113,10 +113,10 @@ do {								\
 #define put_user(x, ptr)	__put_user(x, ptr)
 
 
-#define __get_user_asm(res, x, ptr, type, bwl, reg, err) ({		\
+#define __get_user_asm(inst, res, x, ptr, type, bwl, reg, err) ({	\
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
-		__get_user_asm(__gu_err, x, ptr, u8, b, d, -EFAULT);	\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u8, b, d, -EFAULT); \
 		break;							\
 	case 2:								\
-		__get_user_asm(__gu_err, x, ptr, u16, w, r, -EFAULT);	\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u16, w, r, -EFAULT); \
 		break;							\
 	case 4:								\
-		__get_user_asm(__gu_err, x, ptr, u32, l, r, -EFAULT);	\
+		__get_user_asm(MOVES, __gu_err, x, ptr, u32, l, r, -EFAULT); \
 		break;							\
 	case 8:								\
-		__get_user_asm8(__gu_err, x, ptr);			\
+		__get_user_asm8(MOVES, __gu_err, x, ptr);		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -330,16 +330,19 @@ __constant_copy_to_user(void __user *to, const void *from, unsigned long n)
 
 	switch (n) {
 	case 1:
-		__put_user_asm(res, *(u8 *)from, (u8 __user *)to, b, d, 1);
+		__put_user_asm(MOVES, res, *(u8 *)from, (u8 __user *)to,
+				b, d, 1);
 		break;
 	case 2:
-		__put_user_asm(res, *(u16 *)from, (u16 __user *)to, w, r, 2);
+		__put_user_asm(MOVES, res, *(u16 *)from, (u16 __user *)to,
+				w, r, 2);
 		break;
 	case 3:
 		__constant_copy_to_user_asm(res, to, from, tmp, 3, w, b,);
 		break;
 	case 4:
-		__put_user_asm(res, *(u32 *)from, (u32 __user *)to, l, r, 4);
+		__put_user_asm(MOVES, res, *(u32 *)from, (u32 __user *)to,
+				l, r, 4);
 		break;
 	case 5:
 		__constant_copy_to_user_asm(res, to, from, tmp, 5, l, b,);
@@ -388,6 +391,66 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_FROM_USER
 #define INLINE_COPY_TO_USER
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	type *__gk_dst = (type *)(dst);					\
+	type *__gk_src = (type *)(src);					\
+	int __gk_err = 0;						\
+									\
+	switch (sizeof(type)) {						\
+	case 1:								\
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src,	\
+				u8, b, d, -EFAULT);			\
+		break;							\
+	case 2:								\
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src,	\
+				u16, w, r, -EFAULT);			\
+		break;							\
+	case 4:								\
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src,	\
+				u32, l, r, -EFAULT);			\
+		break;							\
+	case 8:								\
+		__get_user_asm8("move", __gk_err, *__gk_dst, __gk_src);	\
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
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst,	\
+				b, d, -EFAULT);				\
+		break;							\
+	case 2:								\
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst,	\
+				w, r, -EFAULT);				\
+		break;							\
+	case 4:								\
+		__put_user_asm("move", __pk_err, __pk_src, __pk_dst,	\
+				l, r, -EFAULT);				\
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
 #define user_addr_max() \
 	(uaccess_kernel() ? ~0UL : TASK_SIZE)
 
-- 
2.30.2

