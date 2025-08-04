Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066128B4F8
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Aug 2025 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754327712; cv=none; b=IDr4N6kBes2ujTfX9zTDJNhWQF1cr1yGkvibnuOADSXB8PaKyVfnAswPYX3igLazRMvQ7lxhwtQNfMWYAaqY66kS4CBkL4+QgISpY1Ygz+8SQgoJ+sKFTRVBURM0Hp3C+9EoI0+m7PSw8Qg0X9e01QNQB+b48uCpcxg2lDi3UxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754327712; c=relaxed/simple;
	bh=BSv3IA5IuUJhTBGL3xkgYTrQYKCsOpXUGxp4B+QDShQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBA55IBiITPf/AMu87R4ToESOJiXDhPDT4y321e/t/MUk13vEq03Acz5p4QcqR9qYg4f8C6oRu/bJ7rcXi5g2Li8XLHDwrRbII33Re3JiQj2mSFNLhfq/OW2XRhyqHCzXtEwfNN5dlhnhe3IE1YH+GXmb1FmunTDEf4+Z7OLCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqLQ00F2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqLQ00F2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78315ff04so3732638f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Aug 2025 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754327709; x=1754932509; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=PqLQ00F2UJdJD5Xr2A6LX45pQoj1+dqB6f1NuXYE4Ma3LRANhjuXpcphac2h664qhK
         wI9pCWja1wIhQ6kdgw5QywxDjcZOKS4De1ve3raJltE1MCRut7vutWdTzjMKPf+dClvc
         IxOjq01Sz+FotWlVAFj2+o9Nka64el7DsjyCtgsQARGflyzVl0iQy1LdysowndWahyCR
         desXvSAIbVWJoANakisQkXwd59mn2al2Vi0i0cWS3OOST4kWIFSDpo6IqB19wA9v1px3
         n6QawcoOCjPBgVr4SVAQeADPKwPF21BmPltsVr+WDAF3lpbXcD4O+zxwTyin7oAEvFk+
         h34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754327709; x=1754932509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ES2rPSb96ZRcMua/upicMCXBbX2m2hK2sP3TCwY9yY=;
        b=eBnxM6r7ptPTYnn1GnFa4NJjKzE4GSWrytJW/0CfX4gLNZI3ss9HkjsTZ7GeaZTDDL
         lTqvkDWCgNvMv8a8FrS6Zt5xAuWe1uYC68X9ziD3V8O02InFA/sUPh70vqvQFdm2hGSu
         Myhp1XQKoR1L+oVeeGmLIKfWLe4WbASerX/P1IlODVcuZHdlTr2JlQ09mBdEVQlUB/vO
         Ie92o5HGSQHS8L5qPpZ5rhltNl68nPaCQWUzffJRQGv1VOpIXpmLoVTIZzMocTkOZpOb
         4pEcnsq6g10emVGE6qeJyGLE4QXUg3bBxZ5H+9U/ofGgfE9MXuNLmRlkqE40o81z4gb9
         Q1+A==
X-Forwarded-Encrypted: i=1; AJvYcCWhrvnFFdxJZhnelE72tuPWj/rhXqqNbVJmD81A99elTCaV+SeQRfqS9T9slWeYUm4uQDnwJ3d9UsHZ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyxCiH7ukRr7R3tFx5EmMNoICOcXuQCTQ3BCaauID2CosK/mMlM
	nF7/ydaPa7xmf2QXL+zSbhLNIl9LSbZjsBkVl/PGt+7/MEpYEgdxT7ZE
X-Gm-Gg: ASbGncume/g+uGPnwSbjHDyBUdu28SScDC8EzIHhTq9otoJk1/7//Uwpag6jA3ZIe1h
	mmRpaijOY3fNA44Iq8LXegD2ViTcTcKzXBbtlp1fy7wXv0eQu7TdpUj9dopeMeTOa07zkPZh+qM
	QFn/4/8SSXjnJQkELwpO9v8N/8eA+TwVgIZZHjEoH3pvgtILSxhaI6CEXtYqj7/iukFJCgC3/5Q
	7LzS2QGoaK5y/qrNZV0UyYxZ6xGzrczS5QDcPw4EFc0AY8Dw67UADn/lCxEMG3jth2Zr7x1fykg
	lZMzrHKtBc6a//GGU/jIzkZKJAqichle0brMv2rc2fkS2XqO5KwD+aqbcSk7wWtT7kd6XRXKiPo
	SSdGM1X4l/L7BzeRvCC6jKdkHVQvJQ/5P8OR0o2RsEnyj+AWLUeKqtPIngotvtQ==
X-Google-Smtp-Source: AGHT+IEpNawQWUPhZIXoNWLCtN2+qaXCsKArzNXCXzW1yE3i7/WUxeM9GsxIUXvlWMi666W2l82q6Q==
X-Received: by 2002:a05:6000:40c9:b0:3b8:893f:a185 with SMTP id ffacd0b85a97d-3b8d94cf20dmr7323692f8f.53.1754327708754;
        Mon, 04 Aug 2025 10:15:08 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47ae8esm16051546f8f.61.2025.08.04.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:15:07 -0700 (PDT)
Date: Mon, 4 Aug 2025 18:15:06 +0100
From: Stafford Horne <shorne@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 10/17] openrisc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJDqmoUNhwWeAlpa@antec>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-10-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804164417.1612371-10-kees@kernel.org>

On Mon, Aug 04, 2025 at 09:44:06AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to OpenRISC's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
> 
> Build tested ARCH=openrisc defconfig with GCC or1k-linux 15.1.0.

THis looks ok to me.

> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Stafford Horne <shorne@gmail.com>

> ---
>  arch/openrisc/include/asm/bitops/__ffs.h | 2 +-
>  arch/openrisc/include/asm/bitops/__fls.h | 2 +-
>  arch/openrisc/include/asm/bitops/ffs.h   | 2 +-
>  arch/openrisc/include/asm/bitops/fls.h   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/include/asm/bitops/__ffs.h b/arch/openrisc/include/asm/bitops/__ffs.h
> index 1e224b616fdf..4827b66530b2 100644
> --- a/arch/openrisc/include/asm/bitops/__ffs.h
> +++ b/arch/openrisc/include/asm/bitops/__ffs.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline unsigned long __ffs(unsigned long x)
> +static inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/__fls.h b/arch/openrisc/include/asm/bitops/__fls.h
> index 9658446ad141..637cc76fe4b7 100644
> --- a/arch/openrisc/include/asm/bitops/__fls.h
> +++ b/arch/openrisc/include/asm/bitops/__fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline unsigned long __fls(unsigned long x)
> +static inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/ffs.h b/arch/openrisc/include/asm/bitops/ffs.h
> index b4c835d6bc84..536a60ab9cc3 100644
> --- a/arch/openrisc/include/asm/bitops/ffs.h
> +++ b/arch/openrisc/include/asm/bitops/ffs.h
> @@ -10,7 +10,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FF1
>  
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	int ret;
>  
> diff --git a/arch/openrisc/include/asm/bitops/fls.h b/arch/openrisc/include/asm/bitops/fls.h
> index 6b77f6556fb9..77da7639bb3e 100644
> --- a/arch/openrisc/include/asm/bitops/fls.h
> +++ b/arch/openrisc/include/asm/bitops/fls.h
> @@ -11,7 +11,7 @@
>  
>  #ifdef CONFIG_OPENRISC_HAVE_INST_FL1
>  
> -static inline int fls(unsigned int x)
> +static inline __attribute_const__ int fls(unsigned int x)
>  {
>  	int ret;
>  
> -- 
> 2.34.1
> 
> 
