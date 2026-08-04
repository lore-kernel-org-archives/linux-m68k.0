Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE33B83FB
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Aug 2026 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853893; cv=none; b=i3AFC6kxjuONdqcQcJSg0Rw8UMVUiMIdWYXv8Gsq0C1zd5lxM1XvTq3k9d0Tk1I39wuIOga/g9dL7KFqhFqNwSQIvOeod4w6Wpgxuood16U+OQpC74IxIrxC9rRCvpfwR+k+Y/iHDSwmxjtjoFYbg7CF4V2QWCkcmaFTeEsGVn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853893; c=relaxed/simple;
	bh=QiJCNRyg0hPZ2mI4Gjma0OFzO/BLvZ2oUgJygGTgQGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjKOh5RyyG/LL8jwPIIuzUTXv7cxdxqmviPJIQvUPRnPje2DcoEgaxup4L2N7kclyMkbgixndEznC0wgL7CiQ0S3ZwKG2X6j5Z5/A6igDOKctFZ/L1JMjHXqslqXBH6jMj+4ha6aAbQgjrRt6I0naYYYYZ6NM2kdISTUrriRWvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963a722ed59so1160209241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Aug 2026 07:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853875; x=1786458675;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WfbQ4y5yUdy2TJAvCiAC8jxLj5JOJo3d5fP3Tj0QSMo=;
        b=jJiCZBSMspswCyacJaW4/a8mNQwNHorg/w9vBDiK4jCMJOToHC8nwL+FxYMMy2o0JK
         Rjn+p3Dhx+h6vsSLuNfQY/Tv4leEI/qvVGtmLwBZsLS65ChPEIafIn7qeRsqj2nVLziX
         jduqvtCZwh+J1+r8JeqKWb2hysPJJsjq+98ETy2JAwkk4011eibMQTCa92d5uHB2W+is
         DkOpTohH1ElrZqclgn1zUlNGRF7s6OFWezjfvzX+vbpyig73zV9uI4QIzOoJc9Ni+zaC
         WRPw6gv00lqfx/8uFLzYf4tkXBWm8pIVuzTLECiUh0j+TK/wi+UIfn9IKW2jjgDVBX8d
         9HTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqImQBJLxKU93FkssyX2jh8ByUaeeuKVXNGa0TUo6uou5YzglGmr1XxE4jOIr68dBUZlNPQ+SStkBEm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwaE/8Xg5xlSXarugpTaDjbSasegZ0JyzgoUSmyQooJoWzvKylF
	rqVgg/bo7qmOmPrWIZviGD9iI+kGq/O9qehRp1Rq/RCI+5TMfmSpfIsau/APQter
X-Gm-Gg: AR+sD134+d6D8Rng6p0WOV4YfnB5RB88kHNQ9PA8IMcWZgwYv3lYn0D6fCiix6Rfnxv
	fbwueht2VMbBaPMgZ4iFBzhi+wpaOewiHj8c7jPS+t5roTVmZrPS4k64Hpnm2HgTCX7jH1PeRKk
	YU+ObNPD9ymi8dEWBI/umlfGXSe7QvEg8usJS0v6O62eyRF/f3V8S+e43YECJ+87nPOh+Lpz3GI
	2i2qLrSrVrgS/DHaCL8zUMZMnWvOYjQ1G8UpmE/wHQOqv3kLqQCIb90unvEcMUcfhxTEEh9Ab6S
	YvZ2VtnybqVxPoDZIJdxsURP3fXznPtLYa1oy97+bP6qM4M9viGaHcmInYR5aJm7Ok+B8JfQnBX
	qfWiyxIprbcGYgxp60i7Z4fD+M+m0NsDTbCfPzcL0mxBLsRJhCMciuz4eKkn5nFeE/taubOe91K
	5b1SzZQv3WWFev830UX+n8Uc5/Ze5x2rxAnijMR6DAAI6McJkmj0fAUhms/7zGWS5/dEEThLcLL
	xMuZeVc9JLXuD/pmiAMV4SGNGinHQ==
X-Received: by 2002:a05:6102:3e8e:b0:73e:5068:824d with SMTP id ada2fe7eead31-75b2498801emr9645299137.14.1785853874628;
        Tue, 04 Aug 2026 07:31:14 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-760423db3ccsm480748137.0.2026.08.04.07.31.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:31:14 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so1391970e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Aug 2026 07:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSnfFgFVQbfRjxPdgNPSjUc6LIoet0sKZ3DxrxsHyke5H67nf1nWNM73oIf/T0XhiMG5F0xV9Apxvm@lists.linux-m68k.org
X-Received: by 2002:a05:6122:4687:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c387704235mr3498906e0c.7.1785853873478; Tue, 04 Aug 2026
 07:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728005610.575268-1-rosenp@gmail.com>
In-Reply-To: <20260728005610.575268-1-rosenp@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Aug 2026 16:31:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmAd0dba9_EPdJkqw4kQubtKms03Ws8P-WfY__yxTEjA@mail.gmail.com>
X-Gm-Features: AUfX_mzx-BRg1E-s4SG7HkbYeAMYP1kt95Rsysb98ELpkM0oLgUWl-DNPpZmMiA
Message-ID: <CAMuHMdUmAd0dba9_EPdJkqw4kQubtKms03Ws8P-WfY__yxTEjA@mail.gmail.com>
Subject: Re: [PATCH] rtc: msm6242: use devm_platform_ioremap_resource()
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-m68k

On Tue, 28 Jul 2026 at 02:56, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with a single devm_platform_ioremap_resource() call, which folds
> the resource lookup and mapping into one step and returns an ERR_PTR on
> failure, checked with IS_ERR() and propagated via PTR_ERR().

Thanks for your patch!

> The rtc-msm6242 platform device (arch/m68k/amiga/platform.c) provides a
> single IORESOURCE_MEM window (0x00dc0000-0x00dcffff). It shares that
> resource definition with rtc-rp5c01, but the two are registered under the
> mutually exclusive A2000_CLK and A3000_CLK hardware flags, so only one
> RTC device exists on a given machine. The region reservation now
> performed by devm_platform_ioremap_resource() therefore introduces no
> conflict.

Any patches adding seemingly safe region reservations need testing on
actual hardware.

> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

> --- a/drivers/rtc/rtc-msm6242.c
> +++ b/drivers/rtc/rtc-msm6242.c
> @@ -188,21 +188,20 @@ static const struct rtc_class_ops msm6242_rtc_ops = {
>
>  static int __init msm6242_rtc_probe(struct platform_device *pdev)
>  {
> -       struct resource *res;
>         struct msm6242_priv *priv;
>         struct rtc_device *rtc;
> +       void __iomem *regs;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res)
> -               return -ENODEV;
> +       regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
>
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       priv->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> -       if (!priv->regs)
> -               return -ENOMEM;
> +       priv->regs = regs;
> +
>         platform_set_drvdata(pdev, priv);
>
>         rtc = devm_rtc_device_register(&pdev->dev, "rtc-msm6242",

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
