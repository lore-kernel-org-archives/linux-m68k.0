Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F18372EC0
	for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jun 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864694; cv=pass; b=rPc7V+kv7BigN1p2I1/p0TlFBkDNnILjpEZt7O1xf6bJVdmjCSeIkecYgJVNjwHvn3cLr5J8DGMLan3jtEfQb0NYnvJdNhad2KEAq2sgSy+1jZGQvjyNCnqehcr6QuvcOyMd5hnh4IrLPlDs/7s3iR007TbQVXFjlFvyN7AvJJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864694; c=relaxed/simple;
	bh=ni/12ceZsW/f1/rf10e0NeNiqZaIvmVbzOgM9UdT9bo=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIl6jXXbJFe1w1TIUpSNkq0IJSSJikYRThn88SajLjBBjBLEx7KFMIcXGxIjLjw2VfYFwvQa/sd2wYvyp81zpP/l4hFWylFezmewRA5gglQZNl15JH8UcgOHDiCmd7Aena2z0hpVJsyTNWWBfwTRQ+0a8qIIgLO8APEtmsYz+FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cNsFQ12M; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cNsFQ12M"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-695f6438518so2538607a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Jun 2026 03:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781864687; cv=none;
        d=google.com; s=arc-20240605;
        b=eI4/vgL08vIS7gwWTQj5dZGZze48AwoepOEBnFYilcKdPaEIkanws9t7bnUwszZ3+b
         ng6857HJwyUYHgsV0UVhS7veYBJhF8oW4mjpv4cp4YGVQpvZgIdyAodnpf3Ge/z3qd8K
         v+Ekd5Ml5OTyD5Fim61m1i7TQyrsDWAEW/ZfGQg+G2W5lE7kRKRibLWjtCuPWLkP8/s4
         4OsqFOcrGMMueb7m0sa+eyJ3nFUXRBuKR2YfKWfEGpAfvfszPqZq6cPaaNi8QHMxZvBY
         sR5Rm0HyM6I+yNJdSc2aD3qkEaza4tCX+jAyeskqApYz8WixNV5KgeqKFqazD8SKU/Xv
         DUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        fh=QLcNAmFqoQDK4/vNYu2Mn/QyYkmay22ec2+KOkFF1ow=;
        b=XwLaeOKx+vGgnY/+oN4vVK6W7gyHtKTLtFCq+2G8irTTjgoXbaX67f4cCvElyS3YMQ
         hGfc9roWt75YIdZAZqwOScs/0pRLlQGw9ONDG3B1sKrqfeY2yqyY/GrhHNieAv2vNKyn
         Knps3mkJ7vq2VnFy2lO8mtVrNRLTNrZTB4uefnES/xYRlO0oOiVCDNsuEPkTT5GycXZ1
         pJVgBzoseiEvL3qUG3hgIJ+vXm26YjayJioOtMtBfoje8pIxlFNeRzLxjgKPdLohePih
         thvNMxgr1sfatCu0CTY+qbXUfxoLXrBQj7M8kgfJqCaVCbiAxw+emBRDdtlzVnxTksca
         ld1w==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781864687; x=1782469487; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        b=cNsFQ12MZ7x0sHdCuBEXnETyugzP/+dWz63GntKGf+8DQEZYU6BauOD2x7mDijJ+n6
         mgiT7j3FtmGMb+nUdDyAJpjyRgO9uIQ5HMVd/sP/NF4GhWvGxo0q1c99Ut6Bt7CXtOSJ
         jv4cPAJhIXveNCWR/JdjyH1Wi0d/1zOlqHWfl0LtNDL8id4XPxOQbpJ8szQVSPqeDUa4
         06pv8KtR4S7bBRfMNHQWfRZFWB6jfNqux8wRLUfZqhnIn7vn2AdsEkkAhHpu8l0+7Pfk
         OP1zkfc4+EfGUZ8AvUbrqyloqHpn0sWwIFP0Ukdlc/sJBph37ezwXV4SMKj/tDRxfwOx
         81Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864687; x=1782469487;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        b=rVgp52K5wp3hOfnws+pBVg99sKwf/Ycug1IJQcNVj5UKSXdf8OIJ5xIlPmVBmEI+hs
         KJTsEPGH52O4YMa7KMTrSFmm8fiKZI386ao3Qgzs0LXj/PLVRBCPmAJ52rKf4rkSlY6i
         ERUIEc9H0UnRySVzhJDfb0gp3N0B27uNgCIxcJ6Q0jBoE/P1kHxNKCKQd26JCir4YJTQ
         rF5VIUpM7SbcaontKVeNL2xiN+PvtCRMItGe8ljUKK0ZZVlNxNFNgCxHUAHT13+sOdZv
         NEzPjiiz46h0/kH5I8M2ffUCrxzkOCRH7GetkeUMA3gxhF8arTCBDlt6H9GPAAHLfY75
         fS5Q==
