Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0BCC001B0
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Aug 2023 23:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjHGXIn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Aug 2023 19:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjHGXHL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Aug 2023 19:07:11 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8231FEF
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Aug 2023 16:06:17 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d4789fd9317so2925204276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Aug 2023 16:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=gXJTXcEvyVT7IoetVDXBwB8IPw8UIwzytrLAqRYME0pNQ9C4uggCnI6RPeBYUmiABc
         NGa1RjP9x6Az35hUll5l4sYYgp98uBkULFey+10bJthE9R/J1BfMB4fjSuNmCpJ1YXG1
         ARmLg59bINaXUvevzM80HySnkL9LRFKwNZ83rXMUa4P0U6g1vYwZDB00ToF81qaBEF1+
         SCcl4G/9B02tlTVDHjLxfkMGL5hqppCgW9NlCKGjCO3XjVlW37imlXi2cPPjZHQnQLsK
         WyhHmorW6P7DI7CdyMJrfi88WQs4xcY1ld9fhabvXIyG+tqrpY5PfVFDlBq81eHbR+r8
         HFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449559; x=1692054359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5tIdqLMLMEIndKmulGbjbVGcWP2eiFuISuM6iDOZlQ=;
        b=EYNX1CGJhoD0vJrSOIsjhliJ0ZjYGw5pdtwmQ4hhsYEg5d6N6E54Iy71KONt+Io1CB
         uaOOcYdapaH95MGwSwwo09btvduL9gFNqpXqmXsZSfQU98+ffkOysqeCSCEB14K8w7fO
         jhW5EivO0GHvZXU9y0IuJxo6W1EUL3Ot+AXq8Ez84VgQDvDu2jS09ZHKK49rsQTBijK7
         nqSX1c4PNcTDxbrgbqHcCXcvWGitFYNtp43ieDqGkXqecb1omf/FrSClEXjh/6ydyJ4i
         SjUq5+TCYk5O8WiRzNWEVS5dPmvv/ciSTDu1lVs6lPjZb0IMEOv9t8U+tiyCIUhTCeNl
         lvZw==
X-Gm-Message-State: AOJu0YzUYAA0j2+CX9rOQhSIzNIDqMlNwhHxCYM2w/d4Iv3Iy8MsnaTi
        qLBxpg3IjGrXlj5qPpq5plE=
X-Google-Smtp-Source: AGHT+IHgbeu9fOmMS+FNlr/kvyOX24cSJUZ4nRlF6aWfNWe7W/NjYriU1Zmx+jVELg0QXXl18qiXKg==
X-Received: by 2002:a25:4b81:0:b0:d4b:ec36:bb85 with SMTP id y123-20020a254b81000000b00d4bec36bb85mr7290071yba.50.1691449559015;
        Mon, 07 Aug 2023 16:05:59 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:58 -0700 (PDT)
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
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v9 20/31] hexagon: Convert __pte_free_tlb() to use ptdescs
Date:   Mon,  7 Aug 2023 16:05:02 -0700
Message-Id: <20230807230513.102486-21-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

