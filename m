Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E293870816
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Nov 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727554; cv=none; b=koCfsfX/VuxfsqG3e0Lbmg2YmSfklFvgmOstZKXj3HugylCfw0jbvOsHZfiHIEh42pICk4mYTXwmGM5pdDJd9nqnO1Uh0S43iescXZ37CYSqSMTVPVUYhM6rkhfEwb1Wpbsm0iwU/KNflyw3nJEDqBIEbeAfS70Q7q1p7myNUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727554; c=relaxed/simple;
	bh=WlxLRHsEKt5E0xzrDqmgFT1xoYLbcZ9Baly/pFKaHvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AM0KDZS+HaDHfdefEuJwULdx3eiUQljClltll1c+vkAcTn8hjh95T28Xcyv3JZzYNgrt5saBSaxecMF9GuD0zSVVzSwO75KOfPagbtNKbnypLikUCuTqE6DyDXPx+w/fj4/Zm1glRjl3legyzKeuAiRASMta0H2CN/0ZRj4nKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E28DCA420DE;
	Mon,  4 Nov 2024 13:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD259C4CED1;
	Mon,  4 Nov 2024 13:39:10 +0000 (UTC)
Message-ID: <c767306e-e248-4395-b4ec-2bdfec56ef49@linux-m68k.org>
Date: Mon, 4 Nov 2024 23:39:08 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: coldfire/device.c: only build FEC when HW macros
 are defined
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20241029214315.26710-1-antonio@mandelbit.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20241029214315.26710-1-antonio@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Antonio,

On 30/10/24 07:43, Antonio Quartulli wrote:
> When CONFIG_FEC is set (due to COMPILE_TEST) along with
> CONFIG_M54xx, coldfire/device.c has compile errors due to
> missing MCFEC_* and MCF_IRQ_FEC_* symbols.
> 
> Make the whole FEC blocks dependent on having the HW macros
> defined, rather than on CONFIG_FEC itself.
> 
> This fix is very similar to commit e6e1e7b19fa1 ("m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined")
> 
> Fixes: b7ce7f0d0efc ("m68knommu: merge common ColdFire FEC platform setup code")
> To: Greg Ungerer <gerg@linux-m68k.org>
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

Thanks, looks good. Applied to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
>   arch/m68k/coldfire/device.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> index 7dab46728aed..b6958ec2a220 100644
> --- a/arch/m68k/coldfire/device.c
> +++ b/arch/m68k/coldfire/device.c
> @@ -93,7 +93,7 @@ static struct platform_device mcf_uart = {
>   	.dev.platform_data	= mcf_uart_platform_data,
>   };
>   
> -#if IS_ENABLED(CONFIG_FEC)
> +#ifdef MCFFEC_BASE0
>   
>   #ifdef CONFIG_M5441x
>   #define FEC_NAME	"enet-fec"
> @@ -145,6 +145,7 @@ static struct platform_device mcf_fec0 = {
>   		.platform_data		= FEC_PDATA,
>   	}
>   };
> +#endif /* MCFFEC_BASE0 */
>   
>   #ifdef MCFFEC_BASE1
>   static struct resource mcf_fec1_resources[] = {
> @@ -182,7 +183,6 @@ static struct platform_device mcf_fec1 = {
>   	}
>   };
>   #endif /* MCFFEC_BASE1 */
> -#endif /* CONFIG_FEC */
>   
>   #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
>   /*
> @@ -624,12 +624,12 @@ static struct platform_device mcf_flexcan0 = {
>   
>   static struct platform_device *mcf_devices[] __initdata = {
>   	&mcf_uart,
> -#if IS_ENABLED(CONFIG_FEC)
> +#ifdef MCFFEC_BASE0
>   	&mcf_fec0,
> +#endif
>   #ifdef MCFFEC_BASE1
>   	&mcf_fec1,
>   #endif
> -#endif
>   #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
>   	&mcf_qspi,
>   #endif
