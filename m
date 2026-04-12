Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A063313E17
	for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984199; cv=none; b=eU0qQ0ABUkbmWefN9rD0DiRvuTZ+kqaI6II8X29HCKV2dU8TbBk1Nb7Zejt6Lui+PHPnsGBAqSX/PWWCHP6xFMwsppe/rtI4smFIeMa6KMm33O9GjL0TJv00JlUZ8UHSbCamXN8ypeLEFM+xMdIw+5AbiOB1TSrciukCeDQXS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984199; c=relaxed/simple;
	bh=XZtsBYJ+xUzK/w66hhh7L4ep5/Nv3d9zyXSTiNiHtzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBob1VLEdl1atvMzGDs0etxC244oFJtMYX1AdWgnFihD+AU7zegupmZAjnW6yk8Pa0oXr+P+fvoPGSzBxbhbyptXAd3G69clAMaue5FC9LCNVY9Hh9qoIEcAOZoNYKmifZkdt++NpAeeKNnTcQmQ5owvfkSjLT7qbYWa0X7k/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmUZEyLc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmUZEyLc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d70c30767so265750f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775984196; x=1776588996; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=kmUZEyLcPTH1oeF6NixGY292e2+0sNtOqXYwu6FCqD/l0+rrjT90Xcj1oA+1sHUPE8
         SyR70IuM2GdN5jqeCqYcsph8m+fJ4WhSsO1uFH0vGj50ltIflTKLtl9W7EuiebN87k1p
         3kic8hZMeDHbg7/jODprh4YFvWukGnlNO1l9tFlZ/6kNdgeInyIejmvlyW4dEq6XvwJ3
         KwCckIsCAO7EXrDMLnioG8Q1eIqKRqmsKsZvNQ5AxBUqmoa8o0PrJhy31TRuwmVrGRtD
         Gwol/oxHSdxi76PlPvE6IOZsFOSP2eVoW1nypNmQDlD2Ada6oRs5WAESeKQUBlhQlASR
         dAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775984196; x=1776588996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbDgrbrkQIZIzHMqS4zyFwb8jbE/7QCDRz8zhtNheE4=;
        b=BHlfZEtuVU8NEBBiBiHLgZO9H1ceCHbhGNyxiM1364Cg9CY+DJhvmQ4cx65tZqbymN
         8s5qbuoE1QfVpWcVjzPEvEvuRH7tfw93XAFu63ckm7FSSWLtTbOww9lwSuzTAgM85qwC
         elqEXYMc4nzre3lDoluUlq4Ni6XC6VsELjJU9PHmHpP2vd7d196VIxhX/kqSRQpEpRDY
         oJ46KVwofRM5mTSSNZ1dNxTtuitYac4uwKEa5dtBam02Trty3Ntacb8+wgPpDqmlsKXD
         Wfx1JOVoONXQZfxBMXpIlRdCvtzclyqJ0FbDVmX1a9cq24Kk8g7SfHTNBaWjMpLRxY+X
         2rbA==
X-Forwarded-Encrypted: i=1; AJvYcCUozpFedbebhEE5v++S0tV26lp17VKxqcOyWxEg8kwmc/eI75pT8iNa2Q8RZTnR88DnEoTmjfoSPuA+@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzZXuS8+ev6sJ33mZ3M+7ITJtlb0Ruf18zEZJwIzZcPP6+oGUG6
	ydfGveQhJobjHDmoBaX2l5CNjEncupJLe37FvbXdGZiPQOovIlvYeAhs
