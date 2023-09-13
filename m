Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1E4EDEC5C
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241415AbjIMOJd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241291AbjIMOI5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:08:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855CE1BCB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by laurent.telenet-ops.be with bizsmtp
        id lS8n2A00C3fvA4V01S8nmF; Wed, 13 Sep 2023 16:08:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003ct1-4F;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV61-FZ;
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
Subject: [PATCH v2 33/52] m68k: mvme147: Make mvme147_init_IRQ() static
Date:   Wed, 13 Sep 2023 16:08:23 +0200
Message-Id: <853e29ca81761032c3af132fffbd583b667234a6.1694613528.git.geert@linux-m68k.org>
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

    arch/m68k/mvme147/config.c:76:13: warning: no previous prototype for ‘mvme147_init_IRQ’ [-Wmissing-prototypes]
       76 | void __init mvme147_init_IRQ(void)
	  |             ^~~~~~~~~~~~~~~~

Fix this by making mvme147_init_IRQ() static.
The function body was moved to arch/m68k/mvme147/config.c in v2.6.18.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/mvme147/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
index 4e6218115f43ce56..7dfacd0b207a9750 100644
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@ -73,7 +73,7 @@ static void mvme147_get_model(char *model)
  * the mvme147 IRQ handling routines.
  */
 
-void __init mvme147_init_IRQ(void)
+static void __init mvme147_init_IRQ(void)
 {
 	m68k_setup_user_interrupt(VEC_USER, 192);
 }
-- 
2.34.1

