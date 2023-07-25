Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A19C07E8B
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 04:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjGYEZz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 00:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjGYEYm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 00:24:42 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7640835AC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:05 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d07c535377fso3253638276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 21:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=GBQqKOXR4MY0Ps6Ytzn9QjLc5kcnNARqYVMOSqCl4nxxP5zueTINjr7iMbjZhk8uU1
         uF+ZNdDLWemlb8QXVTn60jLorPF4KaxuajyPq7XQ8ZCUpgrsfyxcNU4aZsjJHBdfgv4V
         f3SehFOrdMCWYaV3GNfOxXZlwwtfQps2pLwSnw0r1MZbny4VXC0cZl+5ECg/uwswSkJJ
         2spe5/EA1yI0VqTuQ1Drr9GEQcMwkhM/FKbElCEbuZdJkSdi81Zbahgosic5IMYJMWsY
         zz7YF2FVGFBOrfl6ZnWHbV39qhmx668oKEAvnRRKMjMLLqABK50UfsT2Oc13y2cvxYxd
         xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=as9/3Z3i7sg3lctPb9IoaVrZ0K6DPhp05LQZ+ugBbOfasBTHl+GdY8PFtKSqrCH6qO
         HreivLbjomjn2OkoITldVTwObxA4Yiu7hhhymo+/5tyUveQni6dFTgU9LJWU4pMv7GqR
         dDIAAhv6N9VrTlqZLoHroIfaCHrFEU5/CQFXUiHR4trTA1QW+wvKx1oTd4c39JIlmwll
         3Q8Y7XtoLu2fBa6IJ+b+IcJdj+CTaOlKXTSsPQiBxHfDOB3shln6XpFetoTx/AaOTuL7
         58hrVINHrhe7cF+W5Qwvb705aKafEgKaZu0EdkK0LSkn6qK1LdLXqNiQZbBBBrkNyspE
         Dszw==
X-Gm-Message-State: ABy/qLZuJTRLXZTNH1mhilq3gXaJzW+ebRRdlP31p9T1tmRtfKsZKWVY
        ERJ/HfXaxifULkU6G+IurUk=
X-Google-Smtp-Source: APBJJlFIEKBO4FnrV/9ajkbTKUo/vEdRCYW7kk6X3z3g19puIv3mx6us1kMtRHRFLnY2I/2ODsKhEw==
X-Received: by 2002:a25:2309:0:b0:d0d:2d82:7a27 with SMTP id j9-20020a252309000000b00d0d2d827a27mr4389099ybj.13.1690258924402;
        Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
From:   "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
        kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date:   Mon, 24 Jul 2023 21:20:47 -0700
Message-Id: <20230725042051.36691-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1

