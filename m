Return-Path: <SRS0=QPqG=BG=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42055C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 04:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16E3720719
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 04:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZdXs+fz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgG0ETX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jul 2020 00:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgG0ETW (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Jul 2020 00:19:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F028C0619D2
        for <linux-m68k@vger.kernel.org>; Sun, 26 Jul 2020 21:19:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so8391138pjb.2
        for <linux-m68k@vger.kernel.org>; Sun, 26 Jul 2020 21:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lMQElHuYixWOO3X2YZVj8t4rc2y5NkwK9ja5g781dAc=;
        b=OZdXs+fzPN8KK/QnMx199F6/HUp8BidD321Q4u5MsPZEliosjUUx796+QJBhLa98+L
         jxvltTZFkUYtfzEocxpFiR3RIWmSIsIgnPsKxt/qIljUk5DaKpnQkcWcwYfhVuzEV9Fm
         TOGQaN/9+OEaEaEpAiZYR1pWh2t9WNVBRoMDoVTpW6VKRCwvFvRyPJJh4ayU8Pd8R9xz
         3ItQCxymGgawe9E3gvADtYbZTJ99CH9B3B4H2VgUacmPv7WepohS3aYkMmQuOuJBEHE1
         mG6AspJ3b80nUMSOIZXgudZqGkdzc8Np81KTZS5Twamdw41lN9FIKKHTzNgxorfK0ZW1
         /YuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lMQElHuYixWOO3X2YZVj8t4rc2y5NkwK9ja5g781dAc=;
        b=ns0gDgp+DEFYAd8eu6yjgKwuLQ/vAjq3aJkzniBWalC64iHvLaoQTWEgn8wmHz9R1P
         85Dd/+a1UNamB6uY/kOo0xAq0Sf7HA9AiiK1OSgHVW1jKoru+boG0RkpWPcad6owGJOB
         97AeJbQgh0w2SjtJIC+RICTDNVf5BriQm9UI1mg9RrBfnvi0T6jhKxpoiMYFMpzknn1a
         7DYthu8mxfhdyEQHkZH/OmBLGp4bh9lBj+zqekqudoU/80qs/L//XkjIoGVhPsrDp1d+
         eWtr0fbhuvEnDYQ4Vloax9tAFODznNg0UpFMmDEumOS94+a9TAe6fSBrkeSIAqJfBZIc
         H2JA==
X-Gm-Message-State: AOAM5331MrWXsgYukohPfL8/3/WbTbyqY/bZXI/MleN7fMhl8Zb3wi+K
        uVAt8F2WJ0uir9H5FG7Nox1Z9ZQd
X-Google-Smtp-Source: ABdhPJxFvYIIae7Y5cwMTdHJI7RfqZ7RYR1XBv0dd6m7aAuKfdfeH5DFtwaXBbpiA1BTCD3G1zp/Ow==
X-Received: by 2002:a17:90a:eb18:: with SMTP id j24mr4726019pjz.76.1595823562034;
        Sun, 26 Jul 2020 21:19:22 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id gf24sm3506811pjb.4.2020.07.26.21.19.21
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 26 Jul 2020 21:19:21 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id A5462360081; Mon, 27 Jul 2020 16:19:17 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     glaubitz@physik.fu-berlin.de, geert@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Mon, 27 Jul 2020 16:19:15 +1200
Message-Id: <1595823555-11103-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k (other than Coldfire) uses syscall_trace for both trace entry
and trace exit. Seccomp support requires separate entry points for
trace entry and exit which are already provided for Coldfire.

Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
in preparation for seccomp support. Check return code of
syscall_trace_enter(), and skip syscall if nonzero. Return code
will be left at what had been set by by ptrace or seccomp.

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---

Changes from RFC v1:

- add return code check in do_trace_entry branch to enable syscall
  filtering (will return -EPERM)
- change to use testl for return code check (suggested by Andreas Schwab)

Changes from RFC v2:

- don't set return code of filtered syscall - seccomp may want to set
  that for use by calling process.

---
 arch/m68k/kernel/entry.S  |    8 +++++---
 arch/m68k/kernel/ptrace.c |   17 -----------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..de3d54a 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -164,9 +164,11 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	tstl	%d0
+	jne	ret_from_syscall
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
@@ -177,7 +179,7 @@ badsys:
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
@@ -186,7 +188,7 @@ ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
 	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 1:	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 /* on 68040 complete pending writebacks if any */
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 748c63b..b747a86 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -272,22 +272,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return -EIO;
 }
 
-asmlinkage void syscall_trace(void)
-{
-	ptrace_notify(SIGTRAP | ((current->ptrace & PT_TRACESYSGOOD)
-				 ? 0x80 : 0));
-	/*
-	 * this isn't the same as continuing with a signal, but it will do
-	 * for normal use.  strace only continues with a signal if the
-	 * stopping signal is not SIGTRAP.  -brl
-	 */
-	if (current->exit_code) {
-		send_sig(current->exit_code, current, 1);
-		current->exit_code = 0;
-	}
-}
-
-#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
 asmlinkage int syscall_trace_enter(void)
 {
 	int ret = 0;
@@ -302,4 +286,3 @@ asmlinkage void syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
 }
-#endif /* CONFIG_COLDFIRE */
-- 
1.7.0.4

