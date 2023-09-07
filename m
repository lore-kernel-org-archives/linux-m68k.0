Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCEDEC873E
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 16:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244452AbjIGQyA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244551AbjIGQx7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 12:53:59 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B19CE7
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 09:53:30 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4RhL5410Pnz4x88F
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:42:00 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id j1hy2A00P1C8whw011hywv; Thu, 07 Sep 2023 15:42:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGR-002mAv-67;
        Thu, 07 Sep 2023 15:41:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGg-00CMj1-EL;
        Thu, 07 Sep 2023 15:41:58 +0200
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
Subject: [PATCH 50/52] m68k: sun3x: Make sun3x_halt() static
Date:   Thu,  7 Sep 2023 15:41:51 +0200
Message-Id: <1d9bcd8cc98730ba0b9e2cc116e52f5d09d20f6d.1694093327.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694093327.git.geert@linux-m68k.org>
References: <cover.1694093327.git.geert@linux-m68k.org>
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

