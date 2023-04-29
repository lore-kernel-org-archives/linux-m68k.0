Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EAAC77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 08:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjD2IES (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 04:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjD2IES (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 04:04:18 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA50B2136
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 01:04:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-528cfd36422so331715a12.3
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 01:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682755456; x=1685347456;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsBP+wutLRXlIXdeB4CEEQZsUb/37ITQ2koaLU5T6qQ=;
        b=psPn6YzcTrANeXobSYPbREqDMagdyV8xnUx4+ngeSCsVRPAh2Cqz+gNwAgPSItAhOk
         dDpmR6yxsLxif5oAE0ek9RFph3svjegXxZpt2o11s9QrYVTzw2++jKgORzMlLJXxhEC0
         i9T7h7Gd6HgOtjMMzqcncOyn/W2TbS8SIvFiN8fxrMgRcWS17PlJGkFDkHpL9ISSvGhM
         VLdGGmyr7xm/WPqPqGSdLk+N90jgdnV8zvzA4JXh1UOOrvWG+hk80QP7IRFy7T5AS+Z7
         wswiDNziD2jMIABBQAd13UR/LE6dAilA5VG9ViOvTrOIl00afYf6tANDZOeWFfOnI35I
         ay3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682755456; x=1685347456;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsBP+wutLRXlIXdeB4CEEQZsUb/37ITQ2koaLU5T6qQ=;
        b=JsKz1IGmrECEg5ttiLPSXKMAvMUFOZEuAUmUtVV0LXST15p2zYzLhvUOjlgXNDnmEL
         GlpQQs8UKRYjktBjCglF5cjphKAYfIduecCe7MVMacYO1RtnQnN44LjViVGk5MdPmsEA
         IrI5ILJXq8z/t1a8ZTOHsxd0eYNUfFr8qiyFyF1lvRcqClWbpN83TVFMdtftAZf4ZvqF
         aZUtuogFzfGY+G9fvprDaPmOhB39ewLRU/phRbuB85vZT1pkDIQmhY2p5hvY5KTgVUlH
         Omu/z5l0RqyI/XPI732SFsjm/j8CjlVHEDsvNdsT21peHy/26WHiNHTiAr54FDRRfCBT
         lJow==
X-Gm-Message-State: AC+VfDysE6o8ldCMxsN6d9R5WP488dDHeaxvwz4Xb576+9ZPI1jSSRvJ
        nqSlN0xuRGoNteJMlMVJalQ=
X-Google-Smtp-Source: ACHHUZ7xRQ6LFaNW8g7Llcp2LJaQ9yrZULSr6L1Jn12v83JiNUE4WW8fKSNqmNHBVAuYCpzmvkiauQ==
X-Received: by 2002:a17:90a:ab88:b0:23f:abfc:5acb with SMTP id n8-20020a17090aab8800b0023fabfc5acbmr7950241pjq.18.1682755456167;
        Sat, 29 Apr 2023 01:04:16 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a520a00b0023fcece8067sm2531052pjh.2.2023.04.29.01.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 01:04:15 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id CC47836045B; Sat, 29 Apr 2023 20:04:11 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     schmitzmic@gmail.com, Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Subject: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid stack corruption
Date:   Sat, 29 Apr 2023 20:04:10 +1200
Message-Id: <20230429080410.8993-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Inserting a gap of 20 bytes avoids user stack corruption
due to a discrepancy between user stack pointer and stack
state when an instruction is interrupted by a bus fault
in mid-execution, in particular a movem instruction with
the user stack pointer as target, such as commonly used in
the function prologue on C function calls.

The user stack pointer in this case reflects the stack
state before the instruction, but as many write operations
as would fit while on a mapped page are already written out
at that point. On 030 processors, the resulting exception
(format b) causes the instruction to be resumed, not
restarted after return from exception, and only at that
point is the user stack pointer updated. We must not corrupt
the user stack by writing beyond what's already stored to
the stack, and using the pre-execution stack pointer to
place the signal stack, that is exactly what happens.

We have two ways to address the issue: avoid running signal
delivery on format b bus fault exception (as suggested by
Andreas), or insert a suitable gap into the signal frame to
avoid it clobbering the stack contets.

Inserting a gap into every signal frame indiscriminately
does appear to cause memory leaks or excessive memory use
on low memory systems (been there ...). Some heuristics
is called for to only use the frame gap trick where
appropriate.

We can use the format b fault address in frame.un.fmtb.daddr
to find the address where the fault occurred, i.e. the
address where the instruction will resume. Addresses
above are no-go, anything up to and including the fault
address is OK to use. But we better make sure that the fault
address is actually on the page below the USP, and that the
start of the signal frame will end up on the same page that
the fault occurred on (again, been there). The latter might
be sufficient to ensure we're not hitting an unmapped page
when copying the signal frame, as the bus fault will have
been resolved when we get to signal delivery (??).

The bug that started this debug effort was reported by Stan
Johnson. Finn Thain developed a test case and debugged the
stack corruption. Fix developed and tested on my Falcon 030
with just 14 MB of RAM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
CC: Finn Thain <fthain@linux-m68k.org>
CC: Andreas Schwab <schwab@linux-m68k.org>
CC: Stan Johnson <userm57@yahoo.com>
Link: https://lore.kernel.org/r/CAMuHMdW3yD22_ApemzW_6me3adq6A458u1_F0v-1EYwK_62jPA@mail.gmail.com
Link: https://lore.kernel.org/r/e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org
---
 arch/m68k/kernel/signal.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index dfc7590abce8..75f4c4943231 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -858,11 +858,23 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
 }
 
 static inline void __user *
-get_sigframe(struct ksignal *ksig, size_t frame_size)
+get_sigframe(struct ksignal *ksig, struct pt_regs *regs, size_t frame_size)
 {
-	unsigned long usp = sigsp(rdusp(), ksig);
+	struct pt_regs *tregs = rte_regs(regs);
+	unsigned long usp = rdusp();
+	unsigned long ssp = sigsp(usp, ksig);
+
+	if (CPU_IS_020_OR_030 && ssp == usp && tregs->format == 0xb) {
+		struct frame *fmtbframe = (struct frame *) regs;
+		unsigned long fltp = (unsigned long) fmtbframe->un.fmtb.daddr;
+
+		if (fltp < ssp &&
+		   (fltp >> PAGE_SHIFT) == (ssp >> PAGE_SHIFT)-1 &&
+		 (((fltp - frame_size) & -8UL) >> PAGE_SHIFT) == (fltp >> PAGE_SHIFT))
+			ssp = fltp;
+	}
 
-	return (void __user *)((usp - frame_size) & -8UL);
+	return (void __user *)((ssp - frame_size) & -8UL);
 }
 
 static int setup_frame(struct ksignal *ksig, sigset_t *set,
@@ -880,7 +892,7 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 		return -EFAULT;
 	}
 
-	frame = get_sigframe(ksig, sizeof(*frame) + fsize);
+	frame = get_sigframe(ksig, regs, sizeof(*frame) + fsize);
 
 	if (fsize)
 		err |= copy_to_user (frame + 1, regs + 1, fsize);
@@ -952,7 +964,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 		return -EFAULT;
 	}
 
-	frame = get_sigframe(ksig, sizeof(*frame));
+	frame = get_sigframe(ksig, regs, sizeof(*frame));
 
 	if (fsize)
 		err |= copy_to_user (&frame->uc.uc_extra, regs + 1, fsize);
-- 
2.17.1

