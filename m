Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D33C64EBC
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F2AA2237B
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKTEvz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 19 Nov 2020 23:51:55 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52724 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgKTEvh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 19 Nov 2020 23:51:37 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id BB33E2A45A; Thu, 19 Nov 2020 23:51:36 -0500 (EST)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Joshua Thompson" <funaho@jurai.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <c6b1d9620af3e8f89dd0157a41fa4147294b251d.1605847196.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Remove redundant VIA register writes
Date:   Fri, 20 Nov 2020 15:39:56 +1100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There's no need to write the same value to the timer latch and timer
counter registers. Values written to the counter registers get stored
in the latches anyway. The write to vT1CH copies the latch values to
the counter.

Cc: Joshua Thompson <funaho@jurai.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/via.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 4226ae2e7501..36ff997d4706 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -170,8 +170,6 @@ void __init via_init(void)
 
 	via1[vIER] = 0x7F;
 	via1[vIFR] = 0x7F;
-	via1[vT1LL] = 0;
-	via1[vT1LH] = 0;
 	via1[vT1CL] = 0;
 	via1[vT1CH] = 0;
 	via1[vT2CL] = 0;
@@ -226,8 +224,6 @@ void __init via_init(void)
 	via2[gIER] = 0x7F;
 	via2[gIFR] = 0x7F | rbv_clear;
 	if (!rbv_present) {
-		via2[vT1LL] = 0;
-		via2[vT1LH] = 0;
 		via2[vT1CL] = 0;
 		via2[vT1CH] = 0;
 		via2[vT2CL] = 0;
@@ -605,8 +601,6 @@ void __init via_init_clock(irq_handler_t timer_routine)
 		return;
 	}
 
-	via1[vT1LL] = VIA_TC_LOW;
-	via1[vT1LH] = VIA_TC_HIGH;
 	via1[vT1CL] = VIA_TC_LOW;
 	via1[vT1CH] = VIA_TC_HIGH;
 	via1[vACR] |= 0x40;
-- 
2.26.2

