Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69932B131
	for <linux-m68k@lists.linux-m68k.org>; Fri,  4 Sep 2026 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553612; cv=pass; b=DK2QZQejwFDTpv21eDCtm8F4gBJSij6PbEY0DpggqlJSX0hO9ug7H7FhhtMcb9Fb4/VN/s5w5NEn8WeV8m0RyZO6eGWirWnxB0EOwNGJmcTNuw95N0w9ekAYPpCOmO4s/lJLIsqmuBLDe7AUuyp5c/SKemvikMPHSYo4bYjGyQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553612; c=relaxed/simple;
	bh=apsCJPAEvIxcNPrv06lf8gEHanZVwcDw0wrGmMSJ0Og=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESNnUmEehfTCAsiQsHfTi1d3zOcDjuZs0ws1e+JDtPdY/mI9saSiEuOV8C1f2/MczRE2itecL1vMuaxwG0I6XJypTZMN2Fva2b8WCOBIyX2OKeZzTAmvrqAeucKNrNnYVU+Ax1es2SAgpLTHwM0HObNU6aL0Vok5fYtWcm/WEuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Dy6XiRzZ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Dy6XiRzZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2531f453eeso195764266b.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 04 Sep 2026 13:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788553606; cv=none;
        d=google.com; s=arc-20260327;
        b=r7vbr3j7/hGN+0RcF9RX+EPnQX5/ztESPje5PDYr5yK+89hFJm3iA7kz/lZNGEE99o
         5CV4lBdsJMn4rwO1lR5XOBTuvLwiVL6Zcr2PjZgyNQwyhH3RaaZnF1VU9mRqrYf6KM4z
         OLTpYw/xXwetBNjEzQJYDQuY0lV7iMEdbG4tcY2j+PNG25NQARW1yG00SMtrT0I8dfwd
         4vC12o45SJJ3d6lCifO5A6xLXcKNbNT3cIhSWqJJkaZ5K+wP9g3qTzkJNQuk5RoqanMJ
         FIVEbaVmVWPDlfOCzzxIbxcpSXh2aYNhSV3Hn1wWPtkdk+NXxowbKIPTSalQ28COiI1i
         CcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        fh=sP5Z5vfwhkPTMnvjs1/aqEht6+C68lYGAY00AZvWPgs=;
        b=SLiZhlbCrJNgAKrsYUNLvZaVm4InwUQARdFhbkSi72pj7ZpyJC6UVVuAZMcUC5w/rc
         iFBnd6j/gO3gLFNHLZlaAvOHMHa6YS75DCP3HkmJbmRB31Q0eQXkeRuj6MubJR7otQud
         zQog4NQ9EmX16p/AaNpsgPtQUowoT6gUXrml/4GjCaPT2AXWFi7l3uPJFFQSNuBqeIyL
         Ki7vc2+ToGw58mbbee3wis9VCRjr9bP6zgtF9QWniNh1+Q8IXppFMp3Sn8So9fa+8MQW
         qm4+7mPphI0/XIqj2c7fzFk+s6Lag8Oe2czw+RJBjLtfyiUavLMI2gWcpAW4VV4nYsNO
         7qYg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788553606; x=1789158406; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        b=Dy6XiRzZ9Hv8vYlrpMbLB5MOpRYj2O47OeQYFwrnty+4+XLJe6JqWVhqLSYo3D9aa1
         ZL61trPrVN8EHO9/Z01W6OxVXzVvovUlXrkbgQsdcEV+EDPULPps8cYr5WyK/Y5sIt+L
         fpArwZNpo6P517nV0GsqU8B0Nquu7pd4tvJTuP74HeHHx3NNaMdKYxhgq5JfL8Q9NZhU
         JEU8qGzTLngYD6O8yUVwb7rONhORIJuBTFyoZtAo6ITU24QpGL1qxUSFgWb448A3m36L
         fo5/r6cPreY+VnnBMxGh8Gu6bAPEOB9XH941fCOEgbab5ssLrcIJ5lOQzrTmS50BkH49
         1NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553606; x=1789158406;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        b=nFHsg3zx0TYodlIeLSojFy1ask26bIZeE0TVA34DPFazbQ6ocHRvX4gOks6Pl2FGcd
         pBSV/6tHUd7UlppYsClh32ysuOIWSPlEiGyyMKndsBOgLGt8CUruUcvpV4Fsn/3xrKJo
         nHxbP/Yc0m98jPypZmBIsDu9mzWvjb7a4/dz5SkZR6g01Xus16hx0G+CeBwU0mTlyKWn
         Wykf6BK65S4x2ZGAN3/qBPqA8DCw6vUhiLjWWWGjFTGsNTZgglUH4QENKBaxvXQd4Cq7
         BDVsJNq8HBbatzfvg6SJWOmT6VQOMmJLpUTPrs0UZL0h4q63DX3s4+jT125HNs1/5Ew7
         IbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS49rG+vXhOSX7EZgBBIHVEyRH38Zb30qu8Z+t+ggLuTRtnOgm25X+pLvUuBwQakGxGbibDZseOMmq@lists.linux-m68k.org
