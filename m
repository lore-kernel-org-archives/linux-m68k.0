Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD5FC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:16:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B965B206E2
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 07:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgFOHQd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 03:16:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:35930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgFOHQd (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 03:16:33 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12DFD206D7;
        Mon, 15 Jun 2020 07:16:30 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/5] m68knommu: __force type casts for raw IO access
Date:   Mon, 15 Jun 2020 17:16:18 +1000
Message-Id: <20200615071618.2598843-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Bring the m68knommu raw IO functions into line with the m68k raw IO
access functions and __force casting of the address component. This
is primarily to fix sparse warnings on use of these raw macros.

Reported-by: kernel test robot <lkp@intel.com>
CC: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/io_no.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 0498192e1d98..1bc739f1f1ad 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -14,15 +14,15 @@
  * that behavior here first before we include asm-generic/io.h.
  */
 #define __raw_readb(addr) \
-    ({ unsigned char __v = (*(volatile unsigned char *) (addr)); __v; })
+    ({ u8 __v = (*(__force volatile u8 *) (addr)); __v; })
 #define __raw_readw(addr) \
-    ({ unsigned short __v = (*(volatile unsigned short *) (addr)); __v; })
+    ({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
 #define __raw_readl(addr) \
-    ({ unsigned int __v = (*(volatile unsigned int *) (addr)); __v; })
+    ({ u32 __v = (*(__force volatile u32 *) (addr)); __v; })
 
-#define __raw_writeb(b, addr) (void)((*(volatile unsigned char *) (addr)) = (b))
-#define __raw_writew(b, addr) (void)((*(volatile unsigned short *) (addr)) = (b))
-#define __raw_writel(b, addr) (void)((*(volatile unsigned int *) (addr)) = (b))
+#define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
+#define __raw_writew(b, addr) (void)((*(__force volatile u16 *) (addr)) = (b))
+#define __raw_writel(b, addr) (void)((*(__force volatile u32 *) (addr)) = (b))
 
 #if defined(CONFIG_COLDFIRE)
 /*
-- 
2.25.1

