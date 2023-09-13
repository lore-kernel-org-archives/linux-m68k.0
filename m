Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AB3EDEC63
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241610AbjIMOKX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbjIMOJl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:41 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348C41FE3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by michel.telenet-ops.be with bizsmtp
        id lS8p2A00W3fvA4V06S8qJZ; Wed, 13 Sep 2023 16:08:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003csm-07;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV5g-BU;
        Wed, 13 Sep 2023 16:08:47 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 29/52] m68k: mac: Remove unused sine_data[]
Date:   Wed, 13 Sep 2023 16:08:19 +0200
Message-Id: <75dbc0a141490daf9febfb8cb4a43ae87fbe3352.1694613528.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613528.git.geert@linux-m68k.org>
References: <cover.1694613528.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/mac/macboing.c:29:26: warning: ‘sine_data’ defined but not used [-Wunused-const-variable=]
       29 | static const signed char sine_data[] = {
	  |                          ^~~~~~~~~

The predefined sine table was superseded by a table calculated at
run-time in v2.2.0.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/mac/macboing.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
index 4de6229c7bfdebce..76431241347682fc 100644
--- a/arch/m68k/mac/macboing.c
+++ b/arch/m68k/mac/macboing.c
@@ -22,15 +22,6 @@ static int mac_asc_inited;
  */
 static __u8 mac_asc_wave_tab[ 0x800 ];
 
-/*
- * Alan's original sine table; needs interpolating to 0x800
- * (hint: interpolate or hardwire [0 -> Pi/2[, it's symmetric)
- */
-static const signed char sine_data[] = {
-	0,  39,  75,  103,  121,  127,  121,  103,  75,  39,
-	0, -39, -75, -103, -121, -127, -121, -103, -75, -39
-};
-
 /*
  * where the ASC hides ...
  */
-- 
2.34.1

