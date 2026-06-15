Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B9330328
	for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522428; cv=pass; b=NISaz5FoNCzb0nYMwz8M8aq6c7QvN5WVLRjx/ls2muUgjVKv/Sd0L5NYeXIsAhhMEF5xpuuLdLQaEriHBqkzPX4CH1LRStdwcA7FqZ8hWaDaXYsWa/r5EovR04jOGK2OcwaBB4L4aCg9RbUPXahFYvrXbawlwQaxwsG/bFyTv9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522428; c=relaxed/simple;
	bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+K1bwEoaiYP4iMxyw0TWXPl7nRki/LDrLzPZ7k3o38R+ihwy52fE+K9Sc+SA/2hFwDjz8iAP9fTH/JU55P7P+g2BLKTmhcHqnjEUUbhB2diezmQG6TapFn/KRH222DpmPlr503NTjjaUCIGbweYx7Ku+liYeRIYi8fE0aERZ4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qpt5YRVv; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qpt5YRVv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-beb1bee8c16so351693666b.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2026 04:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781522424; cv=none;
        d=google.com; s=arc-20240605;
        b=TrzSVXc2HXeaI45uKKYrK4tK/+1XC1OgvCCQZP2LG30nR5UIrbnAdLk0XR4ej82nAb
         cXhYajxud1HOrlIL9MfCoDEZCYfEGIh/2mOWDPrFAaljLSys2IFnq8nCsDOVTuv7Qyjj
         PNBpF5qdt8bJCAbgyvC9Gd+dXdG6tzbvEorH0svwbI50i7+9MLPedUBoAbZoQpZQt6fc
         siHp2ySEcaS5A7ppXVu/YQ3x7602Wu3eG6LvxjgSv8nNRq/ks3PQe4GqqQbmrI+dPs6J
         VQLQqUGqgyXq8NNPWFjXyj5NeFV/UGsE5oM5zFx1yoDtFlVRMGabnB1dq+HzQixz5bFU
         AHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:dkim-signature;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        fh=L2tyJWHXizYBHPdNsHVu5u4pZihHPayZR+nzSoQDABE=;
        b=hbkk/79A1F3DpsZxigdozrsYq+82481RIZ/h/XH6L/JXj/Ofo8DTq+MehQoagB928h
         a2H4xcvRHP2JTlO42PnkQ95qooBl5qFwRpL2mJytgK0VdG+ZV7OvwpPFwF24NthoUcwK
         PGooTlaivozhqJCOjUj3XUvqW9z84NyblCxfdXc+LsnZ26BVrTUTFO6xEpOaXPQDHluF
         YrcutmMkfm1mDgr4iIyXN13MG29uXSi48KvEjZYZasZU6AOfish9qzW3qqzYdrTIyL3e
         gcsP5yFVH4TY6pKMVZ+bm8vmeiZ1Imrbp8Wog7dy/XRJBSwWY3ikFRjE3PzZ4JTVQ0bt
         ZqXA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781522424; x=1782127224; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        b=Qpt5YRVvPUSs/7bhYXBYKWHkgsrWXLap+jmr500Ank5ADm/7fMLxGs/0XiCQJANUze
         itLOpa1HXQ8jBRPxYC7GMAkle/33nxa1wfSTyl984tpPOn2LUZRlsxq792w4rFMTzLph
         BlMubmkLHscF6+EGeXXdogrrgIGSO79kYPTpFdt56GBLek6AkkS+vWBLnhdYr3NSIf4y
         NBQ3qEtstyc0gSJ4MMhaw/vP/jwWIcyi48R58VNZoB76X7NZJJ2eTGBGf36eHdQb3Fw5
         ZLJavqHoIFA0g+vYEU+E+ybrxGW2BInLvTuCJyfP6fRaT+XMsiAJuWpy5Z51w7lc5Gax
         4vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522424; x=1782127224;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :mail-followup-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6mqHKqlBvXA+4paxQcgIh7H4kij3XKYmw9YFuF/cKw8=;
        b=VCi2Ij9nf9NW2ivv0b4nMGdw0kafIRvC22xClivFY/xBz2uQ/aW70vn06P7eif2vWj
         XTT6wyqRNI3VtViCj/BdXfMtj4Dgqlqv0RY1n8v8Gl0IMC4bLTsAdqhzNblDIHcKizsI
         tVfJ8sKnAziHO6OEUelNrZhdW7vPeSwspl6aEirj9Mscs6GRl5IDNZhDqUunXgcG2HI9
         yBeX6hZ0zKaUr+oVpbb4T3wRErkHHNgKlRvi/lDzA9UlnAXSSpQ9JfLxxRaOli8xM9Y1
         LIn4dMLY1YS8+y7A2XvIVQ7GLOYxPRdCVABP4MP9AbT097eVCXXA8xtvZYKAx+OUR/LL
         Y5FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wocjxYRl3jKO119CVYf7mV4JwuyV/o1hi/JZt3aLxx8xzDUo2hyQdXEPRhRnsMVo8eO4Mrk+kvfjt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywv32xkiZ+j+fgJWCyGsDDtTO7eIV20SQx3gQA9Fz/e/yuvuNHj
	tgWnQzQQSmJz1X1wh3BTEc6egNguPUdgwXLFTOMWHGlw8kzM6BzDNvQXRRTGY6qHOwuxocE7rNS
	X4fViOsnVjDQwLrl4GbX/Pi5DwYOHUOZSaJqN3aOLgQ==
