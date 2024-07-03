Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355517B40E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jul 2024 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.40.73.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720013419; cv=none; b=R7URmwr82J3YmjUi0jECBJgs+ot6sc5GLy6GMtix9HhGLi5W9cBJhzTCtvvfoLEn2E58T3LLpOfD6E/Ry4yru/BF6GY9cx9+QFK2ZU9ufhBhCkqMNswGuT0lLQOQQ6QGTK7xuM5zIH6giibVX4tbc0nPKEHcbx3xXAGLBxC1O9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720013419; c=relaxed/simple;
	bh=NuS0lze8w6QLW4fVtoIyJUDw/MJGvL5U5EexN3ZTprk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGrG+OrWP49QXguYhIvsXWkgEISaPE8zRWgQO6jTawSpp5cdWDuUSIgRajVK5kmKxredJnAlcwMlg29RlkCXBaAdlFagMJ5DnAKJam/y5K5BBBX5OHs1SsCk2iwwo0Yjal57kBTBwd8KQ7lArbfOY9xitfRKD0/TnUNioDmxN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjhCO1d3; arc=none smtp.client-ip=145.40.73.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjhCO1d3"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19E6FCE2986;
	Wed,  3 Jul 2024 13:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0A0C2BD10;
	Wed,  3 Jul 2024 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720013414;
	bh=NuS0lze8w6QLW4fVtoIyJUDw/MJGvL5U5EexN3ZTprk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gjhCO1d3ezXJwDvtRRP/7/nsF7jTaWIJx65me7saESC8r8oa+fT2FPjtCZByQxO44
	 fJm+Rae10+sZC0Di5ch48lLtU39PZOsC8bxzGewsb6vAduRRGCLnjSA2MyYyR6CPCS
	 yxbR4EDab+NZCo4UFbPpKBCntnFrm1mK9qg2PByQe0zSeZy1GBsVrmADSAtc/h7fNZ
	 1yA6bTXzq0ArocijLMLUSqTbCY0L3QFQHUkG+gYyW8Q1ybBOGacLEYolx+VxklvXct
	 V3JgJc3IxEueyfDyRrxbnH/jDl/bVVl2vz6A5G2RlS+I57qozDprSOzpp8dQ48KGYg
	 OUC4baOKXNzkA==
Message-ID: <a9c34972-a933-49f4-98e4-cbcc321022e2@kernel.org>
Date: Wed, 3 Jul 2024 23:30:09 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC support
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Agner <stefan@agner.ch>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
 <20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
 <20240628094511.75cc9c78@xps-13>
 <b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/7/24 02:44, Jean-Michel Hautbois wrote:
> Hi Miquel,
> 
> On 28/06/2024 09:45, Miquel Raynal wrote:
>> Hi Jean-Michel & Geert,
>>
>> jeanmichel.hautbois@yoseli.org wrote on Thu, 27 Jun 2024 18:05:28 +0200:
>>
>>> Add a few definitions, as the base address for the NFC for the M5441x.
>>>
>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>> ---
>>>   arch/m68k/include/asm/m5441xsim.h | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
>>> index f48cf63bd782..d4ee1eab7c4a 100644
>>> --- a/arch/m68k/include/asm/m5441xsim.h
>>> +++ b/arch/m68k/include/asm/m5441xsim.h
>>> @@ -99,6 +99,7 @@
>>>   #define MCFINT2_PIT1        14
>>>   #define MCFINT2_PIT2        15
>>>   #define MCFINT2_PIT3        16
>>> +#define MCFINT2_NFC        25
>>>   #define MCFINT2_RTC        26
>>>   /*
>>> @@ -333,4 +334,10 @@
>>>   #define MCF_IRQ_BOFF1        (MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
>>>   #define MCF_IRQ_ERR1        (MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
>>> +/*
>>> + * Flash module
>>> + */
>>> +#define MCF_NFC_BASE        0xfc0fc000
>>> +#define MCF_NFC_SIZE        (0xfc0fff3b - 0xfc0fc000)
>>> +#define MCF_NFC_ISR        (MCFINT2_VECBASE + MCFINT2_NFC)
>>
>> I'm sorry but this feels really backwards. Platform data as C
>> structures are already legacy, but defining these information in
>> some arch headers and using them directly from drivers really seems
>> even "wronger" to me. What's the mid/long term plan for this? If the
>> platforms are still in use today and need to be maintained, why not
>> finally enabling device tree support? I know it's harder to do than to
>> say, but I'd like some really good explanation on why we should accept
>> to do this in 2024 because it feels rather inadequate.
> 
> Thanks for your review !
> 
> I agree with you it is legacy. I use a lot of ARM platforms and device-tree is indeed great. Though, switching the m68k architecture to use this sounds really tough.
> 
> I will obviously let Geert and maybe others answer, but my feeling is it is not really worth it to implement the dts on those platforms are they are not that used (compared, again, to ARM for instance).

It would be nice to use devicetrees on ColdFire, but I am not aware of anyone
currently working on it. So I don't think we will see it any time soon.
So currently all supported ColdFire peripherals are "legacy" and use the
old platform model.


> AFAIK the platform data is not officialy considered deprecated ? As it concerns a few platforms out there...

Certainly not officially deprecated. m68k in all its forms is currently well maintained
(if not necessarily a lot of new development).

Regards
Greg

