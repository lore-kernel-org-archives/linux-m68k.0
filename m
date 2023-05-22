Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F4FC77B75
	for <linux-m68k@archiver.kernel.org>; Mon, 22 May 2023 07:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbjEVHCg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 03:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjEVHBd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 03:01:33 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B296419D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 00:00:53 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af1a7d2f6aso48824371fa.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738852; x=1687330852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXvb5TDUzvESWFR9QC/PoBRtJqf1+F8aU7D/u9pREy0=;
        b=OtttQP9k8xlpdHUIJVQBj8OckJ52gXzjAKfZrO75yaomv2Kiy+b4fjJvIwaykOdpkr
         usJaUK3rXE5surL3MPXnlE1TEJwwCby96MhbkYqN1mF6zVB6zp2XsGhjdCbv4XVJE6/s
         T4ni/jV8YaVyRAd6JB8iNtxkvmPyKAInGhO77viNGA33qHHTOTMSjoPo6kYmfoiQK12j
         iDtwhnWm7qBIe6BJff5uUa9Mw7T989YyEmwWpkc6B/+u6Lc+aAkLc1d4kRY6SMY63VU7
         hmiPvpMUPJTmQnqUoOO6sf1NrZ+OQ4se37lsy0EYUsaGwaOuyi19yVC4YL6wRFmh7WLu
         cHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738852; x=1687330852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXvb5TDUzvESWFR9QC/PoBRtJqf1+F8aU7D/u9pREy0=;
        b=GqVWzA8yUNO4QNSszivCB5qC11f1W8uh+FbtWS7jXnKd0NofA7IO07U3+NflnuY6xE
         nXhWgUDCe+pA9wnPeWBPQDkiAzPd958MsxmKMJzKJbZbPAeAFceG0QWiqwQGNnGW3vYk
         Gq8T8OSvENIxBNfiGtP8kGrl+hzeDSmIhvZ9zpdC2X8+SeVMkXrce6gxF5iPHPfQAgVa
         y/vbyVNmRU3EJ+Z4O7wRBTHvtEbAqeHaEuv6kGufpX8AR92wyCTqikGTO83HuouL4cZb
         TXofAx4wtsuEBnnHSH3He7yfSyUoGdZmqQRW8vSxfFAFIrq0+8sXYfh1iYCOnAZqN8xO
         1yOQ==
X-Gm-Message-State: AC+VfDxppIYDDIW9sXex8IFsjm0gwUwXjS5EOCkoW2aN1Nxqt0QM2xRD
        x8VVwDwpgJoPpuXzdsp805XWbA==
X-Google-Smtp-Source: ACHHUZ6viiMuZL/2m9fCattsKp8aF3UuUuFyad4eQQVghG4ZKIS+G1y5wT7bo/adt7XE6wIs5M+wEw==
X-Received: by 2002:a2e:9f42:0:b0:2af:19dd:ecda with SMTP id v2-20020a2e9f42000000b002af19ddecdamr3543683ljk.45.1684738851937;
        Mon, 22 May 2023 00:00:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 May 2023 09:00:47 +0200
Subject: [PATCH v2 12/12] m68k/mm: Make pfn accessors static inlines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-12-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry, do the same with pfn_to_virt().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/m68k/include/asm/page_mm.h | 11 +++++++++--
 arch/m68k/include/asm/page_no.h | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 3903db2e8da7..363aa0f9ba8a 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -121,8 +121,15 @@ static inline void *__va(unsigned long x)
  * TODO: implement (fast) pfn<->pgdat_idx conversion functions, this makes lots
  * of the shifts unnecessary.
  */
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 extern int m68k_virt_to_node_shift;
 
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 060e4c0e7605..af3a10973233 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -19,8 +19,15 @@ extern unsigned long memory_end;
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)((unsigned long)(paddr)))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 #define virt_to_page(addr)	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
 #define page_to_virt(page)	__va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))

-- 
2.34.1

