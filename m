Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724F6C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49924206E2
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgFOHQo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 03:16:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgFOHQo (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 03:16:44 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3CDE206D7;
        Mon, 15 Jun 2020 07:16:41 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] m68knommu: fix use of cpu_to_le() on IO access
Date:   Mon, 15 Jun 2020 17:16:36 +1000
Message-Id: <20200615071636.2598894-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Due to the different data endian requirements of different buses on
m68knommu variants we sometimes need to byte swap results for readX()
or values to writeX(). Currently the code uses cpu_to_le to do this,
resulting in sparse warnings like:

arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32

Some casting to force __le32 types would resolve but it looks to be
simpler to just switch to using the underlying swab32() to resolve.

Similarly handle the 16bit cases in these functions as well.

Reported-by: kernel test robot <lkp@intel.com>
CC: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/io_no.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 1bc739f1f1ad..2c96e8480173 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -67,7 +67,7 @@ static inline u16 readw(const volatile void __iomem *addr)
 {
 	if (cf_internalio(addr))
 		return __raw_readw(addr);
-	return __le16_to_cpu(__raw_readw(addr));
+	return swab16(__raw_readw(addr));
 }
 
 #define readl readl
@@ -75,7 +75,7 @@ static inline u32 readl(const volatile void __iomem *addr)
 {
 	if (cf_internalio(addr))
 		return __raw_readl(addr);
-	return __le32_to_cpu(__raw_readl(addr));
+	return swab32(__raw_readl(addr));
 }
 
 #define writew writew
@@ -84,7 +84,7 @@ static inline void writew(u16 value, volatile void __iomem *addr)
 	if (cf_internalio(addr))
 		__raw_writew(value, addr);
 	else
-		__raw_writew(__cpu_to_le16(value), addr);
+		__raw_writew(swab16(value), addr);
 }
 
 #define writel writel
@@ -93,7 +93,7 @@ static inline void writel(u32 value, volatile void __iomem *addr)
 	if (cf_internalio(addr))
 		__raw_writel(value, addr);
 	else
-		__raw_writel(__cpu_to_le32(value), addr);
+		__raw_writel(swab32(value), addr);
 }
 
 #else
-- 
2.25.1

