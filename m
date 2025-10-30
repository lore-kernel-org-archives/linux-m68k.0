Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EA434D38B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860614; cv=none; b=lzTyKRlxVUO+NcNkwengf+DKNk/QFimItLslvZruLZ0uQggTZJUA71bDaEHXONNGgY9hwO9+LHG/jknEz0tFeLx926NR6mQ/a6WH+0rsTaCtKir8UWAWS4RlVSYAJnTDYysGRp1ImGhWmLd+rFzCDtUhWWIBxOn2teWAjJPdJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860614; c=relaxed/simple;
	bh=726SBCQ2p6EtS2laU45uEz8m/+eOynHeRtx/IHLwsK4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mgr/LzncdAEB0+z6645DOt0BoAWYjsio2+pCjEn3A9cTqfVjQ58F8uRMtEkqBhf7kiqvGpsp9wIrAiQm6+2PzDPvbyy1tu/JOoC8uuxeB/0l3SO2AsDUZ5oXDk+nZfD/WJSHMlFYWU+8u3QTeqtQqcKSZbk6TVq7iyfcO9QBvIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IppR931n; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IppR931n"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c12ff0c5eso3727945a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Oct 2025 14:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860611; x=1762465411; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=IppR931nCXtpwbY3h+FSw/ezYQXKuuk/CMX9vmKo1kCYo46JCiaHLLfAOq6Z5Pb4AD
         dEd2burdcogjtcq02fdGQQWP3D254mzTKdzYaF/kHse8q4xsvXLWBIoSb4ZLbifH/0YK
         nYN5SkYBZ7RXKRqiIM3CrKxWPWE/dfnQtBlC6ocyBiX8mvw+9C0/JlXhEvyWeD4MpRO/
         OcFteqY3sUrQvcC0V/OBXRzcGebqlqA5KH4OUx5eKjyOTn5n838s7w087yN8aYedqczK
         su9hotNdHTnE8fHejlp/u9VVlnyXCi/aiOEsiiP4ooBUqHrGyb8qPx+5ww5RGYSiVCAe
         ou+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860611; x=1762465411;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8AQa1wMUOcSt+/a7sUYtl8GxEW4QEfEGayOfnmqow=;
        b=xCFGcFAe0Y+qhRwFHQS7QhU8EfUrReHd2lawrgd5FLtFZbpS2g3tLQAceMFFaDcnys
         lwdo7wspnrQkBCMG8gH0H7z5el8VcNvhl7GebBGdSDtxweDP6+p64EtWK37dqBC02Amc
         l51/NYpmvhofmdWGqjko+Wm6qxArOQKcJGaDRRyYghoByW7nX4Fku0GFC8GDMVLa3Ehq
         49GJ8XxgP6qo4nNNGgVjQUmPUGVTNIHrxlFK4SH07rdd2wr3zmyKxptziAaDtB9psn9Y
         jfw2f3LqGE0pDX0AaELswOpXs8sueZy+hu0b6qwoqy6uJ/Gk3qfwu0ejiFgMuDS5eKLV
         /mJw==
X-Gm-Message-State: AOJu0YwZ+K4Nc7E5C/RNdpvzKB1e5E46TLQmXJr0GMeXAUY3u6QH3Owy
	ERwidWIvbruRmO/0E3xM3CPaLsSkhaUNJlqFdTvr4jPM0fTfTwXRKrlf
X-Gm-Gg: ASbGncvftoC9am3pz/LC0voLlgiHx13Ty5St3ZkUpc3C7cNOP80eXeAO5gXcr0J1fKr
	sfJHIsLrkYq6OeGR7BdGYyN96oqHuSttmIzeO1mQmttV8zDWfszVgrSX0TUXXOQPBV1xEf+Ea7N
	ZLHcsrD5bfJEn3eq1Z5XxBR1wB8/wkrQrV9cZ4QucM7E3wyIC0jH7IwLEzHKCzAe5BoBrAKc+6h
	tVMfnQAG5D2w4q60gCxMTjRNK+0DRhA/9sSCpH5cEFdnaA47GQsBzX42Fa9+n4Vc6fX0+TyxiVE
	azStGTdjZbI5URYDVFlneqLpCal/ig+OnQkHtuhNzQoV6ZmspdfsY2m6fH9jjEaDLhA0FXMgMdx
	XChBHYh02zlELTzaLwT90fPuK7R+zCPiQAPH3JOHisYNH2w8sKgFsnzOtOJ1rFxxGidMT8GJLYY
	9fJOLuk6n/8e6YH+ZFye1BS8rVBz7UH8ZL9ObXJsOl04rCgMpk+3alatEHQYne8+yQ82J/B1cgD
	F2kpRKTZKTaIy2V3Gx6FNyXaXWG1x/LZNNoUTPUJss=
X-Google-Smtp-Source: AGHT+IFin9LuBkbb0AYlwQbtnRdbrtyDgRJm0skxN5mswL3VB45tj8ToOhRdUQJToapuvAyVdWHmfg==
X-Received: by 2002:aa7:cb83:0:b0:634:bff4:524c with SMTP id 4fb4d7f45d1cf-6405efcc89dmr3248794a12.9.1761860610802;
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a03asm14294a12.3.2025.10.30.14.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:43:30 -0700 (PDT)
Message-ID: <212e0cb5-a2f5-460f-8e03-3c3369d0acf1@gmail.com>
Date: Thu, 30 Oct 2025 22:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/6] m68k: coldfire: remove creating a fixed phy
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

Now that the fec ethernet driver creates a fixed phy if needed,
we can remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/m68k/coldfire/m5272.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 918e2a323..28b3ffa25 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/phy.h>
-#include <linux/phy_fixed.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
@@ -103,23 +102,9 @@ void __init config_BSP(char *commandp, int size)
 
 /***************************************************************************/
 
-/*
- * Some 5272 based boards have the FEC ethernet directly connected to
- * an ethernet switch. In this case we need to use the fixed phy type,
- * and we need to declare it early in boot.
- */
-static const struct fixed_phy_status nettel_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= 100,
-	.duplex	= 0,
-};
-
-/***************************************************************************/
-
 static int __init init_BSP(void)
 {
 	m5272_uarts_init();
-	fixed_phy_add(&nettel_fixed_phy_status);
 	clkdev_add_table(m5272_clk_lookup, ARRAY_SIZE(m5272_clk_lookup));
 	return 0;
 }
-- 
2.51.1


