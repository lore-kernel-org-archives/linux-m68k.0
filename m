Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328891C5F10
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Oct 2025 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897677; cv=none; b=Aj9vh3TdVW8RFjtgZtFfPeZmtZshWRQIsxZjmL6dnLk5+AII+zq0g474C69A7dDw4g/63Traq9mpB2gw5agscTW/R3tGe7jVo+mTg4/OsX+k1L4PtX1z/u6/iU0wDr8Uv62adQ5yVJUqJGrGWK9l9IpSxoyO3BUXxsSq1fz3FUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897677; c=relaxed/simple;
	bh=6p33IUItqsgTbWao0/8LpE6O8R7ZzMno24041gdGicw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKs6df49vPNyancJd1pYKvdUCFIPWhoml0OPdQlybddq9d7ttVwos/Q7NyatcXZghYRBEpel7CSyjkegrbJ+zi8tehgjK1b1KrKp/VbK3F4Wb28Mk0LFqXbH5pO5+o5ER5GY6uJuTkjWtuRjo6UnjHQE2HLIxU7eotB/MTS1V8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb4a9IuV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb4a9IuV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711810948aso14353365e9.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Oct 2025 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761897673; x=1762502473; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=Eb4a9IuVctRmJYX7XUDpqovXBDdBaBYhoFjFWXRWN/QTkB7JrtENywsIrslhoBQx4S
         5/3A8LMRV/W3VCTr525Pc7XqmrnY1php1Sbfq9qZ0H31UzzYkWwHED5YviRcDaIP0tIk
         Fq01nXDHr8G0Vf4d4y8ZHCAJoer1Exb8QV3wwZDWBv/CxlClM3gRxMk+KYFpYBhNoY28
         Eymu/Ery7jGQgjCnb4/xjWosMC4uJ/7jxAKepo5cFNTLoKX4A2HgtdrtLLsPjv9zTqvN
         4ALZfvsuG5HKoXpS+Sa/y74TkHVDLUAQeb4+5Qtp1OglbdNxB3d6eSB8uognOwalB2sY
         xK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761897673; x=1762502473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=FEiaPKV9TyQV5i38GrNrofA1x0QQ90ZZ6+17XnGUcDDuSKQh9QXcjOfGzaZtpHd/dB
         PgFUfjIiwf23+nBPUgVVnF2TmytGspSzA9dJfOUqSYys8jF+C5qrLxzsPPuTfj0xQ4W8
         GosGBrTVvWCyH1yfcSS5ALRyRDKwlUwI4JAmlCas9y8fkifnoCQu28a/ZS4Od78cUaJh
         wwa5EXR1hpIijdVolni5sWb/dsP/G+wmobtwJL+9nu4l2OgFrA/wQYul5rglnvAN+gI8
         hUjMK8ymBmjqoT6IaCHQv84x6DFetsNnVHdEPgKu92HpHgxDFctxXhnmufPb47gi19Ok
         d6ZQ==
X-Gm-Message-State: AOJu0Yz5hz94D1zV1gFN/Y9034eK79suBSmqYa5lsbM+7cGOKKt1IPpo
	qSz7BRS1RecaYcCCN50j4Y8QAUspVg66wS5l+6fORvjcNHObPad5UbzF
X-Gm-Gg: ASbGncsWcLdwMoFPCGetYf3iHvkv1crUSApAk5RdxKDzw1QIexpwevsvZaK6V7Ko4rc
	c0In1CwZ5/+EQf9AfcnJyzth2f2S4XOPm+O3dxMV8J4EjdR4pLJJOb6As6DhMIlBW1N5rHcJ2z+
	aK29g796xJfX7YmhDtyU/ZzGeIXB7SwSA3W/zx5o6OS5X0nJ55JrNg5AT1lBG9C0LQAynIbudSQ
	RYBOEFsJn4CmBVDDCrsoxeOM54frZjGgf5egOpb6u5BUK4enXQWmwyCqLR8EaYxZVIHZHy7KkRj
	ali2vNtAA19buHwvTFbaXfXfXbUt+LVDCsgE9b5lne9+UwhrZXiqL8Zc22my/I7k3k5zvp9AfpL
	owfSJSYSpcr5VOejDVguNkv0n+m5hmzjhyQpZ9e4yo+kYNhvukqs9uZRpqYj203DJnYTn1z1zOi
	6e+35lWUxDNGplk6KxctF5b1EpyMAczf9kFxPc6fYyE1U3IGtyHN/vZroy4aYxNiIy67wY/4EDT
	mhhEd9GY092LY7WStk0aSe9sCJiHVkGOaoo0jJvFbEhba2G+Hk=
X-Google-Smtp-Source: AGHT+IG3O6vg8rF+wyYnH9VY8eDwwYFcOfRL+X70Z7BOTOQha5cuoUjm6Rm7WfFX1PmypLP9cnG59A==
X-Received: by 2002:a5d:5847:0:b0:3fa:5925:4b11 with SMTP id ffacd0b85a97d-429bd6e100bmr1988899f8f.42.1761897673065;
        Fri, 31 Oct 2025 01:01:13 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f28:b500:9590:7da:a3e7:284b? (p200300ea8f28b500959007daa3e7284b.dip0.t-ipconnect.de. [2003:ea:8f28:b500:9590:7da:a3e7:284b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1125ad0sm2128765f8f.13.2025.10.31.01.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:01:12 -0700 (PDT)
Message-ID: <827e9890-efc1-4630-9a84-931b8482cff5@gmail.com>
Date: Fri, 31 Oct 2025 09:01:19 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Wei Fang <wei.fang@nxp.com>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/2025 4:36 AM, Wei Fang wrote:
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
> I'm not familiar with the ColdFire platforms. Do these platforms only have
> a maximum of two FEC ports?
> 
> The logic below doesn't show a maximum of two FEC ports.
> 
Right, the quoted logic would support more ports. But AFAIK there's no
hardware with more than two ports. Max is dual fec designs, see comments
in the code wrt i.MX28, and also following commit description:
3d125f9c91c5 ("net: fec: fix MDIO bus assignement for dual fec SoC's")

> for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
> 	if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
> 		continue;
> 	if (dev_id--)
> 		continue;
> 	strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
> 	break;
> }

