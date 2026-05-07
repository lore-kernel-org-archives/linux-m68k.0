Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FB2406277
	for <linux-m68k@lists.linux-m68k.org>; Thu,  7 May 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164427; cv=none; b=az6aArRJrNWEaAm28TDlRRh3OdC++czJL4WhRoOk+hs2yYLRALj5IWXVNevcD4SsjnEHC33LVuvJTg3isPnSChuUw43lBuAPqnhTy3h49W4bpaE14gIh+hN9saM4pzZOXHDsTblCvz/BiqBGyckk2AmS35mYynRt+xjo8v7xfcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164427; c=relaxed/simple;
	bh=4h47Z6ML2wUmiSm067qKXqglBqLvg1eK31qkZ+Ft+/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7bWawwftQ7gZNOfzk1vECKaLvZq3iWnTiDzr21uFTVri6jFNwZVYzcUSN5MmaBPNiczSsuIHEOYYJqvxqOCX3ct2kh/tb9oyB2iajyK9TnaP6IzZgSUloG0IX9To+/grXTsBj/5rlLwFieonbQPNpj0XHTaETzFwQ2XKxjf12I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeFNGBs/; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeFNGBs/"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D207E60181;
	Thu,  7 May 2026 14:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D63C2BCB2;
	Thu,  7 May 2026 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778164425;
	bh=4h47Z6ML2wUmiSm067qKXqglBqLvg1eK31qkZ+Ft+/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oeFNGBs/orp6cCxb0HHNCkON/3uF18AuQK/w23afJiRNnQJzTEE17mH6NRRk85PRX
	 oHoNL3bBGEfL+N5fYKeYhLAwFBaQAHPCFXQKKu31lWD2wDNrw7ERx/aDzERBNWMWHB
	 fhQKUZMB7yVgM/TnM3Rt5aXhpkHV0IKy2UkGwrjxO8UzFR69gPbSXz8QTDpfvMJdbz
	 oJpk1/7htDYqWB5AaftvhKtVeqUu/q1GkdelKIhRb35Wi1o3nFGB2HDaTTwQJ7br6S
	 bRl5+TzDt83ChPkxn/6Wsmw3enejW/i0+IAKZLYKBjIIWZXbUKmVXy+CD6E+zcD8vc
	 z547l1n/896iQ==
Message-ID: <7bc9e2c2-3646-43bc-8405-c4367d99d8bc@kernel.org>
Date: Fri, 8 May 2026 00:33:40 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX()
 functions
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
 dmaengine@vger.kernel.org, linux-can@vger.kernel.org,
 linux-spi@vger.kernel.org, olteanv@gmail.com, adureghello@baylibre.com
References: <20260506142644.3234270-2-gerg@kernel.org>
 <20260506142644.3234270-8-gerg@kernel.org>
 <20260507-masterful-pegasus-of-science-c408e0-mkl@pengutronix.de>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20260507-masterful-pegasus-of-science-c408e0-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/5/26 23:30, Marc Kleine-Budde wrote:
> On 07.05.2026 00:26:48, Greg Ungerer wrote:
>> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/flexcan/flexcan-core.c
>> index f5d22c61503f..a682f02d2c43 100644
>> --- a/drivers/net/can/flexcan/flexcan-core.c
>> +++ b/drivers/net/can/flexcan/flexcan-core.c
>> @@ -296,6 +296,7 @@ static_assert(sizeof(struct flexcan_regs) ==  0x4 * 18 + 0xfb8);
>>   static const struct flexcan_devtype_data fsl_mcf5441x_devtype_data = {
>>   	.quirks = FLEXCAN_QUIRK_BROKEN_PERR_STATE |
> 
> Nitpick:
> Can you move it here, so that the quirks stay sorted?

Yep, sure thing.


> 		FLEXCAN_QUIRK_DEFAULT_BIG_ENDIAN |
> 
>>   		FLEXCAN_QUIRK_NR_IRQ_3 | FLEXCAN_QUIRK_NR_MB_16 |
>> +		FLEXCAN_QUIRK_DEFAULT_BIG_ENDIAN |
>>   		FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX |
>>   		FLEXCAN_QUIRK_SUPPORT_RX_FIFO,
>>   };
> 
> With that change:
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for drivers/net/can/flexcan

Thanks
Greg


