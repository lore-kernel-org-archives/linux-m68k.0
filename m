Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E86299923
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628197; cv=none; b=sK9/V3ERBUXUgK2qm3wiTLRktFTm6Nxj91ImdxDJXDcssy9NW7mHhxOrNJ6JfaDO+rcOInbKjgHiGB1rTTsdHy6A0hQ0UP7sLWXbRi5/y25qgnwrKhjAbBVzg6FbfjPMj1vJJQmX7W9oSPLr3iBzQATlORnjQ09VKouuxJzhvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628197; c=relaxed/simple;
	bh=sCIzHr6LIKs/1PVbD9pk77j9HIdph/3wuYTdeeKTPZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP3hG+zfx/9hb4OSQIKRiz/v+bUJHo4Wcn566oDTga6pmtDVq4dblN3uC5GSv85GhDn9+SyBdzClNpRNRl3zWM736nPKvGgAaSRXbLIEnMpFvAZas+dx9Qqe6UzYIScGJC4zmFiZgFkcRnSfpZJhA1FMV1YKrlyLgbUjsmsx10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ1VN5qJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ1VN5qJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad8076b01so1755425ad.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 13:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628195; x=1784232995; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=nJ1VN5qJIKLksLJvX/l6yVZ+CUAZQZzfdJpdf7eZKkHevGOFq5TIUKbqxhiUBW0x1t
         qi1DN3zIU/Gfpmc40EuqFClPrB/VxM7vGpkPu52MWgQhGH1szd74cHbWCKeGA7mVK/VL
         CeU1xXOFqOQpmzsMp8M7RjzZB72yKeYSrZA40PrlUaGaBeNVj7oyevwrJBOX6ewXeA7j
         UpstVP0OBvPXwx45UALuJ9GQil/K7d9Os1UXeW8PRTHqGhaNzxAn8M3KZk25qdH3Zvqo
         wBu1ZC8yylfQesF4KAht7lMmT0MohwbmIgQAvNO6aVqKFDz1ia1C+rqjbCMa6XCJBWEX
         UJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628195; x=1784232995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=SsDeMyddgxCkGJdaQH2t7lf1MiA+EBCR9Me7vOMxU5arv091OEMbrkA/4Xz2qMxyi+
         lyQXVDo3Z9Tr2n/51vBS/IluQMO8b7rMlQTpH3ftn6yPA46VyVjvcL0WyymcPs3RtOsy
         E3yUbY6jPBaR2RkknAiQfeiRXY8MikLZVIhHwQkv35JnAwtEtvzHbgyExlRFNZDE2L8U
         v8a2jF7pvYMy63GXY+sbQmnLAa/pUCix/sVOdxfmKownFWF4QtcDXTHngWlUihImSiXQ
         CjZ84cC5HRcyE0jEgh6GF1TFmEBqg8J0CKNjhnBnI/waj5iI1OnYLa1yZXInNn7MjC0S
         R+ig==
X-Forwarded-Encrypted: i=1; AHgh+RpfMxoy9QcnUKMclATfBUo/kYtMlI+Oyh2T9lGJp18Cp5DemipCB2Az7v75YjeUdbKbyq3ZONHvxisT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzNbHwEMctZLtqrRjnZX3jSUhWef3fyPhxco/jXBiHR6kK2Ycom
	T2pf0Xl5MmqYzj6rtCknk1dHNH5ws1i78cO1LdsIzX4Csre1SO3QZ4Ck