X-Gm-Gg: Acq92OGjTQm0s3OI3ymtQhNdZN2EZNC6VLE+xYo+yrOO/WxjMHbJvIc6gZlxChaobFJ
	TrIPsX/KNPBhGXMPHnflEBmgf8ZsEVYoWOhhnwIo+O/2c5TtYbcGcktnSFKqHOQ3TIyfNP/3lI6
	ygrkA4QxADfGFbuSc8sz152uZnYEA80qgmnlPz4v22CCY+sEz0EXdCds4buoqZDQLRDaH6XNOxG
	GKkEvHthHbRURh2jzJ1pgzOo5Z4qK1aROKEEGYij94ck0cX1Rv0Ir83qjS/wyLc+1zocY8Jj6CQ
	H5qrbzsX61jhge1RGiprlvCo6sL4/ycybXwf
X-Received: by 2002:a17:907:7342:b0:bf2:6d61:3268 with SMTP id
 a640c23a62f3a-bfe2a713a05mr372243766b.23.1781522424173; Mon, 15 Jun 2026
 04:20:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Jun 2026 20:20:21 +0900
From: Angelo Dureghello <adureghello@baylibre.com>
Mail-Followup-To: Jonathan Cameron <jic23@kernel.org>, 
	Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
 <20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com> <20260611114800.009d9797@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260611114800.009d9797@jic23-huawei>
Date: Mon, 15 Jun 2026 20:20:21 +0900
X-Gm-Features: AVVi8CcVAgC1MKZdgPIabfG_bEsJqD-RTAVk9pERfc6y7h_8h9norD6F9V9jiEU
Message-ID: <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] iio: dac: add mcf54415 DAC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

On Thu, Jun 11, 2026 at 11:48:00AM +0100, Jonathan Cameron wrote:
> On Wed, 10 Jun 2026 22:35:14 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
>
> > From: Angelo Dureghello <adureghello@baylibre.com>
> >
> > Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> > DAC configuration registers are mapped in the internal IO address space.
> >
> > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > consists of a conversion unit, an output amplifier, and the associated
> > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > are respectively 0 and 0xfff, left untouched in this initial version.
> >
> > This initial version of the driver is minimalistic, "output raw" only, to
> > be extended in the future. DMA and external sync are disabled, default mode
> > is high speed, default format is right-justified 12-bit on 16-bit word.
> >
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> I'm lazy so didn't check earlier versions but assume the two bits
> of feedback from Sashiko are false positives:
> https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com
>
> The one about clock underflow if resume fails, and then devm cleanup happens later
> is a bit nasty.
>
> I did a bit of digging and maybe it is better to just leave the clock on?
> The status dev.power.is_suspended is set to false whether or not resume succeeded
> and I believe a following suspend will not take into account that resume failed.
>
> I'm not set up to poke the combinations but it might be worth trying that.
> +CC common clk people who may immediately know what the right answer is.
>

was about testing this, there are no bus faults on read/write of registers
with clock disabled, nor warnings in dmesg on double disable.

Anyway, i see now from arch Kconfig that is not possible to have CONFIG_PM
for this specifig CPU (with MMU, PM is force-disabled), so would remove pm_ops.
Ok ?

Will fix all other things you pointyed out in v6.

> Otherwise just a few minor style comments inline.
>
> Thanks,
>
> Jonathan
>

thanks,
regards,
angelo
