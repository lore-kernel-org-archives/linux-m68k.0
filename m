Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F1B2BDC25
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Nov 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155378; cv=none; b=Q0dtcLdwJjS8Fw6KUlt02qnD5ZGKNl3CdXhdw0AfZRKJB7gN3kQ2VDGZ9ZXKsvwQLtYPPXSPMhpuMiEA/8R4CpmAD4Dlnp6H4JVqVMDj4Jz4kbPfC/Vx7Wa2P0pXUAh7qjxNJDpcPwIFxgj3y1EgBgzChq5+eYwk3J98jBWyaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155378; c=relaxed/simple;
	bh=KImMfOPBHJxMvj6GnbGXjOLE3ksMhUz7hd07AjPOnlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTtIP01CSrBGLI+pdc4H22E7BPBl330uxaOln/gBk4UWSvTBAof1AnG8PBWvsR94u6d11OoUcDykKsMsEBwtjn1xM0QxKDY7mN1bIOoyzRSU2pglF8IiaFXhtP7iL1mXc4IpxYD11wA48JCOb8EvtuyORJL5W5cNEpyPtSB79uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCnd3paw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCnd3paw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c19b5de4so2089916f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 02 Nov 2025 23:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762155373; x=1762760173; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=CCnd3pawRQ49mNwYyh9TUl5hB+Dgxj5j8TlkdWAHm0XeV5/qlBYqoeFzAUPGSFVpaf
         9lJ321d3m05RqHEmkxiATBLnuunnvxplqReK0QLK+OiPVoRkb6s6BWHPZqE0Lz12X6mO
         wPB7aTd4+ZdCmcQhxo15JiMvMbQvsEsGCNzXrseb47hKRdQ9RgPvf7ohJH4uoiAM2h7K
         FWKU0DIpaciZy4KEoRHmztyXD6YgXIMd4jhg+DSQJrc7MEqD+QVeKSqEIpvPg/U+lnKk
         BOhvDAzwd69s8xrGPtfqXOltDWW0+qocuVDuuyzCf8MZyRt+JV8Xt3FEmkj28vM9I4mA
         uynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762155374; x=1762760174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy242WDGUqoE91x1eR+As3xqC/KmA/wU0RO3gRLGjUI=;
        b=KuwPpTyTJLkZ3VfLPS7tbTYiGC75DOIDJiWs4JJTnUX1RkyMW81IeSehi+NJFbsC0o
         BIcp4o770bNWFnfWQ/hAZIPqL9Sisrkuq2r+rGPVq1KQBwa1Bsj4UXWhx0LhTl6PWo9n
         1ldnTg/yDEaH6d9kGpbigOUf0WyITMqp3vqsqdjzc5d0cSul2NpeUv/+WkYs7qg09ub1
         81vyc9UIz/ezTyGLXvxisP5vZFdfnQIynyEEwNWNC1Q2OvNSW75GRc4QX5mYYoF2RDQt
         ynOZ+StvFyQKl4SVxibAs0NYDA6CyVYzNbkC4hyJSDxRSTICnRX3YklR5351+7mpEovz
         ZrtA==
X-Gm-Message-State: AOJu0YxgvVwcR91G6heOtqnrkL6fJU0tnEdjTz2PDkmxSY8k6rBNdbdL
	3vOsdPtcg3OrjUBUSOy5GJExVY8nV4E5WXPGUYOST/iug5hk5dultRtO
