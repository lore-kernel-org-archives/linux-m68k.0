Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193007;
	b=eGJrrPCUbxbukV+/AjL1JR+draWKLdhIZU9FmzChHA6xs2twHYkCSa/bCIaVHmnXL6Hh
	 yw0fjEYby+sbRaGBTMs+EJttUqcrzwil5JaelOU+RRguxp67/rfqeE5zrK4erF5XrsOm0
	 17Q1GCPmSLaIHkNisuag5GY/jbulI4k0Yw1x8venoo8Lq+7vXpnyCy4nATfkBnjsXAAYF
	 MmUV5spJs41/1UjvkQfQFE4WDss/I0Xr8yXl0n3kr/RgwNUA63lE6kxroz4hEg9l/hNhM
	 d2HNf0y1suRS0cKEgJnANc9l3bu+trB58IGrSAnTaJpkP0Cd90qI3mNw6zTOmt6beuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EBkiqUUdh/y0Dl1qxnhAaecylqgVBg7HXrokp1VAnJY=;
	b=q+F+kocAWeImLJysePxAF0cYeYm4BRfMoyF6tkl5L2sCsVIWgmXAJYtKWBibEjYLqAjP
	 tujXjP7t6bZIfcporE6CRZRzIoiQIEcInztfyoHASQA1rG0Smr+SHHsrOvWqfllS3Bl6p
	 WuFV2eB+ndL+rhC4z2zJEclmeCA47dJC0FQSVOkcDs/EaKY+qLEUt/S/bSeq1mKk7jpgV
	 a1OmQBd1ASw2uI79NUFNgtUWHNAn59Aiigd+q110mYNHufYj+MTAD2o+aRPhtkHQ+moki
	 uJVdGgwsmXIxqhQZBBrMMKGowf5aVkYIl5HpdP6y3gS552BNDq2etx6LcP3JQvZo6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLvJq3i6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B434606A32C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2026 16:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B434606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLvJq3i6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10315685e9.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2026 08:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795193004; x=1795797804; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBkiqUUdh/y0Dl1qxnhAaecylqgVBg7HXrokp1VAnJY=;
        b=cLvJq3i6CRZdkAK2lOnv9nn/HIlXo/NeynktScEfZtLyZIWhIGu3j1+Bx3zAUf0FJC
         8SqJgE9bmcMwDJUHKxB2v0LK+V2GMeiCb/8Fsb4vwFz9h5/TjlwyobNm0gMC5QzgcExc
         mfctDFcPTZpUXUUMXHYxgKio6x24jAolzhh/qvczvBbb88CW79di9hIzAp1Hupaf0Vl3
         RiZ3jSI1jqsxLgYaMLBfAGGS+c54HSHfj9zjcGFszKjgjSWp4kE/jqMVq12cwssYhWB3
         Zj4BQK9pzlfYkQO79wN7fq1GNWsUqbbmmRTTAinUNrAlDeMVQ1HmeH5Xx/ZU/dxoheDo
         Ftmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193004; x=1795797804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBkiqUUdh/y0Dl1qxnhAaecylqgVBg7HXrokp1VAnJY=;
        b=PFvqJdwFmsCytSSZ4mfT6WzvBA01mwQOrQtbjvvlZYVLMwtZynFv0zZntQFVlUwoTy
         o4No6bXhxVKzuTMtHuYsG5l8WXv0QrPKyfxkfTVMdqzRc3DNGUseItjmIA+grgn+xLwZ
         FbGWzwR58wGBv2gcILFWU1jH5nxpBHCgc+Q9EmJi5Uyb62vAHaZMgfbbkc5uvVqEJ6Nm
         2+HkYtjE3VffiocBUnUP3RDKoE6y97mURqSkbZX2BfY2APkW0hKOzVoI8W7YbFRg6C5e
         6/+mbE47rDT3mILaQIBtNzCrumHgM9oDl440nnz3SqllM1De9bdHBhlGyTFL2mKl+2Mo
         QnOA==
X-Forwarded-Encrypted: i=1; AL+hErFAnScAH3EunqTHnlpvwAmsF7AoWaeDBtE7IccAL6I8wN+PjsJSTVCW1lP5FEmB44YpFd6XkZzW4nTX@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z97wRdEJNjIvo2alIqMDqYsVA+Q/tILebZvF/4n1asHMLWaCl8G
	0GDmindm4tifQsNWQsHkEhFWFSZqCUsQXB/xlzrRD/rm2P6bWtOfkU2z
