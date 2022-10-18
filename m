Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FFFC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 00:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbiJRANV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiJRAMd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Oct 2022 20:12:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63FE7F26A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Oct 2022 17:09:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 009DA612F2;
        Tue, 18 Oct 2022 00:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF42C433C1;
        Tue, 18 Oct 2022 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051746;
        bh=Hg9mDlQ2rc67yC7jQGRkLot8/cABw+22mEhfP0W4y5o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qC/Y2y0IvosLvRcgwFV7NXZEP7nCH9rS919TIeLfpQr9BSoVq/a8og79/TDfD7Lr8
         9V7HqTzs+3VD0JpD6oRsBZPcEd3XoxScToEzKNZQO5txIfIZ8DD6CqR1Cc18KkwNwe
         bccTzDB0LX4idF1HQgoKY2mddVK4cwUPU2z5YJ3vDeBtBcfrjBKPtzlfR8Rh/0kfZ6
         oFHbfESI1o7N7s0knS2cR+sP8GqYNSskp07qeXDlY3xUKaHdHvWWUYYX/n0zalyk7f
         mnO3uvQWYJST0dEO3ZlEICeNLRFe5EgdSceiDT3OmL208VGfy5bAcc2r3sTMXyXHuZ
         lbscPT7jWVG7A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 5.19 14/29] m68knommu: fix non-mmu classic 68000 legacy timer tick selection
Date:   Mon, 17 Oct 2022 20:08:23 -0400
Message-Id: <20221018000839.2730954-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000839.2730954-1-sashal@kernel.org>
References: <20221018000839.2730954-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

[ Upstream commit 18011e50c497f04a57a8e00122906f04922b30b4 ]

The family of classic 68000 parts supported when in non-mmu mode all
currently use the legacy timer support. Move the selection of that config
option, LEGACY_TIMER_TICK, into the core CPU configuration.

This fixes compilation if no specific CPU variant is selected, since
the LEGACY_TIMER_TICK option was only selected in the specific CPU
variant configurations.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/Kconfig.cpu | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index f3aa44156969..3fdca29422e2 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -46,6 +46,7 @@ config M68000
 	select GENERIC_CSUM
 	select CPU_NO_EFFICIENT_FFS
 	select HAVE_ARCH_HASH
+	select LEGACY_TIMER_TICK
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
@@ -97,7 +98,6 @@ config M68060
 config M68328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68328 processor support.
@@ -105,7 +105,6 @@ config M68328
 config M68EZ328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68EX328 processor support.
@@ -113,7 +112,6 @@ config M68EZ328
 config M68VZ328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68VZ328 processor support.
-- 
2.35.1

