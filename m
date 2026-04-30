Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66023EA89
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547446; cv=none; b=F4VfkwVS9YUFM88n05KuV+/EkIiWX0FwxDTwrX9MWlGBCEuK1DP+GfqCnkJ9raMm08ktAxJ1igJDMgwUgSV0qW/OFgyZs2sISMOoVYlpZlR+4zQkU3Ohp3PjmgJ64QOx8RbM9Sbopxx+icipjbnrCsoBlERG55nxBxpfqUWn0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547446; c=relaxed/simple;
	bh=w/w2cfpiAXylMNpYNvsFygxcoYNuw//0Bb2+YZ7MZWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLYTg8xU7oiVT5TLGQE1EdgIfQIuKq2IktaQIWh5FiezQ+PT38P1L0fTpVZjbR8xI9M1pojg9eSnQEInZIzuWi7NDwFig7TeHv3eSUA//9qc0a943dkbaCWI6sAATskODJ9AR64TqXmiXOz2iJE+eRAwA+1tZI53338rwwxVOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18D4941A45;
	Thu, 30 Apr 2026 11:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048CAC2BCB3;
	Thu, 30 Apr 2026 11:10:43 +0000 (UTC)
Message-ID: <00c4920e-46a7-4e60-af0a-a2aec7d2699f@linux-m68k.org>
Date: Thu, 30 Apr 2026 21:10:41 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] m68k: coldfire: create IO access functions for
 internal registers
To: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@kernel.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
 <20260430052047.1827575-2-gerg@linux-m68k.org>
 <CAMuHMdVDMnxkF+eKwtSoBt7g_5sqY_O4zLT_icD9zTNuS8ou0Q@mail.gmail.com>
 <b7bac366-f9f5-408b-9359-ae6a4c8cab44@app.fastmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <b7bac366-f9f5-408b-9359-ae6a4c8cab44@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd, Geert,

On 30/4/26 17:20, Arnd Bergmann wrote:
> On Thu, Apr 30, 2026, at 09:13, Geert Uytterhoeven wrote:
>> On Thu, 30 Apr 2026 at 07:23, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> --- a/arch/m68k/include/asm/io_no.h
>>> +++ b/arch/m68k/include/asm/io_no.h
>>> @@ -107,6 +107,22 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>>>
>>>   #endif /* IOMEMBASE */
>>>
>>> +#if defined(CONFIG_COLDFIRE)
>>> +/*
>>> + * The ColdFire internal peripheral registers are big-endian, so you
>>> + * cannot use the conventional little-endian readb/readw/readl and
>>> + * writeb/writew/writel access functions. Define a family of access
>>> + * functions to give correct endian access that can be used by all
>>> + * architecture code.
>>> + */
>>> +#define mcf_read8      __raw_readb
>>> +#define mcf_read16     __raw_readw
>>> +#define mcf_read32     __raw_readl
>>> +#define mcf_write8     __raw_writeb
>>> +#define mcf_write16    __raw_writew
>>> +#define mcf_write32    __raw_writel
>>
>> Why not call them io{read,write}{8,16be,32be}(), like parisc, powerpc,
>> and sparc, do?  Sparc seems to be the closest match:
>> https://elixir.bootlin.com/linux/v7.0.1/source/arch/sparc/include/asm/io_64.h#L439
> 
> I think that would be the right choice for introducing these from
> scratch, but we can't easily change the existing code in small steps,
> for two reasons:
> 
> - the asm-generic/io.h already provides ioread32be() etc functions,
>    and these are used today on some of the coldfire drivers, but by
>    accident these have little-endian semantics (since readl() is
>    big-endian here), and at least one driver relies on it being that
>    way.
> 
> - readl32be() really wants an 'void __iomem *' pointer, and we should
>    not have architectures that do something different here. The coldfire
>    __raw_readl() accepts both pointer and integer (phys_addr_t etc)
>    addresses at the moment, and the arch/m68k/coldfire code for nommu
>    targets uses that. Changing these to use ioremap() and pass pointers
>    would be a much bigger change.

Yes, exactly. I steered clear of reusing anything that already existed.
Especially since the existing broken ones are actually used in drivers.

Regards
Greg