X-Gm-Gg: AYBFou2+fzY6gS5uVKxdP2meA0w7b4YdS2jNecbtU5U+PZ9rO8odc7b1fRZNL0GPLc5
	VnRy9MgqfMFhz1Jz6Vs+8d8tVA/8ya5n6D6mv9/VRx2q658yHoJAcWLpk5uaDrbBZNzcq+bqod2
	wc7iQz6qDgZBgXNLu0TGbBkUMTNp9TRRDLKZyIMoeQbqFEmKjMAjmf7+cg4yQETfEX/H2ZoN5tI
	clsEOFnqBEa2aOifnxmXHWcgGYDk/vxBzCIKTsWh2xzcVE93KOAjQXUBEp2mGE4VZ7uduGpva3g
	IylQomwtyH2tAcW2RT3EgCbDrk2pPrAcllNvkA7jkoMnRSXyEQYW4XrnJJzskI6UGptibbl2ope
	mxzAd1g/DYN+QHKNfBnui9ysf40Kl9hBUp/wiCiMrdfusAHTBtZSZ1gTmPtNtdQ7A5LzCpBsW+a
	5FJPLuYHWdox/rBX75zM1qSZWhM7hojgxA5p+KTwWUpvAhulEU4uQ3z2xk49Ethhn242xtbqli7
	qTTgN40S4kw7H2qnToGjHUTxhEyZ1OJF5KCVBRjtcBnpjTI54rJ8FR5i+xKxu3AE3d+RtQek3P0
	HnsXo37OnDJiYdBWRk0Hp621L9uW+bRIsRoIL/BxVWK8ue4iyd96rX+o8TcJwQ0ASoeJOFctZ0y
	Ef89q3dc=
X-Received: by 2002:a05:600c:530e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb887fe8f1mr85315575e9.10.1795193003759;
        Fri, 20 Nov 2026 08:43:23 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm86679555e9.9.2026.11.20.08.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:43:23 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: delay: Fix rounding of short udelay() and ndelay()
Date: Fri, 20 Nov 2026 16:43:22 +0000
Message-ID: <20261120164322.1034075-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5783b448-b34a-58a5-0bc0-98b1a806f182@linux-m68k.org>
References: <5783b448-b34a-58a5-0bc0-98b1a806f182@linux-m68k.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Finn,

Thanks for running it again, and with both interrupt settings.

> test_ndelay(40)	 191E-09 -> 17.0E-09

I think this one has wrapped the timer as well. 400000 calls only fit
in T2's 83.7 ms if each takes less than 209 ns, and 17 ns is less than
one clock on the LC040. With one wrap it would be 226 ns, which is
longer than before, as ndelay(400) now is. 40000 calls should show it.

> test_ndelay(40000) 38.7E-06 -> 46.5E-06
> test_ndelay(400000) 366E-06 -> 456E-06

These show a real problem with the patch: long ndelay()s now run about
15% long. The 5 I took from x86 is 2^32 / 10^9 rounded up, but
2^32 / 10^9 is 4.295, so every ndelay() asks for 16.4% more loops than
it should. Combined with your udelay(1000) of 979 us (2% short), that
predicts 453 us for ndelay(400000), and you measured 456 us. The old
code was short instead, from rounding loops_per_jiffy down to a
multiple of 2048.

I can't explain the old ndelay(4000) of 6.03 us without knowing
loops_per_jiffy. What does your machine calibrate to?

I can see three ways to go, and I'd like to know which you and Geert
would prefer:

1. Keep 5, as x86 does. Delays are never short, but up to 16% long.

2. Use a closer constant, e.g. __xdelay(nsec * 4 + ((nsec * 1209) >> 12)),
   which is 4.29517, within 0.005% of 2^32 / 10^9 and still never
   short. It costs another multiply and a shift on every call, and the
   second term overflows for delays above 3.5 ms, which ndelay() should
   not be asked for anyway.

3. Leave ndelay() as it is and fix only udelay().

Option 2 seems the most accurate, but ndelay() is mostly used for short
delays, and for those the call overhead you measured matters more than
the constant.

Graeme
