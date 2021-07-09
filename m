Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2C6C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E46A613D3
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 07:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhGIHEy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 03:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhGIHEy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 03:04:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25319C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=wYz0esprEohsJrE8khiE4CKoVDks/UHmfH0LJawQJTk=; b=Y+RIdQfD4ZKQuFVHE61KqXWGrd
        8PPuXnvv+ZJIP6ahOMGbVlSbKnf1jOjIYzpav5vWXQQV9I/u3CL7EJ6R4D+zVu+4jgAJzJUyuiHKx
        LSZ3gw76gIX7sGAKzFiHDv0mtB4ahMwRD0pqH3NybgieTqM67dSUcOp2JKYYZYdAz5L+39rrFljMF
        4yHMJs6I+s2J0ZadJxtV7wgs2xUPu8PeTMyYB3n7xMD/DuC5GtsSF4yYnLjKRTb9gdgQlJG6ZWuEJ
        SuxgzYlR8HSRdTGex6RFwUmFZowfPL6OS57vubNDsmuRpgLpXI5HvApKdlivOvdsb/lSUf0WtCiGS
        +auYMyiQ==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m1kWT-00EFNu-MY; Fri, 09 Jul 2021 07:02:06 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 4/7] m68k: remove the err argument to the get_user/put_user assembly helpers
Date:   Fri,  9 Jul 2021 09:01:29 +0200
Message-Id: <20210709070132.3387689-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709070132.3387689-1-hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

These are always hardwired to -EFAULT now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/include/asm/uaccess.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 96aae4d4656b..fa466bf6c4ca 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -39,7 +39,7 @@ static inline int access_ok(const void __user *addr,
 #define	MOVES	"move"
 #endif
 
-#define __put_user_asm(res, x, ptr, bwl, reg, err)	\
+#define __put_user_asm(res, x, ptr, bwl, reg)		\
 asm volatile ("\n"					\
 	"1:	"MOVES"."#bwl"	%2,%1\n"		\
 	"2:\n"						\
@@ -55,7 +55,7 @@ asm volatile ("\n"					\
 	"	.long	2b,10b\n"			\
 	"	.previous"				\
 	: "+d" (res), "=m" (*(ptr))			\
-	: #reg (x), "i" (err))
+	: #reg (x), "i" (-EFAULT))
 
 /*
  * These are the main single-value transfer routines.  They automatically
@@ -69,13 +69,13 @@ asm volatile ("\n"					\
 	__chk_user_ptr(ptr);						\
 	switch (sizeof (*(ptr))) {					\
 	case 1:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, b, d, -EFAULT);	\
+		__put_user_asm(__pu_err, __pu_val, ptr, b, d);		\
 		break;							\
 	case 2:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, w, r, -EFAULT);	\
+		__put_user_asm(__pu_err, __pu_val, ptr, w, r);		\
 		break;							\
 	case 4:								\
-		__put_user_asm(__pu_err, __pu_val, ptr, l, r, -EFAULT);	\
+		__put_user_asm(__pu_err, __pu_val, ptr, l, r);		\
 		break;							\
 	case 8:								\
  	    {								\
@@ -109,7 +109,7 @@ asm volatile ("\n"					\
 #define put_user(x, ptr)	__put_user(x, ptr)
 
 
-#define __get_user_asm(res, x, ptr, type, bwl, reg, err) ({		\
+#define __get_user_asm(res, x, ptr, type, bwl, reg) ({			\
 	type __gu_val;							\
 	asm volatile ("\n"						\
 		"1:	"MOVES"."#bwl"	%2,%1\n"			\
@@ -126,7 +126,7 @@ asm volatile ("\n"					\
 		"	.long	1b,10b\n"				\
 		"	.previous"					\
 		: "+d" (res), "=&" #reg (__gu_val)			\
-		: "m" (*(ptr)), "i" (err));				\
+		: "m" (*(ptr)), "i" (-EFAULT));				\
 	(x) = (__force typeof(*(ptr)))(__force unsigned long)__gu_val;	\
 })
 
@@ -136,13 +136,13 @@ asm volatile ("\n"					\
 	__chk_user_ptr(ptr);						\
 	switch (sizeof(*(ptr))) {					\
 	case 1:								\
-		__get_user_asm(__gu_err, x, ptr, u8, b, d, -EFAULT);	\
+		__get_user_asm(__gu_err, x, ptr, u8, b, d);		\
 		break;							\
 	case 2:								\
-		__get_user_asm(__gu_err, x, ptr, u16, w, r, -EFAULT);	\
+		__get_user_asm(__gu_err, x, ptr, u16, w, r);		\
 		break;							\
 	case 4:								\
-		__get_user_asm(__gu_err, x, ptr, u32, l, r, -EFAULT);	\
+		__get_user_asm(__gu_err, x, ptr, u32, l, r);		\
 		break;							\
 	case 8: {							\
 		const void __user *__gu_ptr = (ptr);			\
-- 
2.30.2