X-Gm-Gg: ASbGncu6NeCbWf0yyTqXCmhetAlkd9IHCXOpeukQgL0z3wZUFmhzujWREbJSNyHX456
	QwjVHJl4ARnBPNG5hyOpPIWSWhRcSPoQI7AR1Lo1pdCXWj1dH8jEcrkdG68QWbsQSI5v9zkuE27
	c5iAfAiQgKxsunD9+DjlUdiX72NK81rcmp3YAGM92rMGGb/PyjVtH6PfsMPE8u9nWa7iC3hmB4g
	vC1IJPznRqIc6f+ezTaYyuW8v5H7eUVAwXC1zy9jmMS57KhpNovsTGBr2ddr2fBWZcIKHzpXtQY
	xNOplO30pgnjRWLMtx8Upkoce+5QsxvWHAMskZKgREuulyg4/f+OGr06bd1TLVI+GWXIqDeXO3d
	5QTCVbMrf/htlq5eqg9cukNZ55txiCujme+p0sZHdCYuevl4BYSwO/gj3nZfswMElD21+Y5M+Zk
	IX8ALNMdG6CEjPLTzufWxwLhTWzomzeRTnnholLTC7jkhG5ATx5z4ihpdUTTJV6REZyOgvTHA+O
	cV+30Hlw0f6bpt2Url3BE9lYWDzdd7XcSSEVVOl/n2jteY063iTbw==
X-Google-Smtp-Source: AGHT+IGVnLrE9OIWhpiHYyEFkXyZRArW2hWys6rXTWz6yN6lGED8eruKLvg3nkjVzrRE8Fc1QB6LXA==
X-Received: by 2002:a5d:5d89:0:b0:429:8a71:d57 with SMTP id ffacd0b85a97d-429bd688474mr9767699f8f.27.1762155373261;
        Sun, 02 Nov 2025 23:36:13 -0800 (PST)
