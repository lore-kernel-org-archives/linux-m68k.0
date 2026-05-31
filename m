Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23838C2AE
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233354; cv=none; b=pXBzsAWyN7d8eb5SboaTPRgdjDNcYA2UUuNmDEAt9sIedCwgE7y/rgbtKmx3KA87/SCuj5VY4RS6KkGeMLkv69Dp93syHusg9B7ByNF1A+0gTqvZ022ApBjDZC3ViGuKdHM8xVwVPIhRvA8vEUEqk+SHtyqE+CTPMeWjRs97oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233354; c=relaxed/simple;
	bh=nj129rjUByaIy9o0FSopNQk9RD+FeU54z1Cbh8ZBbdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf7gdxrysXJhoHP/3i0n5jVpUklLcSmTDpglVVlTrEv6+vJRgOAITAz25GgvqlyLhxXbjfQobARSu8Ja8weuS0tsiWP+b8vqP0g4h8RMlJuRr9hWvIY9acY2OMkh2lFz82P4dLzE7W8P+EW36q4bGw74rO/2hwulpvgL5jXvFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3154442D6D;
	Sun, 31 May 2026 13:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D21F00898;
	Sun, 31 May 2026 13:15:47 +0000 (UTC)
Message-ID: <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
Date: Sun, 31 May 2026 23:15:43 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 23/5/26 07:20, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Later in this patchset, the mcf54415 DAC driver is added.
> Considering some other different ColdFire cpu DACs exists, the DAC driver
> is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> DACs (mcf54415/6/7/8).
> 
> So updating DAC CLKDEDV_INIT with proper driver name.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
> Changes in v2:
> - none
> Changes in v3
> - roll back clock names as they was originally
> ---
>   arch/m68k/coldfire/m5441x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 5b5e09ecf487..b02ca2eb55a4 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
>   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
>   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
>   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),

I thought after the last discussion on this that we would not change these
clock names?

Regards
Greg



>   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
>   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
>   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> 

