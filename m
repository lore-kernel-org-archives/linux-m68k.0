Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00E310784
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512336; cv=pass; b=dCsIshTOs0DM6fChiC/roUgqhxiX/JnHkXi6Qsy5vvK4h+UXi1QScHLOgzKfKO7afKzqVL0KEtFDuaM+YQF2Oh2oB2TfxgztLSkzbcpkW4h52F+9t3M0uMgB02+Vwc7OT8hKBiprRoUdfPf9x/hFb6UTQN+d+rPeuHcVSu+6J+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512336; c=relaxed/simple;
	bh=1H7Xf7d2is7GVflTECcZFEqt6F6L+thydK7Be71uvw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3ugGx0o2H6VBKctsKjIK3n3kali39jrSYlGSyz/LmqN1bMn4YD+DaSp/IyCDZ8HAR5O8IGWfhaKcgohPwJTFUfvax4+Cqd+U90ZJW/3VSeaMX06SJWmKuzpEnHagZhoT66kbNh6mZbgyy/Y1N9/OOd135W2WXeNM2KvBLxmfLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IC6nYdGp; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IC6nYdGp"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bf0b1a47b1so41949307b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2026 08:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778512334; cv=none;
        d=google.com; s=arc-20240605;
        b=JNdy79JGMWFsY63qPNh01BU3Lscp68eIIHYmOvp9sXO+zc81iiRddXBHZQrcsXKTHO
         wUqgJc4FJkUHVvhCzMcslSDqh61tGfUlEcX2ULMEbc720jC8/ENhhZv0jJ/Cv53ywMQO
         4uXSDzuoQF1/IRQ+VtUN3VxY3JMrW/MXJphp+pTRTKhng+XGT2+E0kykxf+6LBuMceN0
         qRjKt2BSaZ2dvss0iKZl7/zAAwSDCozYe4rxDe8gYcfxKLbutO9ntTBJHgaUWgFr3Mtl
         YVwJWiUpkLtuPA0N5mdAg2wrTO6knlq9/uCta4hM8OQlHj+5KH779M3zmwVDdW80uMcu
         Se1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/f5pcVVRZpgPLr1zYSd/Poxqpg4qBOt7BIeSZNx3Fjo=;
        fh=0ltLx/nqIXM0y6+/dxLailUHhidtBWyTCbKf/ZC8YHM=;
        b=DZ7A+RmdhDEWTFhUo8+/nY+nfMO5ZA0v9cZ3teRBATe7n2fHYzl1NI1TICjrVlQeXN
         iyGGgIvb034hef15o3U1GE+BKrg0bQB2pfOsa3Rj8xF2Lx5Y7x72/HhY87cTNIdjxBFb
         tbrofr5TgqD3MSAyyYstYYxePsNyHkfE9Cn1nYEENcu0r2/0wVu3SfkwRk2hrKtBGrpI
         AhT7uy+bt41JCL0hdM/JvuTdkOniXJijs+2A4q7VQhU7wNzEG0wf5O9LzlLH71+jABLa
         uiY8FWl4J7RuNN6+YbykGitrOtyd7D5jvi7eGX3F5/S9kfvtgnCgewvCla4MFsw73Kxr
         v6Nw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778512333; x=1779117133; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/f5pcVVRZpgPLr1zYSd/Poxqpg4qBOt7BIeSZNx3Fjo=;
        b=IC6nYdGpwgmQO7+vIky75H3/QobYwg98ZcjmN4ZFVeJbbl4MOswfZfS0PwMAEHkWBr
         c4X4Y9XjIs0/TT1WpfH+GcCcGW2muIRln3zHPB5znROyy8pv1Zu+Y7WsYMnjXcjUIWY/
         75iu6OeaCZQCSwmZDE+qKdxG2ODGEYzsuzoNDUBYIpaEZGgwpUHRtSja0+cqGiOe9hEH
         EPbZ876pxCSoQEGg6yePDMQ5a0S13QSariX0oYtOQ9iYdIxGarII+uUf+pwqB1ISY1V/
         YWR5KQRzYSwK5npAAHPm8T6FrxgQhEF0SQQHbPGqQkWy4o0wKH/xuq3l7t1/vTRO6cAU
         l3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512334; x=1779117134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f5pcVVRZpgPLr1zYSd/Poxqpg4qBOt7BIeSZNx3Fjo=;
        b=S95KWDWBwzorPPrL8T48cOCbDVIdlqnj/N2zFsXITVBmvrg89HVMMJ2/Q4vQQawPHk
         AzfJqqN7fZI63fOmUlK59ESOF7OjfbrkjE72ftOELLC1aMhTNG9GYx2H5iAbBraBAKss
         d67jChf2aDeKRJBLLKI9MRTQF7+Z1W+19eGjb19lHz4atr5YkgcIo5fWPF+s0OWCefwD
         oWg4EYqeIoQFfvX7yrAiXgVCNmPSt27fVQHv3+KcpwLSdevSrAFt1t5Ac/zpT0ilvZgM
         EtWL5emayWokyWPe6jUggKJBGTO0Jlqh4mJcgm9yVQUJ/DM9z+Q1SSs+4AB9WK+YgGWX
         wX1w==
X-Gm-Message-State: AOJu0Yz8bqZS5TCaRyJjy1Pn2xxHFnACNDxGeQTD6AZCtWzMDrclHaAo
	vDJfoKZWrx0TmbbQXgUY3PCAcgwuXzahAnpGufbP2gdqgOEo2yE1DayHUxBR6ZRdQdBUjFmEqsQ
	EgCUiTHr+hTHW+IOwX5Rw7mCrsNoNULtAaS8hJH5cdg==
