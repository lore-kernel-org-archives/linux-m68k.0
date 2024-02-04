Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376EC250E0
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707074476; cv=none; b=aCzaEzI1lw/ghqztMDjeBTwIAHOP0Z/9EpFSx8/PfV6GXfrCm2hBW+0AQmkgrvhsKer8CnngZgY7wtbEYG8Bc8xbWgeHzSqBCJMV3QSZJrf3ngmFy2/N30cPnIcfkx9LHzJShNgHlkNMnUJZsy6vDUi3eFAGEzxKMf5Yfe2F2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707074476; c=relaxed/simple;
	bh=VA4WFqk/jMOWOL/vo30U7oCRBFSsNUX9JFHULTpGOM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lO1g/w8w1uto5jLwx8Aan9BHpyxS3oAsrNKBk/uwuUY+P9FiZbGV8cfTbmEE+8XBpFxSOcobv/iiSqrsHQucObEuuNmRtypQYZzrbmsFCKyDT8ZI9r9V0jMfio0aKmEsXwJ9Yf+SZ9kGnuua4GyfZcEKjU8h9cg/BABlvI254Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FF4kjcDN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FF4kjcDN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d958e0d73dso18882965ad.1
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707074474; x=1707679274; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TE9GD2EKHEx5UwuJrNmsHPUlYInDYTBRxLWIAHW3Hzo=;
        b=FF4kjcDNC3mpJxgTdQqFgYwy3I3SwK0eWH4lxKuUGDk3nzmXFic1SzvKgkI8Yio0ui
         2p8svZjfpJF613CP8gwjGmWetYbBInrByLpb2zNS+fUiUW48Fbi9GNGLYuGZbxziQy7U
         wj/8UL9DbGwnITW/eDzFwcR8TkkCdSTOrigp178qHy3C7yMIcu9SwSl6KuGUjtU3C+GC
         MUn2O6EBGCtxO0LHljlm6p7xTnhQmHqVIst9XB0+KWBFwY68/RpcX6yNm5l4IO2cjuig
         PMFEgCg9+SnXzfsacj+Za4fxLXxBXl/y2EAVOfGuMfqHbUBOlrNfBcWuSQcmFjXdpaTH
         gpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707074474; x=1707679274;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TE9GD2EKHEx5UwuJrNmsHPUlYInDYTBRxLWIAHW3Hzo=;
        b=w123KXbMMuDLIKxBbLAEwUp5UIwohE9syD/9QuOEEl+YYvJBBodFKpdj6J7nUqwR61
         FaUOD4WHVGOhuSTHgHA77i6Q7Ft76jN9bTfl47Wwnd/Syk+qyAJ3Xt0OxrlNvOaPVRv1
         +NMNmlSRsMBqtjvaKPFhNCDEAqpoFQKbvpTq0hB9xkTEgUX3jStfez/PnrsEiM5Irdad
         fDnNnNYP+xvM45jSykX53W1jrPQOF24IB1Ha+qL/2yrEsF9nziup/thqUSHJqIpngMlK
         O+pgrrc3f21oVe/N3+O8d0E+xWQxwD7AlCIaJqRGnlz/TRh+/1klwNApvpnYZvWmXijo
         wWUg==
X-Gm-Message-State: AOJu0YxRBFBLZin3HZQt+bWIQVK8e+hpznen8CgfaAj8PEmpV/EncIhM
	o7Ls2EcJFNaDzSoxIcStvy+zu8nkaNyjow89TRXUdG0i8pGLNIeyzJ2ZFpvr
X-Google-Smtp-Source: AGHT+IFSXvz3yRa5YICYHEPpjpMZK50FD2sNsXYcNYWNc9rEmUxMzneTQ0mzWeC2qylgQVPneWkksA==
X-Received: by 2002:a17:902:ce92:b0:1d9:7587:8298 with SMTP id f18-20020a170902ce9200b001d975878298mr6555339plg.23.1707074474298;
        Sun, 04 Feb 2024 11:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0Vjc+Qg+93QxtVHN1S7UaEY/SdStAFI/SLv4dqTRP5f1ZfjPqdOUyFf3SR5jUFwU2eueYgH175vLz0UiHtIT69l1OzdEAj/CGmajWv0qlLFOd8FJYlAZW5RT5jCI+oefCX1pHJrMZRxZ1dbJrjsOLqSJtKbWSAf+AmmYSrzGEILjs
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id jc11-20020a17090325cb00b001d9834f2966sm3400436plb.10.2024.02.04.11.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:21:13 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 5E8B536034E; Mon,  5 Feb 2024 08:21:09 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk,
	Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC 3/4] m68k: Leave stack mangling to asm wrapper of sigreturn()
