Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D930D3F4
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2026 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534337; cv=none; b=fqGmq2QtKyXG4NamV3RcgvMAYJ2cHMCQd5FgcUmd3X9SOqnoaZRttlKMubpdT/IXHLsp4JP1o6uMcm09WrdgX8ogwLGscgicStT/utd16MUUFGAFrb60SaOCL/4SSC+pvKjxCLrJtp/ulp7fixBvfrl+08eEBrlcZUH8RJhjtfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534337; c=relaxed/simple;
	bh=ltC+ZVEYlSTfRZBVW8lQfxANGwyJT0GhDLBO3X538Qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHFpmuUedoV93gApb4jrB6nTaCnlFv9xjzrN5CMezUkP3CejeOilXrpbUJ0w59/wnHfGz1g9HghOcja6466NXoJw+OcM0X+4G7TQJbvMn7CLQ4wYZKkVrkYvh76Nfg/y3JGYYKPdo5WK3N3kekegUd67bs5diiQMpwW/+XYlUis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso287856e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2026 04:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534335; x=1787139135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltt4dRZHOGk9kpthkHmWwYFyCokHwgfUAZZMRKLanCk=;
        b=rZN2tdKZ/7SLbkZGP4LwqiyltNkwTD41yH7R2yJz6CZDyzxgk02AT2FgkDZab7nxlw
         YPPdDED99lEkDbKIDGSrmUcBQl/GeBKF+CnUcV1iKvlUakfjOYVaMyVudeoKXb1KmQ+N
         VKSj1pqL6DqLUqWMNqlopTKF5+NXtXWmn+bUsiK723G6qjJ7tYAwluxGPoBvPZFFWc+P
         9qQ+rOKglqQdUkDjX8ZO/kmG+aRcRhtjXOAEJuzER9VVHBiTo9rVprjYjCeGA+xMtx1p
         scpvfozeKWlwjf4mqQ3sU1tyYknOfgGZSTcsEj49VQyXPDRpuBK4obuThZTbjfIHOfXC
         2VLA==
X-Forwarded-Encrypted: i=1; AHgh+Ro52dmAWaWgdMvpKlmaspvRShsmRFMQVOzP81SHc6INyBX5xlpJ8JRSnsWQ+CkBBKYqd03XL8+6RUCS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyxaRtpQQYZT7cP5/EkethG4oSyTYkhoEHLFJLwE0G6jMAe4sUR
	02k/X/ebIcq3SeGFfcSXPbGcQEhN2KdjgTElzMoMi9/jl2k8ZQJYjIOjAjWqBEt+
X-Gm-Gg: AR+sD11i5B9RYBrSqBUX8mgYXeeKA8pT7AdASUMIMxMVq5z8pvyQ56rQUqcvP8ZZnaw
	TGAtgPJX/z5DTWkEYjWH5K6yhePcOrxwrJE66NMz3ErVAVRrJGZw/N+6hG0byQ4WqJVJdb6q1S4
	73Oc46uXsQpIF6N8vJWargqHW9I3SrxDQ/rIyE/bqg0kVwagTN/6hOjTKXZ90XkUggEPINXiCLh
	04UzmLSOtDAXNbfIiHtp9eTyiXfK0wrOi9kqu1sBJ2grEiWxKj7uBKgRoGjUFg/dWPdnt/hII5Y
	CsRwlY9jfxcpIYlxZ0wOmK3xKU/yZnzvJ0+hcdwIg1h9For4ejzx11rcCQeEvs9XsGphFoMcf/p
	/SKuSRpc0Cwh8hVLfCIxQBXnz5QxDPQTWMmaYyWDP4/J5C9HhE4zQPtbXsM7+ZeBx1WvFROC5BX
	JFcVJ6hqb4WJgrKd1RVdtHs0hNZuTwppxiJD5RFJwsxT9+bDcWXWQG/afkxGwNyJVwmIuY5Y44J
	RAkWpX/vGQivq5M7cH2Fft9wQ==
