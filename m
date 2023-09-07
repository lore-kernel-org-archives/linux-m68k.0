Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA263EC874B
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 17:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjIGR0J (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243489AbjIGR0G (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 13:26:06 -0400
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F01891
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 10:25:43 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4RhL535sjhz4xVNl
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:41:59 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id j1hy2A00X1C8whw011hyX9; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGR-002mAP-0h;
        Thu, 07 Sep 2023 15:41:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGg-00CMiM-8w;
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
Subject: [PATCH 42/52] m68k: sun3: Remove unused orig_baddr in free_baddr()
Date:   Thu,  7 Sep 2023 15:41:43 +0200
Message-Id: <495c7f925f346880b26e21dea63b30cdfcb2dcdf.1694093327.git.geert@linux-m68k.org>
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

    arch/m68k/sun3/sun3dvma.c: In function ‘free_baddr’:
    arch/m68k/sun3/sun3dvma.c:208:23: warning: variable ‘orig_baddr’ set but not used [-Wunused-but-set-variable]
      196 |         unsigned long orig_baddr;
	  |                       ^~~~~~~~~~

Fix this by removing the unused variable and assignment, which were
futile since their introduction in v2.4.5.2.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/sun3/sun3dvma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/m68k/sun3/sun3dvma.c b/arch/m68k/sun3/sun3dvma.c
index f66b2413209069f2..6ebf52740ad7c00d 100644
--- a/arch/m68k/sun3/sun3dvma.c
+++ b/arch/m68k/sun3/sun3dvma.c
@@ -193,9 +193,7 @@ static inline int free_baddr(unsigned long baddr)
 	unsigned long len;
 	struct hole *hole;
 	struct list_head *cur;
-	unsigned long orig_baddr;
 
-	orig_baddr = baddr;
 	len = dvma_entry_use(baddr);
 	dvma_entry_use(baddr) = 0;
 	baddr &= DVMA_PAGE_MASK;
-- 
2.34.1