X-Gm-Message-State: AOJu0YxQdf1MDGFivBHQb4N4YvL7mGNUmVCSgxiXckrXtLyyDJhEBrNa
	wiv3tpXmehGHuGiMI61KtRB6lAn2zblK1SLuQp2byYKL/u8N/xShvNfmBYm98wPLp213aoWNNAV
	GkVOeNmxGWRWLNidN7kenQ2ykXU+Jx43RU3AX35S/ug==
X-Gm-Gg: AfdE7cki3vur3iIwCRtHEmE+JvuNQWDBIV7HxKgTjNLvYYbxtR30y0Mfuyq/b03HID1
	aP/0hL5Pf39vVCsHBdheUURo+gZfCaxLMLZfc7kzSe3aAgeFu9KWblSAlTFERj36bj6ujptRlal
	eeKT14AOQTDFHnga0E+F5QuVpPkjXtjQ843V2985fYKLAK5vR/OtPOHpJsfXu+JZ83ybHnWiTVO
	8iUB6ES4o/zJYqp0h0ITw/Zj2dC4ykRpWGFM870/d4Lb7fK8lpLm33gUIwDQVrnlHUqTzx5ztCq
	sBS3EklFPSS6AxSUNDjwdMu3nQ==
X-Received: by 2002:a17:907:a786:b0:bfe:ed74:526 with SMTP id
 a640c23a62f3a-c09901bd9ddmr153293866b.53.1781864687277; Fri, 19 Jun 2026
 03:24:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:24:46 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:24:46 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260609142139.1563360-1-gerg@linux-m68k.org> <20260609142139.1563360-5-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260609142139.1563360-5-gerg@linux-m68k.org>
Date: Fri, 19 Jun 2026 03:24:46 -0700
X-Gm-Features: AVVi8Cf5uu_-jErGjE81PbtvCv_YT7XlmD0BhPjrXgKYB7qRKbzp8TAf4rZ-9HE
Message-ID: <CALSJ-wBLOaQ69+Hy5sgYoBr=fx654sfcfw7du1O1p89B=1gF0A@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel()
 on ColdFire
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com, 
	imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net, 
	adureghello@baylibre.com, ulfh@kernel.org, linux-mmc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

the driver behaves as before, and it is not using "edma",
but his internal dma interface, no new issues are introduced.

Over testing btw i noticed a possible issue, totally unrelated
with your changes. Will fix it eventually.

Tested-by: Angelo Dureghello <adureghello@baylibre.com>
Acked-by: Angelo Dureghello <adureghello@baylibre.com>

