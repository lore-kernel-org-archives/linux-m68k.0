Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F97C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 02:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D8B3214DB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592447076;
	bh=7tbR37TlDsxb2DvWezaDQ8YEVSOAqo98BHGh0rZj/rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=M2cB+fcg5rjrlg70GNJRezpy/YijezK0SpHRX3Z1H5vBHecMk2zQmlC7IwApOQQ4s
	 h2pYZeaIXtEf+kiQCw1zFioPwwuQiTrxE8gHGg8IK9RRLABYGSWpsr3+qSSE1crI+j
	 dqPx+eEFm4y6h7ov1WxvdMiIZXcZhI6FFNu1r5OQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgFRBRn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Jun 2020 21:17:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729806AbgFRBRk (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Jun 2020 21:17:40 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C068B21D94;
        Thu, 18 Jun 2020 01:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443060;
        bh=7tbR37TlDsxb2DvWezaDQ8YEVSOAqo98BHGh0rZj/rE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wd0AsE7A8ZKtL5f4VjZ2suFMfTbs2XikzAM67/25OI4CL3vHioR9ooZ+7pggxdCCj
         t2T2c40F4LxdPD9WVt1aC8BgX50b4IjgqjZPvM082Cm6SrMLYGLB4AYoE5cQL8OjOg
         zLsTBLrrPxZOk9gX6Nx9r2QJ2bih1U+1EkeRW8k0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 5.4 051/266] m68k/PCI: Fix a memory leak in an error handling path
Date:   Wed, 17 Jun 2020 21:12:56 -0400
Message-Id: <20200618011631.604574-51-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit c3f4ec050f56eeab7c1f290321f9b762c95bd332 ]

If 'ioremap' fails, we must free 'bridge', as done in other error handling
path bellow.

Fixes: 19cc4c843f40 ("m68k/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/coldfire/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index 62b0eb6cf69a..84eab0f5e00a 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
 
 	/* Keep a virtual mapping to IO/config space active */
 	iospace = (unsigned long) ioremap(PCI_IO_PA, PCI_IO_SIZE);
-	if (iospace == 0)
+	if (iospace == 0) {
+		pci_free_host_bridge(bridge);
 		return -ENODEV;
+	}
 	pr_info("Coldfire: PCI IO/config window mapped to 0x%x\n",
 		(u32) iospace);
 
-- 
2.25.1

