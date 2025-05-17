Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015BC156237
	for <linux-m68k@lists.linux-m68k.org>; Sat, 17 May 2025 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747513979; cv=none; b=ZRT9YqhigNXnjDi5YDec3n9+mxEyDlyLKCcRUydboftwRcY52Fn9CKr3s31APGSTMTGeWo+10y0NP8BZR8gUVDJHeNHw8/Z9aXOgZybi5wieu6RoC3dOuFwH+s0ee8RqlWCLZayT3jNJgCAgUJkRqZ7YSa8yc1kMVp8TlD7GmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747513979; c=relaxed/simple;
	bh=42iLIcYt/l0If4G7uGt2Nj/W8LQIEdFOpVdaaIX4VqQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=X5LI7Bj1S9GxwCFzNERH58F5V+fTOT6Tn2hQ1sp44p5LBdEWh/xSYomKyfRXeiWvqEmBv1rsZJSdmzuvYKn6Y9ipb7W57lsgZfHiXwtLF2I/H5kUbPN57TbAewmbkvaVVuu17RJIwxrCWhODWv4ftE4/zy5kzN05uPtZw2dOHSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kpe+0q/r; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kpe+0q/r"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso38727065e9.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 May 2025 13:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747513976; x=1748118776; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yIT7QdQvSCxnmN31XAsBOO9QvEIVddKZPUr95wm71M=;
        b=Kpe+0q/rAt3seQAEecp4iUQyBiVdCJYyzTnN2Wf0mH26fiSgDIbCRmH6ImPEtBjI6F
         vJPxwQ3O8guK4150/xz9gpAheZi+LctStoh9ihPFmeCTdioAjLAijqcx8H5slGz8kAlr
         IrdxPkM+IvaGSp6kJCxa4iSSjbmS3rmJUVLv4Sfypfkz16uz/76iwx9f5CEINc/oH6Mc
         QDNb+LEWNC5dSWMukpW3vxwXtLNmioxEHIfp0CEYPMp4TsiUVC7eYdKNni1sPL/sQOlD
         t7lGn0ZMvLtDY3mr41Wa+wDBLym5NRjkii/FkdaSWDRT0GVKA+/f+72F76IcBOiWBV2w
         5KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747513976; x=1748118776;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yIT7QdQvSCxnmN31XAsBOO9QvEIVddKZPUr95wm71M=;
        b=Y7EV4wNy1iddqWXBe/FRBi3uev79JfE/H2ZFuZQ6l1NEljE1Gy/V1SoIgC2ADnVzEI
         41kCzpOVTRtF7B0gc8C+DZ7zRaU6hn8le+NZmljrq1QxhHeluvlfukHDfoXQsU2ibm6o
         GwltWAdXnsui0hBgVHZ68/Z6bX/EXQHL3DSogS2RzBQZdZ5gOnoETtVfkHE9gUW6ww1e
         u/gVyvfz4rmcdxwqh3svBhAQIYlhgcBx1kIxEjBfKkevHh4DXYbLs6TIvLjeGgN/ea8n
         oubcFLwUwaRWHHg25HKl7mRwYHH5gnbt4DQIHYNPJPueZfbycb+SmBrfCa0hOPCnQNuw
         R7CA==
X-Forwarded-Encrypted: i=1; AJvYcCVT4t7ODjx4jQHz7lkgf4SYlWXJGrq38bLXMO/+4faqs17weM8WHQqgSXqItIcEhPOxiqkaGOpXvCQh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyX/Zzp+iZzWjeTSKQkXtkdEzoM3Ay7gmP9lmGZboTpAdrNlZLv
	sRfCQ2pYGSyOj8dpQhCb/xXjcqH/EtRZGQSzUROS6MI8IEdSVt+z4+7n
X-Gm-Gg: ASbGncuNDc62e6csGY87aNLZqGRVBHFQMsxdVPKYkog2S1u9sdA4hQr8rC1hrPqPSt2
	5P62f5C34p58qKBq+pfFIAidMb0erw9bMPTRWE7r7k8Yt5PWwJT52dIMHFHEN12xFQt7h5Ieq2x
	My2zVNPz9GGBHFuzjoIzyXuKC4CHHmGG/SVQIVe/tapTXGHi0Rr87HrTdYGQMpBC0lpqcX1oeUW
	gdVICx7dJv320C7BFpryLBs4E6CA9Uo03jy1oK+5zb4hV8E5gw4lEAysoHAFL1tI7JTkoFOzTVt
	2LF7pnCNlbevtbYMIQCQwTew3U24dZPc7V0VvLMuKR408SOlsokymRAU7fUDmvpxThGji8qb0Bq
	zb4FkiHZBGP+Pkk8xV0sfgnYpywnSyXq026pU+X32LB1RnNhD0IcmNXdFFsDqmMMxZZX5p7gCSg
	c3KkuU5PnLkUhmeAw=
X-Google-Smtp-Source: AGHT+IH268GqSowwk2eZGa927407wYTBSIfR9dlYEUPnWYeak3Kp6SRS3MB6yTmyGmnRhGaDV2uXOw==
X-Received: by 2002:a05:600c:5493:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442fd618f0dmr92023495e9.10.1747513976054;
        Sat, 17 May 2025 13:32:56 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f37:2700:a4c5:88ff:c972:1238? (p200300ea8f372700a4c588ffc9721238.dip0.t-ipconnect.de. [2003:ea:8f37:2700:a4c5:88ff:c972:1238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdbaesm87096455e9.7.2025.05.17.13.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 13:32:54 -0700 (PDT)
Message-ID: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
Date: Sat, 17 May 2025 22:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/3] net: phy: fixed_phy: simplifications and
 improvements
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series includes two types of changes:
- All callers pass PHY_POLL, therefore remove irq argument
- constify the passed struct fixed_phy_status *status

Heiner Kallweit (3):
  net: phy: fixed_phy: remove irq argument from fixed_phy_add
  net: phy: fixed_phy: remove irq argument from fixed_phy_register
  net: phy: fixed_phy: constify status argument where possible

 arch/m68k/coldfire/m5272.c                   |  2 +-
 arch/mips/bcm47xx/setup.c                    |  2 +-
 drivers/net/dsa/dsa_loop.c                   |  2 +-
 drivers/net/ethernet/broadcom/bgmac.c        |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c |  2 +-
 drivers/net/ethernet/faraday/ftgmac100.c     |  2 +-
 drivers/net/mdio/of_mdio.c                   |  2 +-
 drivers/net/phy/fixed_phy.c                  | 12 +++++-------
 drivers/net/usb/lan78xx.c                    |  2 +-
 include/linux/phy_fixed.h                    | 18 ++++++++----------
 10 files changed, 21 insertions(+), 25 deletions(-)

-- 
2.49.0

