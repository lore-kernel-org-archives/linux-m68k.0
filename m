Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491872EBB83
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860373; cv=none; b=bnLQApVExk9vgaWtr/k6cy2014L/6NeKqHpBq38mefQG2s2QBdwaL9SSt7tBwCIkEuDmVh48/d2N4D+MuB7OSxoKBDnQmNRlVqpNm56+uwUwrBV5E7PmxAxuriofEEn0Jtt13anKmNCZnFGnHFeuEaunXs5B3ngi/x6cSzZancg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860373; c=relaxed/simple;
	bh=WFlyIexI14gzzzuldNdHGJV4JITfsrwcYTRONb/7CzE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RWKRnNXRlCDhmcEQx6Y/Jc+pwZKHHLR4FRGRfMsVxDpYfyvtna8OJlO1hAng6RQEPoaLibPq5p2TFayElInWBd1rfMY3//5qQwtZpaDREzqLeiCTiWCejYI64WH+b49s8nGRmnp57VLoN3G27GtQdw/2wumNDyZsOS7RwS4Xzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyjNNUu8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyjNNUu8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so297002366b.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860370; x=1762465170; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=XyjNNUu8UDVFgrRESRVggxZCEsowWtSqgRYcGnkeEQR5e5gQIjsk6kJ8C8drhak9ke
         oss93YR088u0JXVkeZfoFFQaIqCeSNu30+yZ/WQe1w9acFO85cb0LcjvjZfZTCm7+hdZ
         NmcLXOGbtO0NYz24qQryJJZxrUD6FoCEjQK9V+wrMbtBS7Zs1pAa93lVchkuFx5iMvDj
         TFE2/9MZY07X7YJDMaxlC4ZgGKNsm6QwyxAG6pe6wQEIsXOLrgmkvbHg+HH6XnAfjGe8
         1qH4dH4Zsg/kVpxGAcu+yliol4OREoGa8fiuEJ4kdYyNlHvsdccgoOWFQfcUS5R6cXJ4
         74Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860370; x=1762465170;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=kQf4ukTp79EsfSpmY+wj7UXXMMTgP00D/zejpJ07bje+nDID2/si0tezW0hpwTwPL8
         m4W4F/h778J2tglYdOrZMCOJuHY14i9iN5D7W24T+XjSg3s+gGok+zt2H+eWonAFenlA
         vmWuvonEHpbL8Y7+2Khu/uryQmTtp4a4AhpLIOgoG+aCFroNwLu0g9aSnoe4TVk6sBSA
         wu+pDMHacZEFucQeIjAqrpdZ5JBhIbDAtEHv3xNnjSU0UhjecsImWeGjgO3k/HyzOqVb
         cvGDt8YZxtGqqKaomu4DL9xJTbxN15TXOPFkQm41WAHWdtpIuAhzBCdIBF3qemIaA/8V
         XIBQ==
X-Gm-Message-State: AOJu0YzVxvCppwLfdq2JMjCNXmkyT77TVuKytXrcfJElMDvni5rw6dhR
	O40aGNRtZO5m2RXHW/igoGU62IqC/jIlJ0u+yRGnBjHhm9k2Ns5atkyw
X-Gm-Gg: ASbGncsC9C9FY/JPqbyug4I2rZZOsc1DJ3G1eK9f/yc2ZFrRSlKBfEVyTCJr1gYBk+U
	dhHldWDfWgICqo0gNbNCWGjeX3JzE6RIyCut/Lu7zip7Ikq/ywxcVY01ufv8KVBkOwTlByt8mSp
	frXL2qbpywQa3U5pVuz+yZK8dpzcB+z4x/nTf0Xr86MRd44PncapDNtZysiwQ+ZykW1Kq6kQwn4
	Y5pigUmNN0kb6NYR1JgiXwFWWLOK7iLMDcoWlZa1gmh2sLC1Xjrk4MvOz7roCxjKAkAB3OTzmvB
	R3wGBRHpokGl9edoG2VqiBfF7LPSKQS+hWUXoWwAafkUsQy7yGQnsl/Dg+6BccPg+OGxXQOYHSd
	BUmN80WHmXPizNm0XlXqUiI5sl1dtfoB2R7XE5Fjt2Zypaz9FF1npF1hkYy/c+S6uHnrm9IuTUM
	O2LV25ZQPV9z3As3RjGXdozSDX622Utjm9OfKHG6xL3XUP0/wgfgTay8vVl2Zq+ZNGMERNZRNCw
	oipvfHEU3MnVTOZBetC9yX2C/hGHTtUrsbAvPBeFpL/swNRMCECug==
X-Google-Smtp-Source: AGHT+IH33A3IZf5JH3qGVGFsjIEcTWzgSwfEhDPkDUgrYDxBSHDFAWfg2IEswXtHcRF99P2jtkDStQ==
X-Received: by 2002:a17:907:7286:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b70701055e6mr122986666b.2.1761860369354;
        Thu, 30 Oct 2025 14:39:29 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1855428866b.21.2025.10.30.14.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:39:28 -0700 (PDT)
Message-ID: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Date: Thu, 30 Oct 2025 22:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/6] net: phy: remove fixed_phy_add and first its
 users
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed phy code is built-in.

fixed_phy_add() has only two users
- coldfire/5272, using fec
- bcm47xx, using b44

So migrate fec and b44 to use fixed_phy_register_100fd(), afterwards
remove usage of fixed_phy_add() from the two platforms, and eventually
remove fixed_phy_add().

When I proposed helper fixed_phy_register_100fd() first, there was
the question whether it's worth it, and Jakub asked to submit the
full series:
https://lore.kernel.org/netdev/20251021182021.15223c1e@kernel.org/
Apart from this series, there are two more places where the helper
can be used to simplify the code: dsa_loop, ftgmac100
I left this for a follow-up.

Heiner Kallweit (6):
  net: phy: fixed_phy: add helper fixed_phy_register_100fd
  net: fec: register a fixed phy using fixed_phy_register_100fd if
    needed
  m68k: coldfire: remove creating a fixed phy
  net: b44: register a fixed phy using fixed_phy_register_100fd if
    needed
  MIPS: BCM47XX: remove creating a fixed phy
  net: phy: fixed_phy: remove fixed_phy_add

 arch/m68k/coldfire/m5272.c                | 15 -------
 arch/mips/bcm47xx/setup.c                 |  7 ---
 drivers/net/ethernet/broadcom/Kconfig     |  1 +
 drivers/net/ethernet/broadcom/b44.c       | 37 ++++++++--------
 drivers/net/ethernet/freescale/Kconfig    |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
 drivers/net/phy/fixed_phy.c               | 18 +++++---
 include/linux/phy_fixed.h                 |  8 +++-
 8 files changed, 66 insertions(+), 73 deletions(-)

-- 
2.51.1

