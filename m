Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04D0C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7A7B613CA
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhGIHEu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHEu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:04:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C4CC0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=zs2naTbYYCrbMxX5v0ZTTucNT64JEfSvQa0Th5Iaq2A=; b=XUkzfbjEqUTHcuk09LAAelLkNE
        ZXVwE7oi06K0sFegLtOki3qiwaz68gK+UelQQKE0RriKUKFQ374nP4O6z+lx9AfKDgNtv7im9k0Vo
        q7/U3hKDmsN6qIqDTdLsAksLmZ41WuoqTvlhO7yd1u3k5X5y86dx6rXq0YVSdmlOpca1P/QOdlZ2/
        PbUOVpS3kJbyrMv9NGFdP33JTtPrdU3NgdhgGnrlhI6nI0BXxvtLYG+T9u/DedLCkeP7KKmnbJIC0
        pEHvl0LQMKF8YlTn45aLHLE5t55XwWP2D92SHtPOd6TrGrDRvdVkrOSQUVBGQcNkfxsNdf4hQYOGn
        0PufmFow==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWR-00EFNk-VX; Fri, 09 Jul 2021 07:02:04 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 3/7] m68k: remove the inline copy_{from,to}_user variants
Date:   Fri,  9 Jul 2021 09:01:28 +0200
Message-Id: <20210709070132.3387689-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Small access already use get_user/put_user so move the whole larger user
copy machinery out of line.

This saves almost 10k of .text for a defconfig build:

   text	   data	    bss	    dec	    hex	filename
4019751	1344434	 170104	5534289	 547251	vmlinux.pre
4015417	1338962	 170104	5524483	 544c03	vmlinux.post

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 201 +-------------------------------
 arch/m68k/lib/uaccess.c         |  12 +-
 2 files changed, 10 insertions(+), 203 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 01334a9658c4..96aae4d4656b 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -181,203 +181,10 @@ asm volatile ("\n"					\
 })
 #define get_user(x, ptr) __get_user(x, ptr)
 
