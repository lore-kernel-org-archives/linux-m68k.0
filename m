Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99F2046B9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 23:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377397; cv=none; b=pL5Yytu36rCmSC5FdlBO98NEdEM150o7771YQpAhUuH5mCWDw8/AOWFZ2tYEwiSaghgCRSvO6j9NPfBCjFQuyTyWZSMReZQhLASVY6N5GoJ0nHEu8YxGxF32ipKzhJPzgyNtVxDG6SRXemUGvm1PuxsaodzYBFstiSusR1I0jvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377397; c=relaxed/simple;
	bh=yosJ1tzZoRvPsSdTULBEID9QXuvxAEFjAfWllbJRJlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWD50vFlDzv3wv1TuEYv1ESTTbJJLLqFoSWMO2LiPnRGBL8x6Y191Y5icgTajn4peiIkEGSN+2hdYULjdUYAo3Pyy3FJ9v/gATB5YuxWTbSiRFcmbPi3mQcEEZAbozTvXvsAUOy79G5fK8m8pbmGkjuaCT2MTnpNF0yVzNozWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3655CA41D79;
	Wed,  8 Jan 2025 23:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E91C4CED3;
	Wed,  8 Jan 2025 23:03:11 +0000 (UTC)
Message-ID: <c59ce4ca-0647-45d1-ae83-9644f1fefd27@linux-m68k.org>
Date: Thu, 9 Jan 2025 09:03:09 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: libgcc: Fix lvalue abuse in umul_ppmm()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <c408cfb85bfde8929dcaa4ebea29ade4e1452d8e.1736356696.git.geert@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <c408cfb85bfde8929dcaa4ebea29ade4e1452d8e.1736356696.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 9/1/25 03:22, Geert Uytterhoeven wrote:
>      lib/muldi3.c:53:28: warning: asm output is not an lvalue
>      lib/muldi3.c:53:28: warning: asm output is not an lvalue
>      lib/muldi3.c:53:28: error: not addressable
>      lib/muldi3.c:53:28: warning: generating address of non-lvalue (11)
>      lib/muldi3.c:53:28: warning: generating address of non-lvalue (11)
> 
> Fix the lvalue warnings by replacing the casts on the output operands by
> intermediate variables of the right type.
> 
> Fix the "not addressable" error by replacing the cast on the second
> input operand by an intermediate variable, too.  Treat the other input
> operand the same for consistency.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501030516.uZrwnuQQ-lkp@intel.com/
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks for cleaning this up.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg



> ---
> To be queued in the m68k for-v6.14 branch.
> Not folding into commit e96424b86d5098f4 ("m68k: Use kernel's generic
> muldi3 libgcc function"), as the issue was pre-existing.
> ---
>   arch/m68k/include/asm/libgcc.h | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/libgcc.h b/arch/m68k/include/asm/libgcc.h
> index 1cce6d130d805368..27e17195bd7be41c 100644
> --- a/arch/m68k/include/asm/libgcc.h
> +++ b/arch/m68k/include/asm/libgcc.h
> @@ -10,11 +10,18 @@
>    * will fallback to using the C-coded version of umul_ppmm().
>    */
>   #define umul_ppmm(w1, w0, u, v)				\
> -	__asm__ ("mulu%.l %3,%1:%0"			\
> -		 : "=d" ((unsigned long)(w0)),		\
> -		   "=d" ((unsigned long)(w1))		\
> -		 : "%0" ((unsigned long)(u)),		\
> -		   "dmi" ((unsigned long)(v)))
> +	do {						\
> +		unsigned long __u = (u), __v = (v);	\
> +		unsigned long __w0, __w1;		\
> +							\
> +		__asm__ ("mulu%.l %3,%1:%0"		\
> +			 : "=d" (__w0),			\
> +			   "=d" (__w1)			\
> +			 : "%0" (__u),			\
> +			   "dmi" (__v));		\
> +							\
> +		(w0) = __w0; (w1) = __w1;		\
> +	} while (0)
>   #endif /* !CONFIG_CPU_HAS_NO_MULDIV64 */
>   
>   #endif /* __ASM_M68K_LIBGCC_H */

