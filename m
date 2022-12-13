Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0B0C4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Dec 2022 08:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbiLMITP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Dec 2022 03:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbiLMITO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Dec 2022 03:19:14 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288B91004F
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Dec 2022 00:19:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:e0b1:47d7:2716:fd3])
        by andre.telenet-ops.be with bizsmtp
        id vkKB280063pMg3v01kKB5t; Tue, 13 Dec 2022 09:19:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p50VK-0007lD-Qj; Tue, 13 Dec 2022 09:19:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p50VK-00Feg0-CR; Tue, 13 Dec 2022 09:19:10 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: nommu: Fix misspellings of "DragonEngine"
Date:   Tue, 13 Dec 2022 09:19:09 +0100
Message-Id: <8e823d669284abb9b5174f25a4abfc4cd35b1652.1670919535.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Exys produced the "DragonEngine II" board.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
The printed message:

    arch/m68k/kernel/setup_no.c:    pr_info("DragonEngine II board support by Georges Menie\n");

matches Georges' website:

    https://www.menie.org/georges/DragonEngine/
---
 arch/m68k/Kconfig.machine | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index b7a70297fbc1a5a6..e2f961208f18bec5 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -199,11 +199,11 @@ config UCDIMM
 	  Support for the Arcturus Networks uCdimm module.
 
 config DRAGEN2
-	bool "DragenEngine II board support"
+	bool "DragonEngine II board support"
 	depends on !MMU
 	select M68VZ328
 	help
-	  Support for the DragenEngine II board.
+	  Support for the DragonEngine II board.
 
 config DIRECT_IO_ACCESS
 	bool "Allow user to access IO directly"
-- 
2.25.1

