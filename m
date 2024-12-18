Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882C19D07B;
	Wed, 18 Dec 2024 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525373; cv=none; b=rpH1WwsgUI6iyOeZTYqbFDbtvEaIk2JHLn0bvy5zgBH8z53wIfSW30ZRx1BPQbZZ4Ijmg9vSuN5y0h+XT6tALvCJFLbkt1jRbq6+xFo3ZjYaTny7vD+eLVAv+3tFf4pKHrQxxF08wYCVYrdFAkAX2eaGUXavOBRD4pmdexA1ftU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525373; c=relaxed/simple;
	bh=S5dLyWJhla56q1ymX0qm5fJRqHSk+2Y50QxbQIRstnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3bW3+1kCrXgTNo+TEj85EpWe6TOIPIKFGqx7O0aAkYdEfzWo88+fP3FkiakKs2lNFL8gwsvqIxbAOgITt7zQDjW2iImFscS6ALm56bA7bhwuqvKiorXGtLvrbO/9H2YBiib0f6lTW4dCJwRJynumFaEpmdfKS1/IARi2O3qnY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B1AC4CECE;
	Wed, 18 Dec 2024 12:36:11 +0000 (UTC)
Message-ID: <cbb9070e-5756-4208-8a46-b26d2dfce3c3@linux-m68k.org>
Date: Wed, 18 Dec 2024 22:36:08 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: coldfire: Use proper clock rate for timers
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org
References: <20241202-m5441x_dma_tmr-v1-0-94087efe4243@yoseli.org>
 <20241202-m5441x_dma_tmr-v1-1-94087efe4243@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20241202-m5441x_dma_tmr-v1-1-94087efe4243@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi JM,

On 2/12/24 19:29, Jean-Michel Hautbois wrote:
> The DMA and PIT timers are clocked at fsys/2. Fix it.
> While at it, fix the comment naming for DMA timers (duplicated tmr.2).

This looks like a stand alone fix in its own right, so I have pushed
this into the m68knommu git tree, for-next branch.

Thanks
Greg



> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>   arch/m68k/coldfire/m5441x.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 405e9d5c832c0d41978615a646de21f2fce61afb..7a25cfc7ac07570ff15da3c55d080a717cf93a06 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -33,14 +33,14 @@ DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfuart.2", 26, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfuart.3", 27, MCF_BUSCLK);
> -DEFINE_CLK(0, "mcftmr.0", 28, MCF_CLK);
> -DEFINE_CLK(0, "mcftmr.1", 29, MCF_CLK);
> -DEFINE_CLK(0, "mcftmr.2", 30, MCF_CLK);
> -DEFINE_CLK(0, "mcftmr.3", 31, MCF_CLK);
> -DEFINE_CLK(0, "mcfpit.0", 32, MCF_CLK);
> -DEFINE_CLK(0, "mcfpit.1", 33, MCF_CLK);
> -DEFINE_CLK(0, "mcfpit.2", 34, MCF_CLK);
> -DEFINE_CLK(0, "mcfpit.3", 35, MCF_CLK);
> +DEFINE_CLK(0, "mcftmr.0", 28, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcftmr.1", 29, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcftmr.2", 30, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcftmr.3", 31, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcfpit.0", 32, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcfpit.1", 33, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> +DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
>   DEFINE_CLK(0, "mcfeport.0", 37, MCF_CLK);
>   DEFINE_CLK(0, "mcfadc.0", 38, MCF_CLK);
>   DEFINE_CLK(0, "mcfdac.0", 39, MCF_CLK);
> @@ -167,8 +167,8 @@ static struct clk * const disable_clks[] __initconst = {
>   	&__clk_0_14, /* i2c.1 */
>   	&__clk_0_22, /* i2c.0 */
>   	&__clk_0_23, /* dspi.0 */
> -	&__clk_0_28, /* tmr.1 */
> -	&__clk_0_29, /* tmr.2 */
> +	&__clk_0_28, /* tmr.0 */
> +	&__clk_0_29, /* tmr.1 */
>   	&__clk_0_30, /* tmr.2 */
>   	&__clk_0_31, /* tmr.3 */
>   	&__clk_0_32, /* pit.0 */
> 
