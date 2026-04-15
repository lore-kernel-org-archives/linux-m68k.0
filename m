Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB73D47DC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Apr 2026 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264912; cv=none; b=J38offWeDqqV8kiXV5r5BHe4MiKWi3v7Nw9eQ5BK+lguN/w4Ds5WS1IEhBdbGQEjLiL4Lmv3pFjHrqD2CNhNALpFNycV0ylo+/Vy6J+iuSsoH00YUdfDk6P1WWloFbcDX2YafB/S7EmnZ94rBXL+rSlJv0FT2WTPaoxylRB7oVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264912; c=relaxed/simple;
	bh=PB1YF5aA95daECp2oGFhT65JESEITTkgB+3C1q48fSE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JkzEUE2QLRT2pu6jQTvEOZfZlkUHRNQzDPcnf+dB5Tw6cWLwANKNojypdTeZTZceNoiz0Ij405Y/PgIjihqEMSGqhnoVCO54CgDzHebmv9mOxy7KbL8IbtBpLPVOG7Wg0GY3AG06s7FciQ8qf1D914IJmUSbWiuGRD0SR0CR5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9p6ojbg; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9p6ojbg"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0183244232;
	Wed, 15 Apr 2026 14:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3EBC19424;
	Wed, 15 Apr 2026 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776264910;
	bh=PB1YF5aA95daECp2oGFhT65JESEITTkgB+3C1q48fSE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=K9p6ojbgzF2ucwsr6pd14RpbnzTaDljBu6RJTronpc1x7wYMQwW+x4eLJAoB2h0Dk
	 47wzp3oA4KTjrFeyBXUnilkIlFuouKouFq46up90bv9vcjnZ2+1Yojo5nW2pxt0AOa
	 XxhmTH2LVdraR3E4keFlGDgZxT2a7Oge4uvAyafAiHu4taTfy9VKkcF8ZY097S4rnE
	 mCybBKUZADrhIiSsyMdEtr/FXwXF3MSN2FR3s+qVvKE+MjxgaFSZ61hBlkcbdwescy
	 LIUSAWAjSY9E6Q6Jhg/NTR0gCXAboXVuqn+JJ6h2wtga8xDtN/f4l591WvyKVSd/dk
	 +aH3Qpyrp5sfg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B106F40071;
	Wed, 15 Apr 2026 10:55:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 15 Apr 2026 10:55:09 -0400
X-ME-Sender: <xms:zabfadt4LtLP7k6m-OAzwIzd9nFaWwbmcb0CX_z9eY0fixdcAbATkA>
    <xme:zabfaRQL0W3W64mysY3cWoa4eqjslYqTWIQB_0FG97QI0i63L2ItVsmA4zTqjXc0B
    a8otmTKh2jDn3bhP52UnHE1hrz_l5144QG-X7Yn_qOcddF-pGnPy2dB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggeefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghn
    ihgvlhestdigtdhfrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhdrphhlrghtth
    hnvghrsehgmhigrdgrthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghpth
    htoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zabfaRPMHTGwUaI5iNpoFroWOywE6-9jy7rUQ514M4OV5MGBDFmQvw>
    <xmx:zabfae4Uvdl5GsG4NaG6mY2C5QZcz8rqY25yXKnqGFJK3JbTLSBA3g>
    <xmx:zabfafQzwFP-KtiY4O-4Xo-I9hTsB6RuytIbWUy322ke5PhG5LqWAw>
    <xmx:zabfaTBbQdNyIWtYQ0ZJGYPepI4OdiwOoCkRR5cxlhGsHCAKhqQB1w>
    <xmx:zabfaXHPREaJz4B_CvejbMCKD19prQ5NFjIlzltyAQ_jFzosWgHNgjBQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5167C700065; Wed, 15 Apr 2026 10:55:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbTBWCF3eo87
