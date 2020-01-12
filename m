Return-Path: <SRS0=AmHP=3B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E31C33CA2
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Jan 2020 16:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B592214AF
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Jan 2020 16:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbgALQd6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Jan 2020 11:33:58 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:39864 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729253AbgALQd6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Jan 2020 11:33:58 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id pUZv2101L5USYZQ06UZvt3; Sun, 12 Jan 2020 17:33:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgBX-0007mj-RG; Sun, 12 Jan 2020 17:33:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iqgBX-0004pH-P7; Sun, 12 Jan 2020 17:33:55 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     "David S . Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-m68k@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] net: amd: a2065: Use print_hex_dump_debug() helper
Date:   Sun, 12 Jan 2020 17:33:54 +0100
Message-Id: <20200112163354.18505-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use the print_hex_dump_debug() helper, instead of open-coding the same
operations.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/amd/a2065.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/amd/a2065.c b/drivers/net/ethernet/amd/a2065.c
index 1b025a33b4642f8b..d4823f2969f45b04 100644
--- a/drivers/net/ethernet/amd/a2065.c
+++ b/drivers/net/ethernet/amd/a2065.c
@@ -547,11 +547,10 @@ static netdev_tx_t lance_start_xmit(struct sk_buff *skb,
 	if (!lance_tx_buffs_avail(lp))
 		goto out_free;
 
-#ifdef DEBUG
 	/* dump the packet */
-	print_hex_dump(KERN_DEBUG, "skb->data: ", DUMP_PREFIX_NONE,
-		       16, 1, skb->data, 64, true);
-#endif
+	print_hex_dump_debug("skb->data: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
+			     64, true);
+
 	entry = lp->tx_new & lp->tx_ring_mod_mask;
 	ib->btx_ring[entry].length = (-skblen) | 0xf000;
 	ib->btx_ring[entry].misc = 0;
-- 
2.17.1

