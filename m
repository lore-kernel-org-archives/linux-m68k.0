Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3292B2367DF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755894941; cv=none; b=lc2qN2LmE0OH/iTEr1m2eUAurpJu+3fYe4FtfEkAY1hFJDWinSU2+VqLZ1Kj5X6Z/PbSfNinNLqTcsTpI4PD3djBc6nPELqjJa1YKZZ+fMwkfljru3Lp8AVwAme6ulcGsvwgOjtxz+bRfrxyTIFdvJQmHExnEZqTDnrsL/7oSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755894941; c=relaxed/simple;
	bh=ACmzXamtUkFOMJa6lmYz4KINABUO+0S4KsHWuUfFFqc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=X7+SBXIU6g2tDBq0VvNhRSpUa1DRddzox5shm0ISH0dFMlS7UrDwQt7/UPfgDpgu5ADEcW1IE4p2qsxQLbcYjr9Lnft9HPRUSeoshRxsqOnPjjvXK/DAPo/h+ItPuo63kyJ6SUZDH+GNo8iE8YLdI1Lv70B3O04TK1nKdxvXWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrP3cRdW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrP3cRdW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so13964505e9.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755894935; x=1756499735; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngegEq4W7EG9N2JmbWEs/MfIfA90UpT+UDvgWSX3iDY=;
        b=CrP3cRdW8rTacfSC7+eNDu+/rqyjt9qZAu0lYs1Pf1E5qvSnLXeF0ZepwYW0heyi9V
         /bXQf6u2BPS1MD96Jbydhn4a3WujyYpirv2G8ChQzVCXELOXY+LmwQj6xADlRtt40Wrc
         wJ/lBSoRzu+FMqZXBm0JhW3f0bDCMJV7eM5Ougz811Y+6+LagVVSVqaHeg3GvJrNS6IY
         X45DBLHrmiJNp9SoGVrOkb+4MxJoaT9wEjnj6N0SFby7nBl8GPBVETEqRCYzMogb2Mwn
         gX57mNQAeFG6uig357kp/EIhc2gHL1clXfupw1vlpEO1NBu07MmBaj9cKedca26/x9u3
         7nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755894935; x=1756499735;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngegEq4W7EG9N2JmbWEs/MfIfA90UpT+UDvgWSX3iDY=;
        b=g9Z9k9lebYbpJiWUnPiZEirepvxjFiWvBWWSIHVBlKa5PKcA3S8jlYoNefJJvTyj7i
         Xnf/9pE/PhJjPAT809GlETbyaRUHp4SaP8di2rvdUAQ2QUayyumvLhQQNMT0DQFWhEPh
         PXn7y50pecpxhxBJlBSP8JiSy2E+DnceWw2gnIs+/KMaODs6rH/wSJghZXmyudcApuVu
         5/755K5qhdvsdM4ex5ED4KWHrZoQYJbxPYiYCSN/9BQwLnA/KXwYezxSmeLMWzxcISWx
         wlieUUVtvnxr7XzCgIR/XsXGdTNc8rKHFSyJ2djTaK/0/XAwszCSgLRa0ssN4L7JK77S
         dd4w==
X-Forwarded-Encrypted: i=1; AJvYcCWzgsYnz8ItQdIAC+e6E7aZxLdj/zsHcLHeEWmg11GnbiXgFreDk31sTYrSp01XMr7bh97PMKhPqai4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxtxL2fl/J6ayZz4pfHUAXtUY7DDkRzKtBt4x/opZQNmUiz75SB
	UuMrNpDLSDRNuC2WJlL6NggXrU44+A0XE5vm3Ni2xv98LsLb7mkhG62m
X-Gm-Gg: ASbGncsf7qvEvoDkC9/NlQjE/0BCGLgrPixKmMtGNWfrHWWGRE4/1EBzkkLi1ogxhbS
	L4SLPsIVgzYqUvdEwgHHsWdac4BTZwi7pgdW4kcymiRe8mioi2c9oZxi4yZqc7wiGURAb05frPJ
	A6uPcoFDFJ+VN1pU2sNfdDzfCo7oT0GpOE/bYNagA/A+af8Iopdb6wI9725woRy7YpcAkkfrfHR
	aOQ2YfYzy0pcGbRmpVC11hc5sxNRgtjjcJOTqfSkI5d6LTu/bsHQ2Q6djvxgmfrdd8hg/FEPO/3
	udi+q0t7d06Bwxdnu7/w/e4v4H1vOyfJcQXXw8UFkpPST+pwhtY1llc/4BEwWjj0BnKRt87ZzRK
	mpgzHyC5ZlAlCZYUVS3qZO83fQAQsZYLyDqm5821KkhaQlw3v2Bc4AV14/4pUrR98B5K1dvYMyH
	I2VfZZgUqFKoqLKRiH8Z4VXw9jT8wj1r5s1VQOqddv6XIhrzM4aTMvvOyjU14VtYaE6TyC6A==
