Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA7257858
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518768; cv=none; b=LmbUUkuCqNhtpIv4p3l2WyfJO/s5bVpq9hiwUC4eOaqzzSIaAKNE7SNkUupdki2MiOH2y8fHpoIsAvvwDwUBDeqY3R0bZPK/ZpPdNLIftqk69GrYedrJtAyPs17YrX4loaTYaUOC7pE2SCdM1nwNGnZUgBmm7Ayet+jJpNJc2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518768; c=relaxed/simple;
	bh=t0BBx4j77k/r4wLzkQ6QdpJr9i23fY5IO7mYzhTBa90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNZhlvxsKPUerrI1ZTHxauhIqrDunCsqXBMoxeFDUNn8ch1MeAM5WsnVfvlbAVVpJciBPPN1pl+RScqtJgW+DMcgJJH9/BHJmZnaXjnOARq8nB0iXEj47bNBw6RP0oieop5lJbV8pGl06jU3anttsyIDRW+C1CHL0d6mopvb6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdH4YmLc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdH4YmLc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5786395b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757518766; x=1758123566; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNIzyizj71N4TrhGzRu7v49ragUENadc6/+UUtmHAZ0=;
        b=PdH4YmLcgcnHlcO1FlOK0Ysfbrfj0ruIgjsuY/FZnL/3KYLx37p/ISUxmlL6gcuDc+
         jDn7qwo0cOouYy1tPkuhFDMWW+k6z5Rv2l+72qCbkOk/C5Ewxhonod0ojwnJwP57XDkk
         SjHtUWQyc1ySPjgnpSOZWP8yJxZz4Cn3YiskRqQvNf/z/JlmNfVpTd1M/8O/ufLobbsI
         vJR0ljMfHgNKcPNSL3NUSwm3KCwjDmNtNmJx8fZ7W4IT4c0dGXCu1XdvgrAvcvgPRGR5
         RVx72x3n4OOt0Oh4zv+D24zbdvEOmIIVixyZ1n0EGTsbxdYZRUhrMtS0p4YqHg8McFvv
         yzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518766; x=1758123566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNIzyizj71N4TrhGzRu7v49ragUENadc6/+UUtmHAZ0=;
        b=qnDYtFJNGVHE6QkLmttKzxVVv4OiOhEohqiGXzQXh9moZGvrP8D9RLqFNG+x3kP5WL
         bhuppkHQeCD8On/VTyXk//HHk5gkDwSTPr2nyLyo3ant8YokLW6sXQxZaHtVrjpIj+CG
         YqB5xBqqHIME41klZ2cgJP3s/eYau6cBrsfM7czP5VOLSsMmNyR+UUBl5MGhto0npv4l
         497zsXXE7gzo1pCX4zHx8V00sXKawgbeBBT1xJ8qdG/JVFG1x4l4VKEk3sWeBQsHO20A
         ZGo8PI6IKwnqhzZf1GEF3aZNqXde4gj7C//tsYsKuxT8Ke9tpCiIzBzrd6ef7HSD3G0O
         uyrA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VLPRw3hgQJvSMGST4AHk4zatUX+qEw6A7uTwLUkPXxxZQCnTlQxiAZNYc1tF7g4AJ0X7TnX5pMPr@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyXLS8mIPStueMmd9jNAwJQJveawWnwOa2Wb77d+djI+7zMQYnf
	9cqN13QuOXSwlIfg89QSwpzxP0+slb2RGvz/xewBK1g0UZIRE6oh+2Bp
X-Gm-Gg: ASbGncvv6okdP5IQOx8+cz2YK7bfZ9YFKusixVeU7+P+ScMnYuqUOyas5V2kRYrA9It
	B9BYn8fCPkr8x1jIxMlUqMCYhHYhRIwnHIFMDrklaOTen5++rgkU3nQ74+MVoAusFB2WEQ0Y9CV
	xYxg/oILIKLsX4xEq6wG4QeN8+2sogELmSDucAXo11P8xxtP5Crx4EcywOaods7G3mCTGg2NuL1
	kydB8cRoh26+t6twpdCy46Dfud+vsbRckbE89RVoWv25Qr+mmyumOGiBASt9H7sF2arCo9RPgn5
	/uMrw6NskpTWxooOgzn7Iz8gGiaHfNbUuDtDP4mNiJr5yBMw64tXAi75dT96LWSXxYtc30bcz8b
	PqmXdziOvdg0AUDHv7zlcwsELz9f+fDBS
