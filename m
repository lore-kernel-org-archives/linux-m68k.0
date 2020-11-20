Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AF9C64E7A
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635B2223AC
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 04:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgKTEvj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 19 Nov 2020 23:51:39 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:52686 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgKTEvh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 19 Nov 2020 23:51:37 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id 08B402A457; Thu, 19 Nov 2020 23:51:35 -0500 (EST)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Joshua Thompson" <funaho@jurai.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <bb327f05f8fb61eeb332cc2ba4e8335570976474.1605847196.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Update Kconfig help
Date:   Fri, 20 Nov 2020 15:39:56 +1100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There is still some missing hardware support that affects all models,
such as sound chip and localtalk support. However, many models are well
supported, including the Quadra 800 emulated by QEMU. Missing hardware
support is mostly documented at the web site, so add the URL.

Cc: Joshua Thompson <funaho@jurai.org>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/Kconfig.machine | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 17e8c3a292d7..054ff6392329 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -30,11 +30,9 @@ config MAC
 	select HAVE_ARCH_NVRAM_OPS
 	help
 	  This option enables support for the Apple Macintosh series of
-	  computers (yes, there is experimental support now, at least for part
-	  of the series).
-
-	  Say N unless you're willing to code the remaining necessary support.
-	  ;)
+	  computers. If you plan to use this kernel on a Mac, say Y here and
+	  browse the documentation available at <http://www.mac.linux-m68k.org/>;
+	  otherwise say N.
 
 config APOLLO
 	bool "Apollo support"
-- 
2.26.2

