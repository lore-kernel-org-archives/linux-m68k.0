Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5C3BD651
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Apr 2026 11:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770576; cv=none; b=YklVVD9r9Oxl/bsO6bk3u6en2+7csYRNl78mxtoB7Ah6ovlP1QAH/qIuGduawNHm0emsy1Au8ncXhcib6TCOaY2vCPyeLT1xZ0RTUrLRkytWpdnVRAYWPhk2uAJyGJJj5GbloqceGy86ovCDKJRnYNbY/pu7tegKzuzPlvICYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770576; c=relaxed/simple;
	bh=7J5sLUyTcEtZ5b/o54KJz2TjlXrWGH0W+oigsdVGJYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkAwih4ysMmyabH1mUakM68Sfs7EtZcIJFZ/xeIIFFBE4/c0ZVxKisXG9qTDiusO5uNhdZWvBqa9CMB+sPSm8Iyr72F/1UcDktnpb8aKlDiv4TevaOxe+XfLpQKBCuc7O03VSmEf3VPz8rNOHmRJbxoMPbrQB8OpLLPfezRvmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WITph9t/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WITph9t/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso2248096b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Apr 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770574; x=1777375374; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=WITph9t/a4FcKbj5Sf/zGH4cl1SK6O10zleR6jkCGeT+rgowbRDcEeXIbe9E0JdKUp
         mW+vkxI3i2HJTaUwyyR/lAufkeGSATbIjvONt4/X33F+2iBhr3fkFFwuhhFGSKLqTrX8
         8q4Xz2Co6nS4J5LjeHYWqqlVgjujTH4iR3HUX6FYczSBpW7jkzq95XH2uWpFth9+OH/k
         F9cT4iVI8p0XFijjIlCxzSuxxG5Bo99M/g5b9/dminRlWfAPAuU6N7rlsd3Ksq4DcFUQ
         Ih646o8tdfmgwCsOfvR83hwuI0sJBhRQVGJaRJzqK+Uh1aU/a1lsmmGL2IdcOh1KMrMW
         xEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770574; x=1777375374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=YfDfQgvXhUWY10jvo3Jpidp0dlSLCkEkMzM8KwYSfSznYlbDeXJ+7gTXapezZ4W2K1
         12HCOHwtpy/sHYkGgFdXvszisPCQiEICVUlk7evbGmYA+pz4lfaX4yjAfgyum1lYD155
         ZAOc9PyaOdfs3hsntRUzvJ8+vn8DJ92wT+Bh24dfYOEOuAZNmNRwi008j4zu2t9v8yi3
         txnpuJAYxBBjaw6KAebPne9lrNG2p+9sv5YvhbqiqyfpMfp53sXpiFDpS81LOXBA60LB
         pmRqCgpapvtlV/WMQOseCqZ8hIaGNvB/l0XzUM+iC79+aeKI4v+g8o9IsxTPprgdCFf7
         R1kA==
X-Forwarded-Encrypted: i=1; AFNElJ/GF2UTwfjMGJQQkqV55b7+2g/0U0J7DuLBnBBND/rA2poeCTzcGoLUho6rg4TIh4wB40TiidfWxNXN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw5993dVVjO0yCwr1k/PfqLdR0+JEfHFEvgUIxpbOf2qxocQRyY
	aJbY2Fvdl6RFOjuRyVE1T9neyehOdS7Zv8kkEeJ5LpW7jubI2E26mubo
X-Gm-Gg: AeBDieu4p82zzuYZHiD/sWWvAw0IT3gZ1L/gebcRmfpMp60/4/oRUBtCckCMBcKZnWv
	cTvmUEGaYPxcwHrbsFVeboUCqLz851kQsqg4NM5YyV0tDiNv7BiaBdwWIhaGC4/RVsvXhYL8vLE
	w9rs4SWyeq9xFEuinUvDBWk3pbbNeif5KoeoWXYuMFBBkQJR4X2Dn5h+dbKHokKnDuCxdiKO4vm
	Q7FQjtsjRd39zN4TO2AovNDPQZ58ved5n1cQoU9CGIORF+4kbC+Dv1G2HFa1++/ooOB56rBTlU8
	91ecFzcNrbAFmRhUmuShpDjqRX+KQHgl4O/TdTB0y3BaKE1TanSZ5HOQ0vxx550HjhdTPhn/NNw
	olOMdNZu97rcEoSuBXDl5H4MfdH0usubZX0JYf5yH3G8exy2c2Sm7JeGfw5HXZ7CgT3Gogx83gi
	arOVq5Cj3JW7uk0BcxOYDg9fIdkYOyLgeO2P6OJpWOb17KhupCJr/kUl4ws+DptvuorHAOtQHER
	KG8GQ==
X-Received: by 2002:a05:6a00:6988:b0:82f:aae5:c7a9 with SMTP id d2e1a72fcca58-82faae5d438mr7228492b3a.27.1776770573719;
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14155014b3a.3.2026.04.21.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:52:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <aedc9UddBSYXzrAj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.789114053@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120319.789114053@kernel.org>

On Fri, Apr 10, 2026 at 02:21:09PM +0200, Thomas Gleixner wrote:
> The only remaining usage of get_cycles() is to provide random_get_entropy().
> 
> Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Remove asm/timex.h as it has no functionality anymore.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Kconfig              |    1 +
>  arch/powerpc/include/asm/random.h |   13 +++++++++++++
>  arch/powerpc/include/asm/timex.h  |   21 ---------------------
>  3 files changed, 14 insertions(+), 21 deletions(-)
> 
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -150,6 +150,7 @@ config PPC
>  	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PTDUMP
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
> --- /dev/null
> +++ b/arch/powerpc/include/asm/random.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_RANDOM_H
> +#define _ASM_POWERPC_RANDOM_H
> +
> +#include <asm/cputable.h>
> +#include <asm/vdso/timebase.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return mftb();
> +}
> +
> +#endif	/* _ASM_POWERPC_RANDOM_H */
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_POWERPC_TIMEX_H
> -#define _ASM_POWERPC_TIMEX_H
> -
> -#ifdef __KERNEL__
> -
> -/*
> - * PowerPC architecture timex specifications
> - */
> -
> -#include <asm/cputable.h>
> -#include <asm/vdso/timebase.h>
> -
> -ostatic inline cycles_t get_cycles(void)
> -{
R> -	return mftb();
> -}
> -#define get_cycles get_cycles
> -
> -#endif	/* __KERNEL__ */
> -#endif	/* _ASM_POWERPC_TIMEX_H */
> 
Build tested for this series with allmodconfig and allyesconfig on ppc64le
machine for ppc64le.
tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git getcycles-v1

Boot tested for this series on powernv9 qemu, powernv10 qemu and pSeries
power11 hardware.

Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

