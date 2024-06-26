Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF61836F2
	for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410176; cv=none; b=oG0wHEkfZcIYlRNc++z2lTvwVzO0+lT+Wd3jauPJCy6iCpIShBKRuwl6rw7GM1mNZC1umsq8vG76f7zgZI148Y5+CdUUTHfv9vJV9IwC2/wcz/W32HXbyKoW/sSsVXpwRgivxfkfYOIncAaTNBk96WSNoMW1bur5hWSP4nF+0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410176; c=relaxed/simple;
	bh=QKmxmmTj1SX84EHKsElbfW+9tLL3YUFZ77yCY8gn4Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcQzd/2b9N1nJJiCLALFWGqhTzvIQ0JPkV+kh5THfXM9BJqZqwmbE+p0yGDyQD26amkZDKjzEpvsfWCM1YoGlQR4xSXtlxfsIlT8sscujnqPH8J3jofoL5ntdic9pRXORhQqAmqZuEsYWKJHSO9rZcXs8z3u/qmIkqhS+txtGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-648b9d03552so3577777b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 06:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410172; x=1720014972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkTtdlUIQ7ejkwRoM7JqNcDP5iMetF0h6YACCMSOmc8=;
        b=bOK8/3ue+scdjCqrrRnRxd8fp0EChA0bwgKCj8LpZ2JoTZQK2MRimymUaH+35WVcLd
         imereKXfc0RvduNYlH53CYXEUv+/yGXTUHksvWH0zGknbl6DUacAm4rnWi6qbmm3ofWK
         L0LYDBhMn37GrYLUCcV4brSVMDZp7+hOmF1/tsYGcIhEqavPJboSQLLfza5lCLCm13yC
         zoGgOdFpabCcQsmSsfJhFDIeIrV1ZLipIHiIIQopRCF2YasgkmO98TIS4YeaLNxHC0+7
         i2U0Zhuze1o9T8BVpQuFONMHW0m7i3MPPRaxCwZGwA6y7hSzRlMFwippYl8NNX0SLvP3
         OmyA==
X-Gm-Message-State: AOJu0Yx77J6mQoawlXUiAk8hfaCWuP53lJnFUz1X32cLgAWXq41beDvJ
	L4XlN+0aee+zo+DgLzyHGSmipkEdP8vLjAKsaI8TAOsV1dLboSvj9mmcyTfN
X-Google-Smtp-Source: AGHT+IFB+5D0sW+3qnCO7iVs2nFVJQiW3a01oWy1gWxazLiijRgnaGzs6JFauatGYmGd0AGFT5T4/g==
X-Received: by 2002:a0d:eb8d:0:b0:643:4c39:8388 with SMTP id 00721157ae682-643ac0367b8mr98613347b3.45.1719410172236;
        Wed, 26 Jun 2024 06:56:12 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f15f66a73sm38093727b3.140.2024.06.26.06.56.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:56:11 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64789495923so15772547b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jun 2024 06:56:11 -0700 (PDT)
X-Received: by 2002:a0d:eb8d:0:b0:643:4c39:8388 with SMTP id
 00721157ae682-643ac0367b8mr98613057b3.45.1719410171388; Wed, 26 Jun 2024
 06:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144901.5236-1-oak@helsinkinet.fi>
In-Reply-To: <20240624144901.5236-1-oak@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:55:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeKvDOmLhkASRra18GapSjC_C1qumo0Du=_RSCx1UZpQ@mail.gmail.com>
Message-ID: <CAMuHMdXeKvDOmLhkASRra18GapSjC_C1qumo0Du=_RSCx1UZpQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: fix TT bootup freeze / unexpected (SCU)
 interrupt messages
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, 
	Christian Zietz <czietz@gmx.net>, =?UTF-8?Q?Nicolas_Pomar=C3=A8de?= <npomarede@corp.free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 4:49=E2=80=AFPM Eero Tamminen <oak@helsinkinet.fi> =
wrote:
> Avoid freeze on Atari TT / MegaSTe boot with continuous messages of:
>         unexpected interrupt from 112
>
> Which was due to VBL interrupt being enabled in SCU sys mask, but
> there being no handler for that any more.
>
> v2: commit description checkpatch fixes
>
> Fixes: 1fa0b29f3a43 ("fbdev: Kill Atari vblank cursor blinking")
>
> Tested-by: Christian Zietz <czietz@gmx.net>
>
> (Bug and fix were first verified on real Atari TT HW by Christian,
> this patch later on in Hatari emulator.)
>
> Reported-by: Nicolas Pomar=C3=A8de <npomarede@corp.free.fr>
> Closes: https://listengine.tuxfamily.org/lists.tuxfamily.org/hatari-devel=
/2024/06/msg00016.html
>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Link: https://lore.kernel.org/all/9aa793d7-82ed-4fbd-bce5-60810d8a9119@he=
lsinkinet.fi
>
> Signed-off-by: Eero Tamminen <oak@helsinkinet.fi>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.11.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
