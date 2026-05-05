Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17512E091B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 May 2026 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946823; cv=none; b=hq85NW9c4ou7nFLbtwxebOw/quC8jRuaWVgB3LPqlMauO2kG8x405W8iof9osZVp/yl47czLYbCV/6BDXdFZZhLiIJ6AVkiYG4tq0XbhBqyLQE8HU3FGGzdKgmCRl78txVuT/O91V5A7S4gfvyQm8f8Dp7/35cCWlrIQGM578V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946823; c=relaxed/simple;
	bh=doEKF7GKqDJ3ZWwDJXbPBEQvJsPRYlYCLUPfxcCSqBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZeUSYTgT9VG+eWza3pbcvwaUZuoq1E6QvLmdrmHTyC/hh67u+v6l/sdeA0nUOgnDVvuzQvreRbL42+lVPRlhDiqfWcc8cMeu4lOjK+gAQxtY9xCZx4aNxoVIUI/BIdcVwL6ufQReEyihHNUDs2AkmSwiOAxRoWIEd/T+32uycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D38740781;
	Tue,  5 May 2026 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BC5C2BCB8;
	Tue,  5 May 2026 02:06:57 +0000 (UTC)
Message-ID: <31297e73-52a5-42a0-9676-ecf057f7c21e@linux-m68k.org>
Date: Tue, 5 May 2026 12:06:54 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] iio: dac: add mcf54415 DAC
To: Arnd Bergmann <arnd@arndb.de>, Angelo Dureghello
 <angelo@kernel-space.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Steven King <sfking@fdwdc.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 Angelo Dureghello <adureghello@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
 <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <965cb599-37ac-4d69-a8c0-015152037139@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/5/26 03:27, Arnd Bergmann wrote:
> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
> 
>> +static void mcf54415_dac_exit(void *data)
>> +{
>> +	struct mcf54415_dac *info = data;
>> +	int val;
>> +
>> +	val = readw(info->regs + MCF54415_DAC_CR);
>> +	val |= MCF54415_DAC_CR_PDN;
>> +	writew(val, info->regs + MCF54415_DAC_CR);
>> +}
> 
> We've recently discussed changing the MMIO accessors on coldfire
> to behave like all the other ones, which makes readw() and writew()
> have an implicit byteswap. An additional driver means one more
> place to change during the conversion. Maybe you can use the
> new mcf_readw()/mcf_writew() helpers that Greg has started
> introducing? Those will keep using native big-endian register
> definitions.

Yes, please :-)
Those newly introduced mcf_readX/mcf_writeX are in the for-next branch
of the m68knommu git tree now, they have not hit mainline yet, hopefully
in the next merge cycle.

Somewhat related, I will have patches out for the other affected drivers
over the next few days.

Regards
Greg


