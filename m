Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB05EC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 00:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbiJRAUg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiJRAUE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Oct 2022 20:20:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C9F82D2C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Oct 2022 17:15:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5110612F4;
        Tue, 18 Oct 2022 00:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29345C433D7;
        Tue, 18 Oct 2022 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051850;
        bh=QTwc/4EXx8Vj3th3KQC/kmBQJN5XXSP+3XI085ZiIHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ckwwRYa6HVUH25Mov2/QiQ/PYjZRBEYEZLl8xqVW81I4QtRoe1a25blh/42+y4jVn
         YmtNM8K4xUFWQIoJwUyZfBDZg6Ia8Ji6i9VmY2cKn3GQQkVobjwFEMGAV0lVLOFbx4
         U2OBoV0FsHnAP/9MofL/1X5GNCB2qQxv8TjXFdUG/jfMDyD3KUIS2QxJ5PrjVEpHG/
         8rbBrA8FX+mALIVH1XYFYDksRf6Tqgb7I1Qi8JVjvnLSx7YrByIZQ1P2aEcxyk44Y0
         lR7eUetkTfDcSOJdhSdR7m8E3G2cThwc77P/kU9o1s2m7oxLITCb9oJ+fVwjl8EANn
         sucSDxF7HSOQA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 5.10 11/16] m68knommu: fix non-mmu classic 68000 legacy timer tick selection
Date:   Mon, 17 Oct 2022 20:10:24 -0400
Message-Id: <20221018001029.2731620-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018001029.2731620-1-sashal@kernel.org>
References: <20221018001029.2731620-1-sashal@kernel.org>
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
 arch/m68k/Kconfig.cpu | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 936cd9619bf0..927df820da78 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -45,6 +45,7 @@ config M68000
 	select GENERIC_CSUM
 	select CPU_NO_EFFICIENT_FFS
 	select HAVE_ARCH_HASH
+	select LEGACY_TIMER_TICK
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
-- 
2.35.1

