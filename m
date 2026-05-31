Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F78E33AD9C
	for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780241853; cv=pass; b=JEosJZU31+JF62wwlXwa2UUUIFSVNeea2v9I8Tk1I/pQKEpkYaXag8Habe1FpWzZg1IWmdMTvN5Md5jnIxejQV9kxao2yQbXCAwRt+T6XWofQmsQvY4NodeHEDH6P7Xy1jjJlnsue2v/L4cGqf5DcaNhXbPEBYS0w2Q/WmhJiFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780241853; c=relaxed/simple;
	bh=gLdBtrcKSaf7Yhvs0o0oobST0TYT5VJgb+CJdLI89Js=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVadFzEX+I+xpZroL0eesiv7hXilzFbEuflVB5hqxnmWe6d/a0E+mEfF4MOHYJX1p9FuLIqnEQRUB2CkS8Fj3nu44Yci4E23O//k/MhZvhC1xZoNXAm+qYVKpO5hjfWILhZUuoZy/FJUBAaHDCmh0HOa7R9p3bmdiTXrrINKoVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YGnAbEok; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YGnAbEok"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebbc325000so95068966b.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 31 May 2026 08:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780241850; cv=none;
        d=google.com; s=arc-20240605;
        b=ANbpFgg0ULXRpEo9cr7mr4ndgP2DVUqMQ05hR5vkZauCbjx59AX8CLOjV/ZOZLIQu3
         nDlcvmY2BIdba0iBNSUvCfkXzKLHRUkopIdGYKIfepcwbHAvWsUtQQW9z7cRVZG1eqI7
         VUkcXn9gxnRPFPTKBGbVYT1cXRlQFq1c5ZeAatnOr7seGz24dfbxI2DUYAj88ofLKJEy
         cJk/e0Bsr08SdXF6Fiui5H4v43BidIk2Pv43Vk5f0IzbfXOiFDcrWin1S+ZSEiqtDa3k
         ZIwjIDNYvSPIbWThicuUNhSfHRBJJlW/hJMYvYg1BatWIJYu0t1lArXtHVp2/Vfz80lm
         tlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        fh=EILntQqyjz7m6fqWKq9qC8o/Tv+aSYTwQ2xQ7z6TH4w=;
        b=gEiwjRZbqKwpTkRFK3soemLoYpvRgzzqzRozrvSeV7FOFaUd4ERzu3stC5FWFxNcJS
         gWQmq0/DxlGV41qbhSRrtZgTy25kavE9n9aSo2c1tP8CMOXDeCQolXjUcw6xnyrTeJKD
         wFBAT170KkE6I/WpVVjWZxnuNS7kNbZwiifs7s9UPhJ2bM56l6rKS2eCjgRfCeQVo39E
         pKKFuVIbkIdRGpedWKKPelYR38MR21GAezKwfK2ypaSFoWR5LA8H0b2UIUzwgCIlM1/d
         qUKz2Fe5SCHqn3VZM8zy9fIvPN4Lxt81u1iDra6KoE2/kxoeTIM4hYBqGpNB9t3rKVOl
         Xntw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241850; x=1780846650; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        b=YGnAbEokbF5dFDEYhI04mzDkbiV/oFN6U5D8YNG/Vv3rypNWqCYEDqzsrR768l/yRP
         7G1DLG4BIWBUQqOHNaLtm+9ZF2wal6QWjHt4vCImtavznbuZwkzUOKBBe1/XTm/M86B8
         2zCc2A15HqNsGO9j90UEivV/r4xie37Oong3S4NhC0nkZ8Js8Cqu6sn8tLSiHjZh7wCL
         dYVuf6waMJEv5S9QsTk44+1Z1OOOszqfPe/9tTqkYlI8eS5SJ08TTz0N89Ud0VBdtsU3
         8pdJHxznl1BH8QP9Q7SFuIBP+RjvlN5LZ6m9SwXvWb1+dUFKBgrwF8I7/TNwTkiNsnqL
         tBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241850; x=1780846650;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsUy+RJZPWgLmpycwtIiUI71TrJ5IX3ekRu7ES5q5M0=;
        b=KUZVQ3HhFx8E11dQ5961UrUIs64UZdP2JR1fQvMmEdcNDVLuwZrtLtlzhRWdi0Hw/s
         mSAQcbdWxABW9Qvi5YebXYIiwOTePkFxOUoMB1DFfEwfwbxkW0CVv/n5EP0/9JW0u0Vg
         jQjYCg/wb/jC9wgPyNQd63ZQj0Renu/nml0yk8xAdlyr3iqB3QgKF+HOTdw40SHBCZnq
         gP9NlkXq5MsqV7acGqR89U/8SeOFSEALSAZulszUO3sEyVi+hr92h87sHC79Zs8gyl90
         br8PzYgReXJIs9DcytPCtX4e8c1B/vAcp8BdgtFl1uZuaSmcZerlVJ/uESRQ2v5dj8jt
         y73A==
