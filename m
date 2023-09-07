Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0DCEC8742
	for <linux-m68k@archiver.kernel.org>; Thu,  7 Sep 2023 17:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242886AbjIGRTv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243105AbjIGRTq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 7 Sep 2023 13:19:46 -0400
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B66CFA
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 10:19:26 -0700 (PDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by cantor.telenet-ops.be (Postfix) with ESMTPS id 4RhL6D02Ydz4xT4q
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 15:43:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by andre.telenet-ops.be with bizsmtp
        id j1hy2A0032mGBSJ011hyG9; Thu, 07 Sep 2023 15:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGQ-002m92-HK;
        Thu, 07 Sep 2023 15:41:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qeFGf-00CMgi-Pl;
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
Subject: [PATCH 21/52] m68k: atari: Make atari_stram_map_pages() static
Date:   Thu,  7 Sep 2023 15:41:22 +0200
Message-Id: <c3a8e271acf5e5149586dee4dfbd01b41a4bdb08.1694093327.git.geert@linux-m68k.org>
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

    arch/m68k/atari/stram.c:118:12: warning: no previous prototype for ‘atari_stram_map_pages’ [-Wmissing-prototypes]
      118 | int __init atari_stram_map_pages(void)
	  |            ^~~~~~~~~~~~~~~~~~~~~

Fix this by making atari_stram_map_pages() static.
There was never a user outside arch/m68k/atari/stram.c.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/atari/stram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/atari/stram.c b/arch/m68k/atari/stram.c
index ce79b322a99cbda4..922e53bcb853289d 100644
--- a/arch/m68k/atari/stram.c
+++ b/arch/m68k/atari/stram.c
@@ -115,7 +115,7 @@ void __init atari_stram_reserve_pages(void *start_mem)
  * This function is called as arch initcall to reserve the pages needed for
  * ST-RAM management, if the kernel does not reside in ST-RAM.
  */
-int __init atari_stram_map_pages(void)
+static int __init atari_stram_map_pages(void)
 {
 	if (!kernel_in_stram) {
 		/*
-- 
2.34.1

