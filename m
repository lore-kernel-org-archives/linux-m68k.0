Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D885C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Feb 2023 11:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbjBWL0y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 06:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbjBWL0w (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Feb 2023 06:26:52 -0500
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7996D72B6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 03:26:48 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id eg37so37065829edb.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 03:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG6jwDtYpMM5i6hkPZWpE5bvQMiUV0uLFjJBPBG56go=;
        b=Lc1eA3cLTe0w5wsL4DjpsraF5k3lOm6SFNXdC5y5JSsCljdr1IXUlbni8jKlx9mrT/
         oGEAmz6jPTAqQBhnI5LcSkaqBwzchCi0IEkRLnpkQwW9KFj4owcb3ijI7sv/BlB4iQry
         j7KUm2xzB2FS8gJZmZVrDtO/r5I3rTGjz0ldFFH6mohzpNgBGW7RkwnQ4+JwYTRzby14
         gvMJZVu913hB7DPvJUeybgeqr8/0wDN1w7ESN2rXZnAG9KDNxuhplNZzjDxi8grkGXEL
         obyWobR5WmPEaUug+QkYLOH92FCR61QVCbVGzFQFLiuFIBUzoV3MkH+UOGiLzPZGbj+6
         Kg2A==
X-Gm-Message-State: AO0yUKVMna9hbTHRAKPQuTbIglRx6j5eNt+YpO1pC3kYoumVabebGVJq
        VO4BvEJcGDcPwFzFlvUjv8AHked2JiJL3g==
X-Google-Smtp-Source: AK7set/ADZ2jwF0++W3iu+hB6yp6m1ddei2nfA9In8YoFxI3EWxJ+qRurklcmyNc3SGVehlyE5xHNQ==
X-Received: by 2002:a05:6402:491:b0:4ad:5220:79f6 with SMTP id k17-20020a056402049100b004ad522079f6mr11111120edv.18.1677151606509;
        Thu, 23 Feb 2023 03:26:46 -0800 (PST)
Received: from htpc.tailac752.ts.net (2001-1c06-1802-b100-053f-2d39-17eb-0a08.cable.dynamic.v6.ziggo.nl. [2001:1c06:1802:b100:53f:2d39:17eb:a08])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906684e00b008b1815e30e3sm8418666ejs.117.2023.02.23.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 03:26:46 -0800 (PST)
From:   Kars de Jong <jongk@linux-m68k.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kars de Jong <jongk@linux-m68k.org>
Subject: [PATCH] m68k: fix for systems with memory at end of 32-bit address space
Date:   Thu, 23 Feb 2023 12:23:49 +0100
Message-Id: <20230223112349.26675-1-jongk@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The calculation of end addresses of memory chunks overflowed to 0 when
a memory chunk is located at the end of 32-bit address space.
This is the case for the HP300 architecture.

Signed-off-by: Kars de Jong <jongk@linux-m68k.org>a
Link: https://lore.kernel.org/linux-m68k/CACz-3rhUo5pgNwdWHaPWmz+30Qo9xCg70wNxdf7o5x-6tXq8QQ@mail.gmail.com/
---
 arch/m68k/mm/motorola.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 2a375637e007..911301224078 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -437,7 +437,7 @@ void __init paging_init(void)
 	}
 
 	min_addr = m68k_memory[0].addr;
-	max_addr = min_addr + m68k_memory[0].size;
+	max_addr = min_addr + m68k_memory[0].size - 1;
 	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0,
 			  MEMBLOCK_NONE);
 	for (i = 1; i < m68k_num_memory;) {
@@ -452,21 +452,21 @@ void __init paging_init(void)
 		}
 		memblock_add_node(m68k_memory[i].addr, m68k_memory[i].size, i,
 				  MEMBLOCK_NONE);
-		addr = m68k_memory[i].addr + m68k_memory[i].size;
+		addr = m68k_memory[i].addr + m68k_memory[i].size - 1;
 		if (addr > max_addr)
 			max_addr = addr;
 		i++;
 	}
 	m68k_memoffset = min_addr - PAGE_OFFSET;
-	m68k_virt_to_node_shift = fls(max_addr - min_addr - 1) - 6;
+	m68k_virt_to_node_shift = fls(max_addr - min_addr) - 6;
 
 	module_fixup(NULL, __start_fixup, __stop_fixup);
 	flush_icache();
 
-	high_memory = phys_to_virt(max_addr);
+	high_memory = phys_to_virt(max_addr) + 1;
 
 	min_low_pfn = availmem >> PAGE_SHIFT;
-	max_pfn = max_low_pfn = max_addr >> PAGE_SHIFT;
+	max_pfn = max_low_pfn = (max_addr >> PAGE_SHIFT) + 1;
 
 	/* Reserve kernel text/data/bss and the memory allocated in head.S */
 	memblock_reserve(m68k_memory[0].addr, availmem - m68k_memory[0].addr);

base-commit: b1b5209c1e80a9c9912dfe38986fabbc71a2904e
-- 
2.17.1

