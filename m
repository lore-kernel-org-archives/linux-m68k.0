Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43833C10A8
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626218; cv=none; b=KL/twGkHeoLR/Hjoj9fMAMt0mbeor90evCtNQzy7eOcdNQgndnhdpJMtLtanXK5ABu6JsjejGEA3Py65v3VV3XzuPMW7oPt5mdB+gr9EVQnWGHseBc53W/yxxuYamWeK/yP3vgATYCr833hHxx7xsgGAQpE38iUdKZL/IbLALuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626218; c=relaxed/simple;
	bh=jWS6CuM01KL0TKzupA5IpoB96YuuBOzox4OyTj5L3ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etNzbFKGmHQHXPi6IWD57ivhoP8nrEK8ZcPM3yzscEO95nwEVPJ8sNwniOt92LM4cuGG6ZmRYJdXadfT8wNWclKS/lxro7IuVGRbzqOxksyDJdysJcv5J8eDKVawtv7OUAPR652vYLoy8YyMbTrKreUZahRjviGJ/NxM8f4wyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwM0+1Ya; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwM0+1Ya"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so126800a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626215; x=1784231015; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=DwM0+1YaFwNNs+2SJIgqh0vFaNdKYRDbrdC4hO0qqEy5Tej8qO2LnRD0euCEVl/nbw
         DIneoPrr67uIcSGBGJlvz+OVtJc3kWR6YZNjOr44iuxKurGiGWJu5A4XR8hwykybXvm4
         RUxJ9gnd/1qJ9L6I3osh4ZECpHiMUQOJ2IPJPuC1C+DeZoQhWdpaYSNMNeVW2IiNzrxW
         R5Er6SKqOU0+537J/GXAnAzlKzLT3CVbtY74PvIGQOq1/XIURF17EMtrv8TxTcN9BQme
         qoa5m96RiZVf8CXPKNXkV74eHuB/iw+KXe5q9EU0gC3NbDHBzsYc8TyEDtc2iST2Sihl
         03Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626215; x=1784231015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcViCEZV9Tm/crNMdaH3VAbncnTvlz/mpQaPDKjBGxQ=;
        b=s0gCY9i1XXImAgPp0zvQdLaUXDxMabeyqfV5WO8BC0XGBS8jHBmKHRfD3dd5OGwsEE
         CO9V/dBwlBjYH5CAr5u0XPhotP+2gk0x4mQtzCrTqEsvlgbBJYFZ9SPtlw8BpKcfS8Fn
         Ex17z6HQ2Y7mwDVgPkY/qIrY06c9S9ghwh+Yt4vldMDqqBjuyxsdq95YXAdFNmuA5Ef3
         ucbnj6p/t89232/t1drH9sBkr6A1j4iwVCzh1l+9OqzFY7P+e4jf5ykf6eu0fJ00VW4T
         rhw8Dhv78gIdyj2PH8ga3569i+tGr2+lCg1ayYRxTGNlM+jTdYvEuR0a0RFOew+m9n8p
         aKwA==
X-Forwarded-Encrypted: i=1; AHgh+RrOz27oVr5vvKhAcZOavcWLpdaF02KDsy0rKwWAQ8+b9N3+aONVD9rm0YmT8AK5/dqvS7XP/CZL1ebT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwssEWz1SabKLKs9HtlCw0nLGgNEzI2h7QSye74VQnQ11WszbXU
	Gc19vFSIMXJBih4fVFg01c0oygme83DaHf2CrkoikGJP6sCeG1pveukI
X-Gm-Gg: AfdE7cnJmf0sEqMD25w/8qk81yMMsfBjMR11PEDpexw3CnG4s67TtFLLh5LQkwlU1uw
	RmjpiimL9tV7Lp+tNKRNcC4mLhr011LWH3wMxltkLjdMR3iENShKFzsKbu9+clbdmJ0Ncnuh9jL
	HjBQQg7B4wSvfGSOcI+mtXgJGlHxozwgNbrFSrk8v6JYJ3K/btjX3jABVbcacqBl2+/Mvc9s7V+
	BnpqQ9F8yIafao6uHL6J8rNI7tQ9Vagr8T1zR/mYWLe1OZK3fd42uXzKofIO5qXI8th+Fm1m10O
	7Qlos838jmmBkYwbnA1yOGxcA9DRBHSHHqoiQ4aSICes5zRouYWj4YKGadnTCyQYPV0R29VtXSa
	opA2mBRdCfJZF0efGf0bHogcq9TrxiFDRvKt4go7fzcV/zmJGH8iXlgE01g44HJciDRcIz62+22
	aqMPZPnBp5BnGyO3Pa6YRVrlPzXoKqyQQ5c9v7XUVktci1RTkGWjFvHMyhwyCZ
X-Received: by 2002:a05:6a21:6daa:b0:3c0:9c1a:8949 with SMTP id adf61e73a8af0-3c0bd287dd3mr11145411637.65.1783626215188;
        Thu, 09 Jul 2026 12:43:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm39667491c88.2.2026.07.09.12.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:43:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:13:15 +0530
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
Subject: Re: [patch 15/18] x86/entry: Make syscall functions static
Message-ID: <ak_5y-p4DPztR-CH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.438361565@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190254.438361565@kernel.org>

On Tue, Jul 07, 2026 at 09:06:57PM +0200, Thomas Gleixner wrote:
> They are only used in the respective source files. No point in exposing
> them.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  arch/x86/entry/syscall_32.c    |    2 +-
>  arch/x86/entry/syscall_64.c    |   10 ++++++----
>  arch/x86/include/asm/syscall.h |    8 --------
>  3 files changed, 7 insertions(+), 13 deletions(-)
> 
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -41,7 +41,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #endif
>  
>  #define __SYSCALL(nr, sym) case nr: return __ia32_##sym(regs);
> -long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_32.h>
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -32,7 +32,7 @@ const sys_call_ptr_t sys_call_table[] =
>  #undef  __SYSCALL
>  
>  #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
> -long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
>  	switch (nr) {
>  	#include <asm/syscalls_64.h>
> @@ -40,15 +40,17 @@ long x64_sys_call(const struct pt_regs *
>  	}
>  }
>  
> -#ifdef CONFIG_X86_X32_ABI
> -long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
> +static noinline long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
>  {
> +#ifdef CONFIG_X86_X32_ABI
>  	switch (nr) {
>  	#include <asm/syscalls_x32.h>
>  	default: return __x64_sys_ni_syscall(regs);
>  	}
> -}
> +#else
> +	return -ENOSYS;
>  #endif
> +}
>  
>  static __always_inline bool do_syscall_x64(struct pt_regs *regs, int nr)
>  {
> --- a/arch/x86/include/asm/syscall.h
> +++ b/arch/x86/include/asm/syscall.h
> @@ -21,14 +21,6 @@ typedef long (*sys_call_ptr_t)(const str
>  extern const sys_call_ptr_t sys_call_table[];
>  
>  /*
> - * These may not exist, but still put the prototypes in so we
> - * can use IS_ENABLED().
> - */
> -extern long ia32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x32_sys_call(const struct pt_regs *, unsigned int nr);
> -extern long x64_sys_call(const struct pt_regs *, unsigned int nr);
> -
> -/*
>   * Only the low 32 bits of orig_ax are meaningful, so we return int.
>   * This importantly ignores the high bits on 64-bit, so comparisons
>   * sign-extend the low 32 bits.
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
