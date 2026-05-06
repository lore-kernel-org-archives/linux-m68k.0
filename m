Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ECB4534B7
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 May 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079235; cv=none; b=onQZDxUJIxhT/Q6zYKlukeG1LcMmkibuIVdvaxOZS4gcnc/PxdDHeNueWdDVeKhKqZWeb/a/HPcsQC4mrhIa6XT+x/pNaxhsRiiGDbcumn1dKDyrkMkN7cIr++RlmVEXZMWPjdCOoZw/DHyRmlVtz1e3X9DNoAH1pRh4aCMhIr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079235; c=relaxed/simple;
	bh=iGeZEs7tmL4/Bkc+Vu171PnBQsEvMbUsJhWP2fZbvEg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc5XZLECuMHw+koMv/4IrPLDGbW8pVdNJeRyCyAggfvLwZFsVo5TPITNFkCkuSN6cncnoiD8AZyymsQJ4TrjXzMuoeP4dUcejkmGg1eoJwuWZBAfCzD3FSLOikYLb0adBxksnhPZIlSwEKGyi5zZSemX/c1KybeNutcHPbdZyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9H/3V35; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9H/3V35"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA51E4180F;
	Wed,  6 May 2026 14:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CB1C2BCB0;
	Wed,  6 May 2026 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079233;
	bh=iGeZEs7tmL4/Bkc+Vu171PnBQsEvMbUsJhWP2fZbvEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D9H/3V35Aobn4QmBiV3joX2pHhDLIEJ+RBY5fWA1GH7pasmhjb4uLKDVRPN+F59eb
	 9RefZ+mTsjqzTfLFnGRdAzL5EjuoZmm4zqTLAxLzqFxvDsFJvWh85VfMncsJb2f6M0
	 M4K+IH63+dZka5XYC24lWJTENNsZpJtzNM6awxHEVijwL1KRqny4n6qEn0daE4AVnj
	 oFCEMGIwn7XTNpJJ9dLPHUlXYKvLJTVheypPIfhriQ/AqWCLw0N5WGgehhJaHyBHq9
	 ppjV6DLAuITB3xYbHNc3lWhiaF8MQQHs3Vk4uROL5BuvntUIaxiQs7aTaB9aOoAgCl
	 9sbg6D5RRXm3g==
Date: Wed, 6 May 2026 15:53:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 09/10] m68k: stmark2: enable DACs outputs
Message-ID: <20260506155342.7155bf43@jic23-huawei>
In-Reply-To: <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	<20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 May 2026 19:16:47 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  arch/m68k/coldfire/stmark2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index 30da9bcbfd63..8fdfb9415cd7 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -137,6 +137,8 @@ static struct platform_device *stmark2_devices[] __initdata = {
>   */
>  static int __init init_stmark2(void)
>  {
> +	uint16_t val;
> +
>  	/* DSPI0, all pins as DSPI, and using CS1 */
>  	__raw_writeb(0x80, MCFGPIO_PAR_DSPIOWL);
>  	__raw_writeb(0xfc, MCFGPIO_PAR_DSPIOWH);
> @@ -149,6 +151,12 @@ static int __init init_stmark2(void)
>  	/* CAN pads */
>  	__raw_writeb(0x50, MCFGPIO_PAR_CANI2C);
>  
> +	/* Enable DAC0 and 1 */

If it is useful to have a comment here at all I think it should also
mention disabling the ADC inputs.  Or take the view that given
well named defines no need to have any comment. 

> +	val = __raw_readw(MCF_CCM_MISCCR2);
> +	val &= ~(MCF_CCM_MISCCR2_ADC3_EN | MCF_CCM_MISCCR2_ADC7_EN);
> +	val |= MCF_CCM_MISCCR2_DAC0_SEL | MCF_CCM_MISCCR2_DAC1_SEL;
> +	__raw_writew(val, MCF_CCM_MISCCR2);
> +
>  	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
>  
>  	spi_register_board_info(stmark2_board_info,
> 

