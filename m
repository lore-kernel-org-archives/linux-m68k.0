Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23B301481
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Nov 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989534; cv=none; b=cwMQClXTuP0aKYRwmBP2j8xoWpV1Ol/72kFBmq8Umhwg+Eu4jEPI1DLGPYR/fJEAFB0VRjm2l7dJlrXonOJoy8jKLofZTIgqHec4A1XxrrrCcbf10e5UffTpplS+RlzybvUs1H6IUbVknEE9Qk4hye47c3TuLBpOQUcxyYaOM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989534; c=relaxed/simple;
	bh=rvffBPeDVxbQoo+Q7lx63a7eZIjGM7ukQNoAugTkn9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsZHw69DwnJcW3LUhLCkASbv1nppWCrwx6jalmuBQ982LHDLhFAYEX+uwqaZY+wAEtTsPoLlwHPTC6Kf6H/7vIJfPOUbv/YYvp5T6TjfrbC2Vp8/Ai+j7xITHWL17zsF2kOHITxfj9uS5yF9h7l7Pm5yazjcs9sByKNZWlv+zN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so1540210137.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Nov 2025 05:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989532; x=1764594332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRA7IiXm/R9YyxGpbeRsKjwk7bFwEo0rtrEj2XwEZxU=;
        b=PMUWsPEC4g92x5xm5tcFGdDxKYsLk8MOM+LMFyZYgp9RilKUPzVI8TTOkxUuh9ch99
         WpwM2+FoYrWEWbbgEbExlOzF/04jncQuzaHSCYZTgW4et+OKrS+ILj2RXYfIFmv0QAZP
         vP97fzwxsR1ZLB04JzNJTApVKI9+NRljueLX2Ced7PUIBlopbSNU564vyZs8IY04R66m
         bByDN1XPEY3M8xTXwBW8wpRenyZcmA5qBxWyUQo2naZEg48Rody2QmIPH88ljgEWv8sl
         2tFfj3O/cFONpgfpmzJw7SfIchbZMIk+psnY1m9FJ6gwIubwckgE85uuMPZ56hyOxjk+
         sQLw==
X-Forwarded-Encrypted: i=1; AJvYcCWZKD+W0JZc4nKESLRC3us7O5/bScppCu500+Q8QT6xXTHOw83ycluWCxfpooEFtKMHM4ATfJE1dNPG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw8rJCXjOZPAcQd5AaRC1v41ZBchSHcnZv96WuViodgKMzez897
	7RzJIel9TFP2hwSaausx1l1Dyb6QdUm58BWfM8/7i8sOfeYCiv1ZohVg/S4GnJ5o
X-Gm-Gg: ASbGncuXyZuniF9/riDOG0l7fRy8WFicpbQ3e4Z0wJU0HIEuJ33cY8dlL4C+k5+ufFx
	1UmjbxAkPrE8qEHYu24M2eSZobtF1XtkKKYl901V2WsF1yRE+qiEIoaBAigfkeNzjiPxSyG9dGR
	42GoiblF7Q4bZfCMEtpAre5CWj0g46MZut4uUVx9RKKZvbEMRcMqo7Wp8KxqXwOk68Wm+xoUta2
	WIZvPOKIYQNnhmS023GzZWpNpB5qlw935tfVVDndu2q/9yDiakouh6qlcvpYnTnjfUfz/bF+2iQ
	ePeUzwrCr3keW4inUXj0JUjiT8+8sjrU9GrJ2OPMXJlgXttzqIaq0Ed8FjJh7HLmKcC40j8RTnh
	WWly8xxFXK3d5uT5aeyiRtaP1LnWfrPy3ATwLqCgCCf27rVeN9iGaFCqAID1HEvy8fi1EzaQ0s6
	xQlxxe429TIBMyxYqEbfg8NsWxdC/8lwCGBRuUfnIeJnd0exuiVEUpyXh6T4Z6zBGRdcxPAA==