X-Forwarded-Encrypted: i=1; AFNElJ9/BVdrSxebyq7dmPQR985t+WFpWI31ov6QZB3yg/J24X/XPovlr1RVSVUA8zrRJd9RVpGWsUd1rNcq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw6v1EtYmo2W4o6WC1txeS16Gaq5Zx8v5axCVFZvB+uc5AlN1RV
	YRMJpIXuHqRT5dJbISWUYBwwka/Ux7q7U/UV5AlHrUvSM+4sOtDkUALvMMI7+WokNkGV5DP2ZyJ
	b7gdZmnZVB78+DqxD3hsliEcSo3XS43RrRaVliHPi+w==
X-Gm-Gg: Acq92OGFLSSUn96G3ETBXsFT2OQZDpJTEU/6lHnQno53NvIt8dPHiNjbWwDtCmLJTPn
	PB8WsYx2PHMfRMmJhDkbOQQ2HKFciK3RsUgzpi/PTRifBs6m+U0T10jlZJatFKQiAYd/ITLhRPb
	V1oomOGO/ImQnzet00R/ug/BYW/Muf932xP1p9BpooiOo7YbZB45MmYs7bOXKG6iZy5a4Ca5Q3E
	N9Hd2KKbrljPROULd8oJa11gSqnopNqhh7n40E4jbSYI9jZcVl4OSeHouaeHnlLSTXUm8OF3wbH
	H4EUwgP2ZU1+yRsKfwRQC7Yx6YskBMW15jMdJEoZlUI8rQ8=
X-Received: by 2002:a17:907:1c0f:b0:bec:228e:26ea with SMTP id
 a640c23a62f3a-bec228e2c86mr154675966b.13.1780241850051; Sun, 31 May 2026
 08:37:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 31 May 2026 08:37:29 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Greg Ungerer <gerg@linux-m68k.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
 <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com> <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ecf346d5-a65f-4507-b277-40e75ae89442@linux-m68k.org>
Date: Sun, 31 May 2026 08:37:29 -0700
X-Gm-Features: AVHnY4KfVAiFLMBLt8OCHtOET5j_xWQ5bRSDD33gmCDJzuWhX0mLUD1pV9Eh9I4
Message-ID: <CALSJ-wAiLgFWStDtymqrysx=4ZFGgY+SjYC+wjiMifVKgW7QoQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sun, May 31, 2026 at 11:15:43PM +1000, Greg Ungerer wrote:
> Hi Angelo,
>
> On 23/5/26 07:20, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Later in this patchset, the mcf54415 DAC driver is added.
> > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > DACs (mcf54415/6/7/8).
> >
> > So updating DAC CLKDEDV_INIT with proper driver name.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> > Changes in v2:
> > - none
> > Changes in v3
> > - roll back clock names as they was originally
> > ---
> >   arch/m68k/coldfire/m5441x.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> > index 5b5e09ecf487..b02ca2eb55a4 100644
> > --- a/arch/m68k/coldfire/m5441x.c
> > +++ b/arch/m68k/coldfire/m5441x.c
> > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> >   	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> >   	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> >   	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > -	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > -	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > +	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > +	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
>
> I thought after the last discussion on this that we would not change these
> clock names?
>

sorry, seems i seen this comment just after sending v4.

As a change i rolled back original names in DEFINE_CLK as they was, "mcfdac".
While i cannot change these names above, from tests i did they must match with
the driver name or driver does not find the clock from his code.

Or am i missing something ?

> Regards
> Greg
>

Regards,
angelo

>
>
> >   	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> >   	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> >   	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
> >
>
