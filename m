Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C853BE178
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047004; cv=pass; b=YEZkQhMsU4h0XsdprtBZ5XVN65J/CeTF94ZHb2rbSfz3ZVuQfqutYk0iUbLXlw8QMTFjgsnZyUOFMTZFR8+RYpn5GIASdb44GGPcQDmYemC/rxt6uUx3KSQGP6rXBI4kMxxO9e1jlNbJnUV1eTq7I75/83qfZ8mC+1px93gZVUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047004; c=relaxed/simple;
	bh=qohdw6c5XY/Mph5vnXjfspO9h70+dVSKRCgfLeBy8yM=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPy8434HklgKV5Iws1Xo1LNe4gEdD5ywmy3omvSXm4xGzh5s6Xg0VFLCtduAmQOYb96MMp0Wo1X7/UVAdqKzig4f4yZL+enqszwhAUrYJBqGh1EnABygzsUOCUdiwdt3x7YvqQLMtClqYXUwukorhLp6B6PNQnabWF4Il8ArDAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=uz97QIs4; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="uz97QIs4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bb91b426e40so336404466b.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 12:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779047000; cv=none;
        d=google.com; s=arc-20240605;
        b=bnieO2WuclzgyKUpulGbm2wXn2bs9jxgrQNmlSz3jXkTlQ6hPiJFRpYribxQjnumk8
         QOkKHORf5lj6vVObR6I1UEUQ0+qeRQ+fCpkMCht4uGohmPKovs4u2KrviTCfK8R2xygw
         0qAqKdBFx5rWRFA7cDgNNEB+fN2OKVFWYc4PzGvJ3X5rQtfZiS8HvYZ8ID4q6gdVEvT4
         PtUIehNzlGXcYnDCA6BJVy1U6Sz7se+sJTJlxloEWmQcApnQSzvXqd+PMHJzP20e6PUP
         7Rclw4D8fV24amSfr5ZJ7qDiNl8EC/MvxzcgVL07QMnnulA937kz95sKLjiw3D/tHwyB
         SiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=j6Mto1oYp8fxMNax/4CSsHkuQNzcdJnt+Yi59gbd/34=;
        fh=/DkA+bEBfbYVDu+NUPLL7nmmZ/AsLr59qWp0HUk1twk=;
        b=AruiLQIjNvCZ0MSTSUIfNnifEOmH5L6iwpd+4R+tRs0QUcrhYwmu45+5k5tW9Nezd0
         lrEjzOCm26dfdIIhHlMOw2gqXsChuwm3putE6CUNeAb+Ch8EACpygFizog2c8iy/s/wu
         0Mptbb+GhXZISaufXMDwUd97UUvYof/utMTz+3a34zr1LICoccellMHhmTIGyDO5AaRp
         yqXBtmd2JRRHvtthDitQUWmnAd9LGQhmyWPmrt+9Zqwf8x92qooLefLweMGxJ6dknRGp
         1DffhMVdHC94xUoA3oXGUS4paUlavSIEit/GowgNZG3oCYOyJTESEqq/VrkkgUK5JlpR
         Og0A==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779047000; x=1779651800; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6Mto1oYp8fxMNax/4CSsHkuQNzcdJnt+Yi59gbd/34=;
        b=uz97QIs4isOFY0ANX6yn8+koeQT55rvrOnIto5yb8T6jfBmZ1OXJrvhzxjEFmT7p7b
         GNqBGwOb10dSVN2FZ8JAMHvFmUAPcgJPzrF4125XPjUUvpIpJN4kpGSPwPmq93g3uGla
         ygOs8QqOYf8o7eMxK01p7/wlOXQVZBFI7kDB9VAVdmZf8RF/UYYevyYylSV/P37nlexp
         DUezrDRmwkpzKxTz1R86ro0XrULlTv6fqOVPKqqscr9qI3lbtnzpAsNO6t+uUpJVZqbS
         Nkh2oDeNlM4coDP9Oef1wYE3boJ7E1C2WTGobILQdpNA4/Q0EvMjdKR7+TKUeV7S8LwX
         DwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779047000; x=1779651800;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6Mto1oYp8fxMNax/4CSsHkuQNzcdJnt+Yi59gbd/34=;
        b=WX/R/AJp/4+fZJ9jJJCzikxaTDjfKJneUmVOAL/PW1DaWhXU4NP4hgfqsM5vreKAhu
         Y2z7oP2Ib76C380XSx+H9IlFOctJ7sEaFBy4FC9Gr46Pah+XRA77l3YEETcnpc0pW8Ga
         bAp3a2jnHAwZSS+WlWkIGoyRY3Fy1H9vZY3wpOWU2WpI0zJkxxDQtYSLRe3zjFSnl1EV
         pQD647NUhHwUix5NpHr0tEh3Km5UNrvA9aBgmWtc/tkkGxQVSf11SPlTRvMTHyaIF1ev
         wNr2ldKtTHDXtqjzdg5GPSNOm8EtLK85jKa7J7hk85kLeh20oLCu0IXrpeGMKfwiwE41
         QFqg==
