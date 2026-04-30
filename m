Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A47394462
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532668; cv=none; b=H3sucudM6I8ltsQxlCuAMbNL9r0hDY0ZRWL1aqGepqwMP5Li9I+SeYL+GdrYDz0e79EZinGMBKgX0bJmvTay08MGnnNAs+04+9wcN5M8SSnGAUBAvExwmp8jVwUnDBs/zZJHmAKaEtLr3/6sbPPtwmjwgMq8NfzhyK4Je59RfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532668; c=relaxed/simple;
	bh=GdxtTWdSSjLwY8nWQXbCPCSFKizfm4odtE42hNIudXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjO2x+r3CKTpWZOKohYP/c4K2R0nxs6BC9ibfyXKdnpjm8WCNZ/NSmDaf6aAvWKmUzmjbbSA9Fwvj1ichgEqFphdOoLN6vPrfznWVOTtdpGMLEuevlaRm29Zfz1P4KcaZMZjsD0tNVc5qpoWY14fuEsufPBx2z92zm0Eg5qQA74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-60fd9b71745so200924137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 00:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777532665; x=1778137465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NdMf8VE4Liv8sLOGIkypUs7paEiA065kMGCMtaAf/I=;
        b=MoSgC2Ow2kLNvlxLSBWJe4JBoU7xQZi42MpuM9VzmC13vO3+HrDwuRPiehi7+VrXoR
         OPwpv6PqEeocToQl6hJuqA3Q1hI+Ue3uIxVIAY/hk9f5Zs1pGkzVAqbWeiJfJlmj0xRA
         3kjCz8UnyT6RawA2eiBqfg8IOVjnruLOIXe4e0CYFKVrsypvQmVA/Ezn9AW7CgNi8JA/
         ++rS/KQv+ttNaOocu5GS0EFfJfU+EqDguDgfswV2yjkn5p/xO+SAlEv42l63QIPeSq5O
         g1vuW/+Fxsl80pBNlK2evT+0dAKSuEUhKn/nwfJHaoJgNJfAetJTpVe4fhcxfiR2Nlg8
         Yuiw==
X-Gm-Message-State: AOJu0YxhODjzrEKOJX1neMuy+0wEUiXbpxSuMMn2enzsVILZdzzNUTZs
	SdCF414fZZu1xqi1z8AKUEag42WWPpSAgiQchMqORYyAqYu3Ucrc3lm/ry0VqWF9dv8=
X-Gm-Gg: AeBDiesxl/DmpVIFqjx1UHzBBdLG6sWVmift9a8FmJvKibATpIfxZUgjxHfJLR8VHuj
	Gj6wFZpLL4g29P1f3Hak4rjuVbpemAdbSlJJRMNLMyuq4SpJXm2gYFAxUoZTugBeJsiUY++llww
	td7VQ8A/gVq0H8Dj/4vM9A5w0eHPCbDUe/89Zztn0pNIegDtdlDP7xX0byG9QmVqjhcTgmnM+l6
	nho8/7vEEB3+/YQj/soY8oZvjVcrSjJY6gh4og07ObIq0pd1uZD9ThnnbmsOeJAzyYWtmYsSjJe
	nwBqw/wGWy6nO7RdfegA46vJX/hbqwejKdzIkquftUqGY5eH6uOwBkOoOpavU8l3ujBz3G9e8um
	U0NLPEX++165TGbQa7MK6/R4Aki9Q39zLDSecSlX4fpNutQ2s0KqzN+W1NCJCObR8xEL+PyWBA0
	06uYiKRtXGaRV1lnJVHQ0CO0HMsIiaWZVBEdvgG1KNGUUGEleAQ3m0w7nqQACfA21i+Etl6xQ=
X-Received: by 2002:a05:6102:5692:b0:60a:8515:9097 with SMTP id ada2fe7eead31-62ad9f3835cmr623747137.3.1777532665283;
        Thu, 30 Apr 2026 00:04:25 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7584409sm2301856241.3.2026.04.30.00.04.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:04:25 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6221c7251e1so173180137.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 00:04:25 -0700 (PDT)
X-Received: by 2002:a05:6102:688a:b0:609:af4a:371 with SMTP id
 ada2fe7eead31-62adcb74357mr541360137.23.1777532664799; Thu, 30 Apr 2026
 00:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429142452.1200856-1-gerg@linux-m68k.org> <20260429142452.1200856-2-gerg@linux-m68k.org>
In-Reply-To: <20260429142452.1200856-2-gerg@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 09:04:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW25fL+SHCH=kK3dRHCoa0HWDWa4EMBfGsH9NWWS7psPQ@mail.gmail.com>
X-Gm-Features: AVHnY4KNwHa5I9BpXh2GvZnp-DqeRyTJD8ki8NwXf5lbdZG7-e1hibFS_uPxt_M
Message-ID: <CAMuHMdW25fL+SHCH=kK3dRHCoa0HWDWa4EMBfGsH9NWWS7psPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] m68k: defconfig: add config for M5329EVB board
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Wed, 29 Apr 2026 at 16:27, Greg Ungerer <gerg@linux-m68k.org> wrote:
> From: Greg Ungerer <gerg@kernel.org>
>
> Add a default configuration file for the Freescale M5329EVB board.
> Although the SoC type has been supported for a long time there has been
> no defconfig for the base platform. Create one to give better build
> and test coverage.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/m68k/configs/m5329evb_defconfig

[...]

> +CONFIG_FB=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_LOGO=y
> +CONFIG_LOGO_LINUX_MONO=y
> +CONFIG_LOGO_LINUX_VGA16=y

[...]

> +CONFIG_FONTS=y
> +CONFIG_FONT_8x8=y
> +CONFIG_FONT_8x16=y
> +CONFIG_FONT_MINI_4x6=y

Given you don't enable any fbdev drivers, there is no point in
enabling CONFIG_FB and derivatives...

> +CONFIG_FRAME_WARN=1024

Better stick to the default?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