X-Received: by 2002:a05:6102:4189:b0:739:478b:5bf2 with SMTP id ada2fe7eead31-76c8ab681camr750701137.13.1786534334273;
        Wed, 12 Aug 2026 04:32:14 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76caf5b6c49sm527219137.5.2026.08.12.04.32.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:32:13 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso215111241.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2026 04:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorDi0tXjWLaO5I0p9zqMFbBYqkVA+oyUMPnTLmsflWome1Nd8B2+4XOcFA4QH+S/CZDRpASidWPdEp@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1625:b0:728:53be:7c87 with SMTP id
 ada2fe7eead31-76c88d5f8femr821356137.7.1786534333253; Wed, 12 Aug 2026
 04:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094950.1988084-2-ukleinek@kernel.org> <CAMuHMdVGKX=3cfOrLWp1uSHX76xf1-=C0+GVCXkA8JTqNPg-ew@mail.gmail.com>
 <anBXIAqwllKX-Sxx@monoceros>
In-Reply-To: <anBXIAqwllKX-Sxx@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:32:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6T0yu2NrFWCwe7QKmDYgY9u-sv21S=2r6jyb5j-=1FQ@mail.gmail.com>
X-Gm-Features: AUfX_mzIg1N0z0vWWVyOFkLiFRp6xgwyikGRaLQczOJ4kWtb1pQ8OuOz0PaUMf8
Message-ID: <CAMuHMdV6T0yu2NrFWCwe7QKmDYgY9u-sv21S=2r6jyb5j-=1FQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Define NR_CPUS to 1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Gao Xiang <xiang@kernel.org>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Aug 2026 at 10:56, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> wr=
ote:
> On Mon, Aug 03, 2026 at 09:58:14AM +0200, Geert Uytterhoeven wrote:
> > On Fri, 31 Jul 2026 at 11:50, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.or=
g> wrote:
> > > This fixes a Kconfig warning
> > >
> > >         fs/erofs/Kconfig:137:warning: range is invalid
> > >
> > > which originates from EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS using
> > > NR_CPUS which up to now didn't exist for ARCH=3Dm68k. All other
> > > architectures define this symbol, so fix the outlier.
> >
> > Apart from the Kconfig warning, this also
> >   1. Breaks pressing "ENTER" in "make oldconfig" to apply a sensible
> >      default value, just repeating the question ad infinitum instead
> >      (the default is 16),
> >   2. "make olddefconfig" sets it to literal NR_CPUS, which is invalid, =
too.
> >
> > > Fixes: c9b47e6b2311 ("erofs: cap LZMA stream pool size")
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> >
> > > --- a/arch/m68k/Kconfig.cpu
> > > +++ b/arch/m68k/Kconfig.cpu
> > > @@ -549,6 +549,10 @@ config CACHE_COPYBACK
> > >  endchoice
> > >  endif # HAVE_CACHE_CB
> > >
> > > +config NR_CPUS
> > > +       int
> > > +       default "1"
> >
> > While this does fix the issues on m68k, I don't think this is the
> > right fix:
> >   - NR_CPUS depends on SMP on most architectures, so you do not get
> >      the "range is invalid" warning on non-SMP, but NR_CPUS is zero.
> >     Hence I managed to reproduce the two issues above (albeit 2 with
> >     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0) with a non-SMP
> >     ARM config.
> >   - Kconfig logic using NR_CPUS typically includes a check for SMP, too=
.
> >
> > So I think EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS should be fixed
> > instead.
>
> Agreed, probably it should depend on SMP, too.

Since the underlying issue can be fixed by depending on SMP, but the
warning would still be there[1], I decided to bite the bullet and take
your patch as a fix for v7.2.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2.

[1] https://lore.kernel.org/CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXU=
JM-Q@mail.gmail.com

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
