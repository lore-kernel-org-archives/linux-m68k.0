Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24404365A19
	for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Jun 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782046563; cv=none; b=TrdzF30CJSLval50k24mNTGztqePrV8hD84KXU5qIHQBlwaPBUQjjYafTU3zx5Xg8ZGZtA9C3JKwuE+dpK+zpC4+jM2rabs1uMukD2X52Tmv0AtBc8LPqLIZDGLjOPLaBTRYHops8Pc4U3nPwOBuJlU6VUqvms0U633BznJKrW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782046563; c=relaxed/simple;
	bh=9Kj/yNWTPHGRYpHL8xVqslgYiPz8UU+Ywfyvekq5oIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dostXfRLZl+YZkBkhmkPf1gnzcCXli32qpnB9aPXF+ol5jQsMgwP05mJsPFk2o47RdEKQtL8GeT/FyLS7IJmafygGVV/RN8w/YWldIzOxH2ql3Tgae2KA0ORaud4yQboCBmyX4xCl7/Ft8Vt0+i9USOARRiLO8jFadWNl4FbPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/o4lN77; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/o4lN77"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB8F44040D;
	Sun, 21 Jun 2026 12:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DAC1F000E9;
	Sun, 21 Jun 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782046561;
	bh=7BZ17cjFlry83TGansWhd9Db8FHG6/Qgrb4teQkt9TU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Z/o4lN77OqFzxFLKvGnHfUEt6l5Ua77jIJ7Dm0UNIKzV3uO3NLplC9wwxG4fQ9cJu
	 MLfz+UT8a7Jp46YfwPvH6RzAOKGrHrS1Ru9GmfrjlajcExrbDfo2aL5HtiaU4NKp3J
	 Le96uuPx5cvJiYrq51ws0Ps1qrAkJMGnx+jVhnHwRtbgjcljzXJvPBTXF/4316sTZn
	 0uxPdhSu7qDye3mjfydXHI8BOwhMUAgK+lQiNmcR6ZD/syFreqhke0B+WF0flbOwRY
	 Tuna9/G0oJ0Dcm6VhcoBBJ5iZ8CBDIFf4ZCg7HmPW+dqJypsFG//xcDCcC0iB9MKAw
	 QZTwrcbluXD0Q==
Date: Sun, 21 Jun 2026 13:55:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 09/10] iio: dac: add mcf54415 DAC
Message-ID: <20260621135549.75e152a7@jic23-huawei>
In-Reply-To: <CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
	<20260610-wip-stmark2-dac-v5-9-b76b83366d5c@baylibre.com>
	<20260611114800.009d9797@jic23-huawei>
	<CALSJ-wC9Rsq6WJ_=X87R74jPrg2Y+=L8m0wRRp=1zvN5vSOw6A@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 20:20:21 +0900
Angelo Dureghello <adureghello@baylibre.com> wrote:

> Hi Jonathan,
> 
> On Thu, Jun 11, 2026 at 11:48:00AM +0100, Jonathan Cameron wrote:
> > On Wed, 10 Jun 2026 22:35:14 +0200
> > Angelo Dureghello <adureghello@baylibre.com> wrote:
> >  
> > > From: Angelo Dureghello <adureghello@baylibre.com>
> > >
> > > Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> > > DAC configuration registers are mapped in the internal IO address space.
> > >
> > > The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> > > analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> > > consists of a conversion unit, an output amplifier, and the associated
> > > digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> > > are respectively 0 and 0xfff, left untouched in this initial version.
> > >
> > > This initial version of the driver is minimalistic, "output raw" only, to
> > > be extended in the future. DMA and external sync are disabled, default mode
> > > is high speed, default format is right-justified 12-bit on 16-bit word.
> > >
> > > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>  
> > I'm lazy so didn't check earlier versions but assume the two bits
> > of feedback from Sashiko are false positives:
> > https://sashiko.dev/#/patchset/20260610-wip-stmark2-dac-v5-0-b76b83366d5c%40baylibre.com
> >
> > The one about clock underflow if resume fails, and then devm cleanup happens later
> > is a bit nasty.
> >
> > I did a bit of digging and maybe it is better to just leave the clock on?
> > The status dev.power.is_suspended is set to false whether or not resume succeeded
> > and I believe a following suspend will not take into account that resume failed.
> >
> > I'm not set up to poke the combinations but it might be worth trying that.
> > +CC common clk people who may immediately know what the right answer is.
> >  
> 
> was about testing this, there are no bus faults on read/write of registers
> with clock disabled, nor warnings in dmesg on double disable.

Great. That makes life easier.  I'm curious to why we don't get a double disable
though... Guess I'm missing something in the flows.
> 
> Anyway, i see now from arch Kconfig that is not possible to have CONFIG_PM
> for this specifig CPU (with MMU, PM is force-disabled), so would remove pm_ops.
> Ok ?

I suspect that's something that might get 'fixed' at somepoint, so I'd keep
the PM stuff in this driver as long as you can check it basically works.

Jonathan

> 
> Will fix all other things you pointyed out in v6.
> 
> > Otherwise just a few minor style comments inline.
> >
> > Thanks,
> >
> > Jonathan
> >  
> 
> thanks,
> regards,
> angelo
> 

