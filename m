Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF167EDEC5A
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241676AbjIMOKo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241473AbjIMOJy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:54 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5582113
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PG1Q1Wz4wxK1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:50 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id lS8o2A01E1C8whw01S8o3e; Wed, 13 Sep 2023 16:08:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003csu-2Q;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV5o-D3;
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
Subject: [PATCH v2 31/52] m68k: mac: Make mac_platform_init() static
Date:   Wed, 13 Sep 2023 16:08:21 +0200
Message-Id: <f5f069f94c369b7de223bb5e1a21837807fde982.1694613528.git.geert@linux-m68k.org>
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

    arch/m68k/mac/config.c:961:12: warning: no previous prototype for ‘mac_platform_init’ [-Wmissing-prototypes]
      961 | int __init mac_platform_init(void)
	  |            ^~~~~~~~~~~~~~~~~

Fix this by making mac_platform_init() static.
There was never a user outside arch/m68k/mac/config.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/mac/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 382f656c29eaeef2..d56affefd5cabeb5 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -958,7 +958,7 @@ static const struct pata_platform_info mac_pata_data __initconst = {
 	.ioport_shift = 2,
 };
 
-int __init mac_platform_init(void)
+static int __init mac_platform_init(void)
 {
 	phys_addr_t swim_base = 0;
 
-- 
2.34.1

