Return-Path: <SRS0=pQ+q=BH=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F78C43459
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jul 2020 03:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F5C9207CD
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jul 2020 03:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbpL9/1A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgG1Dey (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jul 2020 23:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgG1Dex (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Jul 2020 23:34:53 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59C1C061794
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jul 2020 20:34:53 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id r11so2283093pfl.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jul 2020 20:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H36cGMxHQ8BRm6wAF0579NyVmdPCO4iD8RgcvZW00go=;
        b=ZbpL9/1Ay/N9a5W5SHzbKHeCmcXXyhgdUM1zeQaWohbRyeJkrKXcxd+Tgh12sMDZuI
         moTVnVoeT0/WcuXz1Fvqm1fRKZ+6EcG1BRkppL38LtfukqCrGWniBKUagXbrHNvgddXB
         5O7KUvItxpvNqrX1BlhQS6QBB3JPYVEKPpGLHbMD41QJfY3m5dZKzO1TVAOcP7xndLSM
         gjCrZJbmiFAfk89S9O2q6cjg9orGY1gODQZB+bAECk//GJCoe8Upi3yPoNJ3jZELQLVV
         G12fEtcevoV4SOnILf2SpvUvHxG4Q7n6zc9fdsD+bRtSmamMlj02wT10XENLMTGLDmUf
         vwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H36cGMxHQ8BRm6wAF0579NyVmdPCO4iD8RgcvZW00go=;
        b=iIqbtHCkVl3qvUB0YULNsRIcvVKlKfGPoh+nVnd/1uW0gzJy8LPSKPFG5yCWQdUL03
         tZcP9JrMa4ps/JH7z1eYUOWjtbJjEgKAZGIzHhoVN9om+NE2Yi0jEsIz0SY4DPl62F4b
         s6/im/M1kTa4rCWDyph1+U+wQZHzALeV+7r02RfVxMn4znHljpOA40Q3h11ttPXhqYkL
         s5KjOy7XUKXpVFfLJ0W3b1zDyRcwdgtJzlCNfkd1B2p8hRtwvQWdelOsjH6ZMc9jM7nz
         RdjHZViW6Qe58VBKZh9L3ULw3D9QGoCrqzjjTGfITmZhnlGGQBD85PfYbWVQhuMl78oJ
         ex4w==
X-Gm-Message-State: AOAM531DNo/xrP37b379T/eEMYpj5sUhUOJyaFaaylisotpCxUx1l9B3
        ui4pE7Fw+zjShAOY0msi6PM=
X-Google-Smtp-Source: ABdhPJzJR5NRXF3FPFa4PxoySWuPRzG3iBzf77Gh7wQNEZ7DHgBwvAi63TXh9kJn8Ls/uFAlU1Z9vw==
X-Received: by 2002:aa7:9ac6:: with SMTP id x6mr22895541pfp.326.1595907293192;
        Mon, 27 Jul 2020 20:34:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
        by smtp.gmail.com with ESMTPSA id r4sm998707pji.37.2020.07.27.20.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 20:34:52 -0700 (PDT)
From:   Nicholas Piggin <npiggin@gmail.com>
To:     linux-arch@vger.kernel.org
Cc:     Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: [PATCH 09/24] m68k: use asm-generic/mmu_context.h for no-op implementations
Date:   Tue, 28 Jul 2020 13:33:50 +1000
Message-Id: <20200728033405.78469-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/m68k/include/asm/mmu_context.h | 47 +++++------------------------
 1 file changed, 8 insertions(+), 39 deletions(-)

diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index cac9f289d1f6..56ae27322178 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -5,10 +5,6 @@
 #include <asm-generic/mm_hooks.h>
 #include <linux/mm_types.h>
 
-static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
-{
-}
-
 #ifdef CONFIG_MMU
 
 #if defined(CONFIG_COLDFIRE)
@@ -58,6 +54,7 @@ static inline void get_mmu_context(struct mm_struct *mm)
 /*
  * We're finished using the context for an address space.
  */
+#define destroy_context destroy_context
 static inline void destroy_context(struct mm_struct *mm)
 {
 	if (mm->context != NO_CONTEXT) {
@@ -79,19 +76,6 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	set_context(tsk->mm->context, next->pgd);
 }
 
-/*
- * After we have set current->mm to a new value, this activates
- * the context for the new mm so we see the new mappings.
- */
-static inline void activate_mm(struct mm_struct *active_mm,
-	struct mm_struct *mm)
-{
-	get_mmu_context(mm);
-	set_context(mm->context, mm->pgd);
-}
-
-#define deactivate_mm(tsk, mm) do { } while (0)
-
 #define prepare_arch_switch(next) load_ksp_mmu(next)
 
 static inline void load_ksp_mmu(struct task_struct *task)
@@ -176,6 +160,7 @@ extern unsigned long get_free_context(struct mm_struct *mm);
 extern void clear_context(unsigned long context);
 
 /* set the context for a new task to unmapped */
+#define init_new_context init_new_context
 static inline int init_new_context(struct task_struct *tsk,
 				   struct mm_struct *mm)
 {
@@ -210,8 +195,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	activate_context(tsk->mm);
 }
 
-#define deactivate_mm(tsk, mm)	do { } while (0)
-
+#define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev_mm,
 			       struct mm_struct *next_mm)
 {
@@ -224,6 +208,7 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 #include <asm/page.h>
 #include <asm/pgalloc.h>
 
+#define init_new_context init_new_context
 static inline int init_new_context(struct task_struct *tsk,
 				   struct mm_struct *mm)
 {
@@ -231,8 +216,6 @@ static inline int init_new_context(struct task_struct *tsk,
 	return 0;
 }
 
-#define destroy_context(mm)		do { } while(0)
-
 static inline void switch_mm_0230(struct mm_struct *mm)
 {
 	unsigned long crp[2] = {
@@ -300,8 +283,7 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, str
 	}
 }
 
-#define deactivate_mm(tsk,mm)	do { } while (0)
-
+#define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev_mm,
 			       struct mm_struct *next_mm)
 {
@@ -315,24 +297,11 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 
 #endif
 
-#else /* !CONFIG_MMU */
+#include <asm-generic/mmu_context.h>
 
-static inline int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
-{
-	return 0;
-}
-
-
-static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, struct task_struct *tsk)
-{
-}
-
-#define destroy_context(mm)	do { } while (0)
-#define deactivate_mm(tsk,mm)	do { } while (0)
+#else /* !CONFIG_MMU */
 
-static inline void activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
-{
-}
+#include <asm-generic/nommu_context.h>
 
 #endif /* CONFIG_MMU */
 #endif /* __M68K_MMU_CONTEXT_H */
-- 
2.23.0

