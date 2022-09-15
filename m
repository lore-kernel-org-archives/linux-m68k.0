Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C1ECAAD3
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Sep 2022 01:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiIOBrz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Sep 2022 21:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiIOBrx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Sep 2022 21:47:53 -0400
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284F18E47B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Sep 2022 18:47:51 -0700 (PDT)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id JAK00145;
        Thu, 15 Sep 2022 09:47:45 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201612.home.langchao.com (10.100.2.12) with Microsoft SMTP Server id
 15.1.2507.12; Thu, 15 Sep 2022 09:47:45 +0800
From:   Deming Wang <wangdeming@inspur.com>
To:     <funaho@jurai.org>, <geert@linux-m68k.org>
CC:     <linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
        Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] m68k: fix the comments of via_rtc_send
Date:   Wed, 14 Sep 2022 21:47:37 -0400
Message-ID: <20220915014737.1620-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.82]
tUid:   2022915094745daf89ab0da9129a5b7c63f867815d8d2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

remove the double word of 'in'.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
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
2.27.0