X-Google-Smtp-Source: AGHT+IEOlqvObZUV3RxQzGGSxEugu+hq9OMCc5zjg0K2fS2Pjf8AZXtTPPCGB5s7XnoH5Swvb30hIg==
X-Received: by 2002:a05:6a20:3d19:b0:24d:b11b:e908 with SMTP id adf61e73a8af0-2533e9504f9mr23346063637.11.1757518765905;
        Wed, 10 Sep 2025 08:39:25 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab590277sm2085577a91.8.2025.09.10.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:39:25 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:39:23 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Mary Strodl <mstrodl@csh.rit.edu>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] m68k: bitops: Fix find_*_bit() signatures
Message-ID: <aMGbq2h1ElzsDrCR@yury>
References: <de6919554fbb4cd1427155c6bafbac8a9df822c8.1757517135.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de6919554fbb4cd1427155c6bafbac8a9df822c8.1757517135.git.geert@linux-m68k.org>

On Wed, Sep 10, 2025 at 05:16:13PM +0200, Geert Uytterhoeven wrote:
> The function signatures of the m68k-optimized implementations of the
> find_{first,next}_{,zero_}bit() helpers do not match the generic
> variants.
> 
> Fix this by changing all non-pointer inputs and outputs to "unsigned
> long", and updating a few local variables.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509092305.ncd9mzaZ-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

> ---
> To be queued in the m68k tree for v6.18.
> 
>  arch/m68k/include/asm/bitops.h | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
> index 139ec9289ff2d324..e9639e48c6c3c1da 100644
> --- a/arch/m68k/include/asm/bitops.h
> +++ b/arch/m68k/include/asm/bitops.h
> @@ -350,12 +350,12 @@ static inline bool xor_unlock_is_negative_byte(unsigned long mask,
>  #include <asm-generic/bitops/ffz.h>
>  #else
>  
> -static inline int find_first_zero_bit(const unsigned long *vaddr,
> -				      unsigned size)
> +static inline unsigned long find_first_zero_bit(const unsigned long *vaddr,
> +						unsigned long size)
>  {
>  	const unsigned long *p = vaddr;
> -	int res = 32;
> -	unsigned int words;
> +	unsigned long res = 32;
> +	unsigned long words;
>  	unsigned long num;
>  
>  	if (!size)
> @@ -376,8 +376,9 @@ static inline int find_first_zero_bit(const unsigned long *vaddr,
>  }
>  #define find_first_zero_bit find_first_zero_bit
>  
> -static inline int find_next_zero_bit(const unsigned long *vaddr, int size,
> -				     int offset)
> +static inline unsigned long find_next_zero_bit(const unsigned long *vaddr,
> +					       unsigned long size,
> +					       unsigned long offset)
>  {
>  	const unsigned long *p = vaddr + (offset >> 5);
>  	int bit = offset & 31UL, res;
> @@ -406,11 +407,12 @@ static inline int find_next_zero_bit(const unsigned long *vaddr, int size,
>  }
>  #define find_next_zero_bit find_next_zero_bit
>  
> -static inline int find_first_bit(const unsigned long *vaddr, unsigned size)
> +static inline unsigned long find_first_bit(const unsigned long *vaddr,
> +					   unsigned long size)
>  {
>  	const unsigned long *p = vaddr;
> -	int res = 32;
> -	unsigned int words;
> +	unsigned long res = 32;
> +	unsigned long words;
>  	unsigned long num;
>  
>  	if (!size)
> @@ -431,8 +433,9 @@ static inline int find_first_bit(const unsigned long *vaddr, unsigned size)
>  }
>  #define find_first_bit find_first_bit
>  
> -static inline int find_next_bit(const unsigned long *vaddr, int size,
> -				int offset)
> +static inline unsigned long find_next_bit(const unsigned long *vaddr,
> +					  unsigned long size,
> +					  unsigned long offset)
>  {
>  	const unsigned long *p = vaddr + (offset >> 5);
>  	int bit = offset & 31UL, res;
> -- 
> 2.43.0
