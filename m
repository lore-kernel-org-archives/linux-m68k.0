Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD98EEC8741
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 15:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjIGPpx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245470AbjIGP3g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 11:29:36 -0400
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6467BCA
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 08:29:09 -0700 (PDT)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by riemann.telenet-ops.be (Postfix) with ESMTPS id 4RhL540SJYz4x2gn
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:42:00 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id j1hy2A00o1C8whw061hyab; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGR-002mB0-6n;
        Thu, 07 Sep 2023 15:41:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGg-00CMj6-F4;
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
Subject: [PATCH 51/52] m68k: sun3x: Make dvma_print() static
Date:   Thu,  7 Sep 2023 15:41:52 +0200
Message-Id: <e3a49f03de557fc88dd45138fd86b0e3c40b02dc.1694093327.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694093327.git.geert@linux-m68k.org>
References: <cover.1694093327.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

There was never a user of dvma_print() outside arch/m68k/sun3x/dvma.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/sun3x/dvma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index d1847bfa136791e2..5185b4818d408e71 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -60,7 +60,7 @@ static volatile unsigned long *iommu_pte = (unsigned long *)SUN3X_IOMMU;
 
 #ifdef DEBUG
 /* code to print out a dvma mapping for debugging purposes */
-void dvma_print (unsigned long dvma_addr)
+static void dvma_print (unsigned long dvma_addr)
 {
 
 	unsigned long index;
-- 
2.34.1

