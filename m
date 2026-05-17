Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61465F507
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044441; cv=pass; b=BpizI6rp13+SQ6bc/pZwpmPpMa+FJ47Qnsy+Aw99N56zbaLoTKpdJGRZ6aZR+IUnEF1kXlv96UpaadYKvKf4hnPKEqmogS4LPDXNlyoETNgA8HSCiJAQAhr89j/v0T+UWp/Igi+tam5NSVqpN+E4WfNSu3CsCMkU6BXqXUYmVVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044441; c=relaxed/simple;
	bh=6Pu8ZFw5nRrpXUt8iauCXEouB2tgpYnUpfnYcSMw3nM=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePxZ2ysNSQv7qpd4qdW/6z39aYOyKyiqgFLmFFlKnAmjC2kY4N2AEkpZjuwZh3kK9hAvF1mhj7knox6Q66Dyf7vNDr9qM+dD2lpu36pMAkBOSLElGEYxFD2yoPe8TK9eDxE+YlLVeKRSKNQ+Bi+CgPX8uCIQOG9S7ujHoTxy6UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=0VnyK5yO; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="0VnyK5yO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd5126a5e0fso247429666b.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 12:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779044437; cv=none;
        d=google.com; s=arc-20240605;
        b=l1knNbKALliI7FXZRUbrGxLbAG3APXvQgJJDU2/Qq8iBOeIpPJ1zyf7H5QxA2ou9UH
         lqIQyffVGnAntuwB/tXXnlzUm5K5PsVXzU6YuKbsUBrJWLoucD91FXgVWPbfyLwg4o6B
         IplFMfS9GiGg7q2lFGUqm8cEpuZO2zmTSZHKs3xgrZSyzTcquGjjTcUQYYsS/T3oSQIH
         D/MWRPdDVrSdkgAqNXMKEa/980H9SqtLOYYrvPV6ri7UasWfLmaq+0k5tL52vRnwd4lx
         E+UToP1VHWPpeeUoFohxLyTXgQRcpBQSVMcd67rbF/c+WgYCyleKFiHV7+oiE7c6aZpT
         VViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=1JphhE5f2R3RqqlFjJRdSApyosT8RlyHaJ2EQJNTHbI=;
        fh=0ltLx/nqIXM0y6+/dxLailUHhidtBWyTCbKf/ZC8YHM=;
        b=ecl6PjssqUWf26bOX8QEAbgMcaBjO+1TJTKDtCjH3FE3pX0cwHR6uzyluaQPp2s7TY
         5azjswyE5c5k2uPkjRTO9humLlfn3SrfgfGqGn0emqo8H/MlI/heDz5eINj7HETS9jpI
         KHP6C8615iNm+i7EEn2S4YB/liPP1fmCaTLI6jCgjRMMMm/bwSLs9F62q9Fu9fBqiPu7
         ipLrTBGNBQq6R8KSFbQ8vXjpU+uum/SQafVooWjVXrkNY8sy0ADN8fzq11gKjybkyY5I
         V4LZtr8WzuXiCCxWALHWQoGYg+mL8H6SHIgoExievtT5JvYMvxm8snOLek9qclqJ/iwG
         oOgQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779044437; x=1779649237; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JphhE5f2R3RqqlFjJRdSApyosT8RlyHaJ2EQJNTHbI=;
        b=0VnyK5yOBC9ft+mbamx/Vt85JtzIK66BZ4UalfhfVZ4qhLP9jbJrTXzqnqggL8TTdI
         wIZOY0tiCz0fYUOIatU3Cj53lJhWKJ+DlkuwbSHWLA6WUiSAkhewUYz9xxxakwOKRgtF
         n8nNeO5Bxl1y061fskbyaL4UHbfrcTAWIb3PvlK6L01muOGK5rWCeSGV1yO9SBTMbeXr
         RmudUxi2jADCczyEwADcRA3VAgA1N3NxhaSqs1oP/zIJFrmWeAO+dtMmEDKrcntyiz0F
         a7jXRNHZubSlVUVQUR/jsk8arkp38wkBJXMbBMlhMfAU/W4fdgNi6rUjc7JNSmWNZ/1D
         7YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044437; x=1779649237;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JphhE5f2R3RqqlFjJRdSApyosT8RlyHaJ2EQJNTHbI=;
        b=fm6ckcps7fTNwDu5C6FLRBaFtzFy/Scxa/sud6nG0AQPkMk8KFHyJwZ5AaiKoDctjH
         MGIgfJa4o9rGDvgFjzUJUfp260m47j98BIHR1gJxK97MFeoATDhvbChuUeNBsUk1NqOx
         mvXgch3iIH43ba+EA27hFMogxV3YMHBKYfRdKaVLzdkNoub8NQub6fGbzhR5RC4ZVpp4
         iRKV11slmza9L0fm3u7FZMwiv06wGAVXdbAxOoHfCxLNHJy35CBmNatkFmKddu7Oq+Hd
         BExPjDuOaNnnV9YrmCicMNIGLWMQKP89uHi2hY/CQ+SNXla7HtM9PZdEgNN+4UJBkZQq
         DUUA==
