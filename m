Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726728312D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860729; cv=none; b=bfAopaVVPxMGi5StMgoxJqhkITEe3VTBc2M3jhRITK1zMu7Pmo6RZo4E3Eydv2Gw+gnAvmmxlFTa7UXmGKfFgWfiSqN5iIFuNnnJP1XYnWt/6vyuDgahYV0qb7GVKpZMAiQYBtMSz82sguI2LZJW3P8rwFNuxHleI6iZy34XXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860729; c=relaxed/simple;
	bh=uBkk+tHHrc1rrXHOAF46QAp6kvFsvo1lCdXV+dIoOAg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cIQ6MCkaZ584oSCUfG79PwvnvlOKbTJNJPAFq7bXllv25/NDvVKilNIp7DVSWfe0CwuR2JsbgemnWAJdbylGxDsOtnADYnBffyhCxS0z9vw0x/Ky9wGVcceB+z+z5MJdmwk5MR4E09JRoOJjIfBlwUN4nPAFd8kAJ1eI4zxGZZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhqLzV/3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhqLzV/3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso2782077a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860725; x=1762465525; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=lhqLzV/3ZtRDCCH5vFuCKDau6J1Je5t/a9iv6uEnvXLvBPO1JXoTga7Txk0VWIuGsp
         nIRLEVHYDECFBPAm/Q9/MMTzsMIdrOtURzkiGQAs6FvSnBWorVhiRXrrcf0iIIsapCT9
         iDovkMlNAYcTfa6/IgWDPudFQ7uiIQUgdUFi62TcKW/47+rtLfsRBVRFCKJUJDNXQnOT
         06hrXp2xsO02jahV9tLa3Fu3kMn2vHdiw30YMe0yisMc5+4AIuAEeNel3GsIOe3ENp+J
         uaqFtRSlj3J1N4YF1JSiHnw52+aqy5f9UuHUzJvzLPWE/ntBarkGrNSvVxSrndYjV7Nn
         6EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860725; x=1762465525;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=psGwV2v+1wSBRF1G78ZPIT8xSfroU/opNZyN/utNJ+Pfb9JXcgZXve6vwbFGUnUeEF
         6lDIbQiSRsRkJFZ7cMDVwk7XWqcwH/zScqkuz/GlQhBoKZcUK+BQff9HF4tqSBs7vI0G
         kbef4Ou72ZKlICkGAwWEZSp8AetKNRaQbHLH3U5oFZP2fVutHFFxNEhjJ14JVeDwoZ1h
         0IS8K4XpOIsOXevOLFoI/+UDmaYtmAEqt4Y7D7BXDmwYlJiOqzVIG4txWHpMmgf1Cd+y
         DeSG3u5ubyoloWR+ddf9TBeyWTPVHKCRJbq8f3UVb5CZNDnc98OazJhpNVafXs9AJUqI
         KM1w==
X-Gm-Message-State: AOJu0YyXKaXXiCHhGgX7UMJwxhGOxRAsHRvZzclU1jR/2bWmHHB+3Yu9
	h3Rym8gXdmYMBhsOtXakLmQaQMKhYaoPInK/pWcZPh7QUKS/Z4OYVMvX
X-Gm-Gg: ASbGncupYd774f7/JG9VOtJJUjBZKQuOAuNfNG5Ow/Ghpr/sRi0yfeDd3DpKhDYvDu7
	nsquhyTbOR62uY04gQQOwhHL/UYBSmpIzq0CQNckd1aMrNYwssYjhJwO4StTO9rEji0bPkT2zIc
	GwwqyNcBJo68jSFaoTShhqjA459aTd+RoM5OGac/P1UkSw3zqO8Jb8P7F2S4GSLRUbV/WXNrTBj
	2ye/1eHvoBnn2K5wIiSBP2wFD0Y1LlJprVyLnrzhZyK9TbBg+zJLH7Vn+PE5uwjZz3W/fikT9Ae
	cEVPDah3wTPuyP2ZkqeiEwZSo2cStDUuQ+146u7HgEPXFwOvN/+x7bgvusGFfeXQ81y9dv74xvt
	dgIlj7lK+uGpcK2LYmKv5aoXtY0CjanWdzcQ5LoK+ycxbULIJhA/YpGg7+nQMB6mbjFikpbBltC
	TOSSLjPw734u560d6Il5TPx9VQfu7Or/2N4SGi+dZ0HsRe6egVvkPOhtXV/sNG6ML5rPRcE6aCR
	gzHtuXahY1a1ict7U9TnULZKKv0Jrez0WzpFOHlqNU=
X-Google-Smtp-Source: AGHT+IGhyymQfHr5msGL4ysnrrXsuX5kI/Bs7xqXWjhPsbZ1HNwDrWmnY+RRZo06Z6Ip4+Ixlwd6Nw==
X-Received: by 2002:a05:6402:20d3:10b0:640:6e1e:40a with SMTP id 4fb4d7f45d1cf-64077020c84mr772375a12.25.1761860724741;
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a735sm17978a12.1.2025.10.30.14.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Message-ID: <8983b705-6bca-4728-9283-7aa60f49340f@gmail.com>
Date: Thu, 30 Oct 2025 22:45:30 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/6] MIPS: BCM47XX: remove creating a fixed phy
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

Now that b44 ethernet driver creates a fixed phy if needed, we can
remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/mips/bcm47xx/setup.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index a93a4266d..38ed61b4b 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -256,12 +256,6 @@ static int __init bcm47xx_cpu_fixes(void)
 }
 arch_initcall(bcm47xx_cpu_fixes);
 
-static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= SPEED_100,
-	.duplex	= DUPLEX_FULL,
-};
-
 static int __init bcm47xx_register_bus_complete(void)
 {
 	switch (bcm47xx_bus_type) {
@@ -282,7 +276,6 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(&bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
-- 
2.51.1


