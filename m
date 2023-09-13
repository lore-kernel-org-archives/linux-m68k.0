Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4F5EDEC52
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241019AbjIMNpV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241060AbjIMNpU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91331BC7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77D0CB82417;
        Wed, 13 Sep 2023 13:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F4DC433C9;
        Wed, 13 Sep 2023 13:45:12 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 7/7] m68knommu: 68000: fix warning in timer code
Date:   Wed, 13 Sep 2023 23:44:25 +1000
Message-Id: <20230913134425.2610927-8-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913134425.2610927-1-gerg@linux-m68k.org>
References: <20230913134425.2610927-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When building with W=1:

      CC      arch/m68k/68000/timers.o
    arch/m68k/68000/timers.c:120:5: warning: no previous prototype for ‘m68328_hwclk’ [-Wmissing-prototypes]
     int m68328_hwclk(int set, struct rtc_time *t)
         ^~~~~~~~~~~~

Include m68328.h to get prototype for m68328_hwclk().

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/68000/timers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/68000/timers.c b/arch/m68k/68000/timers.c
index 0d0417cebc7f..00fb0dd12faa 100644
--- a/arch/m68k/68000/timers.c
+++ b/arch/m68k/68000/timers.c
@@ -25,6 +25,8 @@
 #include <asm/machdep.h>
 #include <asm/MC68VZ328.h>
 
+#include "m68328.h"
+
 /***************************************************************************/
 
 #if defined(CONFIG_DRAGEN2)
-- 
2.25.1