Received: from ?IPV6:2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3? (p200300ea8f0db700d90a9c99d3d533f3.dip0.t-ipconnect.de. [2003:ea:8f0d:b700:d90a:9c99:d3d5:33f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429d1061e42sm6679455f8f.37.2025.11.02.23.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 23:36:12 -0800 (PST)
Message-ID: <fe2e1f1f-3d34-441b-ab97-cb39c10225a9@gmail.com>
Date: Mon, 3 Nov 2025 08:36:12 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
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
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <7a495800-a639-4356-bc23-1134280c350c@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/3/2025 4:15 AM, Greg Ungerer wrote:
> Hi Heiner,
> 
> On 31/10/25 07:42, Heiner Kallweit wrote:
>> In case of coldfire/5272 a fixed phy is used, which so far is created
>> by platform code, using fixed_phy_add(). This function has a number of
>> problems, therefore create a potentially needed fixed phy here, using
>> fixed_phy_register_100fd.
>>
>> Note 1: This includes a small functional change, as coldfire/5272
>> created a fixed phy in half-duplex mode. Likely this was by mistake,
>> because the fec MAC is 100FD-capable, and connection is to a switch.
>>
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
>> Due to lack of hardware, this is compile-tested only.
> 
> I did not get net-next and try this all out, but it doesn't compile when
> applied to 6.18-rc4.
> 
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/net/ethernet/freescale/Kconfig    |  1 +
>>   drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
>>   2 files changed, 27 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
>> index bbef47c34..e2a591cf9 100644
>> --- a/drivers/net/ethernet/freescale/Kconfig
>> +++ b/drivers/net/ethernet/freescale/Kconfig
>> @@ -28,6 +28,7 @@ config FEC
>>       depends on PTP_1588_CLOCK_OPTIONAL
>>       select CRC32
>>       select PHYLIB
>> +    select FIXED_PHY if M5272
> 
> Does it make sense to limit this to 5272 only here?
> I get that this most closely keeps functionality same as before.
> 
On DT-based systems FIXED_PHY is selected by OF_MDIO.
For non-DT systems I limited this to M5272, because it provides the
same functionality as before, and reduces object code size a little
on other platforms due to using fixed_phy function stubs.

> Regards
> Greg
> 
> 
> 
>>       select PAGE_POOL
>>       imply PAGE_POOL_STATS
>>       imply NET_SELFTESTS
>> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
>> index c60ed8bac..0b71e4c15 100644
>> --- a/drivers/net/ethernet/freescale/fec_main.c
>> +++ b/drivers/net/ethernet/freescale/fec_main.c
>> @@ -52,6 +52,7 @@
>>   #include <linux/of_net.h>
>>   #include <linux/phy.h>
>>   #include <linux/pinctrl/consumer.h>
>> +#include <linux/phy_fixed.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/prefetch.h>
>> @@ -2476,11 +2477,8 @@ static int fec_enet_parse_rgmii_delay(struct fec_enet_private *fep,
>>   static int fec_enet_mii_probe(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> -    struct phy_device *phy_dev = NULL;
>> -    char mdio_bus_id[MII_BUS_ID_SIZE];
>> -    char phy_name[MII_BUS_ID_SIZE + 3];
>> -    int phy_id;
>> -    int dev_id = fep->dev_id;
>> +    struct phy_device *phy_dev;
>> +    int ret;
>>         if (fep->phy_node) {
>>           phy_dev = of_phy_connect(ndev, fep->phy_node,
>> @@ -2492,30 +2490,28 @@ static int fec_enet_mii_probe(struct net_device *ndev)
>>           }
>>       } else {
>>           /* check for attached phy */
>> -        for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
>> -            if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
>> -                continue;
>> -            if (dev_id--)
>> -                continue;
>> -            strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
>> -            break;
>> -        }
>> +        phy_dev = phy_find_first(fep->mii_bus);
>> +        if (fep->dev_id && phy_dev)
>> +            phy_dev = phy_find_next(fep->mii_bus, phy_dev);
>>   -        if (phy_id >= PHY_MAX_ADDR) {
>> +        if (!phy_dev) {
>>               netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
>> -            strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
>> -            phy_id = 0;
>> +            phy_dev = fixed_phy_register_100fd();
>> +            if (IS_ERR(phy_dev)) {
>> +                netdev_err(ndev, "could not register fixed PHY\n");
>> +                return PTR_ERR(phy_dev);
>> +            }
>>           }
>>   -        snprintf(phy_name, sizeof(phy_name),
>> -             PHY_ID_FMT, mdio_bus_id, phy_id);
>> -        phy_dev = phy_connect(ndev, phy_name, &fec_enet_adjust_link,
>> -                      fep->phy_interface);
>> -    }
>> +        ret = phy_connect_direct(ndev, phy_dev, &fec_enet_adjust_link,
>> +                     fep->phy_interface);
>> +        if (ret) {
>> +            if (phy_is_pseudo_fixed_link(phy_dev))
>> +                fixed_phy_unregister(phy_dev);
>> +            netdev_err(ndev, "could not attach to PHY\n");
>> +            return ret;
>> +        }
>>   -    if (IS_ERR(phy_dev)) {
>> -        netdev_err(ndev, "could not attach to PHY\n");
>> -        return PTR_ERR(phy_dev);
>>       }
>>         /* mask with MAC supported features */
>> @@ -3622,8 +3618,9 @@ static int
>>   fec_enet_close(struct net_device *ndev)
>>   {
>>       struct fec_enet_private *fep = netdev_priv(ndev);
>> +    struct phy_device *phy_dev = ndev->phydev;
>>   -    phy_stop(ndev->phydev);
>> +    phy_stop(phy_dev);
>>         if (netif_device_present(ndev)) {
>>           napi_disable(&fep->napi);
>> @@ -3631,7 +3628,10 @@ fec_enet_close(struct net_device *ndev)
>>           fec_stop(ndev);
>>       }
>>   -    phy_disconnect(ndev->phydev);
>> +    phy_disconnect(phy_dev);
>> +
>> +    if (!fep->phy_node && phy_is_pseudo_fixed_link(phy_dev))
>> +        fixed_phy_unregister(phy_dev);
>>         if (fep->quirks & FEC_QUIRK_ERR006687)
>>           imx6q_cpuidle_fec_irqs_unused();
> 

