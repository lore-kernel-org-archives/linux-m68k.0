Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D17EDEC4D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241033AbjIMNpN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbjIMNpM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF06C19B1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6C742B82413;
        Wed, 13 Sep 2023 13:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DDCC433CA;
        Wed, 13 Sep 2023 13:45:04 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/7] m68knommu: coldfire: make mcf_maskimr() static
Date:   Wed, 13 Sep 2023 23:44:21 +1000
Message-Id: <20230913134425.2610927-4-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

      CC      arch/m68k/coldfire/intc.o
    arch/m68k/coldfire/intc.c:83:6: warning: no previous prototype for ‘mcf_maskimr’ [-Wmissing-prototypes]
     void mcf_maskimr(unsigned int mask)
          ^~~~~~~~~~~

The mcf_maskimr() function is only used within this file, make it static
to reduce name space pollution and fix warning.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/intc.c b/arch/m68k/coldfire/intc.c
index 20c084e932c8..b434371e2b99 100644
--- a/arch/m68k/coldfire/intc.c
+++ b/arch/m68k/coldfire/intc.c
@@ -56,7 +56,7 @@ void mcf_clrimr(int index)
 	__raw_writew(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
-void mcf_maskimr(unsigned int mask)
+static void mcf_maskimr(unsigned int mask)
 {
 	u16 imr;
 	imr = __raw_readw(MCFSIM_IMR);
@@ -80,7 +80,7 @@ void mcf_clrimr(int index)
 	__raw_writel(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
-void mcf_maskimr(unsigned int mask)
+static void mcf_maskimr(unsigned int mask)
 {
 	u32 imr;
 	imr = __raw_readl(MCFSIM_IMR);
-- 
2.25.1

