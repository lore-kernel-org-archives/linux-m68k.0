Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D163D3CE4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Jul 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784590514; cv=none; b=b8l1X/51E2KzR4j0daElJ4N66+bzJHsM/YIDccYwj0BZw897/ARhzA0RgU686nWgwqMOurQYYRJjOQQxd+DhLDn0wBKioqZiZ/5Ld+AxZIEr1r5Qb8yM37CcQ/vkNcO51eqMNy8BWfo97PBwoTvMVoMFds0Ru438n4EFJgZkU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784590514; c=relaxed/simple;
	bh=3UZJyqS4SkDBpo96H1dOLfjQP7S/w5kMckz9eVcw/9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5PrkTRjKvaFJxjIW/4jyqoWpiWGYG6rHX2qkKeZnhSWtI0+M0Vf8flUc+SQSj7ManjOFuw/I6DJxuKeQahxFmkdFrlyqcGDGJjYhUkRiVbQAxvg3TX+vbckFFwxve7WH4+DFypVKrwk7qXOxmpzMU4q9yv7IW2ae5CklVcX9Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA2360A7A;
	Mon, 20 Jul 2026 23:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957B91F000E9;
	Mon, 20 Jul 2026 23:35:10 +0000 (UTC)
Message-ID: <5c2e9641-fdb7-4a97-b4a9-fad11ccf837e@linux-m68k.org>
Date: Tue, 21 Jul 2026 09:35:05 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] m68k: coldfire/5441x: register mcf-rcm-reset
 platform device
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260617-coldfire-rcm-power-on-reason-v3-0-1a7c7b6b14e7@yoseli.org>
 <20260617-coldfire-rcm-power-on-reason-v3-2-1a7c7b6b14e7@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260617-coldfire-rcm-power-on-reason-v3-2-1a7c7b6b14e7@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jean-Michel,

On 18/6/26 05:17, Jean-Michel Hautbois wrote:
> Add SoC-level registration of the mcf-rcm-reset platform device so the
> power_on_reason sysfs attribute is created on every MCF5441x board
> without per-board boilerplate.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Applied to m68knommu git tree, for-next branch.

Thanks
Greg



> ---
>   arch/m68k/coldfire/m5441x.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 7a25cfc7ac07..852e52d95eaf 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -11,6 +11,7 @@
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/clk.h>
> +#include <linux/platform_device.h>
>   #include <asm/machdep.h>
>   #include <asm/coldfire.h>
>   #include <asm/mcfsim.h>
> @@ -239,6 +240,30 @@ static void __init m5441x_fec_init(void)
>   	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
>   }
>   
> +/*
> + * Reset Controller Module status register. Exposed to userspace as
> + * /sys/devices/platform/mcf-rcm-reset/power_on_reason by the mcf-rcm-reset
> + * driver (drivers/power/reset/mcf-rcm-reset.c).
> + */
> +static struct resource m5441x_rcm_resource[] = {
> +	{
> +		.start	= MCF_RSR,
> +		.end	= MCF_RSR,
> +		.flags	= IORESOURCE_MEM,
> +	},
> +};
> +
> +static int __init m5441x_rcm_init(void)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_simple("mcf-rcm-reset", -1,
> +					       m5441x_rcm_resource,
> +					       ARRAY_SIZE(m5441x_rcm_resource));
> +	return PTR_ERR_OR_ZERO(pdev);
> +}
> +arch_initcall(m5441x_rcm_init);
> +
>   void __init config_BSP(char *commandp, int size)
>   {
>   	m5441x_clk_init();
> 

