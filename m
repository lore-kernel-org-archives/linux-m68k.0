Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C28C433ED
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Apr 2021 21:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13BCC610D1
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Apr 2021 21:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhDHViY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Apr 2021 17:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbhDHViY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 8 Apr 2021 17:38:24 -0400
Received: from mail.kernel-space.org (unknown [IPv6:2a01:4f8:c2c:5a84::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1389CC061760
        for <linux-m68k@vger.kernel.org>; Thu,  8 Apr 2021 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
        s=20190913; t=1617917889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=feevielqIGhhSdMUAuuvkE2DMQbA1pKerNvkIbA5msM=;
        b=vXSVbSduAjeFf/VAaACK/EsInXvGU4NNmozijQ15CuRxnIhTYMRVysJpj2Gx033nvnJsOL
        BYi31zKEF3JQ0TX7sd/R3HjqUTxsPAanPXTC0IQigLY98Lv7CF1MF3a5VX+5pHMBt64i/S
        0TffRvXjsb+q8JaaVqe4hCkuE24Tlew=
Received: from dfj.1.1.1.1 (host-79-16-10-129.retail.telecomitalia.it [79.16.10.129])
        by sysam.it (OpenSMTPD) with ESMTPSA id 9c6e82c5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 8 Apr 2021 21:38:08 +0000 (UTC)
From:   Angelo Dureghello <angelo@kernel-space.org>
To:     gerg@linux-m68k.org
Cc:     geert@linux-m68k.org, linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH v2] m68k: coldfire: fix irq ranges
Date:   Thu,  8 Apr 2021 23:37:40 +0200
Message-Id: <20210408213740.3235446-1-angelo@kernel-space.org>
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
Change for v2:
  line 85, fix >= into >
---
 arch/m68k/coldfire/intc-simr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index 15c4b7a6e38f..f7c2c41b3156 100644
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
+	else if (MCFINTC1_CIMR && (irq > 63))
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

