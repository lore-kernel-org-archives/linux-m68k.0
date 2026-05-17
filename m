Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CF283FC4
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038578; cv=pass; b=UR4duzT/1Hl5ifz7rr96qKxjJt8kzmAKT78oyBBf4N9RJtdSTBEVzOqRXVDchIgwg+2g+PcdrYSO+R84Cyg9LUjVMbkoBt8NWrQCMT23tyKOsRVoo7Ohcze+JIAYykT1iLhIOBSSbt37kOZLL+NMKetgwwzHm/1TyO0YKMCl/Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038578; c=relaxed/simple;
	bh=9fkNUobK9tqmFCI1XWvGAdvhDFf8Vke0+JZv3ZM2vQo=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sgtc4FlCcwMBDCFvt20NV57bh7gkVklfzQcvg/HrPq0j1lfIgapRgWdHbZIlICLckf5dHJNAQ53ZWl1V1+S82zkMuUNH8HUmYBGbCIPe81ulE75dIhf6YtcaR/a6bcg7HMKqHAIydpS0YJzOUxEOtJrwGWO5hZVnxzpIBCP+wbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=vNkaMqAR; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="vNkaMqAR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bb91b426e40so323352866b.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 10:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038575; cv=none;
        d=google.com; s=arc-20240605;
        b=CypBaL1dqQoIO0Fh6NHYwy7vGJqiEFfw7Fi2jD05LIZv+AkRGQtjKDURdPTj4nZ6lr
         D3yEfWsD7VhVcq1/CLN8mVwHiilmJUDVd6NoLNW06EGGWOtlCCHRYQ6GzSv9ZLRhvFkr
         Ja3riF7T4ZIERzrH/cfEeWVZ3Z3FH4ZbkNAmelv5iLlQCWiJcUHdr29bTWLkvuQZU3Kv
         3s1vxhf1iHNKvIRA64ZdU/GN36urqJY8Cxip+WvU9D6gWw1DQ7ZS0zGbCUSnJ4sn+V6L
         kpMmfWQh5fdVcJchhup2BLsbF/A9p6B02Tg9ayLOCIu30PlIBY3UQsxy1WGpjeSLlDZ6
         BBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        fh=tnqMrsAq82vpB1hhvRLLOVy39VJBzzz01eL8av2C8PA=;
        b=POdTP8QlxCVXEObNDnXbNw6wIJGlis03FnvYgWYWKSkWz6SiF7imXZ1XRvSvS8DiSt
         xqP30vZMUS8oVqYdqTlrO+tw+moXk7H61eQUpB7w7Woe77DgqhHAI2WkEYnvKAS4anAI
         LeW6nEvBLmthSpDSbCDNMQjU9UiSCZs5WZN9cxKqAlj06aC51yUO1ONyMDJMDxpV4DFQ
         Yp3ZH+O1I18HTJ6+sfsXsMWH/j4J5DxCplfMF0yzJQ0VkkA7KS6aruvl4IFbTJHYPl/0
         7BvimlkN+lPe3p3u8WH1No+sAHMBeoFWofQmJ9Q7F+GuKxHDM8fV9/0IZpzhIZKHKvOF
         qooA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779038575; x=1779643375; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        b=vNkaMqAR4z0NZKWJ1+51X5O5CTRo4g++D/QveV4HmZMi5mKM70m2jC6Q5Rn34rnUZe
         DKCG0jHEvVDehjpzT24X60Y+L8zJbPDc0E4a/TZGTCqsAcaa3EMqjejPh2X+pDUdgAn6
         evsix/aCMnkp9MGjtNWnijJYp1x+JpQwUsWC/VgjUo9UTolTn3dleV8WdANZe2G1XfsF
         ss1CvY4ZvVrzoYOp3LoHgzrr0SbYjPXEW2q3VfaVyVTsvIV5hhS/Dv+AsVk++G6hmMXW
         oDhRk2IHTz0s0ZwgPv1lmDc9mYe/4RsILM4FvkkHqMmU2TLP62mmn5K9sU0+CfcsTpJx
         tX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038575; x=1779643375;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BLmdCKMgbw8MBhwcDBHMbfL3wvck7U926c1rh+9BXmI=;
        b=mqck0y/OFhX+tz9H7VhxIERi7DJTC51R5MV2GwsZJNk8TUUzmzI4peJWq+2bxyh3lD
         W7KW3D00r3z8ZGKqINxfQpwr0hf1bgZe8MNxFWHgCCJ57Y2V0I1tVm/d9ECy5McqJZLl
         txlj75XzIqyS2JMRUE2yUlsM/QkE5mbepox8pvoZawrXoYjVtN8riSmUJtl80CmfL5aI
         WLUx2YNvpJeXTo+pFkZDk2lCd/qflZ4aYg7o4A2lsOplyLTM0U8yIN0/jYQYe+udRpIX
         x79FxArgts1RoMgW2AXL6JZ22TdgtkAwhbGcPJ52hdaI6enQND4xxog44yWBoNAZlrof
         jyow==
X-Forwarded-Encrypted: i=1; AFNElJ8BjT8dmLqPIe7ODbsQjhNUyjlYrrAROi5dj7HAPZZSgmeAf/TcOsOIOXfrSRL3Ayih37iyzNbtZJs9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzaqhjiHpVu28zMJc2ed9I5nEkNuJU01s37rm7/WDv1/P/3U1OC
	LWSaJAH8JiJCyHEWKJjBz2Xy/bAoE9qG07GkG+DebpUAsMYJBzHqZcbi+cKU5YhKGHxo9dd7Epr
	tM1E4QewSD+3mDQf6YhtHZPKQapx+X6cXc1xC4FH0Ng==
