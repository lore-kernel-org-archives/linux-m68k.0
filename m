Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24692C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 02:09:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD4B2207AB
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 02:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgL1CI7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 27 Dec 2020 21:08:59 -0500
Received: from m15113.mail.126.com ([220.181.15.113]:39481 "EHLO
        m15113.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgL1CI7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 27 Dec 2020 21:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=BXrHzeLTan3It0wc8w
        SiY/+u4jNmCcHGkkhyTwC6xps=; b=a+UveFrfJ6Jy5Z4At8bK+ZbHwQWlzbUmtG
        7sRwzuYySc7pz/xslHsnKVIu6SbF4eU3fr/0TwLt2F5VPkLgkDfCD9TVQtEsk5jH
        +Kwg8uwuoKOMD6KMEJCPlYvMIa2ZCvGsicmTCzJq6C2otDxuzvhWTaQNFzGUDJqs
        aiQ5P9Fuc=
Received: from localhost.localdomain (unknown [36.112.86.14])
        by smtp3 (Coremail) with SMTP id DcmowABHSOT4PelfhzASNQ--.3440S2;
        Mon, 28 Dec 2020 10:07:53 +0800 (CST)
From:   Defang Bo <bodefang@126.com>
To:     gerg@linux-m68k.org, geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Defang Bo <bodefang@126.com>
Subject: [PATCH] m68k: let clk_enable() return immediately if clk is NULL
Date:   Mon, 28 Dec 2020 10:07:45 +0800
Message-Id: <1609121265-207018-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcmowABHSOT4PelfhzASNQ--.3440S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDAryxGry3Cw1xuFWkXrb_yoWxKwc_Ka
        1fC3yvkF1fXrn7Za1DAFsxAF93C395Zr4fWanIvr45tryvqay5JrWIqw18uF12gF42yFWr
        Zwn5Zry3Cr40qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUahF3UUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbitRoJ11pECvvmtQAAsN
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Similar to commit<742859adc721>("m68k: let clk_disable() return immediately if clk is NULL").
there should be a check for clk to prevent NULL pointer dereference.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 arch/m68k/coldfire/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index 7bc666e..6decd11 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -90,6 +90,9 @@ EXPORT_SYMBOL(clk_get);
 int clk_enable(struct clk *clk)
 {
 	unsigned long flags;
+	if (!clk)
+		return -EINVAL;
+
 	spin_lock_irqsave(&clk_lock, flags);
 	if ((clk->enabled++ == 0) && clk->clk_ops)
 		clk->clk_ops->enable(clk);
-- 
2.7.4

