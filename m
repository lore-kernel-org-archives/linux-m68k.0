Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36331B4254;
	Wed, 18 Dec 2024 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532939; cv=none; b=DzHoQqtzq7TIFH81Rhbei9QYOSRnzJ79VEU4OEtBSYrNoap3jOhiRWblniKw4kRtXwnUsbhM1gQIA2DReXZv1/GfdRkAKlkuFYLUPvDIZ45dDmWVAqv+sKtHhHrWYwSQj92ShqYKxlkWLhbLBnsor9HCdslabwKT3TlBHrJsdxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532939; c=relaxed/simple;
	bh=1k4KlYURZrPOpVUdHz8jZbdIV7WJSou/Dn/X4UFkfos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGYvbPwFPK3t2aMNT2p2iw6mxelE9Hqb5+PvhdQWKmxLlYCL08SK1US31Qnoc+C6mL5fOIsgbPQWsSJEfAWCJwltOX6xvtvCF/odQ8fEQLDiYK/ryAy01YnrZMLIy3Qd8n7fmLX8oHsPpl0gQO9tu1jg41GuJ1jezApoWFV0Ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=HF19sD3O; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="HF19sD3O"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4715FF80B;
	Wed, 18 Dec 2024 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1734532934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATYv1VUKGuEWTioFiXvRpe1NLtiuGE83KG6/RGgy2Sc=;
	b=HF19sD3O/QuZ88Z3np6EsNMxJyRm3Aq7NAGv8zAAy5RF+8I48JFiTPd9cnZ/7ZyZu5JlSR
	NZMgVhOxJ74BXeZfo2VELmbWNqJ5u84govrxIYpy1N9iEqoU+jjkfHkhF/RCdD2SthAcqK
	Iavg4RPyb4gYgpcg13VvzCteTQbuIZnuc1LBYAYl96LYAoNvkJdx+ARD42+xo0mu9v2dfW
	R49DPh7ydaXDfIoJTU21a/3vj7vBtE0yfwF299P7tvvKBt/f3UY+eKMxnKrFD28XmAXau+
	cviRcbwYnMVQY0OUcO0/CWBvyTCTsuLHzGo9COqBN4KctJmsTqAE7XvquG21Yg==
Message-ID: <f9200f99-d496-4490-9be4-198b733c4678@yoseli.org>
Date: Wed, 18 Dec 2024 15:42:13 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] m68k: coldfire: Use proper clock rate for timers
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org
References: <20241202-m5441x_dma_tmr-v1-0-94087efe4243@yoseli.org>
 <20241202-m5441x_dma_tmr-v1-1-94087efe4243@yoseli.org>
 <cbb9070e-5756-4208-8a46-b26d2dfce3c3@linux-m68k.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <cbb9070e-5756-4208-8a46-b26d2dfce3c3@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hello Greg,

On 18/12/2024 13:36, Greg Ungerer wrote:
> Hi JM,
> 
> On 2/12/24 19:29, Jean-Michel Hautbois wrote:
>> The DMA and PIT timers are clocked at fsys/2. Fix it.
>> While at it, fix the comment naming for DMA timers (duplicated tmr.2).
> 
> This looks like a stand alone fix in its own right, so I have pushed
> this into the m68knommu git tree, for-next branch.

As the clock is used in the next patch of the series, it made sense, but 
it can indeed be a standalone one :-).

Hope you will find a bit of time to review the other one :-p.

Thanks !
JM

> 
> Thanks
> Greg
> 
> 
> 
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> ---
>>   arch/m68k/coldfire/m5441x.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
>> index 
>> 405e9d5c832c0d41978615a646de21f2fce61afb..7a25cfc7ac07570ff15da3c55d080a717cf93a06 100644
>> --- a/arch/m68k/coldfire/m5441x.c
>> +++ b/arch/m68k/coldfire/m5441x.c
>> @@ -33,14 +33,14 @@ DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
>>   DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
>>   DEFINE_CLK(0, "mcfuart.2", 26, MCF_BUSCLK);
>>   DEFINE_CLK(0, "mcfuart.3", 27, MCF_BUSCLK);
>> -DEFINE_CLK(0, "mcftmr.0", 28, MCF_CLK);
>> -DEFINE_CLK(0, "mcftmr.1", 29, MCF_CLK);
>> -DEFINE_CLK(0, "mcftmr.2", 30, MCF_CLK);
>> -DEFINE_CLK(0, "mcftmr.3", 31, MCF_CLK);
>> -DEFINE_CLK(0, "mcfpit.0", 32, MCF_CLK);
>> -DEFINE_CLK(0, "mcfpit.1", 33, MCF_CLK);
>> -DEFINE_CLK(0, "mcfpit.2", 34, MCF_CLK);
>> -DEFINE_CLK(0, "mcfpit.3", 35, MCF_CLK);
>> +DEFINE_CLK(0, "mcftmr.0", 28, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcftmr.1", 29, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcftmr.2", 30, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcftmr.3", 31, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcfpit.0", 32, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcfpit.1", 33, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
>> +DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
>>   DEFINE_CLK(0, "mcfeport.0", 37, MCF_CLK);
>>   DEFINE_CLK(0, "mcfadc.0", 38, MCF_CLK);
>>   DEFINE_CLK(0, "mcfdac.0", 39, MCF_CLK);
>> @@ -167,8 +167,8 @@ static struct clk * const disable_clks[] 
>> __initconst = {
>>       &__clk_0_14, /* i2c.1 */
>>       &__clk_0_22, /* i2c.0 */
>>       &__clk_0_23, /* dspi.0 */
>> -    &__clk_0_28, /* tmr.1 */
>> -    &__clk_0_29, /* tmr.2 */
>> +    &__clk_0_28, /* tmr.0 */
>> +    &__clk_0_29, /* tmr.1 */
>>       &__clk_0_30, /* tmr.2 */
>>       &__clk_0_31, /* tmr.3 */
>>       &__clk_0_32, /* pit.0 */
>>