X-Gm-Gg: AfdE7clynJ14IT/yW0c0vk/EEcf9Y9evRCyyxyDzgfd53zZqSHxyylVy4zVb+GuEUmH
	RFbVa7wcZqaLjjF+Y/QTwiZubVFUO8y0IOcXdwjXifBLgEM09KysYZLOi/zP2xy2T38GL8clPh2
	NjFbiwPwvNH6f62wPE+d3qfBCFhp0RKrd1oADwlBO4nuZJxtHxEApAdgnhHsCcLIN6+fXIevG3M
	OlQ4k5t3r4WMeTmNrYzCLVWWnDp6Lt0Ysbye1mrOYRMsooe21L14rjwwfjJHPUc0U9obbM4nlZp
	knnDjnwSDvx7VULpUjO8iJqkCJKW3XCrFfQ3o+OxeoZd6rTSlpZgtASoEe9eQ42fBtAUTWIv+du
	lPPRjqcp1Gv8NYiWOEMbQU7sp6vZgX+jOQUsKQqSMSqDel++V1R5zRnDHAMsKic3NypuNZt4P7e
	jiOCE4CrybCiiQ5361ewn1bCdfMizoRwS59zxFIgyiPhwkUlT8BZsO2fB6qSyt
X-Received: by 2002:a05:6a20:12d0:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3c0bc95630amr10563387637.22.1783628195005;
        Thu, 09 Jul 2026 13:16:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm38446663eec.19.2026.07.09.13.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:16:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:46:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <alABgaW3OpGvH_Oc@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.816918647@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.816918647@kernel.org>

On Tue, Jul 07, 2026 at 09:06:07PM +0200, Thomas Gleixner wrote:
> Randomizing the syscall stack can only happen after state is established
> via enter_from_user_mode() or syscall_enter_from_user_mode(). The earlier
> it happens the better.
> 
> Provide two new macros to consolidate that:
> 
>   - enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode();
> 	add_random_kstack_offset_irqsoff();
> 
>   - syscall_enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode_randomize_stack();
> 	syscall_enter_from_user_mode_work();
>     
> to reduce boiler plate code.
> 
> Those are macros and not inline functions as the latter would limit the
> stack randomization scope to the inline function itself.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   56 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -6,6 +6,7 @@
>  #include <linux/irq-entry-common.h>
>  #include <linux/livepatch.h>
>  #include <linux/ptrace.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/resume_user_mode.h>
>  #include <linux/seccomp.h>
>  #include <linux/sched.h>
> @@ -150,6 +151,61 @@ static __always_inline long syscall_ente
>  }
>  
>  /**
> + * enter_from_user_mode_randomize_stack - Establish state and add stack randomization
> + *					  before invoking syscall_enter_from_user_mode_work()
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the function
> + * returns all state is correct, interrupts are still disabled and the
> + * subsequent functions can be instrumented.
> + *
> + * Implemented as a macro so that the stack randomization is effective
> + * throughout the function in which it is invoked. An inline would only make it
> + * effective in the scope of the inline function.
> + */
> +#define enter_from_user_mode_randomize_stack(regs)			\
> +do {									\
> +	enter_from_user_mode(regs);					\
> +	instrumentation_begin();					\
> +	add_random_kstack_offset_irqsoff();				\
> +	instrumentation_end();						\
> +} while (0)
> +
> +/**
> + * syscall_enter_from_user_mode_randomize_stack - Establish state and check and handle work
> + *						  before invoking a syscall
> + * @regs:	Pointer to currents pt_regs
> + * @syscall:	The syscall number
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the
> + * function returns all state is correct, interrupts are enabled and the
> + * subsequent functions can be instrumented.
> + *
> + * This is the combination of enter_from_user_mode_randomize_stack() and
> + * syscall_enter_from_user_mode_work() to be used when there is no
> + * architecture specific work to be done between the two.
> + *
> + * Returns: The original or a modified syscall number. See
> + * syscall_enter_from_user_mode_work() for further explanation.
> + *
> + * Implemented as a macro to make stack randomization effective in the calling
> + * scope.
> + */
> +#define syscall_enter_from_user_mode_randomize_stack(regs, syscall)	\
> +({									\
> +	enter_from_user_mode_randomize_stack(regs);			\
> +									\
> +	instrumentation_begin();					\
> +	local_irq_enable();						\
> +	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
> +	instrumentation_end();						\
> +									\
> +	_ret;								\
> +})
> +
> +/**
>   * syscall_enter_from_user_mode - Establish state and check and handle work
>   *				  before invoking a syscall
>   * @regs:	Pointer to currents pt_regs
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
