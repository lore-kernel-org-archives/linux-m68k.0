Return-Path: <SRS0=iw/Y=C6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC2CC43465
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 03:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 537502078E
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 03:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIUDJQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Sep 2020 23:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgIUDJP (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 20 Sep 2020 23:09:15 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DBB420723;
        Mon, 21 Sep 2020 03:09:14 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     angelo.dureghello@timesys.com, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: include SDHC support only when hardware has it
Date:   Mon, 21 Sep 2020 13:08:58 +1000
Message-Id: <20200921030858.3899744-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The mere fact that the kernel has the MMC subsystem enabled (CONFIG_MMC
enabled) does not mean that the underlying hardware platform has the
SDHC hardware present. Within the ColdFire hardware defines that is
signified by MCFSDHC_BASE being defined with an address.

The platform data for the ColdFire parts is including the SDHC hardware
if CONFIG_MMC is enabled, instead of MCFSDHC_BASE. This means that if
you are compiling for a ColdFire target that does not support SDHC but
enable CONFIG_MMC you will fail to compile with errors like this:

    arch/m68k/coldfire/device.c:565:12: error: ‘MCFSDHC_BASE’ undeclared here (not in a function)
       .start = MCFSDHC_BASE,
            ^
    arch/m68k/coldfire/device.c:566:25: error: ‘MCFSDHC_SIZE’ undeclared here (not in a function)
       .end = MCFSDHC_BASE + MCFSDHC_SIZE - 1,
                         ^
    arch/m68k/coldfire/device.c:569:12: error: ‘MCF_IRQ_SDHC’ undeclared here (not in a function)
       .start = MCF_IRQ_SDHC,
            ^

Make the SDHC platform support depend on MCFSDHC_BASE, that is only
include it if the specific ColdFire SoC has that hardware module.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 9ef4ec0aea00..59f7dfe50a4d 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -554,7 +554,7 @@ static struct platform_device mcf_edma = {
 };
 #endif /* IS_ENABLED(CONFIG_MCF_EDMA) */
 
-#if IS_ENABLED(CONFIG_MMC)
+#ifdef MCFSDHC_BASE
 static struct mcf_esdhc_platform_data mcf_esdhc_data = {
 	.max_bus_width = 4,
 	.cd_type = ESDHC_CD_NONE,
@@ -579,7 +579,7 @@ static struct platform_device mcf_esdhc = {
 	.resource		= mcf_esdhc_resources,
 	.dev.platform_data	= &mcf_esdhc_data,
 };
-#endif /* IS_ENABLED(CONFIG_MMC) */
+#endif /* MCFSDHC_BASE */
 
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
@@ -613,7 +613,7 @@ static struct platform_device *mcf_devices[] __initdata = {
 #if IS_ENABLED(CONFIG_MCF_EDMA)
 	&mcf_edma,
 #endif
-#if IS_ENABLED(CONFIG_MMC)
+#ifdef MCFSDHC_BASE
 	&mcf_esdhc,
 #endif
 };
-- 
2.25.1