X-Google-Smtp-Source: AGHT+IEOHOQoDPWM/XZQBfXXst8+83rwDz6NjfXLVy4d5VP6h9R+W+Z5jAABDa7tDFwF/394YtVJFg==
X-Received: by 2002:a05:600c:3b95:b0:455:bd8a:7e7 with SMTP id 5b1f17b1804b1-45b5179ce2fmr36504465e9.9.1755894935129;
        Fri, 22 Aug 2025 13:35:35 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f4c:4200:c3d:b19b:1c2c:62a3? (p200300ea8f4c42000c3db19b1c2c62a3.dip0.t-ipconnect.de. [2003:ea:8f4c:4200:c3d:b19b:1c2c:62a3])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b57498b37sm12110275e9.23.2025.08.22.13.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 13:35:34 -0700 (PDT)
Message-ID: <762700e5-a0b1-41af-aa03-929822a39475@gmail.com>
Date: Fri, 22 Aug 2025 22:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: phy: fixed: let fixed_phy_add always use addr 0
 and remove return value
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Lunn
 <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We have only two users of fixed_phy_add(), both use address 0 and
ignore the return value. So simplify fixed_phy_add() accordingly.

Whilst at it, constify the fixed_phy_status configs.

Note:
fixed_phy_add() is a legacy function which shouldn't be used in new
code, as it's use may be problematic:
- No check whether a fixed phy exists already at the given address
- If fixed_phy_register() is called afterwards by any other driver,
  then it will also use phy_addr 0, because fixed_phy_add() ignores
  the ida which manages address assignment
Drivers using a fixed phy created by fixed_phy_add() in platform code,
should dynamically create a fixed phy with fixed_phy_register()
instead.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c  | 4 ++--
 arch/mips/bcm47xx/setup.c   | 4 ++--
 drivers/net/phy/fixed_phy.c | 4 ++--
 include/linux/phy_fixed.h   | 8 ++------
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 5b70dfdab..918e2a323 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -108,7 +108,7 @@ void __init config_BSP(char *commandp, int size)
  * an ethernet switch. In this case we need to use the fixed phy type,
  * and we need to declare it early in boot.
  */
-static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
+static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
 	.link	= 1,
 	.speed	= 100,
 	.duplex	= 0,
@@ -119,7 +119,7 @@ static struct fixed_phy_status nettel_fixed_phy_status __initdata = {
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(0, &nettel_fixed_phy_status);
+	fixed_phy_add(&nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index de426a474..a93a4266d 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -256,7 +256,7 @@ static int __init bcm47xx_cpu_fixes(void)
 }
 arch_initcall(bcm47xx_cpu_fixes);
 
-static struct fixed_phy_status bcm47xx_fixed_phy_status __initdata = {
+static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
 	.link	= 1,
 	.speed	= SPEED_100,
 	.duplex	= DUPLEX_FULL,
@@ -282,7 +282,7 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(0, &bcm47xx_fixed_phy_status);
+	fixed_phy_add(&bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
diff --git a/drivers/net/phy/fixed_phy.c b/drivers/net/phy/fixed_phy.c
index 7902b35c5..b39532abf 100644
--- a/drivers/net/phy/fixed_phy.c
+++ b/drivers/net/phy/fixed_phy.c
@@ -153,9 +153,9 @@ static int fixed_phy_add_gpiod(unsigned int irq, int phy_addr,
 	return 0;
 }
 
-int fixed_phy_add(int phy_addr, const struct fixed_phy_status *status)
+void fixed_phy_add(const struct fixed_phy_status *status)
 {
-	return fixed_phy_add_gpiod(PHY_POLL, phy_addr, status, NULL);
+	fixed_phy_add_gpiod(PHY_POLL, 0, status, NULL);
 }
 EXPORT_SYMBOL_GPL(fixed_phy_add);
 
diff --git a/include/linux/phy_fixed.h b/include/linux/phy_fixed.h
index 5399b9e41..6227a1bde 100644
--- a/include/linux/phy_fixed.h
+++ b/include/linux/phy_fixed.h
@@ -17,7 +17,7 @@ struct net_device;
 
 #if IS_ENABLED(CONFIG_FIXED_PHY)
 extern int fixed_phy_change_carrier(struct net_device *dev, bool new_carrier);
-int fixed_phy_add(int phy_id, const struct fixed_phy_status *status);
+void fixed_phy_add(const struct fixed_phy_status *status);
 struct phy_device *fixed_phy_register(const struct fixed_phy_status *status,
 				      struct device_node *np);
 
@@ -26,11 +26,7 @@ extern int fixed_phy_set_link_update(struct phy_device *phydev,
 			int (*link_update)(struct net_device *,
 					   struct fixed_phy_status *));
 #else
-static inline int fixed_phy_add(int phy_id,
-				const struct fixed_phy_status *status)
-{
-	return -ENODEV;
-}
+static inline void fixed_phy_add(const struct fixed_phy_status *status) {}
 static inline struct phy_device *
 fixed_phy_register(const struct fixed_phy_status *status,
 		   struct device_node *np)
-- 
2.50.1