X-Gm-Message-State: AOJu0YwAq+ZEzDKKzcuvFj3o27w8glMqxtFq1WOyB9d0aKDHbcyTM9PQ
	dWhBs37rPpyvx69EBdb7gjge+BKJ7ImwFoYbR+gw3lLnwQe9vZbYFtXPlzHGmvgCfILB3vLIcC8
	2ouVWQanc+xbLtWPxm7g6vvGWl2j7Or3/Fh+CN+rw3Q==
X-Gm-Gg: Acq92OGWObwTXS/poCIvcABNeMVhe2f2PL+wYyqUMNKivgNYk8XnHGj9tQpMVeUrjb/
	2YawcjaJojIAn0yZ1/Q6H/njgcFxNzc3Ll3KEkYQWoBmG5ewE1kf70CxmgjVY/mFcThJLYG8u3Q
	ktpuHUdmZyzG/LW88oOth21v3tbVbf10dib2OQ1Ij/sJHPtO5zfw7FVb41+1M409yNN8INmP1+7
	hkLttae+BOLvJwFC39oGcFTFTB55EcPPVOe0FdxRgJr7s338IdKsuF7EjSN3nlb2RX9fG06WPFb
	r3+7aym/iFmDBLuI9ZSfPzVC5eMUQ/zPnrBO
X-Received: by 2002:a17:907:2da1:b0:bd5:b26:52d6 with SMTP id
 a640c23a62f3a-bd5177d78c9mr654774966b.5.1779044436258; Sun, 17 May 2026
 12:00:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 12:00:35 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 12:00:35 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-6-gerg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260506142644.3234270-6-gerg@kernel.org>
Date: Sun, 17 May 2026 12:00:35 -0700
X-Gm-Features: AVHnY4JWE7dTwHmdk1WFCo-5y5V_ABFrYGVfcGaUQK_jNNfZ8FP0HbytljKloS0
Message-ID: <CALSJ-wDuXfMzV=Ydic-2S=2v+jbe034gqmy+wr-R1d14LBxuFQ@mail.gmail.com>
Subject: Re: [RFC 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel() on ColdFire
To: Greg Ungerer <gerg@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	arnd@kernel.org, Greg Ungerer <gerg@linux-m68k.org>, adureghello@baylibre.com, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, May 07, 2026 at 12:26:46AM +1000, Greg Ungerer wrote:
> From: Greg Ungerer <gerg@linux-m68k.org>
>
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
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> Note that the patches to introduce mcf_readX() and mcf_writeX functions
> are not in mainline yet. They are currently in the m68knommu git tree
> for-next branch, and so should also be in linux-next.
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

Tested this now on stmark2, sdcard mount/umount/read/write/erase works
as usual. Thanks.

Acked-by: Angelo Dureghello <adureghello@baylibre.com>
Tested-by: Angelo Dureghello <adureghello@baylibre.com>


reagrds,
angelo
