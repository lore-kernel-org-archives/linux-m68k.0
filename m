Return-Path: <SRS0=nM4c=CR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4B5C43461
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 17:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D1E2078B
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 17:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgIHR1U (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 13:27:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731728AbgIHQQ6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 8 Sep 2020 12:16:58 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6336023C18;
        Tue,  8 Sep 2020 13:27:15 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     hch@lst.de, geert@linux-m68k.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: add missing __user annotations
Date:   Tue,  8 Sep 2020 23:26:47 +1000
Message-Id: <20200908132647.923201-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Some of the m68knommu user access functions are not using the __user
annotation where required. Specifically __clear_user(), strnlen_user()
and strncpy_from_user() need their user space source address annoted
with __user.

Picked up by the kernel test robot, when running sparse:

  sparse warnings: (new ones prefixed by >>)

     drivers/char/mem.c:163:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user *buf @@
     drivers/char/mem.c:163:37: sparse:     expected void *to
     drivers/char/mem.c:163:37: sparse:     got char [noderef] __user *buf
  >> drivers/char/mem.c:737:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] __user * @@
     drivers/char/mem.c:737:21: sparse:     expected void *to
  >> drivers/char/mem.c:737:21: sparse:     got char [noderef] __user *

Add in __user where appropriate.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/uaccess_no.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess_no.h b/arch/m68k/include/asm/uaccess_no.h
index dcfb69361408..764b01a3bd07 100644
--- a/arch/m68k/include/asm/uaccess_no.h
+++ b/arch/m68k/include/asm/uaccess_no.h
@@ -125,7 +125,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
  */
 
 static inline long
-strncpy_from_user(char *dst, const char *src, long count)
+strncpy_from_user(char *dst, const char __user *src, long count)
 {
 	char *tmp;
 	strncpy(dst, src, count);
@@ -139,7 +139,7 @@ strncpy_from_user(char *dst, const char *src, long count)
  *
  * Return 0 on exception, a value greater than N if too long
  */
-static inline long strnlen_user(const char *src, long n)
+static inline long strnlen_user(const char __user *src, long n)
 {
 	return(strlen(src) + 1); /* DAVIDM make safer */
 }
@@ -149,7 +149,7 @@ static inline long strnlen_user(const char *src, long n)
  */
 
 static inline unsigned long
-__clear_user(void *to, unsigned long n)
+__clear_user(void __user *to, unsigned long n)
 {
 	memset(to, 0, n);
 	return 0;
-- 
2.25.1

