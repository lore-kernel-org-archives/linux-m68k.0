Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829934B669
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009103; cv=pass; b=NdDJ6x0NuJHJ3ZP+dUl+zBqlnVHlEfuRx0GUHyE1IiTfS6dNdBaXWw3JVV+4/EvG1IeerJWP7tIt949LYGsc+CaTPZOQIUEJECnVl3c8RQSUiGARAfeZpojQ3oTLORphnw9MPfIadDhCz0Is4lz0siqh90G4NHhwSu3rRMVpA4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009103; c=relaxed/simple;
	bh=9+gh0QigFMmNglFLKn5RyV4Y2hTZ1gkGy6kLSDD6tWU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=oUESsE53J003Xu+43xhlyTSGvN6A+/HUwgg/56RgnCfb2OkZeNSAIG7qbg9VGvxLgP4MPlPvmbgPl28DNN8Yn3RAhPz218VsP4Wiqf3/StNs4QuZ4HPzxCx6+hylSaUlrV6dqGM9d/0CmDdidB9W10BRg8hclG5cFBeTgfYeRZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=srGLcOrV; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="srGLcOrV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9382e59c0eso316669466b.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 02:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779009095; cv=none;
        d=google.com; s=arc-20240605;
        b=cL/+9n5WucND4w2kJJRmbLPGwAGYxOLGO9TS2mADTohngGwuOFH/itz/XnEiTXneQk
         7aG4qfoyb/qI+09Lkk7J2yHi8l2jUrsNh2RC3Vgf+BjvGXYZm4Oi5FqGJqfLqUdCh8Iu
         hix/zGKZWO79P+RbLTjR5mHpzOh071VxIUB6wzrHb/jn1mQHl2nsKPswk7IKRhxzeXxt
         nAg0fka6G9p4pPhNeHTtBIUM8C0P7drTj5tcrZyWHkU/txgDrS22dxhCjvpMf2YDwSOX
         3RakegznnZr4gK5pJbkZYzHkPSojTmhULpd69gruQSQ4kmgIleS0Z570FRsizxsedFDN
         9BjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
         :dkim-signature;
        bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
        fh=yinhRRt8YIiDBPZosv+3TF6zdM5p5DzhCJ9XOZ7ZxKc=;
        b=WLfEPS2Ds8f5xqeZGu7VwYxN3pb3gVj0rkdiRsJxRLaLOSMSX91Um3fs0IRnkmzMgt
         bXjP38/bDcc+LlghhF6VLToNdIfd/RsrqjXbznQZv/dOgJEXWEa478Ai8+htYhD7/Ib0
         lM5BNeQw59Y5V7pj34KwIS9QREbUSLCMxQISWKDe/kHsHmw3IcsAnZwqmZ51laDOr/D4
         PgHAOTMr8WCsCOV7z3ijLvcaS75e3LxEoQcTuzldCidjEC7WVSIWJuung4zxO9Qux1zD
         BFRB9H9X+dZKYPqCnNdgLqbDwhP6Zc2xLWjtqX5Jk5MS4G4eI+IyiWRzCHGO6HEfKhQS
         INfA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779009095; x=1779613895; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
        b=srGLcOrVoWHoDBDEg8MXPY6/+GYpx6Mam7yss535Fbvz1RgeXY8RI+xIdPaweLC974
         0JeRyiczOEVkMWsW84OAD6+hcw0nnRb6aSSiKz52Pg0zTXSUwjcmcrto7e/vg7KsKCue
         cwoCWXCHusH6xjzC/6qnxqPn3wFpPg8w+E7vL/bKJJhI1E/usjmHq91Htn3exZXaPV/g
         3HjgUvzU/oOPfTQ3EQSajHBDG/6BThKATNhFekVKDrw+uUiuWN9xubQQ1xBakp/yEx1h
         aZdo97gDFNAoYexLXIRFWvWqbi3P2OCxxfJgKZ/ozkBhrMMxPTK7qVSYatXmcOvh8iGe
         F+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009095; x=1779613895;
        h=cc:to:subject:message-id:date:mime-version:mail-followup-to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l422bOv2RS6ft7h5IAvQA7ommw1CO4QZZ8y5UOnu3r4=;
        b=PqliHV9XO/4bCvwOpkunNMll4z9V2vRF6FjCehFafTa2JsEP7bB/K0LqYBoWRTeIQ6
         9qbKzRyxDYEnt0SvKe6ytGWOd2e+vLiIDGAOA3Ricvfc3MNn3PmlRZG0esebYy+BUph6
         jfjEZT6aOedUZIecKUo4wvoP34VKUZ2DGVKaGMe4H5Lm/iczCAL5H3IqiVIP/Yord9gA
         vvmxMxVIj9ULVXAHwLONhVprus/1qdIIEf0Yuz4EjnCu4eIjPxo8cdf9/Fmm/hawy867
         j73F2G76PYj+mbxxWKkeAgHgxmAfg09L7YCM7z5r++5zdId8V28YUN9BAj5EPE5qxa75
         TN9A==
