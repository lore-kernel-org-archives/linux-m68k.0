Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A80013211C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 05:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729574897; cv=none; b=F9+hbICx0SDp4/chdmBRggOtv2OTV6W4ssaBYce5N2BT4D0ZzsNiG+REfGWHnVFb0VFcRq3rFEfrMkUGTuSF+ncZeSDH/JYjS1adHZQXx5FuH7gBIuWtzZ13/4U8UM368zQKTNp/ksZM/gulDiw7pqo9ELHUPZ3CEJz39MlS39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729574897; c=relaxed/simple;
	bh=MU6k+o8mlxN01YgfI+hrtN6FEbvyXOUUdJtvRafczeE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=koIGe6T7vzQvJZdSZgFIgPO7FHGDL+Zr3BWshxrPb7qhP0eCPZ9+tAZiVMfZeQWCO8/0+nrNAb5ffD7O2HZozmvsPS0IBSCv4S9AehNqLhDRU9rFvfuDHPAhgX0uQSJ4R2ka5YeZZWfl4Gvs5uwWimrEhLEABJEl84HyP11NuSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E58E45C0343;
	Tue, 22 Oct 2024 05:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D30C4CEC3;
	Tue, 22 Oct 2024 05:28:12 +0000 (UTC)
Date: Tue, 22 Oct 2024 01:28:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
Message-ID: <20241022012809.1ef083cd@rorschach.local.home>
In-Reply-To: <20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
	<20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Oct 2024 11:44:42 +0200
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:

> The TRACE_IRQFLAGS_SUPPORT requires the architecture to call
> trace_hardirqs_off() when interrupts are disabled and
> trace_hardirqs_on() when they are enabled.
> Add those calls to do_IRQ function.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  arch/m68k/Kconfig      | 1 +
>  arch/m68k/kernel/irq.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index cc26df907bfe3c8143a931d259eceabb16af7411..ab3375475721fa63418c40d4ba6ac76679ebc77d 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -39,6 +39,7 @@ config M68K
>  	select OLD_SIGSUSPEND3
>  	select UACCESS_MEMCPY if !MMU
>  	select ZONE_DMA
> +	select TRACE_IRQFLAGS_SUPPORT
>  
>  config CPU_BIG_ENDIAN
>  	def_bool y
> diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
> index 9ab4f550342e5de11c528f55781432675ffd66bf..74cf60ebbc4bca51f3caa4046dbd2bdb02355711 100644
> --- a/arch/m68k/kernel/irq.c
> +++ b/arch/m68k/kernel/irq.c
> @@ -21,9 +21,11 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
>  {
>  	struct pt_regs *oldregs = set_irq_regs(regs);
>  
> +	trace_hardirqs_off();
>  	irq_enter();
>  	generic_handle_irq(irq);
>  	irq_exit();
> +	trace_hardirqs_on();

This part of the patch shouldn't be needed because those shoudl be
called by irq_enter() and irq_exit(). Does this not work if you don't
have these?

-- Steve




>  
>  	set_irq_regs(oldregs);
>  }
> 

