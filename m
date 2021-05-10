Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E5BC433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 03:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF4CA60249
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 03:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhEJDSG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 9 May 2021 23:18:06 -0400
Received: from mail-m176216.qiye.163.com ([59.111.176.216]:29544 "EHLO
        mail-m176216.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhEJDSF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 9 May 2021 23:18:05 -0400
X-Greylist: delayed 492 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 May 2021 23:18:05 EDT
Received: from Wanjb.localdomain (unknown [36.152.145.182])
        by mail-m176216.qiye.163.com (Hmail) with ESMTPA id 4B16AC2012F;
        Mon, 10 May 2021 11:08:48 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Pekka Enberg <penberg@kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
Subject: [PATCH] m68k: dma: remove unnecessary include of asm/cacheflush.h
Date:   Mon, 10 May 2021 11:08:35 +0800
Message-Id: <20210510030836.11834-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0pKSlZLTUtITkJPTR5ITxlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ND46Kyo4Fz8USj8QHz0oIxhP
        OBpPCi5VSlVKTUlLTUpNSklDQkpLVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTEJNNwY+
X-HM-Tid: 0a79543fa809d976kuws4b16ac2012f
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

In commit ca15ca406f660 ("mm: remove unneeded includes of
<asm/pgalloc.h>"), asm/cacheflush.h independent on the MACRO
was included at line 18. The include here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/m68k/kernel/dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 1c1b875fadc1..2e192a5df949 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -34,9 +34,6 @@ pgprot_t pgprot_dmacoherent(pgprot_t prot)
 	return prot;
 }
 #else
-
-#include <asm/cacheflush.h>
-
 void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t gfp, unsigned long attrs)
 {
-- 
2.20.1