X-Gm-Gg: Acq92OHutBdhLQovuriFpYJDcGjrBJr1VqfPdF1wMq6hNYo97rjM6FhjVGXEQGHpNdg
	7ky3ZBmDrtjYC9o4jlO81JdMMwVVtK/B6k1S8uUj1/iJVkPZd5S6cUtPNAejlUSQcvQVD7BgoET
	bGjkW1Rx6BxpyX8GAHq3wDXC8VnA5/9C/KxIrK0X8P/E3S0GXZBb6JJcBg9nNzDNbStoTz+NYi3
	8bNdAOS6vvqInPrkpe6zYci6RyFTNYm/S97WdEBrU8RkaeUGiSc3h5dtvf7vtIxPIv3NezSKjV4
	0fcrlHFw
X-Received: by 2002:a05:690c:d96:b0:7b3:a5ae:4214 with SMTP id
 00721157ae682-7bdf5eb538amr251461777b3.24.1778512333347; Mon, 11 May 2026
 08:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-6-gerg@kernel.org>
In-Reply-To: <20260506142644.3234270-6-gerg@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:11:35 +0200
X-Gm-Features: AVHnY4JoT13V3074zVSJJIYRxUbzF897uIv-DHEkMY19qZbI5HkBtp9YPaUtMi4
Message-ID: <CAPDyKFpZ3h7Kx845K+f1EZs2ijgjBmKsLOX8GCuP=C5WV-d8KQ@mail.gmail.com>
Subject: Re: [RFC 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel() on ColdFire
To: Greg Ungerer <gerg@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	arnd@kernel.org, Greg Ungerer <gerg@linux-m68k.org>, adureghello@baylibre.com, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 16:34, Greg Ungerer <gerg@kernel.org> wrote:
>
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

Okay, so please resubmit the $subject patch when the mcf_readX|writeX
functions are available in a v7.x-rc so I can pick it up.

Another option is if someone can host an immutable branch for me to
pull in the changes for mcf_readX|writeX.

Kind regards
Uffe

>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index 375fce5639d7..6853521e8b2c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -55,7 +55,7 @@ static inline void esdhc_clrset_be(struct sdhci_host *host,
>         if (reg == SDHCI_HOST_CONTROL)
>                 val |= ESDHC_PROCTL_D3CD;
>
> -       writel((readl(base) & ~mask) | val, base);
> +       mcf_write32((mcf_read32(base) & ~mask) | val, base);
>  }
>
>  /*
> @@ -71,7 +71,7 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>         if (reg == SDHCI_HOST_CONTROL) {
>                 u32 host_ctrl = ESDHC_DEFAULT_HOST_CONTROL;
>                 u8 dma_bits = (val & SDHCI_CTRL_DMA_MASK) >> 3;
> -               u8 tmp = readb(host->ioaddr + SDHCI_HOST_CONTROL + 1);
> +               u8 tmp = mcf_read8(host->ioaddr + SDHCI_HOST_CONTROL + 1);
>
>                 tmp &= ~0x03;
>                 tmp |= dma_bits;
> @@ -82,12 +82,12 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>                  */
>                 host_ctrl |= val;
>                 host_ctrl |= (dma_bits << 8);
> -               writel(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
> +               mcf_write32(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
>
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
> @@ -110,24 +110,24 @@ static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
>                  * As for the fsl driver,
>                  * we have to set the mode in a single write here.
>                  */
> -               writel(val << 16 | mcf_data->aside,
> +               mcf_write32(val << 16 | mcf_data->aside,
>                        host->ioaddr + SDHCI_TRANSFER_MODE);
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writel_be(struct sdhci_host *host, u32 val, int reg)
>  {
> -       writel(val, host->ioaddr + reg);
> +       mcf_write32(val, host->ioaddr + reg);
>  }
>
>  static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  {
>         if (reg == SDHCI_HOST_CONTROL) {
>                 u8 __iomem *base = host->ioaddr + (reg & ~3);
> -               u16 val = readw(base + 2);
> +               u16 val = mcf_read16(base + 2);
>                 u8 dma_bits = (val >> 5) & SDHCI_CTRL_DMA_MASK;
>                 u8 host_ctrl = val & 0xff;
>
> @@ -137,7 +137,7 @@ static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>                 return host_ctrl;
>         }
>
> -       return readb(host->ioaddr + (reg ^ 0x3));
> +       return mcf_read8(host->ioaddr + (reg ^ 0x3));
>  }
>
>  static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
> @@ -149,14 +149,14 @@ static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
>         if (reg == SDHCI_HOST_VERSION)
>                 reg -= 2;
>
> -       return readw(host->ioaddr + (reg ^ 0x2));
> +       return mcf_read16(host->ioaddr + (reg ^ 0x2));
>  }
>
>  static u32 esdhc_mcf_readl_be(struct sdhci_host *host, int reg)
>  {
>         u32 val;
>
> -       val = readl(host->ioaddr + reg);
> +       val = mcf_read32(host->ioaddr + reg);
>
>         /*
>          * RM (25.3.9) sd pin clock must never exceed 25Mhz.
> @@ -245,7 +245,7 @@ static void esdhc_mcf_pltfm_set_clock(struct sdhci_host *host,
>          * fvco = fsys * outdvi1 + 1
>          * fshdc = fvco / outdiv3 + 1
>          */
> -       temp = readl(pll_dr);
> +       temp = mcf_read32(pll_dr);
>         fsys = pltfm_host->clock;
>         fvco = fsys * ((temp & 0x1f) + 1);
>         fesdhc = fvco / (((temp >> 10) & 0x1f) + 1);
> --
> 2.54.0
>
>
