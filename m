Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9129A1A8F84
	for <linux-m68k@lists.linux-m68k.org>; Sat, 17 May 2025 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747514046; cv=none; b=tyMzfRW96OTk14RQXwC9jk70rEtTd84I/qs18DN20SyrZekID7VrKZDJYylTh8MZa+gS16H61AMu1zPX4f3yGn4YNhD1zcSYgojBCEZWVsLnzZRiKXreLoqGY5GF68xmjSGUBQBcwhIvmBd6aWuu38n0pCjkD8FtpU+P5ZIzDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747514046; c=relaxed/simple;
	bh=4E/aFFWkVe0vQfX0S6QluHCY4Gqb2WRZhvbrp/lrr+w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ALiJJD67sgRp1IVa3dGVjMbJt7nloTJRg/b89waCh9Z+213rW6rmRafk1kSox0R14ceKL0DkUvl/goh6/tmsZe7pf6HmDw/sC82uX6mMXMJrG9Jv5ILPocWux1XqVgLL2ed+h6tvp50jdoyOHgiL005iuX8XOxoZq+lYwHBIn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIEpmwUe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIEpmwUe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso3114421f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 May 2025 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747514043; x=1748118843; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YpuDXqI4S55MWdcng3h5qGQQR58id20p/T1/UmNiWFA=;
        b=lIEpmwUeqwpirn2j+P58GO2u178RHsBZ+FNV5RnHhE8Q5xOsV3OLrmEYyLsAqBtbUG
         hSSwnOh9GSu1B8TN7KwBv0vXZU/4s3E6+Ok2My8NZ3Zjq+JraWXvTD+3+dKmXjgBWmLa
         AVUNZ41S7mP8Ka6B3x9TgdOop8ZW/3+QXdiYWnZwDeTFqj/hU16lZML/JNzVvXFNzEyO
         gfa9RjqYc1ECYIU9vdD9sO+xmfaWKO74EyGQ4Adtex7wqifX2Ip740aU3uYyfCDHFgWo
         4BmrbBWccgr6FQejRsV1BRpAUAA+RPbrk47jxL0DlVgcAIMTsBYkifjKMPLt4tDBYlta
         5XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747514043; x=1748118843;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpuDXqI4S55MWdcng3h5qGQQR58id20p/T1/UmNiWFA=;
        b=anyPHYGMJW7JM3KQFWUyOcb77XOZSDE/wovHZvSOsqbTXFYxwbubAtH6OTPkFPi/C9
         nmvj7GNEJ78bnGF8PFBMmpbsG+9Ehsiy+ZWsPAghR1dURj4PGMXuPlctgRJVs02PqJ2O
         lMj/qonCX29YCgzq9tuSTNIAbKhQ6DRBEWEYiWMQ1cz3LLDPFyPEy+zNjh1OhYZk8EYd
         PPsk6scjfqMydR0nwVSdgTzu3FWurz8XfR39EP4eEUE/iQQ54E4iJrrS/WbfBImL6vll
         oVSgbTewhd0vbfbMCThlQRPo2cJjorcGBMl2LIpVTkFMLpy076YK6EwUn0V9qSwAJNoh
         nrvA==
X-Forwarded-Encrypted: i=1; AJvYcCV9v2Q0R0WNhYMRDz6+0ooANiu7Hp7LTThtfoOEIGGMKng2UWsfW6lYHjc1dS78D5zWPtzTEpgRgkAm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzQl5pWSsktl/yvfKsnSTjw792tEiikiTi/5CNLylPKvU6T5+M4
	3I8+LykW0ZV5l+saAriP5LP/S4i4nVQk6vqGIDX40qjsw/nZC8c8oFwl
X-Gm-Gg: ASbGnctT01i6i0Mi0PeVL6zKVsDAsWtQeps9DFF2gozMcvpFPH4bWCEwtudu3sVkofj
	V+3ig5iG8y3pg+f3N5P8iPZTRnhCKrtVH/RTCS+BCjNttPQMVzeP0tIryWxinUqK6oBWhlQ7wSp
	fIUxPDx/BmSKx7SQe5MpzBOHgEe9B5t9sEMrNG3Lj2wor8Bz0Bxo+xLfgrF05QQfiogW4SI1MuR
	wHcV/6HKoJK++8LeEfjOkN49QQ8POF7sNWFHOlBdPSa0cSr/vpSmRFr0d0GRJwYm4mZvGJSAvN2
	qbHKPf7ldYBje0r5UK9kf98JIdD8LftUPJFMnKcXD46pid98UPCFPiLbha0zBdxp5c2FkE3Y7fO
	l7PYKHdq7U3W5I7IQ3l5tKLuc0yKklHjUBdD90vDGW/x74ceSBGv7rXHXPKKXD5iai/25jpWtfU
	AhyehmfIGmC49OTTY=
X-Google-Smtp-Source: AGHT+IHOpOx8CHNtGolc5aunKCnbXvQIEy0fH8gdhLeI/YjQ802knktd4SwoGUfVClicd1bb6TTaZA==
X-Received: by 2002:a05:6000:2311:b0:3a3:6715:afba with SMTP id ffacd0b85a97d-3a36715b0dcmr2779505f8f.44.1747514042861;
        Sat, 17 May 2025 13:34:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f37:2700:a4c5:88ff:c972:1238? (p200300ea8f372700a4c588ffc9721238.dip0.t-ipconnect.de. [2003:ea:8f37:2700:a4c5:88ff:c972:1238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caf0sm7164563f8f.82.2025.05.17.13.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 13:34:02 -0700 (PDT)
Message-ID: <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Date: Sat, 17 May 2025 22:34:32 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/3] net: phy: fixed_phy: remove irq argument from
 fixed_phy_add
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All callers pass PHY_POLL, therefore remove irq argument from
fixed_phy_add().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c  | 2 +-
 arch/mips/bcm47xx/setup.c   | 2 +-
 drivers/net/phy/fixed_phy.c | 5 ++---
 include/linux/phy_fixed.h   | 5 ++---
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 734dab657..5b70dfdab 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(PHY_POLL, 0, &nettel_fixed_phy_status);
+	fixed_phy_add(0, &nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 247be207f..de426a474 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(PHY_POLL, 0, &bcm47xx_fixed_phy_status);
+	fixed_phy_add(0, &bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index c91adf246..34a71f223 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -160,10 +160,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
 	return 0;
 }
 
-int fixed_phy_add(unsigned int irq, int phy_addr,
-		  struct fixed_phy_status *status)
+int fixed_phy_add(int phy_addr, struct fixed_phy_status *status)
 {
-	return fixed_phy_add_gpiod(irq, phy_addr, status, NULL);
+	return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
 }
 EXPORT_SYMBOL_GPL(fixed_phy_add);
 
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 3392c09b5..316bb4ded 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,8 +17,7 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-extern int fixed_phy_add(unsigned int irq, int phy_id,
-			 struct fixed_phy_status *status);
+int fixed_phy_add(int phy_id, struct fixed_phy_status *status);
 extern struct phy_device *fixed_phy_register(unsigned int irq,
 					     struct fixed_phy_status *status,
 					     struct device_node *np);
@@ -28,7 +27,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline int fixed_phy_add(unsigned int irq, int phy_id,
+static inline int fixed_phy_add(int phy_id,
 				struct fixed_phy_status *status)
 {
 	return -ENODEV;
-- 
2.49.0


