Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01903EDEC5D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241376AbjIMOK0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241444AbjIMOJr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:47 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7CB2100
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PF4zK8z4xHCK
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id lS8o2A00D1C8whw01S8oWu; Wed, 13 Sep 2023 16:08:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003cuA-MK;
        Wed, 13 Sep 2023 16:08:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXw-00FV7N-1W;
        Wed, 13 Sep 2023 16:08:48 +0200
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
Subject: [PATCH v2 50/52] m68k: sun3x: Make sun3x_halt() static
Date:   Wed, 13 Sep 2023 16:08:40 +0200
Message-Id: <0ba2883aaff2e4fc5e570bfee87c58e483668b26.1694613528.git.geert@linux-m68k.org>
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

    arch/m68k/sun3x/prom.c:33:6: warning: no previous prototype for ‘sun3x_halt’ [-Wmissing-prototypes]
       33 | void sun3x_halt(void)
	  |      ^~~~~~~~~~

Fix this by making sun3x_halt() static.
The function body was moved to arch/m68k/sun3x/prom.c in v2.4.5.2.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/sun3x/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/sun3x/prom.c b/arch/m68k/sun3x/prom.c
index 64c23bfaa90c5ba9..8ac87d3dc60718d9 100644
--- a/arch/m68k/sun3x/prom.c
+++ b/arch/m68k/sun3x/prom.c
@@ -30,7 +30,7 @@ struct linux_romvec *romvec;
 e_vector *sun3x_prom_vbr;
 
 /* Handle returning to the prom */
-void sun3x_halt(void)
+static void sun3x_halt(void)
 {
 	unsigned long flags;
 
-- 
2.34.1

