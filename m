Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237D3C001DF
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Jun 2023 21:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjFVVBu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Jun 2023 17:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjFVVAm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Jun 2023 17:00:42 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD182964
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:59:13 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-763d6e8e286so178690985a.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jun 2023 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467519; x=1690059519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=BLHldLJJqXLpr8GAfoHi79v0sph0w6vN/SuJg9rBXjFWP7vHx2aGmaKx+f9hTGSIek
         StBGUDmlBLLgONen/ouQl25e+2Oh56rCFDCpMgFUEQOkNNTjcxLzf4Qpme/gK6EBGlEV
         uCg8bxuRbLrdLb22VpaeGfLLJwjdPeKaXRkjf+OAYYySwTDsQSI3SAbqeNXGAGljALee
         fcpdhclAhH7b5XES0gNbsvIBabKOZu9Ga/PYBeMD7nv08Dx2WAP2VJoEQ2QraVWTFN45
         Wt/gJDKXfFk6SzeY9rfcZjQwBqyFukcCgFCguNA0XxXJLEGG2f88pPraJdoTC9IQG6ul
         Gb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467519; x=1690059519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=eCsvDvLV2NlH+qEHdDMEI6itDR/msLiGQSplp37dGSNQ8OIdqUIuzW89aXRbWbDSmj
         iLcd7W/hVAN4wabjOY7i0dT85J41quAfmpQ415mwgdMnRObB9bBgnOQMXu7HILQdSLtX
         wHRmOvu9X5OFSQ0z5EtYgBfbrz2TFpzmztARzN+oGZEczA1b2SZbkCK2SiVl2+kbvASP
         zWZ+41X1WqUV632WmdCrUdk/4gUo6r41GcXqiRK6Ve96sh+TZ3S7G5a4LNc9oHWXtRlg
         vnVde4SmuWVX4liMqth/0wIxeqCZm/yXgdcudvkXFOhOnAsZsURGJmisxDriRmN5hS0H
         QYkw==
X-Gm-Message-State: AC+VfDyD314vQ9qENp5OEYgVo6xi5gVMEr/BdC83tuKjkCYVwljcthvz
        AKdUKTr/aoLSYtES5uVW1tc=
X-Google-Smtp-Source: ACHHUZ4KRcOpBQjT0rqr9douhR2m3+ahnRE2h5Kbx3P/xMpW7X3b4hHm7K0gMXBTqIp4OFz3bRB+Jw==
X-Received: by 2002:a05:620a:2cc1:b0:763:d981:d0a0 with SMTP id tc1-20020a05620a2cc100b00763d981d0a0mr4781474qkn.38.1687467519407;
        Thu, 22 Jun 2023 13:58:39 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:39 -0700 (PDT)
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
        Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 21/33] csky: Convert __pte_free_tlb() to use ptdescs
Date:   Thu, 22 Jun 2023 13:57:33 -0700
Message-Id: <20230622205745.79707-22-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1

