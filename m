Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A5BC4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Dec 2022 13:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbiLSNkl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Dec 2022 08:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbiLSNkj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Dec 2022 08:40:39 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437EEDEC1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 05:40:34 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:87b:c831:2ca7:222d])
        by michel.telenet-ops.be with bizsmtp
        id yDgX2800X471bjf06DgXPf; Mon, 19 Dec 2022 14:40:32 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p7GNb-000bsa-Bl; Mon, 19 Dec 2022 14:40:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p7GNa-00939e-O4; Mon, 19 Dec 2022 14:40:30 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] m68k: nommu: Fix misspellings of "DragonEngine"
Date:   Mon, 19 Dec 2022 14:40:29 +0100
Message-Id: <851f51b6d97575181071041361f2996472a5423c.1671457176.git.geert@linux-m68k.org>
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

v2:
  - Fix a different variant in arch/m68k/68000/dragen2.c, too.
---
 arch/m68k/68000/dragen2.c | 2 +-
 arch/m68k/Kconfig.machine | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/68000/dragen2.c b/arch/m68k/68000/dragen2.c
index 1a57eff28cfe5f9c..7f1804e31a0622eb 100644
--- a/arch/m68k/68000/dragen2.c
+++ b/arch/m68k/68000/dragen2.c
@@ -15,7 +15,7 @@
 #include "screen.h"
 
 /***************************************************************************/
-/*                        Init Drangon Engine hardware                     */
+/*                        Init Dragon Engine II hardware                   */
 /***************************************************************************/
 
 static void dragen2_reset(void)
diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 4b9fa83800424101..5de0cc3af2aa6f1b 100644
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

