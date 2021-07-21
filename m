Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CFC07E9B
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 11:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25A6661019
	for <linux-m68k@archiver.kernel.org>; Wed, 21 Jul 2021 11:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237795AbhGUKni (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 21 Jul 2021 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239699AbhGUKGQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 21 Jul 2021 06:06:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A28C0610E0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Jul 2021 03:44:51 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id g22-20020a17090a5796b02901763aca3df6so768609pji.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 21 Jul 2021 03:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFUwahSmjzwEO3iNL/tyqfaZAA7mIcEImQPSmKf6ov8=;
        b=Li9+WtqETLBhV/JQP66cuGPV8yJNrTiXyHeIizNhq8dWV4nVxd4XSjGkJnXDTbBpJA
         YnhMbrIYZo/Omzw/W0xqwXwLSYagTZ/FNE+hj6ZUT72g1cyMgnouieKGoAgCu2jY1rRv
         x7axV9bwZbmQNdq+CsMd1wnSIhXBlIN0wQQz+4TQXJC1cKNWdqIhlWLkdm891JnGKdTH
         FODeXsqHlrX2oDe5Kxx8K4oIfKZSgcqQ9OTe0GrNmWCLAVORUARraFefJk5QE3YPpu++
         y3ivxivbLUL8hbaURCWB65C/kHR9+5y76eczMAdSxA0AodrXv3ToleV+2p1L0oGjpreE
         yuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFUwahSmjzwEO3iNL/tyqfaZAA7mIcEImQPSmKf6ov8=;
        b=sT6eGPbiDRUSJ6ga6WksApm8xaO3NcrLekWEjh3jpX1J2oYrVNg84IHtxfwrpT7rG5
         +ThPS2mtX0vBesb1fqNHl4PR8aTIWxw5O3RRfoI81nAtJAs96O6K8sgyq/dLJBh2sV7o
         1aXdVXXYZQ6Pp7HAlLzM0+hnFH0id1/rliL8Gvp080hENL38uSYSr60Z0WXwWj169vOE
         sriY1P7J7EZcNJ3p4R9OUqtfzxxaWiu/DtLSKXDt760fe4r78PQgIKLYCCKdYovcYkxR
         tL4H4B9oGbu/dmB87mfp9Cvn+/uoVyGr4XV4YrQwIgqHWv7BQKc7EDTbMgFivxxevUel
         sItg==
X-Gm-Message-State: AOAM530ZneRTBfsAvu6ul/vjwT7xoVMZ7O5l8DDTOMCYXIh0k4zwRW+i
        /dvZe030Rh/MtEHOisvXuho=
X-Google-Smtp-Source: ABdhPJz4f+r9jmRbY0sqHuYuIM0bdz13iA0DYKeoLSez28UkKZJTjZ8MJmq+aUu1Xc3ZCP1y7KzchA==
X-Received: by 2002:a17:90a:c095:: with SMTP id o21mr34755519pjs.53.1626864290666;
        Wed, 21 Jul 2021 03:44:50 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
        by smtp.gmail.com with ESMTPSA id 85sm26965182pfz.76.2021.07.21.03.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 03:44:50 -0700 (PDT)
From:   Wende Tan <twd2.me@gmail.com>
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc:     Wende Tan <twd2.me@gmail.com>, linux-kernel@vger.kernel.org,
        lkp@intel.com
Subject: [PATCH] m68k: Remove redefinitions of `PMD_SIZE`, `PMD_MASK`, etc.
Date:   Wed, 21 Jul 2021 10:43:18 +0000
Message-Id: <20210721104318.1070133-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Remove redefinitions of `PMD_SIZE`, `PMD_MASK`, `PTRS_PER_PMD`,
and `__PAGETABLE_PMD_FOLDED` when PGTABLE_LEVELS == 2 (i.e. SUN3 ||
COLDFIRE).  They have already been defined in
`asm-generic/pgtable-nopmd.h`.

See also https://lore.kernel.org/lkml/202107201907.lqC6B3dF-lkp@intel.com/#t

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/m68k/include/asm/pgtable_mm.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/pgtable_mm.h b/arch/m68k/include/asm/pgtable_mm.h
index 143ba7de9bda..51653e8216a7 100644
--- a/arch/m68k/include/asm/pgtable_mm.h
+++ b/arch/m68k/include/asm/pgtable_mm.h
@@ -37,9 +37,9 @@
 /* PMD_SHIFT determines the size of the area a second-level page table can map */
 #if CONFIG_PGTABLE_LEVELS == 3
 #define PMD_SHIFT	18
-#endif
 #define PMD_SIZE	(1UL << PMD_SHIFT)
 #define PMD_MASK	(~(PMD_SIZE-1))
+#endif
 
 /* PGDIR_SHIFT determines what a third-level page table entry can map */
 #ifdef CONFIG_SUN3
@@ -58,13 +58,9 @@
  */
 #ifdef CONFIG_SUN3
 #define PTRS_PER_PTE   16
-#define __PAGETABLE_PMD_FOLDED 1
-#define PTRS_PER_PMD   1
 #define PTRS_PER_PGD   2048
 #elif defined(CONFIG_COLDFIRE)
 #define PTRS_PER_PTE	512
-#define __PAGETABLE_PMD_FOLDED 1
-#define PTRS_PER_PMD	1
 #define PTRS_PER_PGD	1024
 #else
 #define PTRS_PER_PTE	64
-- 
2.25.1

