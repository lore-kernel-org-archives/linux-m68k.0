Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48743EDEC4E
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 12:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240672AbjIMMwo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 08:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240783AbjIMMwd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 08:52:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884F31BEA
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 05:52:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8AE3F61924;
        Wed, 13 Sep 2023 12:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B86C433C8;
        Wed, 13 Sep 2023 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694609546;
        bh=s1hsPTSDOP85wbkZeo+bBw0BsgAM684PeX07eI5E2Hc=;
        h=From:To:Cc:Subject:Date:From;
        b=Yd+U8g58KQvarhGpDxlB71NRvyrPsfyWwAs39bVPWtteai5oTlDEq8rPNjjfa1q4K
         tPG2TqWWsoZu3PR46EIEjwZFGRJL2Y3ZjSFpnB8dQqKD5UXNPGs/J1D/4OuagUZuOG
         xUaBS1AgV4HHPntTRCZlqmqLMwWvC7UL933aQD1aYocZyVxmyimR2W6oWL6m0Jr0eN
         Qqvwmbg8OU/gpHW3KHdyONqV/8bD41YyYbOx6xc5502qYu7Oj24R2Ccip3BMOay/J3
         77TAmqda9/OSFURB+KTBr0ytsR+cR1qbqXtkupmAJ7LbtA9LIqPm92X9CCMzSlgEVK
         n43UzeRNeucBg==
From:   Greg Ungerer <gerg@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: fix compilation for ColdFire/Cleopatra boards
Date:   Wed, 13 Sep 2023 22:52:21 +1000
Message-Id: <20230913125221.2128621-1-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@linux-m68k.org>

The ColdFire based Cleopatra family of boards use mostly the same
external pin arrangements as the NETtel board family. The build uses the
NETtel specific code as needed, but not all the conditional defines
allow for this. If you have the CONFIG_NETtel config option set
everything compiles as expected, but if you only select the
CONFIG_CLEOPATRA board type then you will get compile failures:

    arch/m68k/coldfire/nettel.c: In function ‘nettel_smc91x_init’:
    arch/m68k/coldfire/nettel.c:126:2: error: implicit declaration of function ‘mcf_setppdata’; did you mean ‘xas_set_update’? [-Werror=implicit-function-declaration]
      mcf_setppdata(0, 0x0080);
      ^~~~~~~~~~~~~
      xas_set_update

Fix the nettel.h include conditional checks to cover all board types.
This also means some code paths need to check for the 5407 SoC - since
one of the Cleopatra board types is based on that. It is very similar
to the 5307 specific code, and it can use that "as-is".

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/nettel.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/nettel.h b/arch/m68k/include/asm/nettel.h
index 45716ead7b9d..3bd4b7a4613f 100644
--- a/arch/m68k/include/asm/nettel.h
+++ b/arch/m68k/include/asm/nettel.h
@@ -14,9 +14,8 @@
 #define	nettel_h
 /****************************************************************************/
 
-
 /****************************************************************************/
-#ifdef CONFIG_NETtel
+#if defined(CONFIG_NETtel) || defined(CONFIG_CLEOPATRA)
 /****************************************************************************/
 
 #ifdef CONFIG_COLDFIRE
@@ -26,7 +25,7 @@
 #endif
 
 /*---------------------------------------------------------------------------*/
-#if defined(CONFIG_M5307)
+#if defined(CONFIG_M5307) || defined(CONFIG_M5407)
 /*
  *	NETtel/5307 based hardware first. DTR/DCD lines are wired to
  *	GPIO lines. Most of the LED's are driver through a latch
-- 
2.25.1