X-Gm-Gg: Acq92OHyf/5UEMwZkv8o2+rOK1lCYqmRpYWS51rOePhDbY9nWQiK0vJmhsKAArwCnrt
	k7ntoHos/Kc2i9kiLhKNvRfnhE9v3xfZpWSZDrYN4KCW1TqYXv80c5Z/ONAZWerXRXUyocJKr5R
	3+6IuMxvEtp0T157m5m69jyfirgZsiwmkpCzBLOH49W0iUdvsEAZw7OW8R0AaZf7MSO0Uq9t9Xu
	a3lQ7YmEmlUSXL9Pv4sOlBCTo/tkwOS63R9C3VHv7NL/mnRkAn6I765xS0eEk3374dqIGeRzK5J
	fwIHxdW/S3PxeMu6DGU4XkaBikGNATLzTmrm
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr564439666b.29.1779038574485; Sun, 17 May 2026
 10:22:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 10:22:53 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Steven King <sfking@fdwdc.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <CALSJ-wAqFni+OwSUcQS+KESfe7SbWMxc0aCURHtTZ93Rx6GZhw@mail.gmail.com>
 <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUMvoODD4huxqPb+Hj6Rdid1cSgvzuJdqvg_hRzviyFuA@mail.gmail.com>
Date: Sun, 17 May 2026 10:22:53 -0700
X-Gm-Features: AVHnY4LXmzt2FYulHGvc5U-cYyRCzVXS4ho7o5lb3LZyGzYNxvZblCBbDnNF3UY
Message-ID: <CALSJ-wAX_dBYYzLPOPxKZXQQPFQXhW0Oad6FezdZE2bXWfaBcA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] m68k: mcf5441x: setup DAC clock name as per
 driver name
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Steven King <sfking@fdwdc.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, May 17, 2026 at 01:45:44PM +0200, Geert Uytterhoeven wrote:
> Hi Angelo,
>
> There's something wrong with "Mail-Followup-To:", which lists everyone,
> except for you...
>
> On Sun, 17 May 2026 at 11:11, Angelo Dureghello
> <adureghello@baylibre.com> wrote:
> > jfyi, for some reason i was not in to/cc, but i could grab the message
> > in lore.
>
> Might be related...
>

yes, imported the raw msg from lore but was not allowed to send from
lieer, so i removed In-Reply-To:, anyway, thread seems back ok now.

> > On Thu, May 14, 2026 at 10:54:32PM +1000, Greg Ungerer wrote:
> > > On 14/5/26 17:05, Angelo Dureghello wrote:
> > > > On 14.05.2026 11:27, Greg Ungerer wrote:
> > > > > On 13/5/26 19:14, Angelo Dureghello wrote:
> > > > > > From: Angelo Dureghello <adureghello@baylibre.com>
> > > > > >
> > > > > > Later in this patchset, the mcf54415 DAC driver is added.
> > > > > > Considering some other different ColdFire cpu DACs exists, the DAC driver
> > > > > > is named as "mcf54415_dac", related to the mcf5441x family SoCs with
> > > > > > DACs (mcf54415/6/7/8).
> > > > > >
> > > > > > So updating DAC clock names to bind with proper driver name.
> > > > >
> > > > > I am not sure I like naming the clocks here with a prefix for the
> > > > > specific SoC part number this is in. It might be unlikely now, but
> > > > > what if another ColdFire family SoC member uses this same hardware block?
> > > > > That is very common amongst other hardware blocks within the ColdFire
> > > > > family. Can we come up with a name more specific to just this type
> > > > > of DAC hardware block?
> > > > >
> > > >
> > > > from a brief study, this 12bit DAC, and DAC module in general, is only on
> > > > this mcf45441x family. There are some ColdFire with ADC only, as those
> > > > mcf5249/53/82.
> > > > The mcf51mm/ag/je are the opnly to have a 5bit dacs, but these are mcus.
> > > > So, if i don't miss any existing model, the name may be correct,
> > > > unless we want rename it to a more generic mcf_dac.
> > >
> > > Yes, I would suggest just leaving it as is, "mcfdac".
> > > That is not currently used by any other ColdFire variants supported by
> > > the kernel.
> > >
> >
> > Ok, will fix this in a v3, just asking confirmation on the name to
> > Jonathan and all, since it involves iio too.
> >
> > Chaches are:
> > mcfdac
> > mcf-dac  or mcf_dac (we have drivers as vf610_dac and cio-dac)
>
> The clock names in arch/m68k/coldfire/m5441x.c are the names as
> specified by the producer side, not by the consumer side.

yes sorry, i confused DEFINE_CLK with CLKDEV_INIT where the driver name
must be set.

So sure, thanks, fixing clock names back as mcfdac in v3.

>
> > > > > > --- a/arch/m68k/coldfire/m5441x.c
> > > > > > +++ b/arch/m68k/coldfire/m5441x.c
> > > > > > @@ -43,8 +43,8 @@ DEFINE_CLK(0, "mcfpit.2", 34, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
> > > > > >    DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
> > > > > > -DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.0", 38, MCF_CLK);
> > > > > > +DEFINE_CLK(0, "mcf54415_dac.1", 39, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
> > > > > >    DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
> > > > > > @@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
> > > > > >         CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
> > > > > >         CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
> > > > > >         CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
> > > > > > -       CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
> > > > > > -       CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
> > > > > > +       CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
> > > > > >         CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
> > > > > >         CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
> > > > > >         CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

Regards,
angelo

> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