Date: Wed, 15 Apr 2026 16:54:49 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Greg Ungerer" <gerg@linux-m68k.org>, "Daniel Palmer" <daniel@0x0f.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <4ec2b9f3-8420-4f77-9373-7ae4df83404d@app.fastmail.com>
In-Reply-To: <25448303-a816-429d-851b-d827fc8f26fb@linux-m68k.org>
References: <20260404024658.2496519-1-daniel@0x0f.com>
 <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
 <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
 <25448303-a816-429d-851b-d827fc8f26fb@linux-m68k.org>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 15, 2026, at 15:52, Greg Ungerer wrote:
> On 14/4/26 23:24, Arnd Bergmann wrote:
>> On Tue, Apr 14, 2026, at 14:55, Daniel Palmer wrote:
>>
>> There are other coldfire specific drivers (fec, spi, ...)
>> that would need a similar change.
>
> Right, and this is really the work that needs to be done first before
> we will be able to remove the io_no.h specific readl/write code.
> This is what I see:
>
> Drivers that are used on ColdFire targets that use some of
> readb/readw/readl and writeb/writew/writel:
>
>      drivers/net/ethernet/freescale/fec*
>      drivers/net/ethernet/smsc/smc9x.[hc]
>      drivers/net/ethernet/davicom/dm9000.c
>      drivers/spi/spi-coldfire-qspi.c

> Obviously spi-coldfire-qspi.c is ColdFire specific, so easy to change
> and not affect anything else.

> The FEC ethernet driver is widely used on
> ARM and ColdFire, though the change to a register reading helper looks
> pretty strait forward but will be a largish patch.

Agreed.

> Changing the smc91x driver looks easy enough, the ColdFire
> multi-byte access macros in the header are specific to ColdFire.

smc91x is a bit weird because this uses a readw() loop
for byte streams but ioread16be() for register accesses.
I think what is going on here is that this is in fact
a little-endian device, and ioread16be() ends up working
because this does a byteswap on coldfire while readl()
does not. With the normal io.h semantics, these should be
readsw() or ioread16_rep() for the bytestream and readw()
or ioread16() for the LE register instead, same as the
#else path in the header.

> Need to give some thought to changes
> to the dm9000 driver.

The dm9000.c driver should not need any changes, as it only
deals with 8-bit registers and iowrite32_rep()/ioread32_rep()
byte stream transfers, but no 16-bit or 32-bit register
accesses, so no byteswap is needed here.

> Drivers that are used on ColdFire that use only 8-bit readb and writeb:
>
>      drivers/tty/serial/mcf.c
>      drivers/i2c/busses/i2c-imx.c
>
> We could ignore these for now I guess, since readb and writeb will always
> work the same. Though it might be nice to clean them up with proper helpers.
> mcf.c is only used on ColdFire so won't affect anything else.

Right

> Drivers that are used on ColdFire that use iowrite32/iowrite32be:
>
>      drivers/net/can/flexcan/flexcan-core.c
>
> Although this driver has support for differentiating big and little endian
> access I think for ColdFire it is relying on the kludgy overrides in io_no.h
> to actually work right. So will need a fix too.

Makes sense. So the FLEXCAN_QUIRK_DEFAULT_BIG_ENDIAN flag
should be flipped at the same time as flipping the endianess
of iowrite32be()/iowrite32().

> Did I miss any?

I test-built all the defconfigs, with readX/writeX/ioreadXX/iowriteXX
commented out and found three more for mcf5441x:

drivers/mmc/host/sdhci-esdhc-mcf.c

 -> needs to be flipped to explicit big-endian accessors

drivers/dma/mcf-edma-main.c

 -> same, but confusingly this also has edma_readl()/edma_writel()
    helpers that try to handle this. As far as I can tell, this
    is currently broken because coldfire sets edma->big_endian=true
    but then uses ioread32be() that appears to flip the BE
    register contents to LE. I'm either missing something here,
    or the upstream version never worked.

drivers/spi/spi-fsl-dspi.c

  -> this one uses regmap_mmio without specifying an endianess,
     so this should get the default LE helpers everywhere, which
     would be wrong on coldfire after the change. I think the
     correct solution here is to set explict endianess in the
     regmap setup for coldfire.

       Arnd
