Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D962C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Feb 2022 18:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346688AbiBBSgH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Feb 2022 13:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243333AbiBBSgD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Feb 2022 13:36:03 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC06C061714
        for <linux-m68k@vger.kernel.org>; Wed,  2 Feb 2022 10:36:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id m4so249675ejb.9
        for <linux-m68k@vger.kernel.org>; Wed, 02 Feb 2022 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBz2xLkibL6UG4tVpl6B5hXMq4BDHWiQssi6rRsMwGQ=;
        b=VGO4HStlC+qn/OnhZG6gcQiE8Ytz9nhkqriFP3ntPmuh/JTYDElAQAoxV1uXXUy5iJ
         QNa6EWGZqLz/mkSoJAMZsaHmCF+tcLxMdnfdKkWfEIkdGBvatbXGSbWrVjeYOGNU+Lov
         dgoaNr6sa1jz9SxoKyx5hZFSuZK7vnFoOQ6jGHbM9riYOiOXGo6ekgB4DYoKr0ui2sf7
         Xf6W8kMPRmfbBcERuKtGJ10GZFnB2x/J1roSYyq/MBR9ulk9zz98xmTeF8NISSZqRtYI
         dOJxg76q5kSnqo/7FMnusnbRfViC/pCLIYKi2m74DlH+xPW4xzq+aeMA9x/dMOo2eDeT
         rtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UBz2xLkibL6UG4tVpl6B5hXMq4BDHWiQssi6rRsMwGQ=;
        b=uSYGPLnFBxAcTEz/P62w4DSJYpDv55VPeXBJ1nMQyMaWRW+lR4QLi9CNacknCkX2V7
         x7eRnkX8o3RETwSKBevXs7VsVh14Sngk7FUG+owaeEbkKTXcrrVp4y848YMdZ/KTk6fq
         L/CtnwEOwuOvlwrL0k3w3tPAMP5iTu7OdCv3dcjvSayABfwZDkhFhjyKDMMo3qaAiCDi
         DE6OzX0RHAi9kf11fApONi8EvAYe+gnJvXKvCPA+NxHU0FE98JPwQPK7kfgRSuhqZEMr
         2h8C6cwsnpmN9dIIGrmDLb2xNafN3a9zSF6xA7bv1d1x3s9r2twDzTw9v0/xrsogjFKH
         P2Og==
X-Gm-Message-State: AOAM531l+vBRhSBKtONIoMRrGK12YABdHnqop94/EGE3JnjLg6PPjz67
        2ksJt4VMoSLuVP68OJFgrmA61MjBCVd1FhpX
X-Google-Smtp-Source: ABdhPJzwGh52v705tyOSDtF91TICY4yIt1+XtkxuspBexWfXfL/fZJmSblBf3YOLpBwvdzmy0JSV6w==
X-Received: by 2002:a17:907:82a3:: with SMTP id mr35mr26706480ejc.455.1643826962005;
        Wed, 02 Feb 2022 10:36:02 -0800 (PST)
Received: from localhost.localdomain (host-79-25-62-48.retail.telecomitalia.it. [79.25.62.48])
        by smtp.gmail.com with ESMTPSA id c1sm3158981edr.104.2022.02.02.10.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:36:01 -0800 (PST)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: m5441x: remove erroneous clock disable
Date:   Wed,  2 Feb 2022 19:35:53 +0100
Message-Id: <20220202183553.262789-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Remove erroneous esdhc clock disable.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/coldfire/device.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 2efa069562bd..acebf0c53573 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -627,11 +627,10 @@ static struct platform_device mcf_flexcan0 = {
 #include <linux/fsl_devices.h>
 
 static struct fsl_usb2_platform_data mcf_usb_host_info = {
-	.controller_ver = 1,
+	.controller_ver = FSL_USB_VER_OLD,
 	.operating_mode = FSL_USB2_DR_HOST,
-	.phy_mode = FSL_USB2_PHY_NONE,
+	.phy_mode = FSL_USB2_PHY_SERIAL,
 	.port_enables = 1,
-	.big_endian_mmio = 1,
 };
 
 static struct resource mcf_usb_host_resource[] = {
@@ -641,8 +640,8 @@ static struct resource mcf_usb_host_resource[] = {
 		.flags = IORESOURCE_MEM,
 	},
 	{
-		.start = MCFUSB_IRQ_STS0,
-		.end = MCFUSB_IRQ_STS1,
+		.start = MCFUSB_IRQ_STS_HOST,
+		.end = MCFUSB_IRQ_STS_HOST,
 		.flags = IORESOURCE_IRQ,
 	},
 };
-- 
2.34.1

