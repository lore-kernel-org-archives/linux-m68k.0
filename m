Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBA0C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 07:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E96B1610A6
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 07:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240832AbhINHdV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Sep 2021 03:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240887AbhINHdR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Sep 2021 03:33:17 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B55C0613D8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Sep 2021 00:31:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by baptiste.telenet-ops.be with bizsmtp
        id tjXx2500T2aSKa101jXxar; Tue, 14 Sep 2021 09:31:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ2v6-004PHc-Ty; Tue, 14 Sep 2021 09:31:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ2v6-00GIIT-Ip; Tue, 14 Sep 2021 09:31:56 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Julia Lawall <julia.lawall@inria.fr>, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: muldi3: Use semicolon instead of comma
Date:   Tue, 14 Sep 2021 09:31:55 +0200
Message-Id: <20210914073155.3883532-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This code works, but it is cleaner to use a semicolon at the end of a
statement instead of a comma.

Extracted from a big anonymous patch by Julia Lawall
<julia.lawall@inria.fr>.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v5.16.

 arch/m68k/lib/muldi3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
index 3fb05c698c41ebfb..eb7d9d86ff6697a5 100644
--- a/arch/m68k/lib/muldi3.c
+++ b/arch/m68k/lib/muldi3.c
@@ -84,7 +84,7 @@ __muldi3 (DItype u, DItype v)
   DIunion w;
   DIunion uu, vv;
 
-  uu.ll = u,
+  uu.ll = u;
   vv.ll = v;
 
   w.ll = __umulsidi3 (uu.s.low, vv.s.low);
-- 
2.25.1

