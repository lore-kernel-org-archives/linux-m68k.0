Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B9208D99
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083956; cv=none; b=Yx7+rqgwWA54UJZ4dv1lsLxLmwuHyRHOdTBqppRWstfZSWmlrUzi/JOgzJoLDAmvu0VYWwi4oDcGVHQhKAbkodz1MzPoWFVKDhDZHCYNHjwWZLn9g2DbrG4oxcf7omBEpMaG9m1ByX+zhD9V1be6hfWAXJobvswSQqO/dH1LcQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083956; c=relaxed/simple;
	bh=FbR3gg6JVCrfH92imBLO6smtkMM1oMDMyVjwGG9rvgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVEV65mAZun/eNXkmd/d65s6Xj+SKCBQEQxUXHNcjaCtUew4mqPbHnomyKdT/ufZ4JO/f6GMaAFoHXD21USS/lroHTAVGSo8C5dwDsXN9BkoRUGi6XHMbIOQWKdNhSLb166wpHTSdTJ0V1Zptd3nljYnHmxqJO+0LSxZ+st5WfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E481A43C2F;
	Wed, 16 Oct 2024 13:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B75C4CEC5;
	Wed, 16 Oct 2024 13:05:51 +0000 (UTC)
Message-ID: <5f56441c-6ba4-4ef4-9f4b-84496c3414de@linux-m68k.org>
Date: Wed, 16 Oct 2024 23:05:48 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: mcfgpio: Fix incorrect register offset for
 CONFIG_M5441x
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20241016-fix-m5441x-gpio-v2-1-f419777bc90d@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20241016-fix-m5441x-gpio-v2-1-f419777bc90d@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi JM,

On 16/10/24 17:24, Jean-Michel Hautbois wrote:
> Fix a typo in the CONFIG_M5441x preprocessor condition, where the GPIO
> register offset was incorrectly set to 8 instead of 0. This prevented
> proper GPIO configuration for m5441x targets.
> 
> Fixes: bea8bcb12da0 ("m68knommu: Add support for the Coldfire m5441x.")
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Looks good, thanks for the v2.
Applied to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
> Changes in v2:
> - The commit fixed is not the one in v1
> - Link to v1: https://lore.kernel.org/r/20241016-fix-m5441x-gpio-v1-1-0a29befd4b8d@yoseli.org
> ---
>   arch/m68k/include/asm/mcfgpio.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
> index 019f24439546..9c91ecdafc45 100644
> --- a/arch/m68k/include/asm/mcfgpio.h
> +++ b/arch/m68k/include/asm/mcfgpio.h
> @@ -136,7 +136,7 @@ static inline void gpio_free(unsigned gpio)
>    * read-modify-write as well as those controlled by the EPORT and GPIO modules.
>    */
>   #define MCFGPIO_SCR_START		40
> -#elif defined(CONFIGM5441x)
> +#elif defined(CONFIG_M5441x)
>   /* The m5441x EPORT doesn't have its own GPIO port, uses PORT C */
>   #define MCFGPIO_SCR_START		0
>   #else
> 
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241016-fix-m5441x-gpio-e671833569b4
> 
> Best regards,
