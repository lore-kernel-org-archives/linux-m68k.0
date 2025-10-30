Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6230F534
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860549; cv=none; b=NYLTWJt4bMXMLvPLB3AobZqZME8PqPNrne5qR13T/qhZ3xgsd9p9Sf0VBXPU1kIEGEdhMXwEL8qmJQPGb4Qpk/790wggvEmTyCfNyYU4wwelF1apR0A7OBWETvBZe99DZTC3eYLmvPyYbN2P1QQkLKT0lg8IjpcvyU7RkssImRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860549; c=relaxed/simple;
	bh=TvNDWVdmpvbEbvmft7H46461xn5+3cCucjLuAiYQSuY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GOmAmmQ7Xpiuldr0H2FAXwr2MkDYK4JXDorAkEJ+QEO9weRbReYMOZA82BtldDW8u+HHpcK/ozGwIcKGylFcst6IqrB9Fyud6ckcLn6FwTKwapXtSd7lcoIXQ04Xf4qEKEaGdOKLqkAZFV4mxXM79hldiprpWvwvDGS5MqAfqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkle3CIM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkle3CIM"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d6984a5baso300545666b.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860546; x=1762465346; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjUgQuKKSNZeUncCHSxC9aLRNOsmNXtDbAw5szG7GiA=;
        b=dkle3CIMC7Gg77ZW7Idik49Dw3b0gCWFf7cMe0AEIVPFSxUf6yMw8WRhiLrPwooo7t
         5EJ7O1jszDq3yiQZpAX7178goYcqdi5IkINL/jsTgAHIcCUAGi0xKhz4kknjmMqz69cH
         7r17jjFBq1jcgO821SMNsLKha4E7gmqJUoid+X5GHUm0g5N5nSHRsU/1qhWathWa5wdI
         WRrko/Lo0lVVpvcCXs+zUQPwk+C0n06UpdKE/aT7Kl8soY0PjZAhANrtDBORPBjJ/gsl
         xvf0U6ht1dwGHIjaQ/P5LVPmJQSQdVdySDQg+XrMlJ82oVBt1uHbHv/XWbhNGoWQzEUm
         KVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860546; x=1762465346;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjUgQuKKSNZeUncCHSxC9aLRNOsmNXtDbAw5szG7GiA=;
        b=eKmRWR893fcwkF3T1u1QzMw5sAVcdyZOYykcHjB7+YLjijR7PnmL8bg7AXXmC1gOLb
         BLtv2r/PkQjzZRWPJKP46T7bLchtSkj+dbjJ6MWy7IHBnvZQaIXrR3Vy4U/L3qYnWNHf
         2uDKGa7RoUHqo3ud9NQ0BscTpEjZDSDHqpBggz4JY5HqJOGMfKVHzb0xWSwZfTPEdQrq
         9nLFD+IjwHjBu7uMVF7kKLiq0Tzg/PXwt3x1IGu4rI2eBdIh41iGBnWY4pxFCSKNP8dx
         nknLlzGdmTUvyU5Em0BIShzW/EDdIe3NEsTKy+tWUXr4PCMbkpS7RFQUPJhvZuqzNcx4
         L7sg==
X-Gm-Message-State: AOJu0Yx2pk2l7n7VbhV7/VrQ3t9U3IvEGo3N+IRVXMb/djcdA9h1+EtF
	ECnAlGhV6rQ0UNymllMIM9miRdIE9vT37FpnYPol/4aeXQ9X0fVsRt3c
X-Gm-Gg: ASbGncui/yLRGa5SRLtgWyo8eahm6cDSqoS7vYl5gKsZTBgeBWAoOJYXs+hDnmy7vzD
	3FuD+OhLpGH4VPXipIAN10Udolg5MTMK3Lc1XFy0OC27NGpO61D5l50/t6RlqV97zWTawRwPOXK
	6s9l4hW5W1t4v0yCW/19P0IsZs47nD6Xhf2LFcsf61DwvNKM6n6Eq0TtHaHaJRpJA+81dqGkgkf
	EKiYQa6L3eLPtrnDCh263ltqj/WteBjkWTkQscfD7n4Y2vWL3K9g42bKvtO8yz6xtusNyUiozGt
	tzV1shGhpoFtikbPD28N2BHwtsZFb3VQ4wgrgABgiNfEiclHtt+D4rYBxQHyXyFrHETvv9ddjtG
	uNqT5v3jVnJtu5QU0lrOnpf5agXBKx5QZ1Br3AJxcItgs8HgGlUnpKam2f/N5s6YklEL60Jb31s
	J3KpnpcZTx52FPWIF2kAyaXdSnG20YYhVZ38R2al4vvu56iUSxEifguZu3y0qLk4nfdxk2omdvh
	kxhru0ZohgVn6YToKStKprT24vawAqFMHLY7V7Wz7g=
