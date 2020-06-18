Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F35C433E2
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 01:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B4F22220A
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 01:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592445175;
	bh=Vvix1eNkW7Lav4Up7MIJ75b402kMSnFT8rO+55Bkmjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=azfFOWuXTWul4s2saRdHPhr/38QunYq2JUkajpz6C3cxN8CMJoj7wKp4igfixLgJ3
	 Qa0xUC2UwBQh+x1BNSB0ZKJqZgoE4UjmN/pRvUFATFp6dd2TkD1hFGIrM4Ltgy/8G8
	 9cFkjzQ85zcpvRpitsappl7+3eqohznNzmzYuFtY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgFRB0a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Jun 2020 21:26:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731677AbgFRB03 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Jun 2020 21:26:29 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBBA320B1F;
        Thu, 18 Jun 2020 01:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443589;
        bh=Vvix1eNkW7Lav4Up7MIJ75b402kMSnFT8rO+55Bkmjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y4jU8KeFQhyXpykJY1I6XXVzc+BDbEfT9eXLZvMCZ2SRh+NMUw9AnFHalOoN13ie3
         4ylfse0T30S1hzTSJjJAB6XROjDPPpIuwracbpyg6a/lLAmdFZRo7EQxyjWsc2e6XP
         johGEn+IuL8ZP+r9RG062hj19mVt8bNNWUs68jUc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 4.14 023/108] m68k/PCI: Fix a memory leak in an error handling path
Date:   Wed, 17 Jun 2020 21:24:35 -0400
Message-Id: <20200618012600.608744-23-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
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
index 3097fa2ca746..1e428d18d268 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -316,8 +316,10 @@ static int __init mcf_pci_init(void)
 
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

