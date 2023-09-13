Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A805CEDEC4D
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 13:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241019AbjIMNpI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 09:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbjIMNpI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 09:45:08 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4443D19B6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 06:45:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8459ACE2261;
        Wed, 13 Sep 2023 13:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053FFC433C9;
        Wed, 13 Sep 2023 13:44:59 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/7] m68knommu: coldfire: add and use "vectors.h"
Date:   Wed, 13 Sep 2023 23:44:19 +1000
Message-Id: <20230913134425.2610927-2-gerg@linux-m68k.org>
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

    arch/m68k/coldfire/vectors.c:43:13: warning: no previous prototype for ‘trap_init’ [-Wmissing-prototypes]
     void __init trap_init(void)
                 ^~~~~~~~~

Fix this by introducing a new header file "vectors.h" for holding the
prototypes of functions implemented in arch/m68k/coldfire/vectors.c.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/vectors.c | 2 ++
 arch/m68k/coldfire/vectors.h | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 arch/m68k/coldfire/vectors.h

diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
index 3bf0d69eec9e..c26c255b530d 100644
--- a/arch/m68k/coldfire/vectors.c
+++ b/arch/m68k/coldfire/vectors.c
@@ -18,6 +18,8 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfwdebug.h>
 
+#include "vectors.h"
+
 /***************************************************************************/
 
 #ifdef TRAP_DBG_INTERRUPT
diff --git a/arch/m68k/coldfire/vectors.h b/arch/m68k/coldfire/vectors.h
new file mode 100644
index 000000000000..0b01450a4353
--- /dev/null
+++ b/arch/m68k/coldfire/vectors.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+void trap_init(void);
-- 
2.25.1

