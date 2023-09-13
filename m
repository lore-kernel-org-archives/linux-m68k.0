Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BCCEDEC5D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 14:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbjIMOJQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 10:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241278AbjIMOI4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 10:08:56 -0400
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CF01BE5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 07:08:50 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Rm2PF24XPz4x9kD
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 16:08:49 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.187.55])
        by baptiste.telenet-ops.be with bizsmtp
        id lS8n2A00i1C8whw01S8nqN; Wed, 13 Sep 2023 16:08:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXe-003ctU-C6;
        Wed, 13 Sep 2023 16:08:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qgQXv-00FV6a-NZ;
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
Subject: [PATCH v2 40/52] m68k: sun3: Fix signature of sun3_get_model()
Date:   Wed, 13 Sep 2023 16:08:30 +0200
Message-Id: <c635afb4542ab54c3dbd4fa2fbed07a2665a2f4e.1694613528.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613528.git.geert@linux-m68k.org>
References: <cover.1694613528.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The mach_get_model() callback takes a "char *", not an
"unsigned char *".

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 arch/m68k/sun3/idprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/sun3/idprom.c b/arch/m68k/sun3/idprom.c
index 1ace5353d78f5377..9ffd6515ad74a7fa 100644
--- a/arch/m68k/sun3/idprom.c
+++ b/arch/m68k/sun3/idprom.c
@@ -83,7 +83,7 @@ static void __init display_system_type(unsigned char machtype)
 	prom_halt();
 }
 
-void sun3_get_model(unsigned char* model)
+void sun3_get_model(char *model)
 {
 	register int i;
 
-- 
2.34.1

