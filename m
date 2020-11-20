Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A83C8300C
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 039482237B
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgKTEvz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 19 Nov 2020 23:51:55 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52716 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgKTEvh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 19 Nov 2020 23:51:37 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id 215022A459; Thu, 19 Nov 2020 23:51:36 -0500 (EST)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Joshua Thompson" <funaho@jurai.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <effef6339c919a4ef2e81a47e4383f712cdd7626.1605847196.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Remove dead code
Date:   Fri, 20 Nov 2020 15:39:56 +1100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Cc: Joshua Thompson <funaho@jurai.org>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/via.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 66209cb7696f..4226ae2e7501 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -305,21 +305,6 @@ void via_l2_flush(int writeback)
 	local_irq_restore(flags);
 }
 
-/*
- * Return the status of the L2 cache on a IIci
- */
-
-int via_get_cache_disable(void)
-{
-	/* Safeguard against being called accidentally */
-	if (!via2) {
-		printk(KERN_ERR "via_get_cache_disable called on a non-VIA machine!\n");
-		return 1;
-	}
-
-	return (int) via2[gBufB] & VIA2B_vCDis;
-}
-
 /*
  * Initialize VIA2 for Nubus access
  */
-- 
2.26.2