X-Google-Smtp-Source: AGHT+IERJM08TZ8bXx+ck0uj2d1X7qOQAV88F/tMs34SYSvoPqnMtrIfOQ8jsjc5sU98I59xCP9tTA==
X-Received: by 2002:a17:906:9fc4:b0:b6d:a7ad:2fda with SMTP id a640c23a62f3a-b70700b5861mr123536666b.12.1761860546056;
        Thu, 30 Oct 2025 14:42:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308cc6sm1866709666b.12.2025.10.30.14.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:42:25 -0700 (PDT)
Message-ID: <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
Date: Thu, 30 Oct 2025 22:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In case of coldfire/5272 a fixed phy is used, which so far is created
by platform code, using fixed_phy_add(). This function has a number of
problems, therefore create a potentially needed fixed phy here, using
fixed_phy_register_100fd.

Note 1: This includes a small functional change, as coldfire/5272
created a fixed phy in half-duplex mode. Likely this was by mistake,
because the fec MAC is 100FD-capable, and connection is to a switch.

Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
only be 0 or 1.

Due to lack of hardware, this is compile-tested only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/Kconfig    |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index bbef47c34..e2a591cf9 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -28,6 +28,7 @@ config FEC
 	depends on PTP_1588_CLOCK_OPTIONAL
 	select CRC32
 	select PHYLIB
+	select FIXED_PHY if M5272
 	select PAGE_POOL
 	imply PAGE_POOL_STATS
 	imply NET_SELFTESTS
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index c60ed8bac..0b71e4c15 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -52,6 +52,7 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/phy_fixed.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/prefetch.h>
@@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
 static int fec_enet_mii_probe(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct phy_device *phy_dev = NULL;
-	char mdio_bus_id[MII_BUS_ID_SIZE];
-	char phy_name[MII_BUS_ID_SIZE + 3];
-	int phy_id;
-	int dev_id = fep->dev_id;
+	struct phy_device *phy_dev;
+	int ret;
 
 	if (fep->phy_node) {
 		phy_dev = of_phy_connect(ndev, fep->phy_node,
@@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
 		}
 	} else {
 		/* check for attached phy */
-		for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
-			if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
-				continue;
-			if (dev_id--)
-				continue;
-			strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
-			break;
-		}
+		phy_dev = phy_find_first(fep->mii_bus);
+		if (fep->dev_id && phy_dev)
+			phy_dev = phy_find_next(fep->mii_bus, phy_dev);
 
-		if (phy_id >= PHY_MAX_ADDR) {
+		if (!phy_dev) {
 			netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
-			strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
-			phy_id = 0;
+			phy_dev = fixed_phy_register_100fd();
+			if (IS_ERR(phy_dev)) {
+				netdev_err(ndev, "could not register fixed PHY\n");
+				return PTR_ERR(phy_dev);
+			}
 		}
 
-		snprintf(phy_name, sizeof(phy_name),
-			 PHY_ID_FMT, mdio_bus_id, phy_id);
-		phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
-				      fep->phy_interface);
-	}
+		ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
+					 fep->phy_interface);
+		if (ret) {
+			if (phy_is_pseudo_fixed_link(phy_dev))
+				fixed_phy_unregister(phy_dev);
+			netdev_err(ndev, "could not attach to PHY\n");
+			return ret;
+		}
 
-	if (IS_ERR(phy_dev)) {
-		netdev_err(ndev, "could not attach to PHY\n");
-		return PTR_ERR(phy_dev);
 	}
 
 	/* mask with MAC supported features */
@@ -3622,8 +3618,9 @@ static int
 fec_enet_close(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
+	struct phy_device *phy_dev = ndev->phydev;
 
-	phy_stop(ndev->phydev);
+	phy_stop(phy_dev);
 
 	if (netif_device_present(ndev)) {
 		napi_disable(&fep->napi);
@@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
 		fec_stop(ndev);
 	}
 
-	phy_disconnect(ndev->phydev);
+	phy_disconnect(phy_dev);
+
+	if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
+		fixed_phy_unregister(phy_dev);
 
 	if (fep->quirks & FEC_QUIRK_ERR006687)
 		imx6q_cpuidle_fec_irqs_unused();
-- 
2.51.1


