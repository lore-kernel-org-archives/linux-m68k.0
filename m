Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8BCCCFA0A
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 19:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbjIGTbb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 15:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244408AbjIGR17 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 13:27:59 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [IPv6:2a02:1800:110:4::f00:11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A1E197
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 10:27:32 -0700 (PDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4RhL6D04Sbz4x3HG
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:43:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by xavier.telenet-ops.be with bizsmtp
        id j1hx2A00F2mGBSJ011hxwn; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGQ-002m8t-FQ;
        Thu, 07 Sep 2023 15:41:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGf-00CMgS-MZ;
        Thu, 07 Sep 2023 15:41:57 +0200
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
Subject: [PATCH 18/52] m68k: atari: Document data parameter of stdma_try_lock()
Date:   Thu,  7 Sep 2023 15:41:19 +0200
Message-Id: <c94a97725452677dffde1b4e63e9fd13c6752f2e.1694093327.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694093327.git.geert@linux-m68k.org>
References: <cover.1694093327.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

    arch/m68k/atari/stdma.c:69: warning: Function parameter or member 'data' not described in 'stdma_try_lock'

Fix this by documenting the data parameter.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/atari/stdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/atari/stdma.c b/arch/m68k/atari/stdma.c
index ce6818eff75efcdf..155fefff19b0e19d 100644
--- a/arch/m68k/atari/stdma.c
+++ b/arch/m68k/atari/stdma.c
@@ -61,6 +61,7 @@ static irqreturn_t stdma_int (int irq, void *dummy);
 /**
  * stdma_try_lock - attempt to acquire ST DMA interrupt "lock"
  * @handler: interrupt handler to use after acquisition
+ * @data: cookie passed to the interrupt handler function
  *
  * Returns !0 if lock was acquired; otherwise 0.
  */
-- 
2.34.1

