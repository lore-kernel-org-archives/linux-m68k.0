Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5999EC6FD19
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Mar 2023 18:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjCMSJE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCMSJD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Mar 2023 14:09:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAAF24134
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Mar 2023 11:09:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmbT-0007WO-BL; Mon, 13 Mar 2023 19:08:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmbS-003uLV-Fd; Mon, 13 Mar 2023 19:08:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmbR-004cLg-P3; Mon, 13 Mar 2023 19:08:57 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, kernel@pengutronix.de
Subject: [PATCH] nubus: Drop noop match function
Date:   Mon, 13 Mar 2023 19:08:48 +0100
Message-Id: <20230313180848.2770504-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JYaHSJElyejd5xluSwwvH0UA70pphLFlyrkKGjHbKww=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkD2asO+Fo7OgvpmjCHG0jzjGb3SELJC0PB24wR sOTi3J0oqOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA9mrAAKCRDB/BR4rcrs CV47B/47AdF6XpTDQ388Rb1b/Epvdhir1Y4vhtY4rmpp4D++pYX63NiWnLNtQv5AKLgYwL+8NVo 959lJa+wDaQ9hb9XOkBMBmIFVvSyoWQH1JMJQ5tiaGJ6LWkNvbhVCJEnomRHsyoPXEpfMqKG7sh BspqVebqmj8PBxXtbzcbSKMhwJK4FG+fN+VKhQazwHwuTHcX6RwVAu/w8gGOaxN4mNhwFVuWTJg 3NM6XQGKpx+k2i/G8iOrbOvTYj9OLGsmOi3wMhQfH6Lnus61WpMBuipTq4cc9+Bg0teazOwYVSq KcKeTfuxRipYuQb1XOxmHphzBvm6nkCtaco1Txd0U6bXrK5E
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-m68k@lists.linux-m68k.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

nubus_bus_match() returned 1 unconditionally. This is equivalent to
no match function at all. (See driver_match_device() which does:

	return drv->bus->match ? drv->bus->match(dev, drv) : 1;

.)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/nubus/bus.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
index 17fad660032c..72921e4f35f6 100644
--- a/drivers/nubus/bus.c
+++ b/drivers/nubus/bus.c
@@ -14,11 +14,6 @@
 #define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
 #define to_nubus_driver(d)      container_of(d, struct nubus_driver, driver)
 
-static int nubus_bus_match(struct device *dev, struct device_driver *driver)
-{
-	return 1;
-}
-
 static int nubus_device_probe(struct device *dev)
 {
 	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
@@ -39,7 +34,6 @@ static void nubus_device_remove(struct device *dev)
 
 struct bus_type nubus_bus_type = {
 	.name		= "nubus",
-	.match		= nubus_bus_match,
 	.probe		= nubus_device_probe,
 	.remove		= nubus_device_remove,
 };
-- 
2.39.1

