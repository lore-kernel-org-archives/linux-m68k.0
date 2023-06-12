Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1FFCA9ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 21:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239633AbjFLVJF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 17:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239328AbjFLVIS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 17:08:18 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF62F1FC7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:43 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-56d549284bbso2191227b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603943; x=1689195943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=iC1t7ghfm9ecJs1x+mmEzeWS2SIjJKEgK7bxy4oucR/f+MfVZU1qsYKmxWlYK3St5v
         mfNdwnEbyVpOCAZkZBQocohQ9uTAKfouC9/50tiV+ofF8yr/r0xQFvh1fNWAqMX4eSyF
         ymqrJp033zjJJcGcMzZXmmZ/yN236luhBhvJ80nOlgUY6UjLfyMIfHGDH4uYCDgG1Yuw
         Qj+o3ciesPmzibkl2iqbskrx7aUBCJV6cn/sc9mp4OIhLm5DRTHYxNGTzKEY2jXsQ3j0
         sN44pjWt5AeKRt8Gf4eHzyt1HMP4kxf4IL2Kuq0LJJYg24qsvy+zvN4scp5/4UYjNDhu
         bvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603943; x=1689195943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1x1J4vur13K6ienQiLVxExje9aLbKUsjVFvIhcqO10=;
        b=W4tizxs/Xlv4GaMpCmQeyoRwpaMTSPrTCyNnwY0bJEOq6jp1dWaUP6Rp7e0s33TmGl
         A49b56EHbZr16yWoljVPSUmITnqwgj+vdIPVuPSCbjwRcSHb1K+yfOYimalrPkputQoi
         MLKqjX9rhFP4DMX4WU62Oi17milIeCbDj/XmW3oEzJ8E4gC9Xxqn71ESNYHZo3GbI9zA
         /98ZmK63EVdUDA6fk8Vye/NY4eIUZfvCjFtXoihOSb/AOEMhFycvYW2zyhIdnBtMYyb1
         vwKO/ymvSKwGsOUkLSMSdu/KgZBlOe2ioi5ifvOVnVEXpXfSjqgtlB1klSPCBnSErj5H
         cqJw==
X-Gm-Message-State: AC+VfDwdTzTApl92S7NvK+2Ovnwzlrt+61X2PI/IU3PX55fxQMRDzfDr
        G/706N7O7Dg4kNK6DQtmbqI=
X-Google-Smtp-Source: ACHHUZ6tVrzAvnvTdjXheXo4jZ8pT12rQpXHIkWfs+xqz819sAsyiOSj5h9nxDMqGOKxFovlbUa4wg==
X-Received: by 2002:a81:7542:0:b0:56c:e706:2e04 with SMTP id q63-20020a817542000000b0056ce7062e04mr7796917ywc.0.1686603942966;
        Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:42 -0700 (PDT)
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
        Jonas Bonn <jonas@southpole.se>
Subject: [PATCH v4 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date:   Mon, 12 Jun 2023 14:04:17 -0700
Message-Id: <20230612210423.18611-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

