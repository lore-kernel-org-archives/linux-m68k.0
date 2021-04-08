Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03ABC43460
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Apr 2021 21:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B788F61055
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Apr 2021 21:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhDHVcH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Apr 2021 17:32:07 -0400
Received: from mail.kernel-space.org ([195.201.34.187]:50570 "EHLO
        mail.kernel-space.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhDHVcH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Apr 2021 17:32:07 -0400
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Apr 2021 17:32:06 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
        s=20190913; t=1617917112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jd49EOlC09NNgxjqIIYfvOBpCJMADZkT1eDuPhYqZBs=;
        b=i7K2N0vjoCAGWPY4Y50VXJxD9UhK2fpKsv76lVVEEbd3YRgGmcF6gZUqn/zgIfIvKWeDU7
        CQSm8jEmmS3Ci41Fg01uWq7Mows6GITHzEPuYL+YUtrLvIMYdplRjJl0dZWqjB0nTAvxcq
        pRFSp33V/CsLdfCSEVjy602f/Lo6CxU=
Received: from dfj.1.1.1.1 (host-79-16-10-129.retail.telecomitalia.it [79.16.10.129])
        by sysam.it (OpenSMTPD) with ESMTPSA id 9f1637f7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 8 Apr 2021 21:25:12 +0000 (UTC)
From:   Angelo Dureghello <angelo@kernel-space.org>
To:     gerg@linux-m68k.org
Cc:     geert@linux-m68k.or, linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH] m68k: coldfire: fix irq ranges
Date:   Thu,  8 Apr 2021 23:24:44 +0200
Message-Id: <20210408212444.3227652-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Working on flexcan0, there was no way to have irq 128 working.
Fix irq 128 and 196 setup.

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 arch/m68k/coldfire/intc-simr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index 15c4b7a6e38f..cd4b4adb105a 100644
--- a/arch/m68k/coldfire/intc-simr.c
+++ b/arch/m68k/coldfire/intc-simr.c
@@ -68,9 +68,9 @@ static void intc_irq_mask(struct irq_data *d)
 {
 	unsigned int irq = d->irq - MCFINT_VECBASE;
 
-	if (MCFINTC2_SIMR && (irq > 128))
+	if (MCFINTC2_SIMR && (irq > 127))
 		__raw_writeb(irq - 128, MCFINTC2_SIMR);
-	else if (MCFINTC1_SIMR && (irq > 64))
+	else if (MCFINTC1_SIMR && (irq > 63))
 		__raw_writeb(irq - 64, MCFINTC1_SIMR);
 	else
 		__raw_writeb(irq, MCFINTC0_SIMR);
@@ -80,9 +80,9 @@ static void intc_irq_unmask(struct irq_data *d)
 {
 	unsigned int irq = d->irq - MCFINT_VECBASE;
 
-	if (MCFINTC2_CIMR && (irq > 128))
+	if (MCFINTC2_CIMR && (irq > 127))
 		__raw_writeb(irq - 128, MCFINTC2_CIMR);
-	else if (MCFINTC1_CIMR && (irq > 64))
+	else if (MCFINTC1_CIMR && (irq >= 63))
 		__raw_writeb(irq - 64, MCFINTC1_CIMR);
 	else
 		__raw_writeb(irq, MCFINTC0_CIMR);
@@ -115,9 +115,9 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 	}
 
 	irq -= MCFINT_VECBASE;
-	if (MCFINTC2_ICR0 && (irq > 128))
+	if (MCFINTC2_ICR0 && (irq > 127))
 		__raw_writeb(5, MCFINTC2_ICR0 + irq - 128);
-	else if (MCFINTC1_ICR0 && (irq > 64))
+	else if (MCFINTC1_ICR0 && (irq > 63))
 		__raw_writeb(5, MCFINTC1_ICR0 + irq - 64);
 	else
 		__raw_writeb(5, MCFINTC0_ICR0 + irq);
-- 
2.31.0

