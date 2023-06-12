Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AADCA9ED9
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jun 2023 21:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbjFLVJH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jun 2023 17:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239419AbjFLVIX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jun 2023 17:08:23 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB5A420F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:48 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-56d1cb6a607so20229087b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jun 2023 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603947; x=1689195947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSn6cSkj4IeRf8/BsqHClLl3fDsZeC4rpAPYblqUB6Q=;
        b=ciZzI2nnG7zqntS0kYws3Bstzr3nXcXM7AVbRLfJcQTue8B9i+jyLvzKLDy2A9P30Z
         c8kXhocxLYHnQ/QqwZQBscO/Jnyd5DcosG/E4dwS3uAecJsY0Ja9Z3xqw7MsgC6nHjA4
         QA0ciLqLZYMqWOytaJmxjnukXuzthDnZTPicAtRgEtVTuV0GYf1zJiBPTow39XMnG090
         B3bVtajux9wQLuem4VZP38wdaF1Bx4OpAJ5RgPldzLuFMNXFpzdfCqZWClGqvnQMYt00
         /HHhjhqAxABJiO4Fj5XqD6Wx6l8ZOt09hebTgkaibUDXMgVCd7dGCAjsjguwOTWs8p4I
         GZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603947; x=1689195947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSn6cSkj4IeRf8/BsqHClLl3fDsZeC4rpAPYblqUB6Q=;
        b=IbDj8sIucXM1ZGOKxc+ETruDelfY57zQBplr9pqB5e1ukIj5NDgI1GmPDCunMzcqiq
         8XPKqVjtSTvfuVfGifWQF2J7QseLLUdCU8zKrSOc3gYFPpETJw5gfLelS32X74R0x4B1
         8F7++LcfKN/m+ZK+p2WKvUT6ys5lLbWcfGaEwn1xFnXF7YINfHkrHiETNiRXaTTEkoK8
         6HqXKbtJbO2XEJUDIB8LSO0zMrPWF1SzR+rQZBiLGtCjXqO65hS+cwM9WTbND6wdB7zI
         ewqDSzar4yUf/ubWxR3qAGvRzjDO8yRSyEcjoF1KhNd7Gz6Lh7rPRVERQZlfC4R3M024
         aOFw==
X-Gm-Message-State: AC+VfDyaycV3muYtrmokxt+Et0wkgfGQdlAQDDT22wzmkRP2z+5PAdGF
        C0F2anPGX+UL3V7ka4cLVto=
X-Google-Smtp-Source: ACHHUZ51WXkZSpSQz/Euz4h9t2P7hzzB/r3I54c+WRfw9gtRQcMJQg//XHj3D4qG81G3nuV3fW1fKw==
X-Received: by 2002:a81:49c7:0:b0:56d:540b:ed07 with SMTP id w190-20020a8149c7000000b0056d540bed07mr513566ywa.48.1686603947200;
        Mon, 12 Jun 2023 14:05:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:46 -0700 (PDT)
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
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date:   Mon, 12 Jun 2023 14:04:19 -0700
Message-Id: <20230612210423.18611-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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

