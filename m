From: Christoph Hellwig <hch@lst.de>
Subject: Re: m68k ptrace code
Date: Wed, 5 Aug 2009 17:27:49 +0200
Message-ID: <20090805152749.GE6476@lst.de>
References: <20090427191230.GA1657@lst.de> <20090427191441.GC1657@lst.de> <m2zldk7nzm.fsf@igel.home> <20090510231826.930C5FC35D@magilla.sf.frob.com> <m263g8gf3e.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:37854 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755767AbZHEP2M (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 5 Aug 2009 11:28:12 -0400
Content-Disposition: inline
In-Reply-To: <m263g8gf3e.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Roland McGrath <roland@redhat.com>, linux-m68k@vger.kernel.org

Hi Andreas,

On Mon, May 11, 2009 at 11:32:05AM +0200, Andreas Schwab wrote:
> > Looks good to me, except you also want to nix PTRACE_KILL from your switch
> > so the generic code handles it.  Same goes for {PEEK,POKE}{DATA,TEXT} too.
> > Also note that you have to define a PTRACE_SINGLEBLOCK value in
> > asm/ptrace.h (new request code in your ptrace syscall ABI) to make
> > user_enable_block_step() get used by anything.
> 
> Thanks for your comments.  I have made these changes and verified with
> the ptrace testsuite that the singleblock request works correctly.
> There are a few failures in the testsuite, which I haven't analyzed yet,
> but none are regressions.

Any reason why this has never been commited?

> 
> Andreas.
> ---
> >From 2fd8c8e890bb4cff1175a7e37cc8cafbe663ef8a Mon Sep 17 00:00:00 2001
> From: Andreas Schwab <schwab@linux-m68k.org>
> Date: Sun, 10 May 2009 21:14:52 +0200
> Subject: [PATCH] m68k: use generic code for ptrace requests
> 
> Remove all but PTRACE_{PEEK,POKE}USR and PTRACE_{GET,SET}{REGS,FPREGS}
> from arch_ptrace and let the rest be handled by generic code.  Define
> PTRACE_SINGLEBLOCK to enable singleblock tracing.
> 
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/m68k/include/asm/ptrace.h |   13 +++++++
>  arch/m68k/kernel/ptrace.c      |   75 +++++++++++----------------------------
>  2 files changed, 34 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrace.h
> index 8c9194b..eef9309 100644
> --- a/arch/m68k/include/asm/ptrace.h
> +++ b/arch/m68k/include/asm/ptrace.h
> @@ -71,6 +71,8 @@ struct switch_stack {
>  #define PTRACE_GETFPREGS          14
>  #define PTRACE_SETFPREGS          15
>  
> +#define PTRACE_SINGLEBLOCK	33	/* resume execution until next branch */
> +
>  #ifdef __KERNEL__
>  
>  #ifndef PS_S
> @@ -82,6 +84,17 @@ struct switch_stack {
>  #define instruction_pointer(regs) ((regs)->pc)
>  #define profile_pc(regs) instruction_pointer(regs)
>  extern void show_regs(struct pt_regs *);
> +
> +/*
> + * These are defined as per linux/ptrace.h, which see.
> + */
> +#define arch_has_single_step()	(1)
> +extern void user_enable_single_step(struct task_struct *);
> +extern void user_disable_single_step(struct task_struct *);
> +
> +#define arch_has_block_step()	(1)
> +extern void user_enable_block_step(struct task_struct *);
> +
>  #endif /* __KERNEL__ */
>  #endif /* __ASSEMBLY__ */
>  #endif /* _M68K_PTRACE_H */
> diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
> index 2075543..bd08420 100644
> --- a/arch/m68k/kernel/ptrace.c
> +++ b/arch/m68k/kernel/ptrace.c
> @@ -35,7 +35,9 @@
>  #define SR_MASK 0x001f
>  
>  /* sets the trace bits. */
> -#define TRACE_BITS 0x8000
> +#define TRACE_BITS 0xC000
> +#define T1_BIT 0x8000
> +#define T0_BIT 0x4000
>  
>  /* Find the stack offset for a register, relative to thread.esp0. */
>  #define PT_REG(reg)	((long)&((struct pt_regs *)0)->reg)
> @@ -118,18 +120,30 @@ void ptrace_disable(struct task_struct *child)
>  	singlestep_disable(child);
>  }
>  
> +void user_enable_single_step(struct task_struct *child)
> +{
> +	unsigned long tmp = get_reg(child, PT_SR) & ~(TRACE_BITS << 16);
> +	put_reg(child, PT_SR, tmp | (T1_BIT << 16));
> +	set_tsk_thread_flag(child, TIF_DELAYED_TRACE);
> +}
> +
> +void user_enable_block_step(struct task_struct *child)
> +{
> +	unsigned long tmp = get_reg(child, PT_SR) & ~(TRACE_BITS << 16);
> +	put_reg(child, PT_SR, tmp | (T0_BIT << 16));
> +}
> +
> +void user_disable_single_step(struct task_struct *child)
> +{
> +	singlestep_disable(child);
> +}
> +
>  long arch_ptrace(struct task_struct *child, long request, long addr, long data)
>  {
>  	unsigned long tmp;
>  	int i, ret = 0;
>  
>  	switch (request) {
> -	/* when I and D space are separate, these will need to be fixed. */
> -	case PTRACE_PEEKTEXT:	/* read word at location addr. */
> -	case PTRACE_PEEKDATA:
> -		ret = generic_ptrace_peekdata(child, addr, data);
> -		break;
> -
>  	/* read the word at location addr in the USER area. */
>  	case PTRACE_PEEKUSR:
>  		if (addr & 3)
> @@ -153,12 +167,6 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
>  		ret = put_user(tmp, (unsigned long *)data);
>  		break;
>  
> -	/* when I and D space are separate, this will have to be fixed. */
> -	case PTRACE_POKETEXT:	/* write the word at location addr. */
> -	case PTRACE_POKEDATA:
> -		ret = generic_ptrace_pokedata(child, addr, data);
> -		break;
> -
>  	case PTRACE_POKEUSR:	/* write the word at location addr in the USER area */
>  		if (addr & 3)
>  			goto out_eio;
> @@ -185,47 +193,6 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
>  			goto out_eio;
>  		break;
>  
> -	case PTRACE_SYSCALL:	/* continue and stop at next (return from) syscall */
> -	case PTRACE_CONT:	/* restart after signal. */
> -		if (!valid_signal(data))
> -			goto out_eio;
> -
> -		if (request == PTRACE_SYSCALL)
> -			set_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		else
> -			clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		child->exit_code = data;
> -		singlestep_disable(child);
> -		wake_up_process(child);
> -		break;
> -
> -	/*
> -	 * make the child exit.  Best I can do is send it a sigkill.
> -	 * perhaps it should be put in the status that it wants to
> -	 * exit.
> -	 */
> -	case PTRACE_KILL:
> -		if (child->exit_state == EXIT_ZOMBIE) /* already dead */
> -			break;
> -		child->exit_code = SIGKILL;
> -		singlestep_disable(child);
> -		wake_up_process(child);
> -		break;
> -
> -	case PTRACE_SINGLESTEP:	/* set the trap flag. */
> -		if (!valid_signal(data))
> -			goto out_eio;
> -
> -		clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		tmp = get_reg(child, PT_SR) | (TRACE_BITS << 16);
> -		put_reg(child, PT_SR, tmp);
> -		set_tsk_thread_flag(child, TIF_DELAYED_TRACE);
> -
> -		child->exit_code = data;
> -		/* give it a chance to run. */
> -		wake_up_process(child);
> -		break;
> -
>  	case PTRACE_GETREGS:	/* Get all gp regs from the child. */
>  		for (i = 0; i < 19; i++) {
>  			tmp = get_reg(child, i);
> -- 
> 1.6.3
> 
> 
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
> "And now for something completely different."
---end quoted text---
