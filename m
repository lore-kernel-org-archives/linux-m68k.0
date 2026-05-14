Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04530CDAE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 14 May 2026 01:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722071; cv=none; b=gCM6zZfDdOA4aY9roj2bIUkX8R1lg3pDBu2ihQun7lvvn8Rdo5nVF01JObz0FJuKCAGjedXE5PgprRG/TFKAyKWqzSo2T42RaC0p0/vfT3RvpttjJqhqbwAU5Zs99Kl62iv4JbmI+4LyCa813o87IHivmcPJG2limrznFAqV9Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722071; c=relaxed/simple;
	bh=pAifKDZ/lY13PdVBCJ1cpztblQ59eRzHqYlVLG9Z+9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOij1Gzg3YCz5mFDV6/ofYizjtCn3o3tGyZYJ2wNuUzKpsSkAV1ov2ozSCfsDZhmW85U0o4bXvsrrhEwf7eA+pvaaVNdoUNIjsMfUr4cIfTfUGw21ROzwKy57speObJAEl7YyTRX7kuD4P2CdgqUieOZhTi/DyVigKqf7n6Gats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6225760052;
	Thu, 14 May 2026 01:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F48C19425;
	Thu, 14 May 2026 01:27:44 +0000 (UTC)
Message-ID: <734e2323-78dc-43c7-b5fc-0a35cc72e035@linux-m68k.org>
Date: Thu, 14 May 2026 11:27:40 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260513-wip-stmark2-dac-v2-3-fcdae50cf51a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Angelo,

On 13/5/26 19:14, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Later in this patchset, the mcf54415 DAC driver is added.
> Considering some other different ColdFire cpu DACs exists, the DAC driver
> is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> DACs (mcf54415/6/7/8).
> 
> So updating DAC clock names to bind with proper driver name.

I am not sure I like naming the clocks here with a prefix for the
specific SoC part number this is in. It might be unlikely now, but
what if another ColdFire family SoC member uses this same hardware block?
That is very common amongst other hardware blocks within the ColdFire
family. Can we come up with a name more specific to just this type
of DAC hardware block?

Regards
Greg




> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>   arch/m68k/coldfire/m5441x.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 5b5e09ecf487..b724d7fc1a08 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
>   DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
>   DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
>   DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
>   DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
>   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
>   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
>   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
>   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
>   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
>   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> 

