Return-Path: <SRS0=+VAR=CY=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57FAC433E2
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 12:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC9E82078E
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Sep 2020 12:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgIOMKX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:10:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbgIOMJt (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 15 Sep 2020 08:09:49 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E90E62074B;
        Tue, 15 Sep 2020 12:09:13 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] m68knommu: fix sparse warnings in signal code
Date:   Tue, 15 Sep 2020 22:08:59 +1000
Message-Id: <20200915120859.1326796-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Commit 858b810bf63f ("m68knommu: switch to using asm-generic/uaccess.h")
cleaned up a number of sparse warnings associated with lack of __user
annotations. It also uncovered a couple of more in the signal handling
code:

arch/m68k/kernel/signal.c:923:16:    expected char [noderef] __user *__x
arch/m68k/kernel/signal.c:923:16:    got void *
arch/m68k/kernel/signal.c:1007:16: warning: incorrect type in initializer (different address spaces)
arch/m68k/kernel/signal.c:1007:16:    expected char [noderef] __user *__x
arch/m68k/kernel/signal.c:1007:16:    got void *
arch/m68k/kernel/signal.c:1132:6: warning: symbol 'do_notify_resume' was not declared. Should it be static?

These are specific to a non-MMU configuration. Fix these inserting the
correct __user annotations as required.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/signal.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index a98fca977073..a85f59bc1c35 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -920,7 +920,8 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 	err |= __put_user(0x70004e40 + (__NR_sigreturn << 16),
 			  (long __user *)(frame->retcode));
 #else
-	err |= __put_user((void *) ret_from_user_signal, &frame->pretcode);
+	err |= __put_user((long) ret_from_user_signal,
+			  (long __user *) &frame->pretcode);
 #endif
 
 	if (err)
@@ -1004,7 +1005,8 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	err |= __put_user(0x4e40, (short __user *)(frame->retcode + 4));
 #endif
 #else
-	err |= __put_user((void *) ret_from_user_rt_signal, &frame->pretcode);
+	err |= __put_user((long) ret_from_user_rt_signal,
+			  (long __user *) &frame->pretcode);
 #endif /* CONFIG_MMU */
 
 	if (err)
-- 
2.25.1

