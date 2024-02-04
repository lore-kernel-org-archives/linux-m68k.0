Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971B250E0
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707074475; cv=none; b=ezi2nUtpDNQllcCmCTQpjCBz6QIgZ8aYDeEJgXEwLsfQHRmZfMJyCff/U8WpA3+KoPEVky01w8+XIk9sNR3XMoJpxfodC9aslzpzD8n00oPj68dPFFVYmgZV7UY6PydSBYNWM8op9SdRsxi7Q5/LQKxuc9CG09zWe80A99GXN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707074475; c=relaxed/simple;
	bh=6cFbE96fqdCyeEScbgWJcnFByWoPCM1Oeh5KczSGq4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qvdpqx+QuIYmV/vxXrByyfJGe+96BuF1CBV0KnXWc6yecxNQngiJyQUYeT0beLWX8G8b8GJrdByf7YXIK83eLlo+d3hE98XTtas35wuNG816CQyXzRPVGPfBEfIpdgWf4faJHw1S5iRaiyZIhP/aLTM/qIeEBtGtYnSei4SLHyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHx71qtY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHx71qtY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e03b583904so351051b3a.2
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707074473; x=1707679273; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UiwKn/p0k7v/vBhvevWMBMtSdzlfaIzjFDGfCJCSoU=;
        b=OHx71qtYDzsCmTjyTsQkb5NZ65C1oD3uNSGOFEXIryFcqrMbe4+aUDJF25wqN1EBua
         j6yYbhkFjgUEIuDOebPW/lKBY737V38Xf5MH8EMRlqvVtcef2YiHqSkdUD9DLddhm+ix
         bwE6vZniqpWLWTqw9QaWGs7JM4RnSDx+G4t4pyvuRlCYdi9Uf8jYGqC5fc0/XYuu8i45
         E29wiY13MmOasERWbYTF05NHIlUG9PwlnrX9LjqZuVh+ZRdMBxoc0ebTf6MU6IcE3eDl
         C023h1r/xARw1j+iP+yyyjfcioeUzZdAeRJJqcZz81CsPwEK3VBwXA1DrqJ9rBoaSDRh
         jX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707074473; x=1707679273;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UiwKn/p0k7v/vBhvevWMBMtSdzlfaIzjFDGfCJCSoU=;
        b=fqMfq1b/blBahPLt1pYPathYdnoUIa6Y/GM4BaSyJUvO6eKPrP2nYjPkTZSzzWXVg4
         8V9+KnrYSmXfl8k4OS1d7D9CZ0nDaiTBcUQilZgwUg056Sx1A78Nj9449dXwToRoO2ET
         1UVqvp1HEXsbHJmjug/8wtccWx29u9xBQ9XbMVdb2ef3DgZF9/nZ3nRlopPMPJPPRdOI
         SMb+53lee/CDsxsa7MKiknLmqwC5wBtSxD/LHIHyKbcbClVsKqW2RK8mbCez31XEecE6
         ULpWyHutK7zQmqxiYdYzYccqOMczLmZ/UEy5/DqIM0vnyHO9mF/tSRGqKR6QSUlplvif
         mWOw==
X-Gm-Message-State: AOJu0YyicHCSQqq7XnlfNcibFlqutF2WyIDXXZLnpN0N7mzLGEi3gUZS
	kO7MZ3t6H9ySe879Nu0aspYUwEQwYh8KEcQNmNrYGXTOcVrJVtCx
X-Google-Smtp-Source: AGHT+IESPsXRpY9MgFrbddqrhPnmRLNtP2U4WbA7wU0F3lezWP/SOfTScgFh2q0Azv7yiklJjhTHhA==
X-Received: by 2002:a05:6a00:23c1:b0:6dd:8a25:e167 with SMTP id g1-20020a056a0023c100b006dd8a25e167mr12745749pfc.34.1707074471740;
        Sun, 04 Feb 2024 11:21:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXuVedN/WuqQgnTjPvLVI2o3FBBtLHfE9lzvmJA+zLD4+dPOCHcdGWbc1kkWeCVJyhb1yB3SoE4aUwplVYEhFeaHQnb83tA1HkBO4FRKtNXKA6hzmlVCPK79lDTo1YXoWY4SK6rurMv/DQMBvQ=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id g30-20020aa79f1e000000b006d99f930607sm5273581pfr.140.2024.02.04.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:21:11 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id C18D0360328; Mon,  5 Feb 2024 08:21:07 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH RFC 1/4] m68k: Handle arrivals of multiple signals correctly
