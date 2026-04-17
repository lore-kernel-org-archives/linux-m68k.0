Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA693ACA64
	for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Apr 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435113; cv=none; b=puHXsSKpcDGqCr2HQgLlAjwRbGO72fvLE+eWXyrlHk7mDBcsP1NIyWp1ZF8b47j4xP1Br/f2B40ViDKyG3O4746mYPlQXKv7pUP4PTmFGC2X5Iu2WyGwPOSLSgnsUYPwNI9g/Qlqn4Hsox1bkSB29hdyeAg6+iX2hQ3UIQWtM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435113; c=relaxed/simple;
	bh=cDplyoUSFf4MOu8o5s5tDxXmGem7sjGmVPD4z4NwDsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqKc0SADqphuz9IDiV3sndMGhQ3MRd9qYZtedIWrVSJXa4L1k83uI10aATASmD8YfuICf6VH7HiKS/ouOd8I4XBi/W/Onz/wepuudW+dqwOyfpBzK2qONploF3QzsgSZAKstDfZN34ENTehariQVbBTTktkPzUpRLE+Hi1iKToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A841B60138;
	Fri, 17 Apr 2026 14:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB42DC19425;
	Fri, 17 Apr 2026 14:11:48 +0000 (UTC)
Message-ID: <e1871e42-6d1f-4753-a830-9c7dda99f75b@linux-m68k.org>
Date: Sat, 18 Apr 2026 00:11:46 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
To: Arnd Bergmann <arnd@kernel.org>, Daniel Palmer <daniel@0x0f.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20260404024658.2496519-1-daniel@0x0f.com>
 <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
 <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
 <25448303-a816-429d-851b-d827fc8f26fb@linux-m68k.org>
 <4ec2b9f3-8420-4f77-9373-7ae4df83404d@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <4ec2b9f3-8420-4f77-9373-7ae4df83404d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 16/4/26 00:54, Arnd Bergmann wrote:
> On Wed, Apr 15, 2026, at 15:52, Greg Ungerer wrote:
>> On 14/4/26 23:24, Arnd Bergmann wrote:
>>> On Tue, Apr 14, 2026, at 14:55, Daniel Palmer wrote:
>>>
>>> There are other coldfire specific drivers (fec, spi, ...)
>>> that would need a similar change.
>>
>> Right, and this is really the work that needs to be done first before
>> we will be able to remove the io_no.h specific readl/write code.
>> This is what I see:
>>
>> Drivers that are used on ColdFire targets that use some of
>> readb/readw/readl and writeb/writew/writel:
>>
>>       drivers/net/ethernet/freescale/fec*
>>       drivers/net/ethernet/smsc/smc9x.[hc]
>>       drivers/net/ethernet/davicom/dm9000.c
>>       drivers/spi/spi-coldfire-qspi.c
> 
>> Obviously spi-coldfire-qspi.c is ColdFire specific, so easy to change
>> and not affect anything else.
> 
>> The FEC ethernet driver is widely used on
>> ARM and ColdFire, though the change to a register reading helper looks
>> pretty strait forward but will be a largish patch.
> 
> Agreed.

I am testing a change for this one now.


>> Changing the smc91x driver looks easy enough, the ColdFire
>> multi-byte access macros in the header are specific to ColdFire.
> 
> smc91x is a bit weird because this uses a readw() loop
> for byte streams but ioread16be() for register accesses.
> I think what is going on here is that this is in fact
> a little-endian device, and ioread16be() ends up working
> because this does a byteswap on coldfire while readl()
> does not. With the normal io.h semantics, these should be
> readsw() or ioread16_rep() for the bytestream and readw()
> or ioread16() for the LE register instead, same as the
> #else path in the header.

I will create a patch for this one too.


>> Need to give some thought to changes
>> to the dm9000 driver.
>> The dm9000.c driver should not need any changes, as it only
> deals with 8-bit registers and iowrite32_rep()/ioread32_rep()
> byte stream transfers, but no 16-bit or 32-bit register
> accesses, so no byteswap is needed here.

Ah, yes, that is right. Nothing to do here then ;-)


>> Drivers that are used on ColdFire that use only 8-bit readb and writeb:
>>
>>       drivers/tty/serial/mcf.c
>>       drivers/i2c/busses/i2c-imx.c
>>
>> We could ignore these for now I guess, since readb and writeb will always
>> work the same. Though it might be nice to clean them up with proper helpers.
>> mcf.c is only used on ColdFire so won't affect anything else.
> 
> Right
> 
>> Drivers that are used on ColdFire that use iowrite32/iowrite32be:
>>
>>       drivers/net/can/flexcan/flexcan-core.c
>>
>> Although this driver has support for differentiating big and little endian
>> access I think for ColdFire it is relying on the kludgy overrides in io_no.h
>> to actually work right. So will need a fix too.
> 
> Makes sense. So the FLEXCAN_QUIRK_DEFAULT_BIG_ENDIAN flag
> should be flipped at the same time as flipping the endianess
> of iowrite32be()/iowrite32().

I will do this one too.


>> Did I miss any?
> 
> I test-built all the defconfigs, with readX/writeX/ioreadXX/iowriteXX
> commented out and found three more for mcf5441x:
> 
> drivers/mmc/host/sdhci-esdhc-mcf.c
> 
>   -> needs to be flipped to explicit big-endian accessors
> 
> drivers/dma/mcf-edma-main.c
> 
>   -> same, but confusingly this also has edma_readl()/edma_writel()
>      helpers that try to handle this. As far as I can tell, this
>      is currently broken because coldfire sets edma->big_endian=true
>      but then uses ioread32be() that appears to flip the BE
>      register contents to LE. I'm either missing something here,
>      or the upstream version never worked.
> 
> drivers/spi/spi-fsl-dspi.c
> 
>    -> this one uses regmap_mmio without specifying an endianess,
>       so this should get the default LE helpers everywhere, which
>       would be wrong on coldfire after the change. I think the
>       correct solution here is to set explict endianess in the
>       regmap setup for coldfire.

Good catch, thanks. I will look at these too.

I have some changes I am testing to do a blanket change of the arch specific code
to use newly create IO access functions too. Simple enough (like your example patch)
but of course it does cause of bit of churn.

Regards
Greg

