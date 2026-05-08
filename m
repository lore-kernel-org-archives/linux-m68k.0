Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2403E122B
	for <linux-m68k@lists.linux-m68k.org>; Fri,  8 May 2026 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245887; cv=none; b=NgNeO/Yh0WUAfHNOAGQ7dkZbf9VkQqDKTK7LSVyodERi9dVh76Tojexqu1q+esQuBgNy58FVhwWSB7VtwG20HPngJIjqInDDQCOWXYrE3/er5eGtCsLp701wJHaNTin1RxqOvt9LsPcgI1cEcfxNoShXC/Hb+iVVJF6eox0U7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245887; c=relaxed/simple;
	bh=s4VkyW6Ymj0X647w5aPHLX8Impm8n/23UVTni3FkwDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2bVxXpIpO2j1IWvJ8QTmKB/oopATf2bNj6L69R3yibwsqnST55JU00L+Xn0HeI2wIcddQPosJ9u69PsNEO86Z/oXyE6XyFhd8QgNmdTY7rwcWXr1Obk3LhS53mlcmBSmkDAIvNrXG0T60lsSxWkQOxIh4O+ZAnKPZzNABGf58U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkiuW8Wu; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkiuW8Wu"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF73E43975;
	Fri,  8 May 2026 13:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD75C2BCB0;
	Fri,  8 May 2026 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778245885;
	bh=s4VkyW6Ymj0X647w5aPHLX8Impm8n/23UVTni3FkwDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RkiuW8WuvbCjoltHo2R7ImGHyTP1X+HJjXOvmiDGORAkoUjd7bRtnujJzi8NjZ62b
	 Aw5b2NBOr99kUVPPg8++4d+/pDa53NmlLoO2BLGwoNSkw0RtUEVA8GEbkewmHsyWXd
	 eHxGYOUp4BULphk4AXX6IKUdQS2UauhBaf4qdKhnvuJb8neHBdZ8kLyg/4fUqOvmIv
	 QDM5BONisY9nvg2Zgr5ZWVIrC1Ol+/muQ47FXI0P6TVmdTt2PunlkDgXyB30+p740V
	 xTW01VLSV+U84ccqsBgC1ZarJ+1JUI11CI2yA1GPwpw1lsV8BdDq/+zMC5huMpopMK
	 FodDD+H+FWwBQ==
Message-ID: <bb56ee81-dbcd-4aae-b5f9-64debb9c9bbd@kernel.org>
Date: Fri, 8 May 2026 23:11:20 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] net: fec: do not use readl()/writel() for ColdFire
To: Wei Fang <wei.fang@nxp.com>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "arnd@kernel.org" <arnd@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <20260506142644.3234270-2-gerg@kernel.org>
 <DBBPR04MB750044F98B1E719AD9DBD93E883D2@DBBPR04MB7500.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <DBBPR04MB750044F98B1E719AD9DBD93E883D2@DBBPR04MB7500.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/26 12:46, Wei Fang wrote:
>>   static void
>>   fec_stop(struct net_device *ndev)
>>   {
>>   	struct fec_enet_private *fep = netdev_priv(ndev);
>> -	u32 rmii_mode = readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;
>> +	u32 rmii_mode = fec_readl(fep->hwp + FEC_R_CNTRL) & FEC_RCR_RMII;
> 
> This is not an issue, but since you changed this line, the new code should
> follow the "reverse xmas tree" style.

Sure, will change in next version.

Thanks
Greg


> See: https://elixir.bootlin.com/linux/v7.0.1/source/Documentation/process/maintainer-netdev.rst#L380
> 
>>   	u32 val;
>>
>>   	/* We cannot expect a graceful transmit stop without link !!! */
>>   	if (fep->link) {
>> -		writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
>> +		fec_writel(1, fep->hwp + FEC_X_CNTRL); /* Graceful transmit stop */
>>   		udelay(10);
>> -		if (!(readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
>> +		if (!(fec_readl(fep->hwp + FEC_IEVENT) & FEC_ENET_GRA))
>>   			netdev_err(ndev, "Graceful transmit stop did not complete!\n");
>>   	}
>>
> 

