Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB264C433DB
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Feb 2021 13:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A27EF64ECF
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Feb 2021 13:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhBBNHp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Feb 2021 08:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhBBNHm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 2 Feb 2021 08:07:42 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF65C06174A
        for <linux-m68k@vger.kernel.org>; Tue,  2 Feb 2021 05:06:55 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id QD6s2401X4C55Sk01D6sCS; Tue, 02 Feb 2021 14:06:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l6vOO-002iQk-7a; Tue, 02 Feb 2021 14:06:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l6vON-003d2k-Mh; Tue, 02 Feb 2021 14:06:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Fugang Duan <fugang.duan@nxp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
        linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] net: fec: Silence M5272 build warnings
Date:   Tue,  2 Feb 2021 14:06:50 +0100
Message-Id: <20210202130650.865023-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

If CONFIG_M5272=y:

    drivers/net/ethernet/freescale/fec_main.c: In function ‘fec_restart’:
    drivers/net/ethernet/freescale/fec_main.c:948:6: warning: unused variable ‘val’ [-Wunused-variable]
      948 |  u32 val;
	  |      ^~~
    drivers/net/ethernet/freescale/fec_main.c: In function ‘fec_get_mac’:
    drivers/net/ethernet/freescale/fec_main.c:1667:28: warning: unused variable ‘pdata’ [-Wunused-variable]
     1667 |  struct fec_platform_data *pdata = dev_get_platdata(&fep->pdev->dev);
	  |                            ^~~~~

Fix this by moving the variable declarations inside the existing #ifdef
blocks.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/freescale/fec_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 9ebdb0e54291b204..3db882322b2bd3e8 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -945,7 +945,6 @@ static void
 fec_restart(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	u32 val;
 	u32 temp_mac[2];
 	u32 rcntl = OPT_FRAME_SIZE | 0x04;
 	u32 ecntl = 0x2; /* ETHEREN */
@@ -997,7 +996,8 @@ fec_restart(struct net_device *ndev)
 
 #if !defined(CONFIG_M5272)
 	if (fep->quirks & FEC_QUIRK_HAS_RACC) {
-		val = readl(fep->hwp + FEC_RACC);
+		u32 val = readl(fep->hwp + FEC_RACC);
+
 		/* align IP header */
 		val |= FEC_RACC_SHIFT16;
 		if (fep->csum_flags & FLAG_RX_CSUM_ENABLED)
@@ -1664,7 +1664,6 @@ static int fec_enet_rx_napi(struct napi_struct *napi, int budget)
 static void fec_get_mac(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct fec_platform_data *pdata = dev_get_platdata(&fep->pdev->dev);
 	unsigned char *iap, tmpaddr[ETH_ALEN];
 
 	/*
@@ -1695,6 +1694,8 @@ static void fec_get_mac(struct net_device *ndev)
 		if (FEC_FLASHMAC)
 			iap = (unsigned char *)FEC_FLASHMAC;
 #else
+		struct fec_platform_data *pdata = dev_get_platdata(&fep->pdev->dev);
+
 		if (pdata)
 			iap = (unsigned char *)&pdata->mac;
 #endif
-- 
2.25.1