Date: Mon,  5 Feb 2024 08:21:02 +1300
Message-Id: <20240204192105.5677-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204192105.5677-1-schmitzmic@gmail.com>
References: <20240204192105.5677-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

When we have several pending signals, have entered with the kernel
with large exception frame *and* have already built at least one
sigframe, regs->stkadj is going to be non-zero and regs->format/sr/pc
are going to be junk - the real values are in shifted exception stack
frame we'd built when putting together the first sigframe.

If that happens, subsequent sigframes are going to be garbage.
Not hard to fix - just need to find the "adjusted" frame first
and look for format/vector/sr/pc in it.

Minor merge conflict fixes for v4.4 added.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/r/YP2dBIAPTaVvHiZ6@zeniv-ca.linux.org.uk
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/signal.c | 100 +++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 55 deletions(-)

diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index af1c4f330aef..644c2ddc8aac 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -465,7 +465,7 @@ static inline void save_fpu_state(struct sigcontext *sc, struct pt_regs *regs)
 
 	if (CPU_IS_060 ? sc->sc_fpstate[2] : sc->sc_fpstate[0]) {
 		fpu_version = sc->sc_fpstate[0];
-		if (CPU_IS_020_OR_030 &&
+		if (CPU_IS_020_OR_030 && !regs->stkadj &&
 		    regs->vector >= (VEC_FPBRUC * 4) &&
 		    regs->vector <= (VEC_FPNAN * 4)) {
 			/* Clear pending exception in 68882 idle frame */
@@ -528,7 +528,7 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 		if (!(CPU_IS_060 || CPU_IS_COLDFIRE))
 			context_size = fpstate[1];
 		fpu_version = fpstate[0];
-		if (CPU_IS_020_OR_030 &&
+		if (CPU_IS_020_OR_030 && !regs->stkadj &&
 		    regs->vector >= (VEC_FPBRUC * 4) &&
 		    regs->vector <= (VEC_FPNAN * 4)) {
 			/* Clear pending exception in 68882 idle frame */
@@ -788,18 +788,24 @@ badframe:
 	return 0;
 }
 
+static inline struct pt_regs *rte_regs(struct pt_regs *regs)
+{
+	return (void *)regs + regs->stkadj;
+}
+
 static void setup_sigcontext(struct sigcontext *sc, struct pt_regs *regs,
 			     unsigned long mask)
 {
+	struct pt_regs *tregs = rte_regs(regs);
 	sc->sc_mask = mask;
 	sc->sc_usp = rdusp();
 	sc->sc_d0 = regs->d0;
 	sc->sc_d1 = regs->d1;
 	sc->sc_a0 = regs->a0;
 	sc->sc_a1 = regs->a1;
-	sc->sc_sr = regs->sr;
-	sc->sc_pc = regs->pc;
-	sc->sc_formatvec = regs->format << 12 | regs->vector;
+	sc->sc_sr = tregs->sr;
+	sc->sc_pc = tregs->pc;
+	sc->sc_formatvec = tregs->format << 12 | tregs->vector;
 	save_a5_state(sc, regs);
 	save_fpu_state(sc, regs);
 }
@@ -807,6 +813,7 @@ static void setup_sigcontext(struct sigcontext *sc, struct pt_regs *regs,
 static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *regs)
 {
 	struct switch_stack *sw = (struct switch_stack *)regs - 1;
+	struct pt_regs *tregs = rte_regs(regs);
 	greg_t __user *gregs = uc->uc_mcontext.gregs;
 	int err = 0;
 
@@ -827,9 +834,9 @@ static inline int rt_setup_ucontext(struct ucontext __user *uc, struct pt_regs *
 	err |= __put_user(sw->a5, &gregs[13]);
 	err |= __put_user(sw->a6, &gregs[14]);
 	err |= __put_user(rdusp(), &gregs[15]);
-	err |= __put_user(regs->pc, &gregs[16]);
-	err |= __put_user(regs->sr, &gregs[17]);
-	err |= __put_user((regs->format << 12) | regs->vector, &uc->uc_formatvec);
+	err |= __put_user(tregs->pc, &gregs[16]);
+	err |= __put_user(tregs->sr, &gregs[17]);
+	err |= __put_user((tregs->format << 12) | tregs->vector, &uc->uc_formatvec);
 	err |= rt_save_fpu_state(uc, regs);
 	return err;
 }
@@ -846,15 +853,14 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 			struct pt_regs *regs)
 {
 	struct sigframe __user *frame;
-	int fsize = frame_extra_sizes(regs->format);
+	struct pt_regs *tregs = rte_regs(regs);
+	int fsize = frame_extra_sizes(tregs->format);
 	struct sigcontext context;
 	int err = 0, sig = ksig->sig;
 
 	if (fsize < 0) {
-#ifdef DEBUG
-		printk ("setup_frame: Unknown frame format %#x\n",
-			regs->format);
-#endif
+		pr_debug("setup_frame: Unknown frame format %#x\n",
+			 tregs->format);
 		return -EFAULT;
 	}
 
@@ -865,7 +871,7 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 
 	err |= __put_user(sig, &frame->sig);
 
-	err |= __put_user(regs->vector, &frame->code);
+	err |= __put_user(tregs->vector, &frame->code);
 	err |= __put_user(&frame->sc, &frame->psc);
 
 	if (_NSIG_WORDS > 1)
@@ -890,36 +896,28 @@ static int setup_frame(struct ksignal *ksig, sigset_t *set,
 
 	push_cache ((unsigned long) &frame->retcode);
 
-	/*
-	 * Set up registers for signal handler.  All the state we are about
-	 * to destroy is successfully copied to sigframe.
-	 */
-	wrusp ((unsigned long) frame);
-	regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
-	adjustformat(regs);
-
 	/*
 	 * This is subtle; if we build more than one sigframe, all but the
 	 * first one will see frame format 0 and have fsize == 0, so we won't
 	 * screw stkadj.
 	 */
-	if (fsize)
+	if (fsize) {
 		regs->stkadj = fsize;
-
-	/* Prepare to skip over the extra stuff in the exception frame.  */
-	if (regs->stkadj) {
-		struct pt_regs *tregs =
-			(struct pt_regs *)((ulong)regs + regs->stkadj);
-#ifdef DEBUG
-		printk("Performing stackadjust=%04x\n", regs->stkadj);
-#endif
-		/* This must be copied with decreasing addresses to
-                   handle overlaps.  */
+		tregs = rte_regs(regs);
+		pr_debug("Performing stackadjust=%04lx\n", regs->stkadj);
 		tregs->vector = 0;
 		tregs->format = 0;
-		tregs->pc = regs->pc;
 		tregs->sr = regs->sr;
 	}
+
+	/*
+	 * Set up registers for signal handler.  All the state we are about
+	 * to destroy is successfully copied to sigframe.
+	 */
+	wrusp ((unsigned long) frame);
+	tregs->pc = (unsigned long) ksig->ka.sa.sa_handler;
+	adjustformat(regs);
+
 	return 0;
 }
 
@@ -927,7 +925,8 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 			   struct pt_regs *regs)
 {
 	struct rt_sigframe __user *frame;
-	int fsize = frame_extra_sizes(regs->format);
+	struct pt_regs *tregs = rte_regs(regs);
+	int fsize = frame_extra_sizes(tregs->format);
 	int err = 0, sig = ksig->sig;
 
 	if (fsize < 0) {
@@ -978,36 +977,27 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 
 	push_cache ((unsigned long) &frame->retcode);
 
-	/*
-	 * Set up registers for signal handler.  All the state we are about
-	 * to destroy is successfully copied to sigframe.
-	 */
-	wrusp ((unsigned long) frame);
-	regs->pc = (unsigned long) ksig->ka.sa.sa_handler;
-	adjustformat(regs);
-
 	/*
 	 * This is subtle; if we build more than one sigframe, all but the
 	 * first one will see frame format 0 and have fsize == 0, so we won't
 	 * screw stkadj.
 	 */
-	if (fsize)
+	if (fsize) {
 		regs->stkadj = fsize;
-
-	/* Prepare to skip over the extra stuff in the exception frame.  */
-	if (regs->stkadj) {
-		struct pt_regs *tregs =
-			(struct pt_regs *)((ulong)regs + regs->stkadj);
-#ifdef DEBUG
-		printk("Performing stackadjust=%04x\n", regs->stkadj);
-#endif
-		/* This must be copied with decreasing addresses to
-                   handle overlaps.  */
+		tregs = rte_regs(regs);
+		pr_debug("Performing stackadjust=%04lx\n", regs->stkadj);
 		tregs->vector = 0;
 		tregs->format = 0;
-		tregs->pc = regs->pc;
 		tregs->sr = regs->sr;
 	}
+
+	/*
+	 * Set up registers for signal handler.  All the state we are about
+	 * to destroy is successfully copied to sigframe.
+	 */
+	wrusp ((unsigned long) frame);
+	tregs->pc = (unsigned long) ksig->ka.sa.sa_handler;
+	adjustformat(regs);
 	return 0;
 }
 
-- 
2.17.1

