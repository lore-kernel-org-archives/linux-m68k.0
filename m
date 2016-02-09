From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for
 do_sigreturn
Date: Tue, 9 Feb 2016 10:21:26 +1000
Message-ID: <56B93106.4050806@uclinux.org>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
 <8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
 <871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
 <871t8mkcd1.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:58306
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932559AbcBIAVO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Feb 2016 19:21:14 -0500
In-Reply-To: <871t8mkcd1.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Andreas,

On 09/02/16 09:31, Andreas Schwab wrote:
> Greg Ungerer <gerg@uclinux.org> writes:
>> Attached is a test case - derived from the original signal.c code.
> 
> It looks like with all those trivial functions in the non-MMU case the
> compiler sees enough to consider the writes to the (pseudo) function
> arguments dead.
> 
> How about this:
> 
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index af1c4f3..3cc9eaa 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -757,6 +757,11 @@ asmlinkage int do_sigreturn(unsigned long __unused)
>  
>  	if (restore_sigcontext(regs, &frame->sc, frame + 1))
>  		goto badframe;
> +	/*
> +	 * Force a barrier so that the compiler does not consider writes
> +	 * to *sw and *regs as dead.
> +	 */
> +	barrier();
>  	return regs->d0;
>  
>  badframe:
> @@ -781,6 +786,11 @@ asmlinkage int do_rt_sigreturn(unsigned long __unused)
>  
>  	if (rt_restore_ucontext(regs, sw, &frame->uc))
>  		goto badframe;
> +	/*
> +	 * Force a barrier so that the compiler does not consider writes
> +	 * to *sw and *regs as dead.
> +	 */
> +	barrier();
>  	return regs->d0;
>  
>  badframe:

Yes that works too. It forces generation of correct code.

So what is the best path forward here?
Should I submit a gcc bug report?

Regards
Greg