X-Google-Smtp-Source: AGHT+IGxSbmcHcrcKVyMShkoEf/elGpLSz89dW/3Vtwh2RqYffTZp56GpfsfIJ2+dWwOrGI/h6njlw==
X-Received: by 2002:a05:6102:5113:b0:5db:18fe:7520 with SMTP id ada2fe7eead31-5e1de3bf69dmr2992869137.22.1763989531439;
        Mon, 24 Nov 2025 05:05:31 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd96889csm5430480137.5.2025.11.24.05.05.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:05:30 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9371f6f2813so1120504241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Nov 2025 05:05:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM/trEsQEFmwYW92jbO47mosuwi6j2H2dGjHrGvi+hw7OrfjskglIPkKALNnl2SVltBM3NOhN7cY4P@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5113:b0:5db:18fe:7520 with SMTP id
 ada2fe7eead31-5e1de3bf69dmr2992625137.22.1763989529183; Mon, 24 Nov 2025
 05:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-dma-coldfire-v1-0-dc8f93185464@yoseli.org> <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>
In-Reply-To: <20251124-dma-coldfire-v1-3-dc8f93185464@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:05:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDryHHdrsBzsUF4BRhNoDXm4+3FVQ4FV2acGT6reeYhw@mail.gmail.com>
X-Gm-Features: AWmQ_bleU8rfcOoPzR7hq6Rm0AD1QUkBfKzAzzAbdXJa_V1TGP9TwrSr0BINHw4
Message-ID: <CAMuHMdWDryHHdrsBzsUF4BRhNoDXm4+3FVQ4FV2acGT6reeYhw@mail.gmail.com>
Subject: Re: [PATCH 3/7] dma: mcf-edma: Add per-channel IRQ naming for debugging
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, imx@lists.linux.dev, dmaengine@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Mon, 24 Nov 2025 at 13:52, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add dynamic per-channel IRQ naming to make DMA interrupt identification
> easier in /proc/interrupts and debugging tools.
>
> Instead of all channels showing "eDMA", they now show:
> - "eDMA-0" through "eDMA-15" for channels 0-15
> - "eDMA-16" through "eDMA-55" for channels 16-55
> - "eDMA-tx-56" for the shared channel 56-63 interrupt
> - "eDMA-err" for the error interrupt
>
> This aids debugging DMA issues by making it clear which channel's
> interrupt is being serviced.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/drivers/dma/mcf-edma-main.c
> +++ b/drivers/dma/mcf-edma-main.c
> @@ -81,8 +81,12 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         if (!res)
>                 return -1;
>
> -       for (ret = 0, i = res->start; i <= res->end; ++i)
> -               ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
> +       for (ret = 0, i = res->start; i <= res->end; ++i) {
> +               char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +                                               "eDMA-%d", i - res->start);

Can return NULL, so needs error handling.

> +
> +               ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
> +       }
>         if (ret)
>                 return ret;
>
> @@ -91,15 +95,19 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         if (!res)
>                 return -1;
>
> -       for (ret = 0, i = res->start; i <= res->end; ++i)
> -               ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
> +       for (ret = 0, i = res->start; i <= res->end; ++i) {
> +               char *irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +                                               "eDMA-%d", 16 + i - res->start);

Likewise

> +
> +               ret |= request_irq(i, mcf_edma_tx_handler, 0, irq_name, mcf_edma);
> +       }
>         if (ret)
>                 return ret;
>
>         ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
>         if (ret != -ENXIO) {
>                 ret = request_irq(ret, mcf_edma_tx_handler,
> -                                 0, "eDMA", mcf_edma);
> +                                 0, "eDMA-tx-56", mcf_edma);

Fits on a single line.

>                 if (ret)
>                         return ret;
>         }
> @@ -107,7 +115,7 @@ static int mcf_edma_irq_init(struct platform_device *pdev,
>         ret = platform_get_irq_byname(pdev, "edma-err");
>         if (ret != -ENXIO) {
>                 ret = request_irq(ret, mcf_edma_err_handler,
> -                                 0, "eDMA", mcf_edma);
> +                                 0, "eDMA-err", mcf_edma);

Likewise.

>                 if (ret)
>                         return ret;
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
