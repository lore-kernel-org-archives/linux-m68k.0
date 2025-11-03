Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625319D065
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Nov 2025 03:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762139477; cv=none; b=Ztxx8m+YK7MUz/k0V4ztHbAerGl/rNd81H2hvvdaLfoQxs+m8lcYQDOGCC2cC1arwcJHwnb0MLFvXhfNl1W/YiOqGYl2JPssrVVf6353kCKoO0HABVn7QB3oOvRzhZ84dvDAqqmuYs73H795gGFDuZ3nU5PisF02qzpWHrWmfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762139477; c=relaxed/simple;
	bh=Hf+CgnDc4kwl7zy424sXkASz2Dx+ilQ+VafRQYkpadk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIy6jusYsDctX54XtVKUdAehy+mS1ZhyXrRY5xwcxCGYK9UMp4WRf+KiBOD1AjbuSuTwfSKapxNlVQtT/IRk6+w4eX6ExTmnbmNF2dpR3WO7Lh9tBElPm9LFTCgQP38LmCHp7MHPpzEvbbaHM8QP42BhcKTYIIcAe4KUsUV7rxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D019660267;
	Mon,  3 Nov 2025 03:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B547C4CEE7;
	Mon,  3 Nov 2025 03:11:07 +0000 (UTC)
Message-ID: <c6f56d15-bc83-4e69-a9da-67e43f09ab35@linux-m68k.org>
Date: Mon, 3 Nov 2025 13:11:03 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Heiner Kallweit <hkallweit1@gmail.com>, Wei Fang <wei.fang@nxp.com>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <827e9890-efc1-4630-9a84-931b8482cff5@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <827e9890-efc1-4630-9a84-931b8482cff5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 31/10/25 18:01, Heiner Kallweit wrote:
> On 10/31/2025 4:36 AM, Wei Fang wrote:
>>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>>> only be 0 or 1.
>>>
>> I'm not familiar with the ColdFire platforms. Do these platforms only have
>> a maximum of two FEC ports?
>>
>> The logic below doesn't show a maximum of two FEC ports.
>>
> Right, the quoted logic would support more ports. But AFAIK there's no
> hardware with more than two ports. Max is dual fec designs, see comments
> in the code wrt i.MX28, and also following commit description:
> 3d125f9c91c5 ("net: fec: fix MDIO bus assignement for dual fec SoC's")
> 
>> for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
>> 	if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
>> 		continue;
>> 	if (dev_id--)
>> 		continue;
>> 	strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
>> 	break;
>> }

There are a few ColdFire parts that have 2 FEC ports (M5274/5275 and M54418 at the very least).
I don't know of any that have more than 2.

Regards
Greg




