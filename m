Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5533149C44
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714146156; cv=none; b=PJFjVZanj2Pj2F6zEg0ItnScAc35u3/TbR8632hOlijTv0TZrAAD28cEcyTU+QpYLuAcGS72vHrqEyp7yODYcr6otGEzsr+ctt2wsMEJ9yWzsib1D9yyhgmye+h/dVMlDCt4B4cxJcSn1E5EMlR/WV8R53+lD0CdeSBdYjaK5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714146156; c=relaxed/simple;
	bh=qpHQbn/SaC7jqpgIryzZAJsu+nyqrNFAaLzGRqyiHlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMJgM2X7VZpIZyuK4LsMTw0UXcbX3ybFU4/U7ChIlf1qi6JgEwh66d2AFmBHG7vv/+yDaHi8WrCELJQE/+RCxpjdxOqdTTivMJze1fgpypyKiD6310h1B7J16OirdvZZCkXKwWPGY0vXT0XS0/kZqA7oQamxrzOTtK4Cyw5abcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61b62005f38so23349217b3.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 08:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146153; x=1714750953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMcWRPznuA01PMZZ+lXGraQ9C1TAJ99gzxX5MPtCffc=;
        b=FN/rxB9GGCtquN3ZCBjrU/xsLAj0WKgXRUUv2aisYusLrDGG3gvfbBy280fxzNjs/H
         e3I0pg/lFMybdXMFykRm4vsf8GfkHbFu17tK2DvGjaLeTLY7YGcxjltsZjFuBOPmNKsv
         jMcGx6WwDMT5+e9qvsUoFtCVUvEhchvZowBdLLNNNk1x4kvrNzdHUj4Gx9MfhOpK/+vk
         Jy9HHSbCKnYJkkoA3TCWI8GxhPlEGcUJhj1frDkahddhSbKF3wx+JRclx6qOUtoSYpxi
         i1OmrXK2/ltGTns6Mrrh1hvxebCCM+gFolMyylSZyGBPcAgdlDxJFc9Pl71oX2NpOl+i
         15GA==
X-Gm-Message-State: AOJu0YyiLvxyu+dj0iRdeZLRXozarwbXUpBnOgsw0zGPMfzadZCMkINj
	LrSHBNzFd0PuIn8T4neVqErhRReVL1oiY9A1Ea344j54arokamqxE6drM1JB
X-Google-Smtp-Source: AGHT+IF6xioBS35HFxWmCtT38p7lDoGitoMmHDWE7ayJijAfeFxAU9FdwuVw+DcEAChjLMIk+dLmFg==
X-Received: by 2002:a05:690c:25c8:b0:61a:b54d:5925 with SMTP id dv8-20020a05690c25c800b0061ab54d5925mr3092344ywb.38.1714146153274;
        Fri, 26 Apr 2024 08:42:33 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id bt18-20020a05690c073200b0061248f16528sm4002143ywb.66.2024.04.26.08.42.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 08:42:33 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de56d4bb72bso2695348276.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 08:42:33 -0700 (PDT)
X-Received: by 2002:a25:86c2:0:b0:de4:7603:e888 with SMTP id
 y2-20020a2586c2000000b00de47603e888mr3266319ybm.29.1714146152923; Fri, 26 Apr
 2024 08:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230831121623.36293-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdVoDDV-VgPJL75u_t3KeAPhb1xEFX2VigVC3oS51pG6wA@mail.gmail.com> <ZivJKZ8Pp_bfLcvO@smile.fi.intel.com>
In-Reply-To: <ZivJKZ8Pp_bfLcvO@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Apr 2024 17:42:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsYdPnFD_LEdDez7JXYdh67DPoc2GhLNv29B6=65u6+g@mail.gmail.com>
Message-ID: <CAMuHMdVsYdPnFD_LEdDez7JXYdh67DPoc2GhLNv29B6=65u6+g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] zorro: Use helpers from ioport.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Apr 26, 2024 at 5:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Sep 04, 2023 at 11:31:03AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 31, 2023 at 2:16=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > We can use the DEFINE_RES_MEM_NAMED() macro and resource_contains() h=
elper
> > > instead of reimplementing them in the code. No functional change inte=
nded.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/zorro/zorro.c
> > > +++ b/drivers/zorro/zorro.c
> > > @@ -117,17 +117,13 @@ static struct resource __init *zorro_find_paren=
t_resource(
> > >         int i;
> > >
> > >         for (i =3D 0; i < bridge->num_resources; i++) {
> > > -               struct resource *r =3D &bridge->resource[i];
> > > -
> > > -               if (zorro_resource_start(z) >=3D r->start &&
> > > -                   zorro_resource_end(z) <=3D r->end)
> > > -                       return r;
> > > +               if (resource_contains(&bridge->resource[i], &z->resou=
rce)
> >
> > Missing closing parenthesis. What happened to your cross-compiler?
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k for-v6.7 branch, with the above fixed.
>
> Seems never got queued, should I send a v2 with the above fixed?

Oops, will queue in the m68k tree for v6.10.
No need to resend, I still have a fixed copy in my local tree.

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
