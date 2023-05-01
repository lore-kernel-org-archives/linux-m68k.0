Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34801C87FF2
	for <linux-m68k@archiver.kernel.org>; Mon,  1 May 2023 19:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbjEATbj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 May 2023 15:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbjEAT3q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 May 2023 15:29:46 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACAF2D47
        for <linux-m68k@lists.linux-m68k.org>; Mon,  1 May 2023 12:29:24 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1aaea3909d1so17754455ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 May 2023 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969354; x=1685561354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=sCYdFD4O8Had2jReQPDULWIb6jXMWTBVOP1xIsSQDJFrjK4Unzq4xPir2vv9xD60ba
         KhnmERHxh4wjne9PTfzHFe7mUKtGQVGSRxsSTI7oGHQc7fKexIRwy4BhAuhQWGLGw+L4
         jhaBOvefDEjvTltxe1zcg9AOJCenWnwtbQvW8h9UKrmrEmLrYzROLydP0XMIyNyplCDF
         ksvZ9Q2L1rfMSznCSwk+WHikKvzxa7zVAjndA+MUieyvTGKh0Hnkx2VWar6ZLI/SEpj3
         zJ2Emm1btVtqn0B7TpGayRWt9h4mLeUHtWruxn5Hxr1lyas/Ibpq/YOzX0vO1bUnoNNT
         ju/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969354; x=1685561354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tniPUuVL526Jec1TVIaHRLAUx7OruO8jRIKlA5wqt8Q=;
        b=gejSy9Njs4520lksOlxc+TC3mS/yCT2/nqRHtIHBleGw0fpCtbifHz/eKIsfSAfHkS
         hhYgyGusfrzzWx4wE/I/Zqki4iXWdu8Ymi3risC7WyzfIfsWVWAYLBDrvJQT51Aju7mC
         Ob/evTzEWUSq/wN8SnzaU8Ovgtr48QqXQBt7zyI67cMCnTfJ3ozvBBYnb3pgg4iC4/e8
         6qk1JNSGNQnxgU70hFPVSbJ5CmpXSPeCnxk8gdXBbPXqYbFCPVO8FxF4TaGQNtYewZh2
         xTnq6KjEScoqc7gCm6InSjkDXQHXydgdJ6qFdRAsDgI7sgD1zk4zAEG8mR9I42NboR/f
         0Btg==
X-Gm-Message-State: AC+VfDxAhSvEcEfPy3Bg+IZd3og7PVqR/lBJwbByy+dLtYepdfiMQRRD
        i2IYDURZ5NQiY5VA7KQM1+Q=
X-Google-Smtp-Source: ACHHUZ6fkDxKllaaORZgzXEjR5COvh0uqYIPMfHZHm801Tjdn3OT0QOppKb8hXtDeBwjumbd6cc2Pw==
X-Received: by 2002:a17:902:c411:b0:19c:d309:4612 with SMTP id k17-20020a170902c41100b0019cd3094612mr20785827plk.6.1682969353666;
        Mon, 01 May 2023 12:29:13 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:13 -0700 (PDT)
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
        kvm@vger.kernel.org,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH v2 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date:   Mon,  1 May 2023 12:28:22 -0700
Message-Id: <20230501192829.17086-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ed868f4c0ca9 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		ptdesc_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.39.2

