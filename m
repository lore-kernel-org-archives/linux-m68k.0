Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03757424D47
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Oct 2026 06:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959912; cv=none; b=lxDR501wJarQA6/nF9r37vU8YLl+cT1pmgPPUhwIiPzIwN0OY8Faz4purW0K6eMewTY+10c4hoqBjt7oM5njDPtCaj1ztPAGECnw+o2of16zgZWbcAtjO4SsZ/C4ZXVA9XdCkuUpd26xlIFx3X0tnMxN8AQ9Gb0FQXx+S1q/2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959912; c=relaxed/simple;
	bh=dyHbW5A3HN96H3sBpi1EDLyB+75PXlfxOdGFi5mEdfQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=peVZ4TMVcwlipcBmOm5BJn0m1vT17PEuzHKBNr9kLC51SEb+T8faJ7KH4D+AR5i4NtR6CKjJjxRpKKqxhxe4ZTK6dNDNqfUs41IyWfJT7o1j3JK+SodZ4yRZ9Ytp2UwZUuCfMHDUQUM2jUsNSg5OMdLGBLFUNjZa57CYG/Fvl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D6260213;
	Wed, 14 Oct 2026 06:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2711F000FF;
	Wed, 14 Oct 2026 06:38:24 +0000 (UTC)
Message-ID: <a79da05a-0d95-48f7-8b93-1c42feb07f8f@linux-m68k.org>
Date: Wed, 14 Oct 2026 16:38:07 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 2/3] net: smc91x: do not use readw()/writew() on
 ColdFire platforms
From: Greg Ungerer <gerg@linux-m68k.org>
To: nico@fluxnic.net, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, arnd@kernel.org, netdev@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-3-gerg@linux-m68k.org>
 <6fa8c6f6-64cd-4204-a9db-6a33f5e23117@linux-m68k.org>
Content-Language: en-US
In-Reply-To: <6fa8c6f6-64cd-4204-a9db-6a33f5e23117@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ping (again).
Is this driver still maintained?


On 23/9/26 23:04, Greg Ungerer wrote:
> Ping...
> 
> On 7/9/26 23:37, Greg Ungerer wrote:
>> Modify the access macros and functions used to access the smsc hardware
>> registers when used on ColdFire SoC platforms so they do not use readw()
>> or writew(), or derived functions like ioread16be() and iowrite16be().
>>
>> The current set of readX()/writeX() access methods for ColdFire have
>> historically been non-standard, in that they mostly access memory
>> big-endian instead of the expected little-endian. Before fixing the
>> ColdFire readX() and writeX() supporting code to properly work with
>> little-endian data existing driver uses need to be fixed. Convert the
>> smsc driver ColdFire uses of these to use the raw access macros - which
>> are well defined to be (native) big-endian on ColdFire. This change
>> requires some byte swapping at time of access to retain existing correct
>> behavior.
>>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>> ---
>> v2: changed from RFC to PATCH
>> v3: no change
>>
>> Resending with expanded CC list as per get_maintainers.pl, hoping to get
>> this picked up.
>>
>>  drivers/net/ethernet/smsc/smc91x.h | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
>> index 38aa4374e813..1290335629c1 100644
>> --- a/drivers/net/ethernet/smsc/smc91x.h
>> +++ b/drivers/net/ethernet/smsc/smc91x.h
>> @@ -142,22 +142,26 @@ static inline void _SMC_outw_align4(u16 val, void __iomem *ioaddr, int reg,
>>  #define SMC_CAN_USE_32BIT	0
>>  #define SMC_NOWAIT		1
>>  
>> +/*
>> + * Access SMSC device registers using raw IO access primitives. Byte
>> + * swap as required for device registers, but not data.
>> + */
>>  static inline void mcf_insw(void __iomem *a, unsigned char *p, int l)
>>  {
>>  	u16 *wp = (u16 *) p;
>>  	while (l-- > 0)
>> -		*wp++ = readw(a);
>> +		*wp++ = __raw_readw(a);
>>  }
>>  
>>  static inline void mcf_outsw(void __iomem *a, unsigned char *p, int l)
>>  {
>>  	u16 *wp = (u16 *) p;
>>  	while (l-- > 0)
>> -		writew(*wp++, a);
>> +		__raw_writew(*wp++, a);
>>  }
>>  
>> -#define SMC_inw(a, r)		ioread16be((a) + (r))
>> -#define SMC_outw(lp, v, a, r)	iowrite16be(v, (a) + (r))
>> +#define SMC_inw(a, r)		swab16(__raw_readw((a) + (r)))
>> +#define SMC_outw(lp, v, a, r)	__raw_writew(swab16(v), (a) + (r))
>>  #define SMC_insw(a, r, p, l)	mcf_insw(a + r, p, l)
>>  #define SMC_outsw(a, r, p, l)	mcf_outsw(a + r, p, l)
>>  
> 
> 

