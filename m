Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0D3E277B
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 May 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778246054; cv=none; b=Nu2JSR5xwxNQ356pGD/IwK4lLXRSjK/IsO2zhqOC2e7nA+EZdd3Z5Y46vxqA7RsU68K5XWrBsVEWcROBRf3sQaelnNx8uKGExkWRhlBFLNisxoSzvuN2AYaFT0dtuHeazFrbxXxIz6tt+J5bVXJABXGObz3fJoxaZ3AB1BgLEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778246054; c=relaxed/simple;
	bh=T9xjqblfP5Kt4p73w+ZmacLEOzrmjcyyAl7jfGRQ15k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMhK82FyLnLuxbZ9fGiyvttDzYd1T8dSZ58Fi7Xn5phKiYnLpuoTHZyRjf/qedfBvmYnuzbL/zOqWpcLAecwncLBz4hgPNMCDSxYEYai5esdMrbIxHZQXv51wjhGfkigLn+YrAsgo5+bCwNU+3zFuLhCToCm1sUwEItrKuEGqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3E6Jmj3; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3E6Jmj3"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F48B406C4;
	Fri,  8 May 2026 13:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F36C2BCB0;
	Fri,  8 May 2026 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778246052;
	bh=T9xjqblfP5Kt4p73w+ZmacLEOzrmjcyyAl7jfGRQ15k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3E6Jmj3TZY8Q+W7JPq2bwUryqyxvF1JQXv5kB1vCMgyhwSrYca1MwK6/xQtzQFN7
	 I7pnjEbnBlsifSii6MAtOoShUJqh6jHeR53SrTO0swPEmmzfjEvdhy2EyqNQkD/YqP
	 BaM+VQCHH3eBl4Uhrd8W3OmdU8pAFUpo1eUuem3S6vRZT0XrNPHZv1I/XzkD3K7jBj
	 vzdifR3loJ1AN4OUg5oOLt0qZXjZclPDpIqB8cH0sn1EWZ7niidcK8V0Z5hfONUwoF
	 gtmbqy5Q/7VEJdz2iuLnNIAPbDVWVTDmmQ2obSCzQYnzN2WHm4GeZEPXJeYANRUcsN
	 JRb50yW9mxANQ==
Message-ID: <151f5b1b-8a82-4d7b-b1c9-67da07853806@kernel.org>
Date: Fri, 8 May 2026 23:14:07 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] net: fec: do not use readl()/writel() for ColdFire
To: David Laight <david.laight.linux@gmail.com>, Wei Fang <wei.fang@nxp.com>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "arnd@kernel.org" <arnd@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260506142644.3234270-2-gerg@kernel.org>
 <DBBPR04MB750044F98B1E719AD9DBD93E883D2@DBBPR04MB7500.eurprd04.prod.outlook.com>
 <20260508094043.20f5f3fc@pumpkin>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20260508094043.20f5f3fc@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/26 18:40, David Laight wrote:
> On Fri, 8 May 2026 02:46:38 +0000
> Wei Fang <wei.fang@nxp.com> wrote:
> 
>>>   static void
>>>   fec_stop(struct net_device *ndev)
>>>   {
>>>   	struct fec_enet_private *fep = netdev_priv(ndev);
>>> -	u32 rmii_mode = readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;
>>> +	u32 rmii_mode = fec_readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;
>>
>> This is not an issue, but since you changed this line, the new code should
>> follow the "reverse xmas tree" style.
> 
> Looking rmii_mode isn't even used until much later in the function.
> (and then not very often)
> Much better to read it just before it is needed.

Sure, but that feels like a change for a separate patch.
The changes to this file are a global search and replace.
The final produced object is identical before and after.

Regards
Greg


> 	David
> 
> 
>>
>> See: https://elixir.bootlin.com/linux/v7.0.1/source/Documentation/process/maintainer-netdev.rst#L380
>>
>>>   	u32 val;
>>>
>>>   	/* We cannot expect a graceful transmit stop without link !!! */
>>>   	if (fep->link) {
>>> -		writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
>>> +		fec_writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
>>>   		udelay(10);
>>> -		if (!(readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
>>> +		if (!(fec_readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
>>>   			netdev_err(ndev, "Graceful transmit stop did not complete!\n");
>>>   	}
>>>    
>>
>>
> 

