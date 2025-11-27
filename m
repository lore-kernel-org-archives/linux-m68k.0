Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256631DDA4
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232641; cv=none; b=BaZDIaJS+dAMnkRUETUQHE98cUpttMbmbLJz19+zrY+TJvxjMOSYL4DXgOR+HJ+VYu9gqz+5FGWbBmkvEdXBaa4esNDe6ZKMLTmrlkIu9V4feB9MtHQKVeWLkngK+0fXEDMUePV24adp7rmct2fb17MzOjCNYxlUclplducIhd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232641; c=relaxed/simple;
	bh=/k8EWPhfGokPGMRiqiH2p4Mjc5NgvkT0g+q1DuCM1Vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfcfwj5lkESEgIJlR3DJ1KTMz6kkbJOOSemuADC6wuu+bthtnVaKZ+huQ9zC8hyS1dBn1bxtLhsBCMkg41jpyU+4AnAPljK7oBecp7MTlQFtm2A+RSV4O6Jhm8yJxsPQkCElN+QOOoqdLwk9226dvtJCo8yT/qp7hs3lsWcsFyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1141278e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 00:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764232638; x=1764837438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIb8SaPvztgKHHZzH8CWgVAXI7TZRDphVAmy2KGknFI=;
        b=WmFoa6RAaAwJE/TtXMffL8Z/SEpti0qmtMcFQyAge1oH7wG7Iq3rBRwIvpfAIHacAi
         eeNXETyvIGwIasGSqEeltwrB6v4sGdSiVhrEoqGyHFOjhyXLPDowYobZyt0U1n43GcFI
         2nNXxLJXt1FZVSoOyp2cX1qQOf552Os0XxuC+BUxwbD1aTUkeHZAxSNgBDLDlZAsKhFj
         Lum/e3ITVbFgT/ognA5Ij347Z5wA+pUfZzCz1ew4Rdz4wPbpkaVOcQf9lVqIoSewLscv
         noIDwV+3YlKM7qJRmY5Szx3AIehhvKlO7Yy38o5i2tzmqTMYKz7ep4q4HdhmGa6E0Ox7
         9FUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3NUQzTJhcci3qKc1SPiE0IwgKy49SCNS1ruZRA2TZXWeBW6uOBxJ9Oc8Ge33zNAySGVw33Qsyxjm0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxDw+Qs/k0V9StMd4hmkZ/fyPY9WS8BaiGtF9IKh+N/AGaJZDIO
	kjktLRSBMhHSCuSDTmCru1zrv+1Y7PuhVhlAA5v5Qwj8JPrBAJAsUpozWYzijYM6
X-Gm-Gg: ASbGncu5+yAvGiTRcFbLsRs8U3Mz2pmPecY9LCHouOqqYj2pLyOXiu6RIWloSv9GzGM
	C02NznLEpTZJnLYdU7T6ufKmIUWczVXX+zhSlPSRR/me2nOswF2RG19a9x4BWJ5dPwiTjSoK2MC
	sLf6QxSgOJnHwGMqUWTNozIqEdkNfcPrAYNXSXgQW78Bk1/9B68aSYpQyKGSTtQPd/nteTWtm5+
	VSO+TzDuJHrer43cGQZFV5DfNkO3tRXH/YEp3dXJ6CBvs683VKFJuWBLqRa2RuRNO07V+3a5tzK
	zbG4EIhQ3k0L6i5/KSm6GuVB0tcu1ODBKOFNKjiDtxugxY9zb61zZObvDKe84/ke1Q96qC7Udc6
	Qnvg/Iqx1tYUKlL7tQlWhdySzOAL5QcFwfAPoqkOPYWapKpwgGk+nJbLyNUUJU+ahiXzcWndfkW
	xb8/TeAoxCyoKcSmnrhgnNN8cs/bIrWLMhCoMOt600t8JhLq1S
X-Google-Smtp-Source: AGHT+IERNc5QeiPOa2QC9YUYDcxJjQgKyz0j9MfUfxr84BsPNsTS4AJLj+CkPMMolLoewXKrybK0fQ==
X-Received: by 2002:a05:6122:8007:b0:55b:9bf6:da7d with SMTP id 71dfb90a1353d-55b9bf6db38mr5682456e0c.2.1764232637832;
        Thu, 27 Nov 2025 00:37:17 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf5186d0csm336756e0c.20.2025.11.27.00.37.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 00:37:16 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9372164d768so1123924241.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Nov 2025 00:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjCCNNJ0sVzhE2T7v+sE4hRVuyp0d602opcYq8opplqEcHtRYik51dQyinEpY87E/NVmYAMZuFJ0At@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1623:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5e1c41a822amr12513289137.19.1764232635987; Thu, 27 Nov 2025
 00:37:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org> <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
In-Reply-To: <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 09:37:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkVv9s4nivghVE7rDnIpugWqg40dFmqyxV-7HzaTJ-oT-X1ymFUQxkCVvQ
Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
To: Martin Kaiser <martin@kaiser.cx>
Cc: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Wed, 26 Nov 2025 at 21:30, Martin Kaiser <martin@kaiser.cx> wrote:
> Thus wrote Jean-Michel Hautbois via B4 Relay (devnull+jeanmichel.hautbois.yoseli.org@kernel.org):
>
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>
> > Change devm_clk_get() to devm_clk_get_optional() to support platforms
> > where the RNG clock is always enabled and not exposed via the clock
> > framework (such as ColdFire MCF54418).
>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > ---
> >  drivers/char/hw_random/imx-rngc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> > diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> > index 241664a9b5d9..d6a847e48339 100644
> > --- a/drivers/char/hw_random/imx-rngc.c
> > +++ b/drivers/char/hw_random/imx-rngc.c
> > @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
> >       if (IS_ERR(rngc->base))
> >               return PTR_ERR(rngc->base);
>
> > -     rngc->clk = devm_clk_get(&pdev->dev, NULL);
> > +     rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
> >       if (IS_ERR(rngc->clk))
> >               return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
>
> The clock is not optional on a standard imx25 system. If it's missing in the
> device tree, the rngb will not work and we should not load the driver.

As the clocks property is marked required in
Documentation/devicetree/bindings/rng/imx-rng.yaml, "make dtbs_check"
should flag a missing clock.

> Should we call devm_clk_get or devm_clk_get_optional, depending on the
> detected device?

That can quickly lead to complex code.  Nowadays it is fine to rely on
"make dtbs_check" for some part of the validation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
