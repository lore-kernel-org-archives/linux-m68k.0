Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CF2C47082
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 08:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A606613B5
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 08:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhEZIr3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 May 2021 04:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhEZIr1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 May 2021 04:47:27 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62A5C061756
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 May 2021 01:45:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d8ed:c948:a7ff:27e4])
        by michel.telenet-ops.be with bizsmtp
        id 9Lld2500C0QkFpL06LldvN; Wed, 26 May 2021 10:45:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1llpAX-009a1H-3u; Wed, 26 May 2021 10:45:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1llpAW-0066Nc-C3; Wed, 26 May 2021 10:45:36 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: Drop duplicate "core-y += arch/m68k/" rule causing link failures
Date:   Wed, 26 May 2021 10:45:36 +0200
Message-Id: <20210526084536.1454449-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

    Makefile:1949: target 'arch/m68k' given more than once in the same rule
    [...]
      LD      vmlinux.o
    m68k-linux-gnu-ld: arch/m68k/kernel/entry.o: in function `system_call':
    (.text+0x160): multiple definition of `system_call'; arch/m68k/kernel/entry.o:(.text+0x160): first defined here
    [...]

All "core-y += arch/<arch>/" rules were dropped from the corresponding
arch/<arch>/Makefiles, but m68k was forgotten.

Reported-by: noreply@ellerman.id.au
Fixes: 7d9677835b10b5de ("kbuild: require all architectures to have arch/$(SRCARCH)/Kbuild")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index c54055a3d28450aa..dd0c0ec67f67064d 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -97,7 +97,6 @@ head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
 head-$(CONFIG_M68000)		:= arch/m68k/68000/head.o
 head-$(CONFIG_COLDFIRE)		:= arch/m68k/coldfire/head.o
 
-core-y				+= arch/m68k/
 libs-y				+= arch/m68k/lib/
 
 
-- 
2.25.1

