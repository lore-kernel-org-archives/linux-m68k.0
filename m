Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4ABC433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 08:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2245F208DB
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592468256;
	bh=D5FoW2MYkCrzN4913FXukKZcG2fOiDiDFSrL95TapXE=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=PCAG6rmcjKCOio4CrJhNMEXzsY5oflUX4zcX4StZlJVKZyhFsbE2XzBvN+zYl9Dcf
	 e9nOmCBmCuWaHMo51gYTDSgLDqWJe9C7M4PW+orHbU2V966Twz1K3kvy1QFetCIh34
	 1+9ZCDivqyIMadz7/8sgI6JqrMWnMWhF/kCAqsPI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgFRIRg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Jun 2020 04:17:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbgFRIRd (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Jun 2020 04:17:33 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5354208C7;
        Thu, 18 Jun 2020 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592468253;
        bh=D5FoW2MYkCrzN4913FXukKZcG2fOiDiDFSrL95TapXE=;
        h=From:To:Cc:Subject:Date:From;
        b=vSG+OOYl2jtwAxCL2UQNJoAT/gxQZv0Mmsy0uINDfVHFjx0nNh23MUZPzB74AYH/d
         GghKgXiLjlEqqj8E5ibALR0l/Zu0tNQuxqvyLVtrCP9r6732FB7kuwY+N088adu6os
         TtXQ95X7jsspLdFAtyRqCPa46GiLHBouhPi26pRs=
From:   Mike Rapoport <rppt@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>,
        linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] m68k: mcfmmu: remove stale part of comment about steal_context
Date:   Thu, 18 Jun 2020 11:17:27 +0300
Message-Id: <20200618081727.4741-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

The comment about steal_context() came from powerpc and a part of it
addresses differences between powerpc variants that are not really
relevant to m68k.

Remove that part of the comment.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
Hi,

I've found this by pure chance while grepping for pgalloc.h
It's been there since 2011, but I don't think it's a stable material, so I
didn't cc them.

 arch/m68k/mm/mcfmmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 29f47923aa46..cb9f8675d81b 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -214,11 +214,6 @@ void __init cf_mmu_context_init(void)
 
 /*
  * Steal a context from a task that has one at the moment.
- * This is only used on 8xx and 4xx and we presently assume that
- * they don't do SMP.  If they do then thicfpgalloc.hs will have to check
- * whether the MM we steal is in use.
- * We also assume that this is only used on systems that don't
- * use an MMU hash table - this is true for 8xx and 4xx.
  * This isn't an LRU system, it just frees up each context in
  * turn (sort-of pseudo-random replacement :).  This would be the
  * place to implement an LRU scheme if anyone was motivated to do it.
-- 
2.25.4

