Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDAAC48BE6
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 07:13:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8579613BF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Jun 2021 07:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhFNHPh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Jun 2021 03:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbhFNHPh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Jun 2021 03:15:37 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5005EC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jun 2021 00:13:19 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id b12so6041018plg.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jun 2021 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3jXFhgPKKXbdGbAYYh8y51QN2z9+91QTjeVRxCLUbzk=;
        b=HvxLap28LQqYd0+t3G2EAGzbfp/xd6IJGU4KUojcB4o0oqkNJjligCySKIfj1sOGMm
         sjkSEs5aIAI2T/IFZI8JKE7PEwe91v4k5h6oFZ8d5djzVan0vWf/ZuUnXGnJkCRmG+w9
         pjRjvlZTLpxHAzQ18v9OfuNvnAA9raqsAzbro8MBYDUEJSppgBNkxlRpX5w5f0/PtOXM
         gqQGq3xfFKwqoqJTsvUkahmpiM+t2AnjwWwmt94+L8yXrFuZKMEMf8W5Q9QnNh8AuzkU
         g94UCHJyXA40e7waxboBobfMQU27yzkAVjHa/MWneoCDIxwemg73iMVmBxLeFbTAShlZ
         G/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=3jXFhgPKKXbdGbAYYh8y51QN2z9+91QTjeVRxCLUbzk=;
        b=AdnjdudsXp54z9D3i4narpohdnphHDdTatRv23WJRR3rWZknqhG2nx0ji7/cd7qrQ4
         0sLI0W2v67l7LqZ3BZGYLumXpz/rJTFHknfo1jjHaeCkrqKwXO8Ex/hkDNXpkmgdrQrg
         iOW70aMn5IgOlQoWzEe3LJXnLAy5QX2l0UEgmw4Sd24X4bKT8IRYJhKfwAPptWa0Ru+j
         fG+R1CQHA3NzeIFBpyJ1LtGEAKBTkYD7K9VQd/6AoRkGpl1vlthCFP4PwGuRXpUTpUDw
         zORoBN/ZxNcNjwkDDoVpQmFwKXJqpiD7pT2RqBzfs3iPw37IHHDLY/zh/wjUjolPuK3o
         E0AQ==
X-Gm-Message-State: AOAM531mzRk3JeXaV5M+HEsfBG2DGSFZuuB/ABChMHVtaGAW8QNCJS7z
        nFJG0fZK/YVVmGqfxpR9w3M=
X-Google-Smtp-Source: ABdhPJzAbm5jmEkB/z/kVu7aYvPkZAvuMnbRJDalpkChMol+BLJBx/ZvYCISBgxQcQwt++5Dzv9X8w==
X-Received: by 2002:a17:90a:bf87:: with SMTP id d7mr21854776pjs.118.1623654797963;
        Mon, 14 Jun 2021 00:13:17 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id a10sm2245364pgm.60.2021.06.14.00.13.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 00:13:17 -0700 (PDT)
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
To:     geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
References: <87sg1p30a1.fsf@disp2133>
 <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
Cc:     schwab@linux-m68k.org, Kars de Jong <jongk@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <eab743c3-7deb-33c3-030b-6686ff1f5e94@gmail.com>
Date:   Mon, 14 Jun 2021 19:13:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

do we need to add

.globl __sys_exit, __sys_exit_group

(and perhaps __sys_clone3) at the start of entry.S? We have that for 
__sys_fork, __sys_clone and __sys_vfork.

Cheers,

	Michael


Am 13.06.2021 um 11:38 schrieb Michael Schmitz:
> do_exit() calls prace_stop() which may require access to all saved
> registers. We only save those registers not preserved by C code
> currently.
>
> Provide a special syscall entry for exit and exit_group syscalls
> similar to that used by clone and clone3, which have the same
> requirements.
>
> No fix to io_uring appears to be needed, because m68k copy_thread
> treats kernel threads the same as e.g. alpha does, and copies only
> a subset of registers in that case.
>
> CC: Eric W. Biederman <ebiederm@xmission.com>
> CC: Linus Torvalds <torvalds@linux-foundation.org>
> CC: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> ---
>  arch/m68k/kernel/entry.S              | 14 ++++++++++++++
>  arch/m68k/kernel/process.c            | 16 ++++++++++++++++
>  arch/m68k/kernel/syscalls/syscall.tbl |  4 ++--
>  3 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
> index 9dd76fb..1e067e6 100644
> --- a/arch/m68k/kernel/entry.S
> +++ b/arch/m68k/kernel/entry.S
> @@ -76,6 +76,20 @@ ENTRY(__sys_clone3)
>  	lea	%sp@(28),%sp
>  	rts
>
> +ENTRY(__sys_exit)
> +	SAVE_SWITCH_STACK
> +	pea	%sp@(SWITCH_STACK_SIZE)
> +	jbsr	m68k_exit
> +	lea	%sp@(28),%sp
> +	rts
> +
> +ENTRY(__sys_exit_group)
> +	SAVE_SWITCH_STACK
> +	pea	%sp@(SWITCH_STACK_SIZE)
> +	jbsr	m68k_exit_group
> +	lea	%sp@(28),%sp
> +	rts
> +
>  ENTRY(sys_sigreturn)
>  	SAVE_SWITCH_STACK
>  	movel	%sp,%sp@-		  | switch_stack pointer
> diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
> index da83cc8..df4e5f1 100644
> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -138,6 +138,22 @@ asmlinkage int m68k_clone3(struct pt_regs *regs)
>  	return sys_clone3((struct clone_args __user *)regs->d1, regs->d2);
>  }
>
> +/*
> + * Because extra registers are saved on the stack after the sys_exit()
> + * arguments, this C wrapper extracts them from pt_regs * and then calls the
> + * generic sys_exit() implementation.
> + */
> +asmlinkage int m68k_exit(struct pt_regs *regs)
> +{
> +	return sys_exit(regs->d1);
> +}
> +
> +/* Same for sys_exit_group ... */
> +asmlinkage int m68k_exit_group(struct pt_regs *regs)
> +{
> +	return sys_exit_group(regs->d1);
> +}
> +
>  int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
>  		struct task_struct *p, unsigned long tls)
>  {
> diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
> index 0dd019d..3d5b6fbc 100644
> --- a/arch/m68k/kernel/syscalls/syscall.tbl
> +++ b/arch/m68k/kernel/syscalls/syscall.tbl
> @@ -8,7 +8,7 @@
>  # The <abi> is always "common" for this file
>  #
>  0	common	restart_syscall			sys_restart_syscall
> -1	common	exit				sys_exit
> +1	common	exit				__sys_exit
>  2	common	fork				__sys_fork
>  3	common	read				sys_read
>  4	common	write				sys_write
> @@ -254,7 +254,7 @@
>  244	common	io_submit			sys_io_submit
>  245	common	io_cancel			sys_io_cancel
>  246	common	fadvise64			sys_fadvise64
> -247	common	exit_group			sys_exit_group
> +247	common	exit_group			__sys_exit_group
>  248	common	lookup_dcookie			sys_lookup_dcookie
>  249	common	epoll_create			sys_epoll_create
>  250	common	epoll_ctl			sys_epoll_ctl
>
