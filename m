Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F47DC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6065B60F23
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 07:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhIPHIf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 03:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhIPHIf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 03:08:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399F7C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Sep 2021 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=/UgzN+L73AB2sea5Kwt+0xVnpKXHQma1a3HBTAL9MmY=; b=PKeUkvEt7yXyDRqAvZezSZECmK
        u7RsYzO5z7qaCyMQJ1Axc9CZFI0vCwNLd6ORAUaho2VFUnlghzjc6NnYeWYwZnVErfDp8ifQh2Bz0
        fLOxp9sLdnhohwx2INGR6NPFVCDvnAw/VxZVxzAKKSsplhSGDo4sfuaZb1suZ2+e3Xji4+UfOUzIH
        JqNGe34yoFrNhzEJGGExZ5/pzVYZsPxPj0r7+pmDJbll+dUdG1T8i+kLFxjDoEnYE3yQGcuzV88qu
        0Sbte+bFUy9444frcET6CQhkBhgQliMVswNY7bOwy6KoaTxp+KjW5iEdA0QANAOx5dofUFNvYB+Hy
        e8dMC+IQ==;
Received: from [2001:4bb8:184:72db:6d44:b004:a9fa:2cf3] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mQlTq-00GP6e-LX; Thu, 16 Sep 2021 07:06:53 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 4/6] m68k: factor the 8-byte lowlevel {get,put}_user code into helpers
Date:   Thu, 16 Sep 2021 09:04:03 +0200
Message-Id: <20210916070405.52750-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916070405.52750-1-hch@lst.de>
References: <20210916070405.52750-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add new helpers for doing the grunt work of the 8-byte {get,put}_user
routines to allow for better reuse.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 111 +++++++++++++++++---------------
 1 file changed, 60 insertions(+), 51 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 01334a9658c40..288ef7d11a7a3 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -57,6 +57,31 @@ asm volatile ("\n"					\
 	: "+d" (res), "=m" (*(ptr))			\
 	: #reg (x), "i" (err))
 
+#define __put_user_asm8(res, x, ptr)				\
+do {								\
+	const void *__pu_ptr = (const void __force *)(ptr);	\
+								\
+	asm volatile ("\n"					\
+		"1:	"MOVES".l %2,(%1)+\n"			\
+		"2:	"MOVES".l %R2,(%1)\n"			\
+		"3:\n"						\
+		"	.section .fixup,\"ax\"\n"		\
+		"	.even\n"				\
+		"10:	movel %3,%0\n"				\
+		"	jra 3b\n"				\
+		"	.previous\n"				\
+		"\n"						\
+		"	.section __ex_table,\"a\"\n"		\
+		"	.align 4\n"				\
+		"	.long 1b,10b\n"				\
+		"	.long 2b,10b\n"				\
+		"	.long 3b,10b\n"				\
+		"	.previous"				\
+		: "+d" (res), "+a" (__pu_ptr)			\
+		: "r" (x), "i" (-EFAULT)			\
+		: "memory");					\
+} while (0)
+
 /*
  * These are the main single-value transfer routines.  They automatically
  * use the right size if we just have the right pointer type.
@@ -78,29 +103,8 @@ asm volatile ("\n"					\
 		__put_user_asm(__pu_err, __pu_val, ptr, l, r, -EFAULT);	\
 		break;							\
 	case 8:								\
- 	    {								\
- 		const void __user *__pu_ptr = (ptr);			\
-		asm volatile ("\n"					\
-			"1:	"MOVES".l	%2,(%1)+\n"		\
-			"2:	"MOVES".l	%R2,(%1)\n"		\
-			"3:\n"						\
-			"	.section .fixup,\"ax\"\n"		\
-			"	.even\n"				\
-			"10:	movel %3,%0\n"				\
-			"	jra 3b\n"				\
-			"	.previous\n"				\
-			"\n"						\
-			"	.section __ex_table,\"a\"\n"		\
-			"	.align 4\n"				\
-			"	.long 1b,10b\n"				\
-			"	.long 2b,10b\n"				\
-			"	.long 3b,10b\n"				\
-			"	.previous"				\
-			: "+d" (__pu_err), "+a" (__pu_ptr)		\
-			: "r" (__pu_val), "i" (-EFAULT)			\
-			: "memory");					\
+		__put_user_asm8(__pu_err, __pu_val, ptr);		\
 		break;							\
-	    }								\
 	default:							\
 		BUILD_BUG();						\
 	}								\
@@ -130,6 +134,38 @@ asm volatile ("\n"					\
 	(x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;	\
 })
 
+#define __get_user_asm8(res, x, ptr)					\
+do {									\
+	const void *__gu_ptr = (const void __force *)(ptr);		\
+	union {								\
+		u64 l;							\
+		__typeof__(*(ptr)) t;					\
+	} __gu_val;							\
+									\
+	asm volatile ("\n"						\
+		"1:	"MOVES".l	(%2)+,%1\n"			\
+		"2:	"MOVES".l	(%2),%R1\n"			\
+		"3:\n"							\
+		"	.section .fixup,\"ax\"\n"			\
+		"	.even\n"					\
+		"10:	move.l	%3,%0\n"				\
+		"	sub.l	%1,%1\n"				\
+		"	sub.l	%R1,%R1\n"				\
+		"	jra	3b\n"					\
+		"	.previous\n"					\
+		"\n"							\
+		"	.section __ex_table,\"a\"\n"			\
+		"	.align	4\n"					\
+		"	.long	1b,10b\n"				\
+		"	.long	2b,10b\n"				\
+		"	.previous"					\
+		: "+d" (res), "=&r" (__gu_val.l),			\
+		  "+a" (__gu_ptr)					\
+		: "i" (-EFAULT)						\
+		: "memory");						\
+	(x) = __gu_val.t;						\
+} while (0)
+
 #define __get_user(x, ptr)						\
 ({									\
 	int __gu_err = 0;						\
@@ -144,36 +180,9 @@ asm volatile ("\n"					\
 	case 4:								\
 		__get_user_asm(__gu_err, x, ptr, u32, l, r, -EFAULT);	\
 		break;							\
-	case 8: {							\
-		const void __user *__gu_ptr = (ptr);			\
-		union {							\
-			u64 l;						\
-			__typeof__(*(ptr)) t;				\
-		} __gu_val;						\
-		asm volatile ("\n"					\
-			"1:	"MOVES".l	(%2)+,%1\n"		\
-			"2:	"MOVES".l	(%2),%R1\n"		\
-			"3:\n"						\
-			"	.section .fixup,\"ax\"\n"		\
-			"	.even\n"				\
-			"10:	move.l	%3,%0\n"			\
-			"	sub.l	%1,%1\n"			\
-			"	sub.l	%R1,%R1\n"			\
-			"	jra	3b\n"				\
-			"	.previous\n"				\
-			"\n"						\
-			"	.section __ex_table,\"a\"\n"		\
-			"	.align	4\n"				\
-			"	.long	1b,10b\n"			\
-			"	.long	2b,10b\n"			\
-			"	.previous"				\
-			: "+d" (__gu_err), "=&r" (__gu_val.l),		\
-			  "+a" (__gu_ptr)				\
-			: "i" (-EFAULT)					\
-			: "memory");					\
-		(x) = __gu_val.t;					\
+	case 8:								\
+		__get_user_asm8(__gu_err, x, ptr);			\
 		break;							\
-	}								\
 	default:							\
 		BUILD_BUG();						\
 	}								\
-- 
2.30.2

