Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FD4C38145
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Sep 2022 12:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbiIHM6D (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiIHM57 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Sep 2022 08:57:59 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7899E100
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Sep 2022 05:57:58 -0700 (PDT)
X-QQ-mid: bizesmtp80t1662641863t9ne782c
Received: from localhost.localdomain ( [182.148.14.0])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 08 Sep 2022 20:57:42 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: nMuci6qhceMCo5eYHqaOkFRqx6jL6oyHtwzgYlJDVxudxNZw8+s96wq+Wwa9E
        rLEffB1V9SjBRs9PVZiaKnWM1nbJT2wpJ6CR2+Fh7jb2JIvvpg+b4CiE9vjD32WuSawSI7o
        rxJ0WTuzgA/zZcF6H54XFXPjgHrvWp7uMO3bwzgvgX3XZbTUq5bxC06WcrO4Bslng6IEYgA
        2EU3JWQUJpPku78GKB/T95j+Gk9laLlueXNRJ6hRi3QSSKcbkDlEM5sMZPfAwP1IOZQL3Ue
        ArkFTGqgHnTM7/3R2vaZmds6CS4cv/k2DEkCzuWoIE0OWfilw7oBPNvLpXLuPFy6p4BQ+mP
        zFnsbVsntvuaXv++r618iSHOkuFjpukEkJAOMPog7ZToBqtdZU=
X-QQ-GoodBg: 0
From:   wangjianli <wangjianli@cdjrlc.com>
To:     funaho@jurai.org, geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] m68k/mac: fix repeated words in comments
Date:   Thu,  8 Sep 2022 20:57:35 +0800
Message-Id: <20220908125735.30134-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 arch/m68k/mac/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
index 4fab34791758..29a4cb46af01 100644
--- a/arch/m68k/mac/misc.c
+++ b/arch/m68k/mac/misc.c
@@ -126,7 +126,7 @@ static void via_rtc_send(__u8 data)
 
 	reg = via1[vBufB] & ~(VIA1B_vRTCClk | VIA1B_vRTCData);
 
-	/* The bits of the byte go in in MSB order */
+	/* The bits of the byte go in MSB order */
 
 	for (i = 0 ; i < 8 ; i++) {
 		bit = data & 0x80? 1 : 0;
-- 
2.36.1

