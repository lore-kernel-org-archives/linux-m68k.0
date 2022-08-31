Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA09ECAAA1
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Aug 2022 01:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiHaBZv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 Aug 2022 21:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbiHaBZv (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Aug 2022 21:25:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7A19C2FA
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 18:25:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79B2961828
        for <linux-m68k@vger.kernel.org>; Wed, 31 Aug 2022 01:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E516C433C1;
        Wed, 31 Aug 2022 01:25:48 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCHv2 3/3] m68k: allow kexec on M68KCLASSIC with MMU enabled only
Date:   Wed, 31 Aug 2022 11:25:39 +1000
Message-Id: <20220831012539.3416470-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

None of the no-MMU CPU types (classic or ColdFire) or ColdFire with
MMU enabled have support for kexec yet, so the configuration as it
stands is not quite right, and it will fail to compile on them.

Make CONFIG_KEXEC depend on both CONFIG_M68KCLASSIC and CONFIG_MMU.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---

v2: disable kexec for ColdFire MMU as well

 arch/m68k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index b06faf6c0b27..7bff88118507 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -87,7 +87,7 @@ config MMU_SUN3
 
 config KEXEC
 	bool "kexec system call"
-	depends on M68KCLASSIC
+	depends on M68KCLASSIC && MMU
 	select KEXEC_CORE
 	help
 	  kexec is a system call that implements the ability to shutdown your
-- 
2.25.1

