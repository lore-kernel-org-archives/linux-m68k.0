Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F7FC6FD1F
	for <linux-m68k@archiver.kernel.org>; Sun, 19 Mar 2023 04:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCSEIy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 19 Mar 2023 00:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCSEIx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 19 Mar 2023 00:08:53 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E446110A88
        for <linux-m68k@lists.linux-m68k.org>; Sat, 18 Mar 2023 21:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uDRdZ
        NkYqSVHlM7n9lW3x7G96oPXX7mnjHXy7vrE5NE=; b=N4G6nNScQJ5rjlfJrJHHu
        h4h340z8SnM3oTf2ZAGqgog3V7J+Ixt4RI8BgOo//cUlYfrz0v4yQnXEYTJR2YKQ
        1rmPTf3JBXZnuAe5NQqn72LA6HM2XMR9pUEDTLsveoEVaYh3YXdSIXcQEVJV5bzN
        89QIU876gyOW/0hSGvd5RA=
Received: from lizhe.. (unknown [120.245.132.192])
        by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wCXyrixihZkemSoAQ--.33332S4;
        Sun, 19 Mar 2023 12:08:40 +0800 (CST)
From:   Lizhe <sensor1010@163.com>
To:     fthain@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Lizhe <sensor1010@163.com>
Subject: [PATCH v1] nubus: Remove redunant driver match function
Date:   Sun, 19 Mar 2023 12:08:16 +0800
Message-Id: <20230319040816.232446-1-sensor1010@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXyrixihZkemSoAQ--.33332S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr1kZFyxJFy7AryftF45trb_yoWDZwbE9w
        4UZr93Xr15CF1xKw4fWwsrZFyqyw4vqrZ5JFWrt393A3W7Xw15ZrWDZry7Kr15WrWFyFnF
        g347Jrs7ZFWDJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtFApDUUUUU==
X-Originating-IP: [120.245.132.192]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBlww3q2I0YaE4agAAsD
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

If there is no driver match function, the driver core assumes that each
candidate pair (driver, device)matches, see driver_match_device()

Signed-off-by: Lizhe <sensor1010@163.com>
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
2.34.1

