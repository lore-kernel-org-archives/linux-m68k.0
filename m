Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F9FC433E0
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Mar 2021 08:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D4864F11
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Mar 2021 08:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhCEImB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhCEIl3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Mar 2021 03:41:29 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58D2C061574
        for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Mar 2021 00:41:27 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by baptiste.telenet-ops.be with bizsmtp
        id cYhR240060zmvuD01YhRKr; Fri, 05 Mar 2021 09:41:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lI61V-0053KD-1h; Fri, 05 Mar 2021 09:41:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lI61U-00HHVR-D6; Fri, 05 Mar 2021 09:41:24 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] m68k: Fix virt_addr_valid() W=1 compiler warnings
Date:   Fri,  5 Mar 2021 09:41:22 +0100
Message-Id: <20210305084122.4118826-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

If CONFIG_DEBUG_SG=y, and CONFIG_MMU=y:

    include/linux/scatterlist.h: In function ‘sg_set_buf’:
    arch/m68k/include/asm/page_mm.h:174:49: warning: ordered comparison of pointer with null pointer [-Wextra]
      174 | #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
	  |                                                 ^~

or CONFIG_MMU=n:

    include/linux/scatterlist.h: In function ‘sg_set_buf’:
    arch/m68k/include/asm/page_no.h:33:50: warning: ordered comparison of pointer with null pointer [-Wextra]
       33 | #define virt_addr_valid(kaddr) (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
	  |                                                  ^~

Fix this by doing the comparison in the "unsigned long" instead of the
"void *" domain.

Note that for now this is only seen when compiling btrfs, due to commit
e9aa7c285d20a69c ("btrfs: enable W=1 checks for btrfs"), but as people
are doing more W=1 compile testing, it will start to show up elsewhere,
too.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued as a fix for v5.12.

v2:
  - Fix bracing in MMU version.
---
 arch/m68k/include/asm/page_mm.h | 2 +-
 arch/m68k/include/asm/page_no.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 7f5912af2a52ea0a..9e8f0cc30a2ccb9d 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -171,7 +171,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 #include <asm-generic/memory_model.h>
 #endif
 
-#define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
+#define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 6bbe52025de3c5c6..8d0f862ee9d79532 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -30,8 +30,8 @@ extern unsigned long memory_end;
 #define page_to_pfn(page)	virt_to_pfn(page_to_virt(page))
 #define pfn_valid(pfn)	        ((pfn) < max_mapnr)
 
-#define	virt_addr_valid(kaddr)	(((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
-				((void *)(kaddr) < (void *)memory_end))
+#define	virt_addr_valid(kaddr)	(((unsigned long)(kaddr) >= PAGE_OFFSET) && \
+				((unsigned long)(kaddr) < memory_end))
 
 #endif /* __ASSEMBLY__ */
 
-- 
2.25.1