Date: Mon,  5 Feb 2024 08:21:04 +1300
Message-Id: <20240204192105.5677-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240204192105.5677-1-schmitzmic@gmail.com>
References: <20240204192105.5677-1-schmitzmic@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

From: Al Viro <viro@zeniv.linux.org.uk>

sigreturn has to deal with an unpleasant problem - exception stack frames
have different sizes, depending upon the exception (and processor model, as
well) and variable-sized part of exception frame may contain information
needed for instruction restart.  So when signal handler terminates and calls
sigreturn to resume the execution at the place where we'd been when we caught
the signal, it has to rearrange the frame at the bottom of kernel stack.
Worse, it might need to open a gap in the kernel stack, shifting pt_regs
towards lower addresses.

Doing that from C is insane - we'd need to shift stack frames (return addresses,
local variables, etc.) of C call chain, right under the nose of compiler and
hope it won't fall apart horribly.  What had been actually done is only slightly
less insane - an inline asm in mangle_kernel_stack() moved the stuff around,
then reset stack pointer and jumped to label in asm glue.

However, we can avoid all that mess if the asm wrapper we have to use anyway
would reserve some space on the stack between switch_stack and the C stack
frame of do_{rt_,}sigreturn().   Then C part can simply memmove() pt_regs +
switch_stack, memcpy() the variable part of exception frame into the opened
gap - all of that without inline asm, buggering C call chain, magical jumps
to asm labels, etc.

Asm wrapper would need to know where the moved switch_stack has ended up -
it might have been shifted into the gap we'd reserved before do_rt_sigreturn()
call.  That's where it needs to set the stack pointer to.  So let the C part
return just that and be done with that.

While we are at it, the call of berr_040cleanup() we need to do when
returning via 68040 bus error exception frame can be moved into C part
as well.

MSch: Minor v4.4 backport merge conflict and compile errors fixed.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Link: https://lore.kernel.org/r/YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/68000/entry.S       |   3 -
 arch/m68k/coldfire/entry.S    |   3 -
 arch/m68k/include/asm/traps.h |   4 ++
 arch/m68k/kernel/entry.S      |  49 +++++++-------
 arch/m68k/kernel/signal.c     | 118 ++++++++++++----------------------
 5 files changed, 72 insertions(+), 105 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 259b3661b614..cce465e850fe 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -25,7 +25,6 @@
 .globl system_call
 .globl resume
 .globl ret_from_exception
-.globl ret_from_signal
 .globl sys_call_table
 .globl bad_interrupt
 .globl inthandler1
@@ -59,8 +58,6 @@ do_trace:
 	subql	#4,%sp			/* dummy return address */
 	SAVE_SWITCH_STACK
 	jbsr	syscall_trace_leave
-
-ret_from_signal:
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	ret_from_exception
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 52d312d5b4d4..1a75c1015847 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -51,7 +51,6 @@ sw_usp:
 .globl system_call
 .globl resume
 .globl ret_from_exception
-.globl ret_from_signal
 .globl sys_call_table
 .globl inthandler
 
@@ -98,8 +97,6 @@ ENTRY(system_call)
 	subql	#4,%sp			/* dummy return address */
 	SAVE_SWITCH_STACK
 	jbsr	syscall_trace_leave
-
-ret_from_signal:
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 
diff --git a/arch/m68k/include/asm/traps.h b/arch/m68k/include/asm/traps.h
index 4aff3358fbaf..a9d5c1c870d3 100644
--- a/arch/m68k/include/asm/traps.h
+++ b/arch/m68k/include/asm/traps.h
@@ -267,6 +267,10 @@ struct frame {
     } un;
 };
 
+#ifdef CONFIG_M68040
+asmlinkage void berr_040cleanup(struct frame *fp);
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _M68K_TRAPS_H */
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index dbeba043b703..9a79733b20db 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -71,14 +71,38 @@ ENTRY(__sys_vfork)
 
 ENTRY(sys_sigreturn)
 	SAVE_SWITCH_STACK
+	movel	%sp,%a1			  	| switch_stack pointer
+	lea	%sp@(SWITCH_STACK_SIZE),%a0	| pt_regs pointer
+	lea     %sp@(-84),%sp			| leave a gap
+	movel	%a1,%sp@-
+	movel	%a0,%sp@-
 	jbsr	do_sigreturn
-	RESTORE_SWITCH_STACK
-	rts
+	jra	1f				| shared with rt_sigreturn()
 
 ENTRY(sys_rt_sigreturn)
 	SAVE_SWITCH_STACK
+	movel	%sp,%a1			  	| switch_stack pointer
+	lea	%sp@(SWITCH_STACK_SIZE),%a0	| pt_regs pointer
+	lea     %sp@(-84),%sp			| leave a gap
+	movel	%a1,%sp@-
+	movel	%a0,%sp@-
+	| stack contents:
+	|   [original pt_regs address] [original switch_stack address]
+	|   [gap] [switch_stack] [pt_regs] [exception frame]
 	jbsr	do_rt_sigreturn
