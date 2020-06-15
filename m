Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593B4C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35D9C206E2
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgFOGf5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgFOGf4 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 02:35:56 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C92B2067B;
        Mon, 15 Jun 2020 06:35:54 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/5] m68knommu: fix overwriting of bits in ColdFire V3 cache control
Date:   Mon, 15 Jun 2020 16:35:08 +1000
Message-Id: <20200615063508.2435061-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The Cache Control Register (CACR) of the ColdFire V3 has bits that
control high level caching functions, and also enable/disable the use
of the alternate stack pointer register (the EUSP bit) to provide
separate supervisor and user stack pointer registers. The code as
it is today will blindly clear the EUSP bit on cache actions like
invalidation. So it is broken for this case - and that will result
in failed booting (interrupt entry and exit processing will be
completely hosed).

This only affects ColdFire V3 parts that support the alternate stack
register (like the 5329 for example) - generally speaking new parts do,
older parts don't. It has no impact on ColdFire V3 parts with the single
stack pointer, like the 5307 for example.

Fix the cache bit defines used, so they maintain the EUSP bit when
carrying out cache actions through the CACR register.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/m53xxacr.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
index 9138a624c5c8..25b144495234 100644
--- a/arch/m68k/include/asm/m53xxacr.h
+++ b/arch/m68k/include/asm/m53xxacr.h
@@ -89,9 +89,9 @@
  * coherency though in all cases. And for copyback caches we will need
  * to push cached data as well.
  */
-#define CACHE_INIT	  CACR_CINVA
-#define CACHE_INVALIDATE  CACR_CINVA
-#define CACHE_INVALIDATED CACR_CINVA
+#define CACHE_INIT        (CACHE_MODE + CACR_CINVA)
+#define CACHE_INVALIDATE  (CACHE_MODE + CACR_CINVA)
+#define CACHE_INVALIDATED (CACHE_MODE + CACR_CINVA)
 
 #define ACR0_MODE	((CONFIG_RAMBASE & 0xff000000) + \
 			 (0x000f0000) + \
-- 
2.25.1

