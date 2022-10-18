Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B062C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 00:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbiJRA0J (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbiJRAZu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Oct 2022 20:25:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FED49B55
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Oct 2022 17:23:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9F9A61362;
        Tue, 18 Oct 2022 00:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8247C433C1;
        Tue, 18 Oct 2022 00:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051931;
        bh=DU/eQ4VZyL8sT09lDH+qQcBwlvllgQR7vyJrGqUWCMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f36heXSsJ0MYJaIUKv1VrYzBso8mVHtpVEEudin8Qwylo3JOV+XGYbyalBwvhPu2Q
         7qRlmSm5TfET7dgGD+qFrNwwdEt4lycRk5kqKalC4NNZHyahAUI38kcPEIxEkIJbMZ
         nL2bM/3Twy6Br7R+/CTBE8Y6j9w6mCtBDKmsJuhrlZRpbG/MglDlaA7IjlN2DzSt2N
         WMHQtx6L1FvF+JqhwVsLcG8Sgl0ETx2yRetwt8l/72jKQBkiBNcorAGS4Bf2gZLvqi
         77/CrEs/cgOR1hz7qE3QnJsQKjkxztzM4KyuHNQ58vWio2btyBWyxT5Gi2vZFKGyM2
         Hi/iSy2+rsEVQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 4.9 5/8] m68knommu: fix non-mmu classic 68000 legacy timer tick selection
Date:   Mon, 17 Oct 2022 20:11:59 -0400
Message-Id: <20221018001202.2732458-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018001202.2732458-1-sashal@kernel.org>
References: <20221018001202.2732458-1-sashal@kernel.org>
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
index 2268d19cc915..327347792550 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -42,6 +42,7 @@ config M68000
 	select GENERIC_CSUM
 	select CPU_NO_EFFICIENT_FFS
 	select HAVE_ARCH_HASH
+	select LEGACY_TIMER_TICK
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
-- 
2.35.1

