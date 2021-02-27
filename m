Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D66C433DB
	for <linux-m68k@archiver.kernel.org>; Sat, 27 Feb 2021 23:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CBE664E29
	for <linux-m68k@archiver.kernel.org>; Sat, 27 Feb 2021 23:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhB0X2b (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 27 Feb 2021 18:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhB0X2a (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 27 Feb 2021 18:28:30 -0500
X-Greylist: delayed 399 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 27 Feb 2021 15:27:50 PST
Received: from mail.kernel-space.org (unknown [IPv6:2a01:4f8:c2c:5a84::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D74C06174A
        for <linux-m68k@vger.kernel.org>; Sat, 27 Feb 2021 15:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
        s=20190913; t=1614468068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=woNxktFnh/qo/cOl+wLlFWq6Ooa00b7ApyRFnf5nufo=;
        b=s92OXcqZaQ5R59XUpv1WS2Il2+sqoxIQbIhA+5GcWH8l1gN1wuyi5FLMD3tgHOqOFlrY3R
        bxRVbksnA7PWdcQEQbuPaN4XpdUhucjt2nIoBn4rXbbz3mTUsazSjiRVF5JlMsJPHCz8EP
        joTavIRJkyBbUG2NXA4VdqA9Gz/EqUo=
Received: from localhost.localdomain (host-82-54-239-193.retail.telecomitalia.it [82.54.239.193])
        by sysam.it (OpenSMTPD) with ESMTPSA id d107be84 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sat, 27 Feb 2021 23:21:08 +0000 (UTC)
From:   Angelo Dureghello <angelo@kernel-space.org>
To:     gerg@linux-m68k.org
Cc:     akpm@linux-foundation.org, rppt@linux.ibm.com,
        linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH] m68k: fix flatmem memory model setup
Date:   Sun, 28 Feb 2021 00:20:58 +0100
Message-Id: <20210227232058.215436-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Detected a broken boot on mcf54415, likely introduced from

commit 4bfc848e0981
("m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM")

Fix ARCH_PFN_OFFSET to be a pfn.

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 arch/m68k/include/asm/page_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 8cfc92451711..84551b1a8b93 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -167,7 +167,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
 #else
-#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
+#define ARCH_PFN_OFFSET	(PAGE_OFFSET >> PAGE_SHIFT)
 #include <asm-generic/memory_model.h>
 #endif
 
-- 
2.30.1

