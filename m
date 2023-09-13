Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A991DEDEC5C
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241386AbjIMOJX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241281AbjIMOI5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:08:57 -0400
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF7919BB
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:50 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PF4HZNz4x2GX
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id lS8o2A0061C8whw01S8oqQ; Wed, 13 Sep 2023 16:08:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003cu3-LI;
        Wed, 13 Sep 2023 16:08:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXw-00FV7J-0e;
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
Subject: [PATCH v2 49/52] m68k: sun3x: Do not mark dvma_map_iommu() inline
Date:   Wed, 13 Sep 2023 16:08:39 +0200
Message-Id: <0884fd1f5d6775535bf20b13cc74283df4955e49.1694613528.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613528.git.geert@linux-m68k.org>
References: <cover.1694613528.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

dvma_map_iommu() is called from the common Sun3/3x DVMA management code,
but never from inside arch/m68k/sun3x/dvma.c.  Hence it does not make
sense to mark it inline.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/sun3x/dvma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index a6034ba058454642..d1847bfa136791e2 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -143,8 +143,7 @@ inline int dvma_map_cpu(unsigned long kaddr,
 }
 
 
-inline int dvma_map_iommu(unsigned long kaddr, unsigned long baddr,
-				 int len)
+int dvma_map_iommu(unsigned long kaddr, unsigned long baddr, int len)
 {
 	unsigned long end, index;
 
-- 
2.34.1

