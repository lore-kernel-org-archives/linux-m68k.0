Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1E7C05052
	for <linux-m68k@archiver.kernel.org>; Mon, 31 Jul 2023 17:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjGaRIn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 Jul 2023 13:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjGaRHM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 Jul 2023 13:07:12 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F0D26A3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:47 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d075a831636so5107690276.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Jul 2023 10:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823078; x=1691427878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=bucd5YCHLhUvx7sCV87tgBpS/yvMqV1hEBgLcIdtkbm6tehUvQ4b8S8cGlWi7/sHjP
         BwMI7RjEZDCFEoZqNSu1BeMgh4cbrdk5jNpPQbDjyiWAygQ6GF4RuUGGOqf6kg0VdfDp
         NpGCzdPUkKHCC4r7KLVhXjv8laMIW1vLz9Hl1FxyK0cd8KUbq0iEAg4q7XF5QTVPGxVT
         zofHi8CwcgETUVRV13Pib0COy9kOuveisGg57GrFHsyYwDdtVuj+zN7pcxA+niXzYe26
         MUnkSw5QHmNGRsesWl9frKtr+MQAPLnxo4yz7glnwyiVSVRMIHwbjCv+Zju9S3AQsrM+
         fRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823078; x=1691427878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=DZcoQ2cSUB5UyBv46FEH3AiV3uxQUNX9YrDOewmsp9Rs3Pcfl5b0aLW0rddslPCX7o
         ul9o9VqVOoxsNVfG3LwQg3RG3FpYwdYfuQZ/7+Ku+PDWSmcaesbdT15tkPH9CuSbfhRi
         MLBr5q8Bu0avpWEyeWAray6STO8KXO9x00JwMMFl0xng4ydApYpaF3WPfiu/Ml/nyW4f
         zEB2SZFqvjHwaBvXrL2QQs/d64mkUbuwqvnsvBpeXkswmsBMkb60TuCznB2epWHdgW72
         q711HTcMHHWCh/SureypgQ0pZY7jCtoDFIR0EvTaYFyizvk7vJqcX5uYeFVTWAvbaFEZ
         prQQ==
X-Gm-Message-State: ABy/qLZHPK3H0pAQ/JwGZ++037oBUvmvmyXt10fSAlbQ8bWS8HFeJifd
        ZtsLm1XEvRiuv4jO8Ib9Lo0=
X-Google-Smtp-Source: APBJJlH4kzdzBzRUIaE/50pCy+wwrgbHVj7GhIP0EpKNGW/07mJrSi1SmuvJmvqLlmEJ9bXKX+N7ow==
X-Received: by 2002:a25:2496:0:b0:d0d:f5f3:d2bf with SMTP id k144-20020a252496000000b00d0df5f3d2bfmr9661709ybk.48.1690823077914;
        Mon, 31 Jul 2023 10:04:37 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:37 -0700 (PDT)
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
        "David S. Miller" <davem@davemloft.net>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date:   Mon, 31 Jul 2023 10:03:30 -0700
Message-Id: <20230731170332.69404-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..8393faa3e596 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!pagetable_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		pagetable_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.40.1

