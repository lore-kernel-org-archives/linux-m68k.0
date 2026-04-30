Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED71A5B84
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533194; cv=none; b=o8uOOa1cVj8vwbWrLF1t5JPLvbXdAWGa0IR1D1b9K63aMyj90agnIHyN1+le+wzvbLXarm+JEOcFGvnsHE5vbPmswMOUQMt9nichZilFlP9FYsIzap0ahreWq7vfv2utgLwJj0Xpu4oLNj4vLqgqvWfuJkDWOUEHUmpMR8TfbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533194; c=relaxed/simple;
	bh=4tTuNJ/UY6ixdAqxKZMUTeSwlAwYLRWhEA10zHOEAKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbdUlCGauG4j18LE9GSJQAx90iWhkNFFiEHhHjDwBY+HlLEalo3UhETc5iiDPILbEUMAqMVm2n3PYePo/bzSfDK43P2uLj7vjgDQHm1Wbte5vN2KSRteMGSSCG9CBymLVef7VourSWYL1Dnlg3tMY/Yn0AoaNu0PGCN7kqqfI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso376046241.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 00:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533192; x=1778137992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svEWzGjvs7yvcR/Ma0SX4d0JWidv/PFWVn4RGxglD7M=;
        b=PtgIYgJIDnXBFOiFCyWA1ZueOliY1V6XlDyKbEHN8999fhIZQubV5P2rfgrHm9l6NW
         4J37CklwmP3vFRd61AC37jDZa7eLgF+y1jn8jF6MULggXHbjyleFNAy6mAh50xT3+IN2
         SUw51OEy+g3dX8KHkbWieOxYl6CUjb7c42S4/K3Qcaj1ztxCLJyWUiHEn++q3SVtPPKK
         F7c/Vn5rK7hLqldFdUYtMjwoV0NVtnZpFXVXoiuaIIuVYClIbnORSihYkFewhSnxSRfO
         Cb6moMrW/Q1f0rrLWYQd5MEHc/xBvKREeGKm+JBBU9DM+86CLkeOP0gIs+4lHQQf/clS
         frUQ==
X-Gm-Message-State: AOJu0YxqcF9BLhvxzKq9T0b0z8+WZdtJTSz+V+jULy6M1SXU/JuaHZ3S
	paWRCUHBDByUnctMZBKZ+tZEKCo+r6MctCVnNae4zzBDbGYyw0sfm2Q+7dxa5G6LKuI=
X-Gm-Gg: AeBDievto7ieNmPtYvYiWHnZiVIBFjgok2/j2Hjcdl0I9kkwqtxUmmigWrCTn3CbkaJ
	S1sBKNOJ0U82qE4fAzJsbfOa4MBEepkx4R91UiOUZG/fCfQ8cevjAIcKFhbLziKQFudZVZZtP68
	W256qq93bCbBtCBANrNjIh5zq23QeyyPWVjhrC/uZG1JSbni20xICmRD2Zsoedx9f3ozQuDPdP/
	dxa+Y7YfVSF1c5XUYTrATI18/c/2zl2uBYac8Uukab/4qGNm+1J4kenAN2RxKqP7oMD/vDhXneY
	fZILf4BYOYUX/4l3wETbGcOicUmPpG+ObyDBOk/1a5+WX66CQjug6JLR3fNsQ3EUNG94eNxQiKh
	8C3eXcB6KVUYx3Pr6Z0xRy3X5InXk695g441IN23pz5ZZzdovg4WkwVuBrC6O94DEcrCOdpCun/
	b3hsZwj1GEsMH+N+szYNmC56b3oKAog180f5d6EH/eIJd+IZU/B5s+MQIYvvYQiX0BPSDxPRQYx
	pw=
X-Received: by 2002:a05:6102:d94:b0:608:7b2e:4160 with SMTP id ada2fe7eead31-62ad21380bfmr806384137.5.1777533192077;
        Thu, 30 Apr 2026 00:13:12 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm2333456241.8.2026.04.30.00.13.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:13:11 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso579666e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 00:13:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8a:b0:60a:cd0e:5cee with SMTP id
 ada2fe7eead31-62ad2b44be6mr745557137.12.1777533191421; Thu, 30 Apr 2026
 00:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430052047.1827575-1-gerg@linux-m68k.org> <20260430052047.1827575-2-gerg@linux-m68k.org>
In-Reply-To: <20260430052047.1827575-2-gerg@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 09:13:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDMnxkF+eKwtSoBt7g_5sqY_O4zLT_icD9zTNuS8ou0Q@mail.gmail.com>
X-Gm-Features: AVHnY4ISEiHnCBIgSDyGj14KNZbB59EHWVP2VfkUGZtO8v4ckTu1WYl1Zo2I4zU
Message-ID: <CAMuHMdVDMnxkF+eKwtSoBt7g_5sqY_O4zLT_icD9zTNuS8ou0Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] m68k: coldfire: create IO access functions for
 internal registers
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, arnd@kernel.org, 
	Greg Ungerer <gerg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 30 Apr 2026 at 07:23, Greg Ungerer <gerg@linux-m68k.org> wrote:
> From: Greg Ungerer <gerg@kernel.org>
>
> The internal peripheral registers contained in all varieties of ColdFire
> SoCs require simple big endian access ranging in sizes from 8, 16 and 32
> bit. Currently there is a mixture of IO access methods used across the
> various CPU support code, some using readx/writex and some using the
> simpler __raw_readx/__raw_writew.
>
> The readx/writex use cases are particularly kludgy in that they contain
> code to differentiate internal register access and other general attached
> peripheral register access - say on a PCI bus. In effect this means that
> the readx/writex family for ColdFire is non-standard. This ultimately
> ends up causing problems with definitions of other IO access support
> functions like ioreadx/ioreadxbe/iowritex/iowritexbe which in the
> generic case are defined in terms of readx/writex.
>
> Create a set of internal only register access methods to ultimately
> replace all internal register access code. The new access functions
> mirror the existing readx/writex family but using the preferred 8/16/32
> suffixes.
>
> Signed-off-by: Greg Ungerer <gerg@kernel.org>

Thanks for your patch!

> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -107,6 +107,22 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>
>  #endif /* IOMEMBASE */
>
> +#if defined(CONFIG_COLDFIRE)
> +/*
> + * The ColdFire internal peripheral registers are big-endian, so you
> + * cannot use the conventional little-endian readb/readw/readl and
> + * writeb/writew/writel access functions. Define a family of access
> + * functions to give correct endian access that can be used by all
> + * architecture code.
> + */
> +#define mcf_read8      __raw_readb
> +#define mcf_read16     __raw_readw
> +#define mcf_read32     __raw_readl
> +#define mcf_write8     __raw_writeb
> +#define mcf_write16    __raw_writew
> +#define mcf_write32    __raw_writel

Why not call them io{read,write}{8,16be,32be}(), like parisc, powerpc,
and sparc, do?  Sparc seems to be the closest match:
https://elixir.bootlin.com/linux/v7.0.1/source/arch/sparc/include/asm/io_64.h#L439

> +#endif /* CONFIG_COLDFIRE */
> +
>  #if defined(CONFIG_PCI)
>  /*
>   * Support for PCI bus access uses the asm-generic access functions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
