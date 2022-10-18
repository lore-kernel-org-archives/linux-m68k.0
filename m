Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15992C43219
	for <linux-m68k@archiver.kernel.org>; Tue, 18 Oct 2022 00:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbiJRAIw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbiJRAIW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Oct 2022 20:08:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509D6876BE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Oct 2022 17:08:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2E227B81BE1;
        Tue, 18 Oct 2022 00:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131E9C433C1;
        Tue, 18 Oct 2022 00:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051681;
        bh=0WRq8MXZM3ZDilDA1bAGWB/EzA7Q30P8KMT3E0nCaJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MThRxtvKbh/6X476BLhGqoUaTM0PGbEqHAEcjL4ajgZ7gYh6ym+tkEgsrg5gSId84
         7WA0aZS36B2WKgs5T5Iz8h0BTlrW2OUpqL7NWknSFJ1VGxdKvhpsaVYe0+lRsIcz4b
         SRRzDDglzC3D2sb0gTQmIKTPlMaZUUAMcalBc8LZQpNz4Y3yb470oeEDrVwdIxf8XW
         Wyo+CssOvBknaqu+NQa3CB1+K1Pm0KSuxuWg9DDggF0Z1VuXSioof5yRU78nOqKkIw
         /1RPdiAGo9uwfb8aJ4Rr3+dbMnHmRHQdptguY/2DsmwAoW2jDubA515Q3TOXmY7Lek
         OcOPMxKJLWXVg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        kernel test robot <lkp@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH AUTOSEL 6.0 15/32] m68knommu: fix non-specific 68328 choice interrupt build failure
Date:   Mon, 17 Oct 2022 20:07:12 -0400
Message-Id: <20221018000729.2730519-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000729.2730519-1-sashal@kernel.org>
References: <20221018000729.2730519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

[ Upstream commit 750321ace9107e103f254bf46900629ff347eb7b ]

Compiling for a classic m68k non-MMU target with no specific CPU
selected fails with the following error:

   arch/m68k/68000/ints.c: In function 'process_int':
>> arch/m68k/68000/ints.c:82:30: error: 'ISR' undeclared (first use in this function)
      82 |         unsigned long pend = ISR;
         |                              ^~~

This interrupt handling code is specific to the 68328 family of 68000
parts. There is a couple of variants (68EZ328, 68VZ328) and the common
ancestor of them the strait 68328.

The code here includes a specific header for each variant type. But if
none is selected then nothing is included to supply the appropriate
register and bit flags defines.

Rearrange the includes so that at least one type is always included.
At the very least the 68328 base type should be the fallback, so make
that true.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/m68k/68000/ints.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/68000/ints.c b/arch/m68k/68000/ints.c
index cda49b12d7be..f9a5ec781408 100644
--- a/arch/m68k/68000/ints.c
+++ b/arch/m68k/68000/ints.c
@@ -18,12 +18,12 @@
 #include <asm/io.h>
 #include <asm/machdep.h>
 
-#if defined(CONFIG_M68328)
-#include <asm/MC68328.h>
-#elif defined(CONFIG_M68EZ328)
+#if defined(CONFIG_M68EZ328)
 #include <asm/MC68EZ328.h>
 #elif defined(CONFIG_M68VZ328)
 #include <asm/MC68VZ328.h>
+#else
+#include <asm/MC68328.h>
 #endif
 
 /* assembler routines */
-- 
2.35.1