+
+1:
+	| stack contents now:
+	|   [original pt_regs address] [original switch_stack address]
+	|   [unused part of the gap] [moved switch_stack] [moved pt_regs]
+	|   [replacement exception frame]
+	| return value of do_{rt_,}sigreturn() points to moved switch_stack.
+
+	movel	%d0,%sp				| discard the leftover junk
 	RESTORE_SWITCH_STACK
+	| stack contents now is just [syscall return address] [pt_regs] [frame]
+	| return pt_regs.d0
+	movel	%sp@(PT_OFF_D0+4),%d0
 	rts
 
 ENTRY(buserr)
@@ -169,27 +193,6 @@ do_trace_exit:
 	addql	#4,%sp
 	jra	.Lret_from_exception
 
-ENTRY(ret_from_signal)
-	movel	%curptr@(TASK_STACK),%a1
-	tstb	%a1@(TINFO_FLAGS+2)
-	jge	1f
-	lea	%sp@(SWITCH_STACK_SIZE),%a1
-	movel	%a1,%curptr@(TASK_THREAD+THREAD_ESP0)
-	jbsr	syscall_trace
-1:	RESTORE_SWITCH_STACK
-	addql	#4,%sp
-/* on 68040 complete pending writebacks if any */
-#ifdef CONFIG_M68040
-	bfextu	%sp@(PT_OFF_FORMATVEC){#0,#4},%d0
-	subql	#7,%d0				| bus error frame ?
-	jbne	1f
-	movel	%sp,%sp@-
-	jbsr	berr_040cleanup
-	addql	#4,%sp
-1:
-#endif
-	jra	.Lret_from_exception
-
 ENTRY(system_call)
 	SAVE_ALL_SYS
 
diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
index 644c2ddc8aac..8fb8ee804b3a 100644
--- a/arch/m68k/kernel/signal.c
+++ b/arch/m68k/kernel/signal.c
@@ -594,57 +594,35 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
 static int mangle_kernel_stack(struct pt_regs *regs, int formatvec,
 			       void __user *fp)
 {
-	int fsize = frame_extra_sizes(formatvec >> 12);
-	if (fsize < 0) {
+	int extra = frame_extra_sizes(formatvec >> 12);
+	char buf[sizeof(((struct frame *)0)->un)];
+
+	if (extra < 0) {
 		/*
 		 * user process trying to return with weird frame format
 		 */
-#ifdef DEBUG
-		printk("user process returning with weird frame format\n");
-#endif
-		return 1;
+		pr_debug("user process returning with weird frame format\n");
+		return -1;
 	}
-	if (!fsize) {
-		regs->format = formatvec >> 12;
-		regs->vector = formatvec & 0xfff;
-	} else {
-		struct switch_stack *sw = (struct switch_stack *)regs - 1;
-		unsigned long buf[fsize / 2]; /* yes, twice as much */
-
-		/* that'll make sure that expansion won't crap over data */
-		if (copy_from_user(buf + fsize / 4, fp, fsize))
-			return 1;
-
-		/* point of no return */
-		regs->format = formatvec >> 12;
-		regs->vector = formatvec & 0xfff;
-#define frame_offset (sizeof(struct pt_regs)+sizeof(struct switch_stack))
-		__asm__ __volatile__ (
-#ifdef CONFIG_COLDFIRE
-			 "   movel %0,%/sp\n\t"
-			 "   bra ret_from_signal\n"
-#else
-			 "   movel %0,%/a0\n\t"
-			 "   subl %1,%/a0\n\t"     /* make room on stack */
-			 "   movel %/a0,%/sp\n\t"  /* set stack pointer */
-			 /* move switch_stack and pt_regs */
-			 "1: movel %0@+,%/a0@+\n\t"
-			 "   dbra %2,1b\n\t"
-			 "   lea %/sp@(%c3),%/a0\n\t" /* add offset of fmt */
-			 "   lsrl  #2,%1\n\t"
-			 "   subql #1,%1\n\t"
-			 /* copy to the gap we'd made */
-			 "2: movel %4@+,%/a0@+\n\t"
-			 "   dbra %1,2b\n\t"
-			 "   bral ret_from_signal\n"
+	if (extra && copy_from_user(buf, fp, extra))
+		return -1;
+	regs->format = formatvec >> 12;
+	regs->vector = formatvec & 0xfff;
+	if (extra) {
+		void *p = (struct switch_stack *)regs - 1;
+		struct frame *new = (void *)regs - extra;
+		int size = sizeof(struct pt_regs)+sizeof(struct switch_stack);
+
+		memmove(p - extra, p, size);
+		memcpy(p - extra + size, buf, extra);
+		current->thread.esp0 = (unsigned long)&new->ptregs;
+#ifdef CONFIG_M68040
+		/* on 68040 complete pending writebacks if any */
+		if (new->ptregs.format == 7) // bus error frame
+			berr_040cleanup(new);
 #endif
-			 : /* no outputs, it doesn't ever return */
-			 : "a" (sw), "d" (fsize), "d" (frame_offset/4-1),
-			   "n" (frame_offset), "a" (buf + fsize/4)
-			 : "a0");
-#undef frame_offset
 	}
-	return 0;
+	return extra;
 }
 
 static inline int
@@ -652,14 +630,13 @@ restore_sigcontext(struct pt_regs *regs, struct sigcontext __user *usc, void __u
 {
 	int formatvec;
 	struct sigcontext context;
-	int err = 0;
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
 	/* get previous context */
 	if (copy_from_user(&context, usc, sizeof(context)))
-		goto badframe;
+		return -1;
 
 	/* restore passed registers */
 	regs->d0 = context.sc_d0;
@@ -672,15 +649,10 @@ restore_sigcontext(struct pt_regs *regs, struct sigcontext __user *usc, void __u
 	wrusp(context.sc_usp);
 	formatvec = context.sc_formatvec;
 
-	err = restore_fpu_state(&context);
-
-	if (err || mangle_kernel_stack(regs, formatvec, fp))
-		goto badframe;
-
-	return 0;
+	if (restore_fpu_state(&context))
+		return -1;
 
-badframe:
-	return 1;
+	return mangle_kernel_stack(regs, formatvec, fp);
 }
 
 static inline int
@@ -697,7 +669,7 @@ rt_restore_ucontext(struct pt_regs *regs, struct switch_stack *sw,
 
 	err = __get_user(temp, &uc->uc_mcontext.version);
 	if (temp != MCONTEXT_VERSION)
-		goto badframe;
+		return -1;
 	/* restore passed registers */
 	err |= __get_user(regs->d0, &gregs[0]);
 	err |= __get_user(regs->d1, &gregs[1]);
@@ -726,24 +698,17 @@ rt_restore_ucontext(struct pt_regs *regs, struct switch_stack *sw,
 	err |= restore_altstack(&uc->uc_stack);
 
 	if (err)
-		goto badframe;
-
-	if (mangle_kernel_stack(regs, temp, &uc->uc_extra))
-		goto badframe;
+		return -1;
 
-	return 0;
-
-badframe:
-	return 1;
+	return mangle_kernel_stack(regs, temp, &uc->uc_extra);
 }
 
-asmlinkage int do_sigreturn(unsigned long __unused)
+asmlinkage void *do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
 {
-	struct switch_stack *sw = (struct switch_stack *) &__unused;
-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
 	unsigned long usp = rdusp();
 	struct sigframe __user *frame = (struct sigframe __user *)(usp - 4);
 	sigset_t set;
+	int size;
 
 	if (!access_ok(VERIFY_READ, frame, sizeof(*frame)))
 		goto badframe;
@@ -755,22 +720,22 @@ asmlinkage int do_sigreturn(unsigned long __unused)
 
 	set_current_blocked(&set);
 
-	if (restore_sigcontext(regs, &frame->sc, frame + 1))
+	size = restore_sigcontext(regs, &frame->sc, frame + 1);
+	if (size < 0)
 		goto badframe;
-	return regs->d0;
+	return (void *)sw - size;
 
 badframe:
 	force_sig(SIGSEGV, current);
-	return 0;
+	return sw;
 }
 
-asmlinkage int do_rt_sigreturn(unsigned long __unused)
+asmlinkage void *do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
 {
-	struct switch_stack *sw = (struct switch_stack *) &__unused;
-	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
 	unsigned long usp = rdusp();
 	struct rt_sigframe __user *frame = (struct rt_sigframe __user *)(usp - 4);
 	sigset_t set;
+	int size;
 
 	if (!access_ok(VERIFY_READ, frame, sizeof(*frame)))
 		goto badframe;
@@ -779,13 +744,14 @@ asmlinkage int do_rt_sigreturn(unsigned long __unused)
 
 	set_current_blocked(&set);
 
-	if (rt_restore_ucontext(regs, sw, &frame->uc))
+	size = rt_restore_ucontext(regs, sw, &frame->uc);
+	if (size < 0)
 		goto badframe;
-	return regs->d0;
+	return (void *)sw - size;
 
 badframe:
 	force_sig(SIGSEGV, current);
-	return 0;
+	return sw;
 }
 
 static inline struct pt_regs *rte_regs(struct pt_regs *regs)
-- 
2.17.1

