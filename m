Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9C3ED5AE
	for <linux-m68k@lists.linux-m68k.org>; Thu,  7 May 2026 12:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157788; cv=none; b=aN6IZ77ysPX1x2O+NVXufgN5JyR8eODr2CfPjWWR6fu5ZRoqAAc3aPi/tsQuRnTU10qEAslXzni9aWzlgUU7eWUfUQXLqHKyvNP5zEPEtLmIdGYgBqItBUcNyPLSvSeazncuFThN1mhmBtJzjZBgcGtyZJGu/nR/AycFNsrZwwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157788; c=relaxed/simple;
	bh=KcJZ2tQuXM3g8y12mvLrPHW/18cvpRwsmiGbk6LCNUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTNY0lKZpXaM4k0/Nwr6icAs7vLU5oC0FhsJetWUGPtNi1/fYcTQmRdI/8glavs5byvlaneGkAhu1xJw9KyHJQ8WS7iJKQPeWciKRGNhWCFyL2pCNaK8H1ZpQxMztDiszVf8jH6srQa6ThfCopPl3vTWIFWsfgFi8erfbG0loYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivYdaGlo; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivYdaGlo"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1DFC4024C;
	Thu,  7 May 2026 12:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C71C2BCB2;
	Thu,  7 May 2026 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778157786;
	bh=KcJZ2tQuXM3g8y12mvLrPHW/18cvpRwsmiGbk6LCNUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ivYdaGloqHxvmfWXSxe1ELUU+RwECDQ3Ot2aFXb4yrVAQge39ukfDNjlED2qvSaZs
	 oSt9fjlj41wvhoEbVNAed0bzuECz1Oa95CYmBbYRw0rA0lZ8l9e/vqg/NeLtwbC19N
	 3hYoFNUyTffpG57XqltsjWbSULV11ZgH5g7UwlzF1x7ugsFp30oZACYww61xrFhatG
	 KoRJQygv77yLSMgafEG2DAH28LcK6ci1wOLt30Yz6lU12saNClOW9EhizsmcbNgdgT
	 jT4aUZyOu/eFs9CUbXRH7QpgIJoU/ZtJIIgNJ7J0HyBjmQjfOVOs6ABn8AUS1lo8s4
	 e7SElQxE0X/ug==
Message-ID: <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
Date: Thu, 7 May 2026 22:43:01 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX()
 functions
To: Arnd Bergmann <arnd@kernel.org>, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org>
 <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/5/26 05:12, Arnd Bergmann wrote:
> On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> 
>> drivers/dma/mcf-edma-main.c
>>    Supports big-endian access by setting the big-endian flag of
>>    the drivers struct fsl_edma_engine. But locally should be using
>>    ioread32be() and iowrite32be() instead of ioread32() and iowrite32().
> 
> I'm still a bit confused about how this works at the moment,
> since the drivers/dma/fsl-edma-common.h file already contains
> checks for the edma->big_endian flag, which is set in
> mcf_edma_probe(). The version after your patch makes sense
> to me, but it looks like the existing code cannot work.

Yes, it certainly doesn't look right to me either.

Angelo: you look to be the original author of this driver, can you shed any
light on its working status in mainline currently?


>> drivers/spi/spi-fsl-dspi.c
>>    Setting the regmap format_endian flags to use native endian will
>>    force driver to use appropriate big or little endian access on
>>    whatever platform it is built for.
>>
>> These drivers have only been compile tested.
> 
> I would suggest marking these as explicit BIG_ENDIAN rather than
> NATIVE_ENDIAN. The effect should be the same since coldfire CPUs
> cannot run little-endian code, but the way that hardware usually
> works is that the endianess is fixed at the bus level to one way
> or the other. NATIVE_ENDIAN to me implies that the registers
> have configurable endianess that is switched along with the CPU
> mode.

Ok, will change. I chose native endian in this case since the regmap config
entry used for the m5441x family is also used by the vf610 devce (which looks
to be an ARM imx SoC). So it will need a duplicate setup with those endian
flags set to BIG_ENDIAN. But that is no problem.

Thanks
Greg

