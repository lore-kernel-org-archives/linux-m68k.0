Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6C1C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC8A4206E2
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFOGnC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:43:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726299AbgFOGnC (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 02:43:02 -0400
Received: from goober.digi.com (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0407D2067B;
        Mon, 15 Jun 2020 06:43:00 +0000 (UTC)
From:   Greg Ungerer <gerg@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Cc:     Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 4/5] m68k: use asm-generic cmpxchg_local()
Date:   Mon, 15 Jun 2020 16:42:52 +1000
Message-Id: <20200615064252.2435191-1-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Use the asm-generic version of the cmpxchg_local() macro. Although not
all target types use asm-generic/cmpxchg.h, for those that do the
local cmpxchg_local() is the same as the asm-generic/cmpxchg.h one.
So no need to define the local one.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/cmpxchg.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/m68k/include/asm/cmpxchg.h b/arch/m68k/include/asm/cmpxchg.h
index 38e1d7acc44d..3a3bdcfcd375 100644
--- a/arch/m68k/include/asm/cmpxchg.h
+++ b/arch/m68k/include/asm/cmpxchg.h
@@ -129,14 +129,6 @@ static inline unsigned long __cmpxchg(volatile void *p, unsigned long old,
 
 #else
 
-/*
- * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
- * them available.
- */
-#define cmpxchg_local(ptr, o, n)				  	       \
-	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr), (unsigned long)(o),\
-			(unsigned long)(n), sizeof(*(ptr))))
-
 #include <asm-generic/cmpxchg.h>
 
 #endif
-- 
2.25.1