X-Forwarded-Encrypted: i=1; AFNElJ85tkfwTRUG8bdxn7xOVbsGJeL3FNdSSJDIVK7q0oxZbfQrvd3cIQoBhQ+Vdbw265E7J4qA4mt0ThwR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyFvX1LQoVcuV9jZxhkmwtc/cRUKOfO32VzDHb/fNvWjRM3I0TK
	Cz06KwLqC8yEsuqb/YQvTBwqdlFdk2EvVQ5pIvt5pmNSeSPwT1QBZ3M4S7k7sCBFdRiQbGLpq4W
	kwyoUWBlnlRwiwGBialiTyN7J4dgDqqWr8k2xe192fg==
X-Gm-Gg: Acq92OEirAR/lok03kvdIn2HSDIEe2c5Y9g068/NpIzpvvGcjy1tnqFFcFuXY5JCzwE
	eCUtSnH2MmUetjZzhyQ9nRX1eK0sQdpy3LI3tyC4XWOUTGpB6IV7ly2IijPTMY4hew3GoiABlRx
	cgLOuIuPahLXFB/ugJBCNGKHMMvv9SxRFOyZSRdtbUQro5sqp+f/eh6uhIYYmw53JI6aatwjPDo
	fLla48Pt9+FdmyamA+gXYESet3b5XG/2sYH+gVUo4lOnr49azDfNH//UarGBt7qVQDzgWWhzXHs
	AmEIWmYgzi5I07o/zPohB681BY2u5MGdqLzveVolgXG0Kf8=
X-Received: by 2002:a17:907:1c9c:b0:b98:40e:f335 with SMTP id
 a640c23a62f3a-bd51795070cmr615382266b.34.1779047000052; Sun, 17 May 2026
 12:43:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 12:43:19 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 12:43:19 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com> <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
Date: Sun, 17 May 2026 12:43:19 -0700
X-Gm-Features: AVHnY4LTi1UepgBp7RlwHGhgQikPAAttg6_8VSJjgHVMj7UNTEH_cv4_jkSHs5E
Message-ID: <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Greg Ungerer <gerg@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>, Angelo Dureghello <adureghello@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

sorry that i could check this now only, hope is not too late.

On Thu, May 07, 2026 at 10:43:01PM +1000, Greg Ungerer wrote:
> Hi Arnd,
>
> On 7/5/26 05:12, Arnd Bergmann wrote:
> > On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> >
> > > drivers/dma/mcf-edma-main.c
> > >    Supports big-endian access by setting the big-endian flag of
> > >    the drivers struct fsl_edma_engine. But locally should be using
> > >    ioread32be() and iowrite32be() instead of ioread32() and iowrite32().
> >
> > I'm still a bit confused about how this works at the moment,
> > since the drivers/dma/fsl-edma-common.h file already contains
> > checks for the edma->big_endian flag, which is set in
> > mcf_edma_probe(). The version after your patch makes sense
> > to me, but it looks like the existing code cannot work.
>
> Yes, it certainly doesn't look right to me either.
>
> Angelo: you look to be the original author of this driver, can you shed any
> light on its working status in mainline currently?
>

I was some years far from this driver (and the kernel itself), but i have
seen there are several changes in the edma common part from that time.
I remember i reviewed/tested some of them, some other unfortunately not.

I realized last month, that i was back working on this board (stmark2)
that somehting related to edma or dspi looks broken in mainline now:

[    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
[    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
[    2.280000] spi_master spi0: failed to transfer one message from queue
[    2.290000] spi_master spi0: noqueue transfer failed
[    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5

DSPI is using edma, i will try to understand where the issue is asap.

About how it works:
- for accesses to edma module (IP) mmio registers, must be native
big_endian, so using the "be" suffix in "mcf"_edma looks ok for me.
- for accessing the "tcd" memory structure, that must be, from what i
remember, anyway in little endian, independently from the cpu core
endiannes, this is the reason that big_endian flag is needed, it is
used for tcd area accesses, so the IP module was built.
The tcd area may be similar to pci accesses (see mcf54415 RM 19.4.16).

Anyway, tested the patch, nothing looks changed nor in better or worst.
Will look into this in the next days.

>
> > > drivers/spi/spi-fsl-dspi.c
> > >    Setting the regmap format_endian flags to use native endian will
> > >    force driver to use appropriate big or little endian access on
> > >    whatever platform it is built for.
> > >
> > > These drivers have only been compile tested.
> >
> > I would suggest marking these as explicit BIG_ENDIAN rather than
> > NATIVE_ENDIAN. The effect should be the same since coldfire CPUs
> > cannot run little-endian code, but the way that hardware usually
> > works is that the endianess is fixed at the bus level to one way
> > or the other. NATIVE_ENDIAN to me implies that the registers
> > have configurable endianess that is switched along with the CPU
> > mode.
>
> Ok, will change. I chose native endian in this case since the regmap config
> entry used for the m5441x family is also used by the vf610 devce (which looks
> to be an ARM imx SoC). So it will need a duplicate setup with those endian
> flags set to BIG_ENDIAN. But that is no problem.
>
> Thanks
> Greg
>

Regards,
angelo