X-Gm-Gg: AeBDiesclbN+YzVo9DgFftKCqqCnxyPoFnkh6UF+uKhOk2BUtv4cpb4XdfGqjIudQ8c
	RaP5eRvdqHw0a5GOJfcfCBlXC5A9YMt9YKyhLbfEQleHs7RS769UN73Or9OMVX132Dkbharae0N
	ld8LNij4PAipeR0K0lAx0DN2H9G36sUxk8YNnZl8OQGNWvYbbb/Xfs/jnnEwt36rJJ0RK6/lKCV
	dWn88BwmZzjX5RHOfHtp0Sqc24Buf+7bPaWhh1HSrsBe/ZPik5WO9h3/bJHgkUtNzJx2rfgBGNE
	wTaTuAt5kjfwuvvu/xYlaUwGm0hsHr0jM3TSJloRvptvCBkNf6A7OaSQzfXIQBso8fwiS2GKnBP
	nOipcMREGWu8Yxr+SAiGTqQXWztLnHmcgz5FnpdGJ9kpNFc1sLunhC9xL9nUP07VGa1c3Fc7Cit
	ZigXzUUnw/YSY51D2SiXLTKVgZ9ke4yp7lQa14y2sWi+2i7AwMlzaAYbZ7x0Lvpgdd1+Tunp2Y2
	epFww==
X-Received: by 2002:a05:600c:698d:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488d6ac9ce5mr126951995e9.14.1775984195334;
        Sun, 12 Apr 2026 01:56:35 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ed4dsm197923925e9.4.2026.04.12.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 01:56:34 -0700 (PDT)
Date: Sun, 12 Apr 2026 09:56:33 +0100
From: Stafford Horne <shorne@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonas Bonn <jonas@southpole.se>,
	linux-openrisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>,
	iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org
Subject: Re: [patch 30/38] openrisc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <adteQSw8c65MtX5l@antec>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.593798781@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.593798781@kernel.org>

On Fri, Apr 10, 2026 at 02:20:55PM +0200, Thomas Gleixner wrote:
> The only remaining non-architecture usage of get_cycles() is to provide
> random_get_entropy().
> 
> Switch openrisc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Add 'asm/timex.h' includes to the relevant files, so the global include can
> be removed once all architectures are converted over.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: linux-openrisc@vger.kernel.org

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/Kconfig              |    1 +
>  arch/openrisc/include/asm/random.h |   12 ++++++++++++
>  arch/openrisc/include/asm/timex.h  |    5 -----
>  arch/openrisc/lib/delay.c          |    1 +
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -10,6 +10,7 @@ config OPENRISC
>  	select ARCH_HAS_DELAY_TIMER
>  	select ARCH_HAS_DMA_SET_UNCACHED
>  	select ARCH_HAS_DMA_CLEAR_UNCACHED
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select GENERIC_BUILTIN_DTB
>  	select COMMON_CLK
> --- /dev/null
> +++ b/arch/openrisc/include/asm/random.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __ASM_OPENRISC_RANDOM_H
> +#define __ASM_OPENRISC_RANDOM_H
> +
> +#include <asm/timex.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return get_cycles();
> +}
> +
> +#endif
> --- a/arch/openrisc/include/asm/timex.h
> +++ b/arch/openrisc/include/asm/timex.h
> @@ -9,13 +9,9 @@
>   * OpenRISC implementation:
>   * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
>   */
> -
>  #ifndef __ASM_OPENRISC_TIMEX_H
>  #define __ASM_OPENRISC_TIMEX_H
>  
> -#define get_cycles get_cycles
> -
> -#include <asm-generic/timex.h>
>  #include <asm/spr.h>
>  #include <asm/spr_defs.h>
>  
> @@ -23,6 +19,5 @@ static inline cycles_t get_cycles(void)
>  {
>  	return mfspr(SPR_TTCR);
>  }
> -#define get_cycles get_cycles
>  
>  #endif
> --- a/arch/openrisc/lib/delay.c
> +++ b/arch/openrisc/lib/delay.c
> @@ -18,6 +18,7 @@
>  #include <linux/init.h>
>  
>  #include <asm/param.h>
> +#include <asm/timex.h>
>  #include <asm/processor.h>
>  
>  bool delay_read_timer(unsigned long *timer_value)
> 
> 
