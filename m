Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C596AC4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Dec 2022 08:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbiLMITA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Dec 2022 03:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbiLMIS7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Dec 2022 03:18:59 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7062FD22
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Dec 2022 00:18:56 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:e0b1:47d7:2716:fd3])
        by baptiste.telenet-ops.be with bizsmtp
        id vkJu280013pMg3v01kJuKr; Tue, 13 Dec 2022 09:18:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p50V2-0007kn-ND; Tue, 13 Dec 2022 09:18:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p50V2-00Feee-3N; Tue, 13 Dec 2022 09:18:52 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: nommu: Fix misspellings of "uCdimm"
Date:   Tue, 13 Dec 2022 09:18:50 +0100
Message-Id: <c1509bb9df16934e2629e1e2b00644f6585c7114.1670919502.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Arcturus Networks produced the "uCsimm" and "uCdimm" modules.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.machine | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 53c45ccda5647b5d..b7a70297fbc1a5a6 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -192,11 +192,11 @@ config UCSIMM
 	  Support for the Arcturus Networks uCsimm module.
 
 config UCDIMM
-	bool "uDsimm module support"
+	bool "uCdimm module support"
 	depends on !MMU
 	select M68VZ328
 	help
-	  Support for the Arcturus Networks uDsimm module.
+	  Support for the Arcturus Networks uCdimm module.
 
 config DRAGEN2
 	bool "DragenEngine II board support"
-- 
2.25.1

