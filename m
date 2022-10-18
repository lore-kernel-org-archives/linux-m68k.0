Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906C9C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 00:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbiJRARr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbiJRAQ1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Oct 2022 20:16:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D98AE53
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Oct 2022 17:13:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33D3F6132C;
        Tue, 18 Oct 2022 00:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DEFC433C1;
        Tue, 18 Oct 2022 00:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051803;
        bh=Baj5djExwbyMGNBb6T6Hca5rCqcaAKPmbU86XJZ3JeM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CUtj1/SQq0XeqtVm5qdySvnSew8siiNGGwRB/DOjPrr/FCj97SOD2gazNtSf1Sonn
         Sz4CMPWcs/FA9suoSEdyxT1R8WAun64NC7LCNyvupVDRAEHD2sZxz4s2CTsuR+7AfC
         BdSP1vEBvqCJ7YOFLypg/LZVJnC7f+1lNOkb7uAhX4CsV+1nE7oYWNwor/DxtYB/yx
         QS67didcAFmTapEaFV5cSY+4mxcyMliZjA8SO0ce6lMEGlkaC176n3LZ/R+REscBpe
         YABCoUKL29NoPycaUgi4KBmVq2e8KQTsdQyUBtxKopbHtM0GR7bBcp/riOo6QyZ6E4
         RsRFOZkW9LNew==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 5.15 12/21] m68knommu: fix non-mmu classic 68000 legacy timer tick selection
Date:   Mon, 17 Oct 2022 20:09:31 -0400
Message-Id: <20221018000940.2731329-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000940.2731329-1-sashal@kernel.org>
References: <20221018000940.2731329-1-sashal@kernel.org>
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
index 29558055c71b..6ed860d6584a 100644
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
@@ -108,7 +109,6 @@ config M68060
 config M68328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68328 processor support.
@@ -116,7 +116,6 @@ config M68328
 config M68EZ328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68EX328 processor support.
@@ -124,7 +123,6 @@ config M68EZ328
 config M68VZ328
 	bool
 	depends on !MMU
-	select LEGACY_TIMER_TICK
 	select M68000
 	help
 	  Motorola 68VZ328 processor support.
-- 
2.35.1

