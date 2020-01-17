Return-Path: <SRS0=t/Qt=3G=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE1DC33CB1
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Jan 2020 07:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E84920748
	for <linux-m68k@archiver.kernel.org>; Fri, 17 Jan 2020 07:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgAQHUZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 17 Jan 2020 02:20:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:42358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729121AbgAQHUZ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 17 Jan 2020 02:20:25 -0500
Received: from goober.digi.com (acc1027289.lnk.telstra.net [149.135.16.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84C962073A;
        Fri, 17 Jan 2020 07:20:23 +0000 (UTC)
From:   gerg@linux-m68k.org
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: fix memcpy() out of bounds warning in get_user()
Date:   Fri, 17 Jan 2020 17:20:05 +1000
Message-Id: <20200117072005.13923-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

Newer versions of gcc are giving warnings in the non-MMU m68k version
of the get_user() macro:

    ./arch/m68k/include/asm/string.h:72:25: warning: ‘__builtin_memcpy’ forming offset [3, 4] is out of the bounds [0, 2] of object ‘__gu_val’ with type ‘short unsigned int’ [-Warray-bounds]

The warnings are generated when smaller sized variables are used as the
result of user space pointers to larger values. For example a
short/2-byte variable stores the result of a user space int (4-byte)
pointer. The warning is in the 8-byte branch of get_user() - even
though that branch is not the taken branch in the warning cases.

Refactor the 8-byte branch of get_user() so that it uses a correctly
formed union type to read and write the source and destination objects.
Keep using the memcpy() just in case the user space pointer is not
naturaly aligned.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/uaccess_no.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess_no.h b/arch/m68k/include/asm/uaccess_no.h
index 0134008bf539..6bc80c35726d 100644
--- a/arch/m68k/include/asm/uaccess_no.h
+++ b/arch/m68k/include/asm/uaccess_no.h
@@ -71,26 +71,29 @@ extern int __put_user_bad(void);
 #define get_user(x, ptr)					\
 ({								\
     int __gu_err = 0;						\
-    typeof(x) __gu_val = 0;					\
     switch (sizeof(*(ptr))) {					\
     case 1:							\
-	__get_user_asm(__gu_err, __gu_val, ptr, b, "=d");	\
+	__get_user_asm(__gu_err, x, ptr, b, "=d");		\
 	break;							\
     case 2:							\
-	__get_user_asm(__gu_err, __gu_val, ptr, w, "=r");	\
+	__get_user_asm(__gu_err, x, ptr, w, "=r");		\
 	break;							\
     case 4:							\
-	__get_user_asm(__gu_err, __gu_val, ptr, l, "=r");	\
+	__get_user_asm(__gu_err, x, ptr, l, "=r");		\
 	break;							\
-    case 8:							\
-	memcpy((void *) &__gu_val, ptr, sizeof (*(ptr)));	\
+    case 8: {							\
+	union {							\
+	    u64 l;						\
+	    __typeof__(*(ptr)) t;				\
+	} __gu_val;						\
+	memcpy(&__gu_val.l, ptr, sizeof(__gu_val.l));		\
+	(x) = __gu_val.t;					\
 	break;							\
+    }								\
     default:							\
-	__gu_val = 0;						\
 	__gu_err = __get_user_bad();				\
 	break;							\
     }								\
-    (x) = (typeof(*(ptr))) __gu_val;				\
     __gu_err;							\
 })
 #define __get_user(x, ptr) get_user(x, ptr)
-- 
2.17.1

