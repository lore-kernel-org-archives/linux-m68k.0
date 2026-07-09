Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7B4446EF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622565; cv=none; b=aA7GgC27YkC27z+kT+Z7nmO4j/7DEtlg+da6uW6bQno0CLeLFv/4oEtJcEIyxUd2cvF1GH+CMHN6qzEttAqSar+gD6OehhCTJRDaYp9KUFzwIiIX8FbtpWCD7IuWAU2MEX0TJJGYvDBFUDt3rieyJt9ZvVZ4wHXxLXgKS6jBxrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622565; c=relaxed/simple;
	bh=jxrFwpuvrTS1XNI/bITRNy4rM5f6KM69+ytcvmY9Kws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsH/8/EPlrEAal3PtHHCluON9YppZbBDJ3ptyBBNsGpDb1Q1uwQMW22jymL/DDZv+n22sM0iwX8UWlCu3WA54Dr5UgxzVcxqhW1crHcr/T+VlDCWHFMy4j4fGXJqjrfIbH/8RrjRd2u5qvFHpXRk4+HsJZe2HgHswFkjfoUsUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+mYOv+H; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+mYOv+H"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37df72c9984so275179a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622563; x=1784227363; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=H+mYOv+Hbdh0QSpRzDoK7uoy8zEPZJvBdDWDwiH8Fjt8qmUxxM+r/vAApuHaU30kFs
         WjTifUGnNfGraJ8YwTAip3apfeORlAUJpTA1cPJvgBA6aL19CXjGu40SN5FL7vSOsqws
         BrHd3UCvevyL0wdADLa2DLSQf44/OPSyiZzhYCHeADm6256JVVMMjlmghtZrVfmeQWey
         QBJy6uYwiJJ1K8CNGdx//Tt9IfGvo8I0tZro2rK9fpVC1Vm788yoAETsxFaTMV55wqlK
         EVsWCAd8kq7S4u6M+dE62Ge0B2Y/DY9bEtDk89Z3zHDMh+gHOxXwGmneTJbsFL3AHDBx
         TMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622563; x=1784227363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=mmx01Kg8PN9GFatK+nHl9qkJKTZubxdtKRXntcxRiQDg7ENOiiL+dzOrrkrPWczZ2w
         HPhgYHBlxdu4Izfmd2m6nZ9RpObSV74Nc6Z6mtMXzk16IhdEGnzWC72S85pioghwqvn4
         j80eh5QNXdKQjI01JIwOeD92isDYNmNHt7PsNOvvE8OHOCmJZrLWV1fxtIu5z2voXSps
         T05x3S1m4lF7z+zfTgJIMHGuf/E4ChxT8aKhL3jVkBdJSpwercYFKqmxtEOq5z0DIDRa
         UTy5KjOALfwZab81ath05PlhxmGsxhJT2sxb8EIjvQVKbaq4z2wCXbgn7LXpt/J37SFy
         NoxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrgm5YeLpxlPyFFXI5AP0DDod5Qw9o9qc24XjHw61yndESBNDr7dVyWp+YO95qGIvBiTsPl1FBcpYO/@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwGopOPTtrKy3W8wuIylBIs8qRD87hDfs/YCrbgmfMNWkW3py9Y
	x7vH5ha0LNpWOQ0RB5CWx+xs70NwEp4nr7fRaTeDpY3VGZ4VSocDNlE5
X-Gm-Gg: AfdE7clH313wa7SecWkssC3ZR8SkN30yt3ICFAwBpBFH2KY314d4gtECCN2f45Zr0bF
	1/2sq/qJ7NnDB90VD2TfQK350pVe1icv9MQW7GOfpH0MtSo6y0ksRqXN6vvoTUFj0GSQioRkSIX
	kQmr9RouTl66S2UctyvSa0hwQar3ZG2QpzwSKDiHwyVDcgFCU+N+zb8wAAP1pEBxx6+kzD3Nmka
	pM598LMpMy4QqJeawm4ZKGatG539h6mUjgH6+UU3C+vcKTjwi6T1oRrn5dhgULMbwPN2Zo9vajk
	aVLWLHMYGAuObaH6dhOAYBd6F+82ntMQnYIxO5Jl8/h41ZTFjRYgPOaR4jDyBINMCmYYn1KaeI6
	/PJ/it6jZeGUkrGNBLTZ9A9cgXZZ2pIY09mzyI/6gBCCqH44USlrPCEq59Y1m8LTJEoFKpncykK
	F4TAZPn5PfMBCRFNU9ch9JdAGXRVW56wyo8b2G8zom87c0D/PbxnhoSbAvsby4
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr9806931637.27.1783622563297;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm19491362eec.17.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:12:23 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rfwwd1OtaQxka@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.974626922@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.974626922@kernel.org>

On Tue, Jul 07, 2026 at 09:06:19PM +0200, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/traps.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -7,7 +7,6 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -333,9 +332,7 @@ void do_trap_ecall_u(struct pt_regs *reg
>  
>  		riscv_v_vstate_discard(regs);
>  
> -		syscall = syscall_enter_from_user_mode(regs, syscall);
> -
> -		add_random_kstack_offset();
> +		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
>  
>  		if (syscall >= 0 && syscall < NR_syscalls) {
>  			syscall = array_index_nospec(syscall, NR_syscalls);
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
