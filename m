Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE7DC433DB
	for <linux-m68k@archiver.kernel.org>; Sun, 28 Feb 2021 19:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC78364E74
	for <linux-m68k@archiver.kernel.org>; Sun, 28 Feb 2021 19:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhB1TJZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 28 Feb 2021 14:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhB1TJX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 28 Feb 2021 14:09:23 -0500
Received: from mail.kernel-space.org (unknown [IPv6:2a01:4f8:c2c:5a84::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B64C061756
        for <linux-m68k@vger.kernel.org>; Sun, 28 Feb 2021 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
        s=20190913; t=1614539319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=L95Q+ipWGApjnlrS3VVRlUdANQ283x1smg6FYfAldhQ=;
        b=O3xq4StwOs4P45+2/Iw+BP/86+zqDqmhGasjWZhDwW1mDMSbLkjO1ilo35DIyPD52iTIjf
        3r0LK+vnAK1AfSHLG2IfArKMPjGBb2Cw2cjJ+vusTH27ewuFRRxEqjQ/LIFMkY7s+M4IvI
        pkB9fmg2c+kr1jWt6ysFsgKoMK+sVlI=
Received: from localhost.localdomain (host-79-50-9-193.retail.telecomitalia.it [79.50.9.193])
        by sysam.it (OpenSMTPD) with ESMTPSA id 6685384e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sun, 28 Feb 2021 19:08:39 +0000 (UTC)
From:   Angelo Dureghello <angelo@kernel-space.org>
To:     gerg@linux-m68k.org
Cc:     akpm@linux-foundation.org, rppt@linux.ibm.com,
        linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH v2] m68k: fix flatmem memory model setup
Date:   Sun, 28 Feb 2021 20:08:28 +0100
Message-Id: <20210228190828.392974-1-angelo@kernel-space.org>
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
Change for v2:
- replace PAGE_OFFSET with m68k_memory[0].addr
---
 arch/m68k/include/asm/page_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 8cfc92451711..1c683ce57d48 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -167,7 +167,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
 #else
-#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
+#define ARCH_PFN_OFFSET (m68k_memory[0].addr >> PAGE_SHIFT)
 #include <asm-generic/memory_model.h>
 #endif
 
-- 
2.30.1