-unsigned long __generic_copy_from_user(void *to, const void __user *from, unsigned long n);
-unsigned long __generic_copy_to_user(void __user *to, const void *from, unsigned long n);
-
-#define __suffix0
-#define __suffix1 b
-#define __suffix2 w
-#define __suffix4 l
-
-#define ____constant_copy_from_user_asm(res, to, from, tmp, n1, n2, n3, s1, s2, s3)\
-	asm volatile ("\n"						\
-		"1:	"MOVES"."#s1"	(%2)+,%3\n"			\
-		"	move."#s1"	%3,(%1)+\n"			\
-		"	.ifnc	\""#s2"\",\"\"\n"			\
-		"2:	"MOVES"."#s2"	(%2)+,%3\n"			\
-		"	move."#s2"	%3,(%1)+\n"			\
-		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"3:	"MOVES"."#s3"	(%2)+,%3\n"			\
-		"	move."#s3"	%3,(%1)+\n"			\
-		"	.endif\n"					\
-		"	.endif\n"					\
-		"4:\n"							\
-		"	.section __ex_table,\"a\"\n"			\
-		"	.align	4\n"					\
-		"	.long	1b,10f\n"				\
-		"	.ifnc	\""#s2"\",\"\"\n"			\
-		"	.long	2b,20f\n"				\
-		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"	.long	3b,30f\n"				\
-		"	.endif\n"					\
-		"	.endif\n"					\
-		"	.previous\n"					\
-		"\n"							\
-		"	.section .fixup,\"ax\"\n"			\
-		"	.even\n"					\
-		"10:	addq.l #"#n1",%0\n"				\
-		"	.ifnc	\""#s2"\",\"\"\n"			\
-		"20:	addq.l #"#n2",%0\n"				\
-		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"30:	addq.l #"#n3",%0\n"				\
-		"	.endif\n"					\
-		"	.endif\n"					\
-		"	jra	4b\n"					\
-		"	.previous\n"					\
-		: "+d" (res), "+&a" (to), "+a" (from), "=&d" (tmp)	\
-		: : "memory")
-
-#define ___constant_copy_from_user_asm(res, to, from, tmp, n1, n2, n3, s1, s2, s3)\
-	____constant_copy_from_user_asm(res, to, from, tmp, n1, n2, n3, s1, s2, s3)
-#define __constant_copy_from_user_asm(res, to, from, tmp, n1, n2, n3)	\
-	___constant_copy_from_user_asm(res, to, from, tmp, n1, n2, n3,  \
-					__suffix##n1, __suffix##n2, __suffix##n3)
-
-static __always_inline unsigned long
-__constant_copy_from_user(void *to, const void __user *from, unsigned long n)
-{
-	unsigned long res = 0, tmp;
-
-	switch (n) {
-	case 1:
-		__constant_copy_from_user_asm(res, to, from, tmp, 1, 0, 0);
-		break;
-	case 2:
-		__constant_copy_from_user_asm(res, to, from, tmp, 2, 0, 0);
-		break;
-	case 3:
-		__constant_copy_from_user_asm(res, to, from, tmp, 2, 1, 0);
-		break;
-	case 4:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 0, 0);
-		break;
-	case 5:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 1, 0);
-		break;
-	case 6:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 2, 0);
-		break;
-	case 7:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 2, 1);
-		break;
-	case 8:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 4, 0);
-		break;
-	case 9:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 4, 1);
-		break;
-	case 10:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 4, 2);
-		break;
-	case 12:
-		__constant_copy_from_user_asm(res, to, from, tmp, 4, 4, 4);
-		break;
-	default:
-		/* we limit the inlined version to 3 moves */
-		return __generic_copy_from_user(to, from, n);
-	}
-
-	return res;
-}
-
-#define __constant_copy_to_user_asm(res, to, from, tmp, n, s1, s2, s3)	\
-	asm volatile ("\n"						\
-		"	move."#s1"	(%2)+,%3\n"			\
-		"11:	"MOVES"."#s1"	%3,(%1)+\n"			\
-		"12:	move."#s2"	(%2)+,%3\n"			\
-		"21:	"MOVES"."#s2"	%3,(%1)+\n"			\
-		"22:\n"							\
-		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"	move."#s3"	(%2)+,%3\n"			\
-		"31:	"MOVES"."#s3"	%3,(%1)+\n"			\
-		"32:\n"							\
-		"	.endif\n"					\
-		"4:\n"							\
-		"\n"							\
-		"	.section __ex_table,\"a\"\n"			\
-		"	.align	4\n"					\
-		"	.long	11b,5f\n"				\
-		"	.long	12b,5f\n"				\
-		"	.long	21b,5f\n"				\
-		"	.long	22b,5f\n"				\
-		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"	.long	31b,5f\n"				\
-		"	.long	32b,5f\n"				\
-		"	.endif\n"					\
-		"	.previous\n"					\
-		"\n"							\
-		"	.section .fixup,\"ax\"\n"			\
-		"	.even\n"					\
-		"5:	moveq.l	#"#n",%0\n"				\
-		"	jra	4b\n"					\
-		"	.previous\n"					\
-		: "+d" (res), "+a" (to), "+a" (from), "=&d" (tmp)	\
-		: : "memory")
-
-static __always_inline unsigned long
-__constant_copy_to_user(void __user *to, const void *from, unsigned long n)
-{
-	unsigned long res = 0, tmp;
-
-	switch (n) {
-	case 1:
-		__put_user_asm(res, *(u8 *)from, (u8 __user *)to, b, d, 1);
-		break;
-	case 2:
-		__put_user_asm(res, *(u16 *)from, (u16 __user *)to, w, r, 2);
-		break;
-	case 3:
-		__constant_copy_to_user_asm(res, to, from, tmp, 3, w, b,);
-		break;
-	case 4:
-		__put_user_asm(res, *(u32 *)from, (u32 __user *)to, l, r, 4);
-		break;
-	case 5:
-		__constant_copy_to_user_asm(res, to, from, tmp, 5, l, b,);
-		break;
-	case 6:
-		__constant_copy_to_user_asm(res, to, from, tmp, 6, l, w,);
-		break;
-	case 7:
-		__constant_copy_to_user_asm(res, to, from, tmp, 7, l, w, b);
-		break;
-	case 8:
-		__constant_copy_to_user_asm(res, to, from, tmp, 8, l, l,);
-		break;
-	case 9:
-		__constant_copy_to_user_asm(res, to, from, tmp, 9, l, l, b);
-		break;
-	case 10:
-		__constant_copy_to_user_asm(res, to, from, tmp, 10, l, l, w);
-		break;
-	case 12:
-		__constant_copy_to_user_asm(res, to, from, tmp, 12, l, l, l);
-		break;
-	default:
-		/* limit the inlined version to 3 moves */
-		return __generic_copy_to_user(to, from, n);
-	}
-
-	return res;
-}
-
-static inline unsigned long
-raw_copy_from_user(void *to, const void __user *from, unsigned long n)
-{
-	if (__builtin_constant_p(n))
-		return __constant_copy_from_user(to, from, n);
-	return __generic_copy_from_user(to, from, n);
-}
-
-static inline unsigned long
-raw_copy_to_user(void __user *to, const void *from, unsigned long n)
-{
-	if (__builtin_constant_p(n))
-		return __constant_copy_to_user(to, from, n);
-	return __generic_copy_to_user(to, from, n);
-}
-#define INLINE_COPY_FROM_USER
-#define INLINE_COPY_TO_USER
+unsigned long raw_copy_from_user(void *to, const void __user *from,
+		unsigned long n);
+unsigned long raw_copy_to_user(void __user *to, const void *from,
+		unsigned long n);
 
 #define user_addr_max() \
 	(uaccess_kernel() ? ~0UL : TASK_SIZE)
diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 7646e461aa62..56022d06b780 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -7,8 +7,8 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 
-unsigned long __generic_copy_from_user(void *to, const void __user *from,
-				       unsigned long n)
+unsigned long raw_copy_from_user(void *to, const void __user *from,
+				 unsigned long n)
 {
 	unsigned long tmp, res;
 
@@ -51,10 +51,10 @@ unsigned long __generic_copy_from_user(void *to, const void __user *from,
 
 	return res;
 }
-EXPORT_SYMBOL(__generic_copy_from_user);
+EXPORT_SYMBOL(raw_copy_from_user);
 
-unsigned long __generic_copy_to_user(void __user *to, const void *from,
-				     unsigned long n)
+unsigned long raw_copy_to_user(void __user *to, const void *from,
+			       unsigned long n)
 {
 	unsigned long tmp, res;
 
@@ -95,7 +95,7 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 
 	return res;
 }
-EXPORT_SYMBOL(__generic_copy_to_user);
+EXPORT_SYMBOL(raw_copy_to_user);
 
 /*
  * Zero Userspace
-- 
2.30.2