On Wed, Jun 10, 2026 at 12:13:00AM +1000, Greg Ungerer wrote:
> The implementation of the readX() and writeX() family of IO access
> functions is non-standard on ColdFire platforms. They check the supplied
> IO address and will return either big or little endian results based on
> that check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are wrong. This is now in the process of being
> cleaned up and fixed.
>
> Change the use of the readX() and writeX() access functions in this driver
> to use the recently defined specific ColdFire internal SoC hardware IO
> access functions mcf_read8()/mcf_read16()/mcf_read32() and
> mcf_write8()/mcf_write16()/mcf_write32().
>
> There is no functional change to the driver. Though it does have the
> effect of making the IO access slightly more efficient, since there is
> no longer a need to do the address check at every register access.
>
> Acked-by: Angelo Dureghello <adureghello@baylibre.com>
> Tested-by: Angelo Dureghello <adureghello@baylibre.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
> v2: moved from RFC to PATCH
>
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index 375fce5639d7..6853521e8b2c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -55,7 +55,7 @@ static inline void esdhc_clrset_be(struct sdhci_host *host,
>  	if (reg == SDHCI_HOST_CONTROL)
>  		val |= ESDHC_PROCTL_D3CD;
>
> -	writel((readl(base) & ~mask) | val, base);
> +	mcf_write32((mcf_read32(base) & ~mask) | val, base);
>  }
>
>  /*
> @@ -71,7 +71,7 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>  	if (reg == SDHCI_HOST_CONTROL) {
>  		u32 host_ctrl = ESDHC_DEFAULT_HOST_CONTROL;
>  		u8 dma_bits = (val & SDHCI_CTRL_DMA_MASK) >> 3;
> -		u8 tmp = readb(host->ioaddr + SDHCI_HOST_CONTROL + 1);
> +		u8 tmp = mcf_read8(host->ioaddr + SDHCI_HOST_CONTROL + 1);
>
>  		tmp &= ~0x03;
>  		tmp |= dma_bits;
> @@ -82,12 +82,12 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>  		 */
>  		host_ctrl |= val;
>  		host_ctrl |= (dma_bits << 8);
> -		writel(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
> +		mcf_write32(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
>
>  		return;
>  	}
>
> -	writel((readl(base) & mask) | (val << shift), base);
> +	mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
> @@ -110,24 +110,24 @@ static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
>  		 * As for the fsl driver,
>  		 * we have to set the mode in a single write here.
>  		 */
> -		writel(val << 16 | mcf_data->aside,
> +		mcf_write32(val << 16 | mcf_data->aside,
>  		       host->ioaddr + SDHCI_TRANSFER_MODE);
>  		return;
>  	}
>
> -	writel((readl(base) & mask) | (val << shift), base);
> +	mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writel_be(struct sdhci_host *host, u32 val, int reg)
>  {
> -	writel(val, host->ioaddr + reg);
> +	mcf_write32(val, host->ioaddr + reg);
>  }
>
>  static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  {
>  	if (reg == SDHCI_HOST_CONTROL) {
>  		u8 __iomem *base = host->ioaddr + (reg & ~3);
> -		u16 val = readw(base + 2);
> +		u16 val = mcf_read16(base + 2);
>  		u8 dma_bits = (val >> 5) & SDHCI_CTRL_DMA_MASK;
>  		u8 host_ctrl = val & 0xff;
>
> @@ -137,7 +137,7 @@ static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  		return host_ctrl;
>  	}
>
> -	return readb(host->ioaddr + (reg ^ 0x3));
> +	return mcf_read8(host->ioaddr + (reg ^ 0x3));
>  }
>
>  static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
> @@ -149,14 +149,14 @@ static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
>  	if (reg == SDHCI_HOST_VERSION)
>  		reg -= 2;
>
> -	return readw(host->ioaddr + (reg ^ 0x2));
> +	return mcf_read16(host->ioaddr + (reg ^ 0x2));
>  }
>
>  static u32 esdhc_mcf_readl_be(struct sdhci_host *host, int reg)
>  {
>  	u32 val;
>
> -	val = readl(host->ioaddr + reg);
> +	val = mcf_read32(host->ioaddr + reg);
>
>  	/*
>  	 * RM (25.3.9) sd pin clock must never exceed 25Mhz.
> @@ -245,7 +245,7 @@ static void esdhc_mcf_pltfm_set_clock(struct sdhci_host *host,
>  	 * fvco = fsys * outdvi1 + 1
>  	 * fshdc = fvco / outdiv3 + 1
>  	 */
> -	temp = readl(pll_dr);
> +	temp = mcf_read32(pll_dr);
>  	fsys = pltfm_host->clock;
>  	fvco = fsys * ((temp & 0x1f) + 1);
>  	fesdhc = fvco / (((temp >> 10) & 0x1f) + 1);
> --
> 2.54.0
>