X-Gm-Message-State: AFuF++kPTfecIzraHp8rPwaXNMh8v94NkV3UgEhu65SM205FWiqqw0SC
	IJRYY2MS7+A36kzxmPt5jOWpV2/xs6KZ8QX7yYWintyOI3cxTZuMJ2bCoEgutyAK8mQzdiEl8Z+
	7Yp8kRYs90486Aq2eH5Ocgc8d6QjCTXLrQbS4SU123w==
X-Gm-Gg: AYBFou2D2K++0zimFLCQNrX2aRvDhctYlkkaA21E5b73hYg28o8GiiwBGjHLvnzhXts
	lNIfCMOK5Eo7NhlJsd9yhfK1hvsO1jgA9JP/EbnGwfqch23oupUzWhsrgTjfWXTqBi1CK39ZVMm
	frBgZuU/SvruMHKebxTa/tP2spqdRUHHWJeCYRTnzyEp5E54ULWDDmYNFbquqeBdSP31zqMhD+1
	pdzVjR9mtHEPNEBsfOix44q9jsvuI31kD1JYO4m9Wx064BRURq+4TwwuRq90uogRoHzUOgXeSPL
	As2AlWX/oxJzK+fAh2Y53znEZKArcHAIMCaMayfjTQ==
X-Received: by 2002:a17:906:ba82:b0:c19:5572:d234 with SMTP id
 a640c23a62f3a-c260c6a0ea0mr658955066b.1.1788553605796; Fri, 04 Sep 2026
 13:26:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Sep 2026 15:26:45 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Sep 2026 15:26:45 -0500
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org> <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
 <Z5h70TL6lSWzGA4f@infradead.org> <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
 <Z5h9ZySKFwHRjg0O@infradead.org> <44398a86-cf85-4c7b-85f1-de9beedc72fc@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <44398a86-cf85-4c7b-85f1-de9beedc72fc@yoseli.org>
Date: Fri, 4 Sep 2026 15:26:45 -0500
X-Gm-Features: AcwNN1UeHDiIoMnhpwFKK6XEr1ozLUIj6HzYctMfqmwrWSoz_rKyl2uviZtEeDg
Message-ID: <CALSJ-wBWQQMWnex9=bhdtdg1QM4KJ6eRvHNOi54ZtTfznQ8SjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire M5441x
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Muchel and all,

just asking if this job is in progress, since i have the same
dspi issue open, and need dma eventually for other drivers.

I can eventually help on this, i have hardware for testing.

On Wed, Jan 29, 2025 at 08:32:52AM +0100, Jean-Michel Hautbois wrote:
> Hi Christoph,
>
> On 28/01/2025 07:47, Christoph Hellwig wrote:
> > On Tue, Jan 28, 2025 at 07:43:23AM +0100, Jean-Michel Hautbois wrote:
> > > > It really should not be hard.  The dynamic mappings already work fine
> > > > as m68k is using the generic code.  So the only thing you want is
> > > > to dip into the glonal pool for coherent allocations. For that you
> > > > need to select the DMA_GLOBAL_POOL config option and fill the pool
> > > > with dma_init_global_coherent().
> > > >
> > >
> > > Isn't it done in patch 1/2 ? Or did I miss something ?
> >
> > The point is that this is all you need.  No need for new dma ops.
> >
>
> Indeed, I tested it and it works fine.
> I have removed the test in fec_main to be certain, but I think it would be
> better to change the COLDFIRE_COHERENT_DMA conditional ?
> What sounds like the most efficient way ?
> I can' do:
>
> - #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
> + #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA) &&
> !defined(CONFIG_DMA_GLOBAL_POOL)
>
> I suppose it would be better to modify it in the Kconfig, but I can't find a
> nice way to do it without having a circular dependency:
> arch/m68k/Kconfig.cpu
> @@ -555,6 +555,7 @@ config COLDFIRE_COHERENT_DMA
>         default y
>         depends on COLDFIRE
>         depends on !HAVE_CACHE_CB && !CACHE_D && !CACHE_BOTH
> +       depends on DMA_GLOBAL_POOL
>
> =>
> error: recursive dependency detected!
>         symbol DMA_DIRECT_REMAP is selected by M68K_NONCOHERENT_DMA
>         symbol M68K_NONCOHERENT_DMA depends on COLDFIRE_COHERENT_DMA
>         symbol COLDFIRE_COHERENT_DMA depends on DMA_GLOBAL_POOL
>         symbol DMA_GLOBAL_POOL depends on DMA_DIRECT_REMAP
>
>
> I will send a v2 with the global pool.
>
> Thanks !
> JM
>
>
Regards,
angelo

>
