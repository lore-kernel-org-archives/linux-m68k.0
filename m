Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CC9EDEC5F
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241683AbjIMOKp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241335AbjIMOJy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:09:54 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB382116
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:53 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id lS8p2A00R1C8whw06S8qJX; Wed, 13 Sep 2023 16:08:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXd-003cru-JR;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXu-00FV4Y-Ur;
        Wed, 13 Sep 2023 16:08:46 +0200
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
Subject: [PATCH v2 15/52] m68k: emu: Mark version[] __maybe_unused
Date:   Wed, 13 Sep 2023 16:08:05 +0200
Message-Id: <051731639b4c8e296ec4017595051885cc551c23.1694613528.git.geert@linux-m68k.org>
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

    arch/m68k/emu/nfeth.c:42:19: warning: ‘version’ defined but not used [-Wunused-const-variable=]
       42 | static const char version[] =
	  |                   ^~~~~~~

Fix this while obeying the wishes of the original copyright holders by
marking version[] with __maybe_unused.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by,
  - Drop prefix from compiler output.
---
 arch/m68k/emu/nfeth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index 1a5d1e8eb4c80839..26e68813f35144f8 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -39,7 +39,7 @@ enum {
 #define MAX_UNIT	8
 
 /* These identify the driver base version and may not be removed. */
-static const char version[] =
+static const char version[] __maybe_unused =
 	KERN_INFO KBUILD_MODNAME ".c:v" DRV_VERSION " " DRV_RELDATE
 	" S.Opichal, M.Jurik, P.Stehlik\n"
 	KERN_INFO " http://aranym.org/\n";
-- 
2.34.1