X-Forwarded-Encrypted: i=1; AFNElJ/DGCBc1s/qA+DOz6CtbrjjTqauv8nPR6AljYSDXjha1dRIN9/UXxMEQ9OmbisJqVp4G6UTjQkDSRs7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwurCNiG0S17/ETVx5rxR+25XaYxbOwBZBQJmpLAxhVdY0jWSc4
	p1XBFUVcOS24aguyw7CekvXHq+ExLi7OHMjupvs3saomMiHZEsVPQkq0X5b0njXzNey6iMbNF+q
	782kpap6wLCoFkYZg84PkbYZmw8of9V8c2Lb77hxGFQ==
X-Gm-Gg: Acq92OF/+a+adJ2nuzpMXSXhJlyINdm09Xq1SSqIgSg6u59z4ctRbq+t9VZiaKvrp6n
	4DJnubnHwuWGhPrOTQV5RuESDCJDzYprBHrx48q8uTBRkaXPfd9M9xFkvfTD/J1HAueyT01bi0C
	1Smai288EMH4OFBgUfDTyvAppwphVDzh7bytyWW3EG8twIlZW0FzTIUDlptBsm5FIfvOCtBFeWr
	jVvBr8p8CO4Ki1Vlwgds2Y0Mn2ejREFauHrV+brQQM/hI08g1QCg0g205jgkxUDXTe4LmR2YdAu
	g/fGX6YSJvz5Sy121HtX47IJS5NXFKX5mohs
X-Received: by 2002:a17:906:ee83:b0:bd4:d6d6:b4bc with SMTP id
 a640c23a62f3a-bd517909091mr528852666b.27.1779009094955; Sun, 17 May 2026
 02:11:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 02:11:33 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 02:11:33 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 17 May 2026 02:11:33 -0700
X-Gm-Features: AVHnY4LQJhW2f1YyqOOc8oHDFb0_rhPBBBuqz4UdC8WHi2UPdjOoJsNG-CwUBBU
Message-ID: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
	Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

jfyi, for some reason i was not in to/cc, but i could grab the message
in lore.

On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> Hi Angelo,
>
> On 14/5/26 17:05, Angelo Dureghello wrote:
> > Hi Greg,
> >
> > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > Hi Angelo,
> > >
> > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > >
> > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > DACs (mcf54415/6/7/8).
> > > >
> > > > So updating DAC clock names to bind with proper driver name.
> > >
> > > I am not sure I like naming the clocks here with a prefix for the
> > > specific SoC part number this is in. It might be unlikely now, but
> > > what if another ColdFire family SoC member uses this same hardware block?
> > > That is very common amongst other hardware blocks within the ColdFire
> > > family. Can we come up with a name more specific to just this type
> > > of DAC hardware block?
> > >
> >
> > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > this mcf45441x family. There are some ColdFire with ADC only, as those
> > mcf5249/53/82.
> > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > So, if i don't miss any existing model, the name may be correct,
> > unless we want rename it to a more generic mcf_dac.
>
> Yes, I would suggest just leaving it as is, "mcfdac".
> That is not currently used by any other ColdFire variants supported by
> the kernel.
>

Ok, will fix this in a v3, just asking confirmation on the name to
Jonathan and all, since it involves iio too.

Chaches are:
mcfdac
mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)

Regards,
angelo

> Regards
> Greg
>
>



>
> > > Regards
> > > Greg
> > >
> > >
> >
> > Regards,
> > angelo
> > >
> > >
> > > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > > > ---
> > > >    arch/m68k/coldfire/m5441x.c | 8 ++++----
> > > >    1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > > > index 5b5e09ecf487..b724d7fc1a08 100644
> > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > >    	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > >    	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > >    	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > >    	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > >    	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > >    	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> > > >
> > >
>
>
