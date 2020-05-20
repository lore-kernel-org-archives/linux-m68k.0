Return-Path: <SRS0=ZJog=7C=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80BAC433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 20 May 2020 04:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EA76207C4
	for <linux-m68k@archiver.kernel.org>; Wed, 20 May 2020 04:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgETElo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 May 2020 00:41:44 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:60646 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgETEln (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 May 2020 00:41:43 -0400
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id 4CC4E299D6; Wed, 20 May 2020 00:41:42 -0400 (EDT)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Joshua Thompson" <funaho@jurai.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <10dff3e7c17d363a4b239aae7b3ebab32bef3547.1589949122.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Remove misleading comment
Date:   Wed, 20 May 2020 14:32:02 +1000
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This code path was tested on a Quadra 950 a long time ago and the
comment isn't needed.

Cc: Joshua Thompson <funaho@jurai.org>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/iop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 100e5112fd9e..d99c7ea08d8c 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -299,7 +299,6 @@ void __init iop_init(void)
 
 /*
  * Register the interrupt handler for the IOPs.
- * TODO: might be wrong for non-OSS machines. Anyone?
  */
 
 void __init iop_register_interrupts(void)
-- 
2.26.2

