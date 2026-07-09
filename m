Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42F4D990F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622084; cv=none; b=KspaMqr7Ee6O1igemvy+YUmKGN4WjG5xJL1v51CGxXW2OJHJZdAjQdTvlXCS7ti1WpBL9WQ2qWfUAS9pSmdynea559kWtNd6GZKTo8y5pRUkwJjWx3lgugjjvyqFXCSeetibMEjU99ZpjJHMyCEd8ZmSKUV+62plVrSNoxCsVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622084; c=relaxed/simple;
	bh=jgoYslbmrTXQwTFPwDFZi/esOXDuFRs3hpbsZJU8/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Adwbnq01vGgmddD6A1oJG4WgsrdCFEnMN2vqe9n1cbmEyJGsU25PlMbQuBsFhoHBBnyrVUx0sznSIj9vEtyNrrlwDckmIfHnN+Mg17IdWiqUmg6/F2BkXWv9JdcC2HmYN6v2CBiT3/1IfnmlCzZFszrdrQjeZuLaAMRb+9KJUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU0KH01F; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU0KH01F"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so195432a91.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622081; x=1784226881; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=TU0KH01F3uH//2hhmRAxhYzC9IfksgChqwm1ONwGFVeZk0JfRyMXCw0WOaVz3P0ydG
         qbm8ryVuyQRXlWKVneTYbansdLkIf7ZSZmI5y6VMZoIylnXI8WCuNDP5zs/xV3sIREtK
         eHrXMvOzaT+F4ST9Hisw2LxuehyY9IQZrSbvzWlJWNBtw74GMFqAiMXa1cKcbdEx9Xn9
         8IYRPxABt1iT37U4OfRGlSwBgmr+SijwqSj+l5pEqx8gY5Py3A/agGXQKAMKxaUI2ovE
         YbVQTLbVoEvsx4Al8IhxpwO3vzUQBmu//X2sBtvAbpRJKofAhydMYY/vqnKDpKMxC5ka
         Dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622081; x=1784226881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=ggb6R/Zxj6DBb5GaF6AO4rpFyaprmBhFMjny9Ee3mVlhDQ1dmzKnwj+ujXq4GVI/in
         zmdvfGQWZ6m+DcloSOfYsc5vrCUeBxQnZwmlr4bIXGbN4UJ560ZbNwRaCDoJDb+70B1K
         S5DrSXEBsY+gjht17MgD/Tm4XnxG6wHm50gBryVHsj9y7pox80epQZQUCVSfFlM9UWcA
         yRyB1Ds/oPZFr4+150QoqtLoIgcvxG//EBd64TLekQaWK9pI8t4+DmwZQtE3qKELTVgZ
         FErbvpI1xfOh8aW4ibZ3lnCfL872OiNFmBES5sktt6Vkd/BDOXM6hKfv/GUeWg0C0tvU
         3xMA==
X-Forwarded-Encrypted: i=1; AHgh+Rrt8WMkJSCfrxtvYtGAXCS4iOBMHLI1yPcrpNLQ6QyHjZ7nZJost8Tx4CEZZnnEF7PcgR7s6uk29X2X@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy7Y3UCgTkFWU2gwWcUs6JbfpGDCv/v7ndkfZn1mnys8Psh0JD7
	WnH6WKBl3CUpldqY7oBpkDSUnGJU2EqkppYRUcCWrAydc9R+z4qs6L/Y
X-Gm-Gg: AfdE7ckSr6KZGIXN14Iar1n8Px1zlx/k8EbYcLIejP+AEdvA4A6aRjryxfih4DWfbG7
	a/rbdhtlHD1SAXXW/H+H9cofqNYztmYDQeYENjT9TpBtkLIPjbgCNGAsz1Vw44qOwKBKvdy4znS
	PHkX8PXy45P5fF6s3Qpsm8CzpJy1WwEE797xXmJ6HAuj+yOCSwwiNlRQuXbzq0CG3cgPCHnYw/r
	G8u+blAD7HbYPedFkZe0LqVkgBZhLlcq3MKDjTeziHXBGaAFrDw/lJn8FzvJfGi7hLxp4FLLn3I
	UHY1P1Mp1U3r4qGTy72wscJ7DVDOxwM+bE6/md2V6EUxLG2P6ePFjxgWOh1V2L56ZA8Y+LElGwz
	yCJQVg3c2CQ82D3g4mvm01+seOM5E4b1KmHjM4tcDqQtJ3Brr7JEIUgXCi4+pVW1Zsj2/jugPwD
	52MbF5snU+o8g3bVj8qFOoHpCveZuXCsZhhwhR4WaH0Koc/M+GSf6ilz2L/PkP
X-Received: by 2002:a17:90b:2752:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-389417e4858mr8140301a91.22.1783622081049;
        Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm11123455eec.22.2026.07.09.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:34:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:04:21 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
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
Subject: Re: [patch 02/18] randomize_kstack: Provide
 add_random_kstack_offset_irqsoff()
Message-ID: <ak_piRRvfiMc9m7N@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.768842729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.768842729@kernel.org>

On Tue, Jul 07, 2026 at 09:06:02PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() uses get/put_cpu_var() which is pointless
> overhead when it is invoked from low level entry code with interrupts
> disabled.
> 
> Provide a irqsoff() variant, which avoids that.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> ---
>  include/linux/randomize_kstack.h |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -77,8 +77,27 @@ static __always_inline u32 get_kstack_of
>  	}								\
>  } while (0)
>  
> +/**
> + * add_random_kstack_offset_irqsoff - Increase stack utilization by a random offset.
> + *
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Interrupts must be still disabled.
> + */
> +#define add_random_kstack_offset_irqsoff()					\
> +do {										\
> +	lockdep_assert_irqs_disabled();						\
> +	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,		\
> +				&randomize_kstack_offset)) {			\
> +		u32 offset = prandom_u32_state(raw_cpu_ptr(&kstack_rnd_state));	\
> +		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));		\
> +		/* Keep allocation even after "ptr" loses scope. */		\
> +		asm volatile("" :: "r"(ptr) : "memory");			\
> +	}									\
> +} while (0)
> +
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
> +#define add_random_kstack_offset_irqsoff()	do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> 
LGTM.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc
