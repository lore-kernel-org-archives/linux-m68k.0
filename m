Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E58C3D1CAE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600416; cv=none; b=LWn4ZqPO3AAoew/kxv55hJ7fvKj8BkagWNMx2xIi9V7Fc4uBrmirXlrHMdDyxn1qET+zDXruNraDS9222qXE6b8TDPEWyJVfYhJMcnX2HzVGWHPuUEErpYhmEXJ91xRrb497J3nuFWtw1pfXlsagP9sezrLCptGgqCwRzEGXryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600416; c=relaxed/simple;
	bh=l/HPGKTm7HZ1KJE7OckzDeL7ku9p0tV9zaTdTNuKpKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgbUr6sddHqomNmT0TbI7Ow6IdAtdeYqWEVeL6WOmt48PSZ0j1cY3ox15BUEzAqdU/Es9MYsVb8YsfF60uz5T9r9Pjb6QaU15dGkLkoYhmx8v4txnNmSP1PlWEcUk0jE+qh68ZOp8iUkJYmzzgpEJ+HfwS1chDp1lcju1OiMKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0455A40817;
	Mon, 28 Sep 2026 13:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224A01F00893;
	Mon, 28 Sep 2026 13:00:09 +0000 (UTC)
Message-ID: <b9a686cf-0d28-4feb-b971-f1bf2264964f@linux-m68k.org>
Date: Mon, 28 Sep 2026 22:59:52 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com,
 imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net,
 linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
References: <20260907134037.1855408-1-gerg@linux-m68k.org>
 <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org>
 <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org>
 <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 24/9/26 00:15, Andrew Lunn wrote:
>> The driver will always need to support big and little endian hardware, so I
>> am not sure how to avoid some abstraction like this.
> 
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

There is regmap, but that is way more than just access macros.
At least one driver shared across big and little endian architectures
does use that - the freescale dspi driver (drivers/spi/spi-fsl-dspi.c).
There is probably others.

If the issue is more to do with code churn then a simpler approach here
might be to just essentially keep the same work around but move it locally
into fec.h. Something like the patch below.

This could be cleaned up to use ioread32be()/iowrite32be() after the final
readl()/writel() changes have been applied.

Regards
Greg



diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 7176803146f3..317e4e44d313 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -701,5 +701,16 @@ int fec_ptp_set(struct net_device *ndev, struct kernel_hwtstamp_config *config,
 		struct netlink_ext_ack *extack);
 void fec_ptp_get(struct net_device *ndev, struct kernel_hwtstamp_config *config);
 
+/*
+ * ColdFire SoC peripheral blocks are big-endian, so use the raw IO access
+ * functions for them to access in correct byte order.
+ */
+#ifdef CONFIG_COLDFIRE
+#undef readl
+#define readl __raw_readl
+#undef writel
+#define writel __raw_writel
+#endif
+
 /****************************************************************************/
 #endif /* FEC_H */
