Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC4430C159
	for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779657432; cv=pass; b=jnu8x4LdLHbJvQmHDlsJ4/pnkmNYEIYHFwhYbyFvss0oAV1XYxC1YJskjgbf7fzweHULMPdxpEu0OxkSvYGjx0ew+iMexW3BZWqlnEitlBBa26LyqYxUBuyZJkEwW6TzRarKo4XfcArpOwZEn7d6U8W6KnolOyHgekuYzhLIb/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779657432; c=relaxed/simple;
	bh=qfr3PV+aenV2JpxF3FEwOoVdituPWH2TqiuNbdw2APY=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+bvcbkpk8145OZWyTP/2Nl9thK8Y1VKG+z/ru/PsUScTIhXBQQ3xfv+HyiGjgR56QduEE++hFIzLgcf+3tuxkI3zwfRUcLkFizAWfF8OqFMQRXjOu4HyqTAGtuNq68iyK1F963aDk5q//iliQuBNmVi7ar+dcK4FAUOFdjz20A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TjsFtRWd; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TjsFtRWd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso13977054a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 14:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779657428; cv=none;
        d=google.com; s=arc-20240605;
        b=b+VYqIFftMZTVgbqZnQ1FBmcqBkRfi4OMvmHL8fWV8mDVrGyTADbkXp6boF6gymQFC
         XSzojhC6H2try+TPslZL1qdVguSIucOWPSngnjOlzXyaF15DmaSPpnkuWWYYf7Y2xKY2
         niJBYkHibV1TT6pXA0qdkTu1waAfdImwigFakEqsum6YHeGDboendp/2jUATHJ2EFKBY
         1jno8PvMYMh/gMOsmpE6dp2VB8UV5Zmilm3PblBju1FzsNOVoL8vEzfyPGaVcjp8hjAK
         3mj6WfjD5qCb1erGr2jMKehrGgdQ8PUU01KcjYA5V7ikx3EADytmuuQzBQnPFqCVVFvd
         1uVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=81SVtsumHItsjvk/xJawurytwgu7zZM7CD6y/vNW0oQ=;
        fh=2MDHVL1Jwzf3yuyDdfZBGQdgDRvCEVKXz381i3DAqUw=;
        b=G7jvWhDIbcaq9mPjum57YACoL17kvcqFNEfbxEmwY5TsU9gCfVvTDGce+GaBxrGHgq
         GgwbXZy6b+PtThhT9ustLyeDNRfB08UEpptsg0nl0XT/3Ow++Ox/JApmOHUrzycP5Umx
         mpAz/ACREZy9h2co/edQnxJz5k4FasE147n98h8zC2pqb7d0EEjKoTTBY+X72qXpaEmN
         bdL3SdVWCy/CO6Ia7/7/Q1uF9KlBqEo+kyvWOMQNyJjNvqsKYdhG77qg8Agt6kGLJYNq
         Vo/WZS48ooVNjUAbNqD55HOkoMy/VO5igWg3cMtziiCPhjqcMQjhb1MABXFiGHymbMng
         8WfQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779657428; x=1780262228; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=81SVtsumHItsjvk/xJawurytwgu7zZM7CD6y/vNW0oQ=;
        b=TjsFtRWdm5wKJczDYVdwvbfzXJ4yKrbTaiAhUtt2o6pWV+aeYJTGxJICNdQ+Y3TFAd
         +WDY/9rpFmdzjQAgJNlmaspCtwLlPSt+PKvnSOLoEian2QOriKlM88ukxg5Lx4bYxV91
         KBy3lKJQuHtBGDBpcfUA4z36K1FCF2OZ/kxMFhxcWoz34FT2UmRE8BEY4n10XdA9YnVT
         mEiF4edvLtoZNXhn5ajbpDytFa0peNGC8GOZvdPYGwq7bdVN1KlrXtjBRYW6QDKv20pV
         gTnl4laI9yJz/sxP4pI1pDveqqZDioW2TvHt/a1wweNG8mb+KEtouxv+bTFpLvNgAVIB
         s9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779657428; x=1780262228;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81SVtsumHItsjvk/xJawurytwgu7zZM7CD6y/vNW0oQ=;
        b=m06YMkMB05TjLf49/paAmpL0axjJT1SYx+03ncmvjYJaXZaE8qFv39J2LCdIALNZ2A
         X09yyVS8P2+SdHezap5knvP2gKcRbYgaAIjye7EQmsKWQpIt0XpwoZ3ukdhFlgDcZToU
         lGp4NiK98UBcpYp6PrX5OVf8i+GlNLxRjOD6bGZt1lW+u+D8oWmgx8Aus9NJWNRjiu7Y
         dRVVhhtnHESL4GeHYBElyPzTExB/HCU4b1gQFfh1sWbK5nE6KamKB2vimVm3hjzTMibw
         BYw7bsdYH02az8WWOETYrK9C3+u++zrXNOUCemNisCkNO2Iuj1mDzcsS36fdWJ89WV4u
         8Mgg==
X-Forwarded-Encrypted: i=1; AFNElJ/B62bQDxMRcGoGUznUmN9pWS3v6jQ/65x79eY6Q6tJOuwSVYX4QNZDRagFqV/b6CYOCL7fHMRghaAX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz53IiTBnyvQexIbz04yn4NLtbWJTZyPDp60PiNKT5T6jWTPJNe
	eyuZfxKinyJKgXY/YT/Sr9jAkkAY6mmp6JpO2ApOhorzdl70kPtSortqQ8SG5BxhF46Nws6iQBX
	C/1iPSt7rJMaTrFy7ubRX7+kpX2wT3lJmKqdKaNpP2Q==
X-Gm-Gg: Acq92OGxipjbH22k7oSLNYwcMC4IuU2mOe8Y50K5pqi7zJWy3t5hx8CwsuTjw086Qoo
	WtNc1mJP52RlNg+zjaamKyXe4YPJuUjqkWixGmhS5lUHWBoz84uWEedtLS+jy7mA8n9xi2fKxHP
	Le3aM5l7iavlXqSwADAdqT8bFxE/D2kquzVNwegUh9vfSqrxJF8pzS6+ohcukReZPlbvcDUUs62
	PCAh5QBmXeIkkuibr6lnSgd15fhkwCfHMlytpI1jAg2TCv8rrtk/0LF4CMXypIhUYfTaqLRGnBb
	NRA0lKD/pehDuI6pzSXCzzJuTC+eR0rojpIo
X-Received: by 2002:a17:907:7290:b0:bd2:4aa6:1a9d with SMTP id
 a640c23a62f3a-bdd2360237fmr744344866b.16.1779657428216; Sun, 24 May 2026
 14:17:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 May 2026 14:17:07 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 May 2026 14:17:07 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com> <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
 <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com>
 <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com> <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
 <CALSJ-wCuZs9cBJsuOOYMEYM6xOXZbdOm_pr=70d3HRYYSYJ0KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CALSJ-wCuZs9cBJsuOOYMEYM6xOXZbdOm_pr=70d3HRYYSYJ0KA@mail.gmail.com>
Date: Sun, 24 May 2026 14:17:07 -0700
X-Gm-Features: AVHnY4JHtsLYNvdawYYzb7h3_2sEIhQJt9TYhOw6--5OCNVF-hms1fU3-Y2rI9c
Message-ID: <CALSJ-wDm8NoB8mF3KSx49XMSWz1vjwFhSmgJZWq8pN2pCf12mw@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Ungerer <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Sun, May 17, 2026 at 03:41:31PM -0700, Angelo Dureghello wrote:
> Hi,
>
> On Sun, May 17, 2026 at 03:04:23PM -0700, Angelo Dureghello wrote:
> > Hi Arnd,
> >
> > On Sun, May 17, 2026 at 10:08:22PM +0200, Arnd Bergmann wrote:
> > > On Sun, May 17, 2026, at 21:43, Angelo Dureghello wrote:
> > > > On Thu, May 07, 2026 at 10:43:01PM +1000, Greg Ungerer wrote:
> > > >> On 7/5/26 05:12, Arnd Bergmann wrote:
> > > >> > On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> > > >
> > > > [    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
> > > > [    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
> > > > [    2.280000] spi_master spi0: failed to transfer one message from queue
> > > > [    2.290000] spi_master spi0: noqueue transfer failed
> > > > [    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5
> > > >
>
> About this issue, it fails on dma_pool_alloc(), so tomorrow will check,
> i probably lost some dma config option.
>

so i worked on this open issue above:

- moved to master and rebased,
- crated a wip/edma branch,
- bisected and found the offending commit, before this, mcf-edma driver
  and connected spi-fsl-dspi (using edma) was both working correctly.

7a360df941a4bd60847208de59f1ac8b166265a2 is the first bad commit
commit 7a360df941a4bd60847208de59f1ac8b166265a2 (HEAD)
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Oct 12 09:52:27 2023 +0200

    m68k: don't provide arch_dma_alloc for nommu/coldfire

    Coldfire cores configured with a data cache can't provide coherent
    DMA allocations at all.

    Instead of returning non-coherent kernel memory in this case,
    return NULL and fail the allocation.

    The only driver that used to rely on the previous behavior (fec) has
    been switched to use non-coherent allocations for this case recently.

    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
    Tested-by: Greg Ungerer <gerg@linux-m68k.org>

 arch/m68k/Kconfig      |  1 -
 arch/m68k/kernel/dma.c | 23 -----------------------
 2 files changed, 24 deletions(-)

So i can try next week a patch for edma looking what has been done
in fec, and since i am probably the only with mcf54415, will test it
here.

> > > > DSPI is using edma, i will try to understand where the issue is asap.
> > > >
> > > > About how it works:
> > > > - for accesses to edma module (IP) mmio registers, must be native
> > > > big_endian, so using the "be" suffix in "mcf"_edma looks ok for me.
> > >
> > > The twist here is that with the way that readl() is defined on
> > > coldfire as a non-swapping operation, and the generic
> > > definition assuming the opposite in
> > >
> > > static inline u32 ioread32be(const void __iomem *addr)
> > > {
> > >         return swab32(readl(addr));
> > > }
> > >
> > > the function called ioread32be() actually tries to access
> > > the registers as little-endian. I can see two possible ways
> > > we got here, but don't know which one is currect:
> > >
> > > a) the device actually has little-endian registers (like it
> > >    does on i.MX, but unlike all other coldfire devices), and
> > >    you just never noticed because using ioread32be() worked
> > >    as you expected.
> > >
> > > b) you tested the driver using an ioread32be() definition that
> > >    did not have a byteswap and it correctly accessed big-endian
> > >    registers at the time, but the version in mainline today does
> > >    not.
> >
> > Ok. The ioread32be now works properly since i had applied Greg patches.
> > I generated an error in _probe on edma channel 2, reading status reg.
> > looks consistent:
> >
> > 	iowrite16(2121, regs->erqh);
> > 	iowrite8(0x77, regs->serq);
> > 	iowrite8(0x12, regs->ssrt);
> > 	
> > 	u32 status = ioread32be(regs->es);
> > 	printk("%s() status: %04x\n", __func__, status);
> >
> > [    0.140000] mcf_edma_probe() entering
> > [    0.140000] mcf_edma_probe(): allocating data
> > [    0.140000] mcf_edma_probe() status: 800012f8
> >
> > If i am not loosing myself in this r/w labyrinth, the path should be:
> >
> > 1) Greg removed coldfire readl/writel, leaving now the standard LE r/w,
> > 2) So the ioread32be swaps the standard LE read giving BE.
> >
> > Am i correct ?
> >
> >
> > >
> > > > - for accessing the "tcd" memory structure, that must be, from what i
> > > > remember, anyway in little endian, independently from the cpu core
> > > > endiannes, this is the reason that big_endian flag is needed, it is
> > > > used for tcd area accesses, so the IP module was built.
> > > > The tcd area may be similar to pci accesses (see mcf54415 RM 19.4.16).
> > >
> > > edma_read_tcdreg() calls into edma_readl(), which is the same function
> > > that is used for normal register access, so from what I can tell,
> > > they always use the same endianess here.
> > >
> >
> > If edma_readl was using
> >
> >         if (edma->big_endian)
> >                 val = ioread32be(addr);
> >
> > and never changed, without Greg patch, it was likely returning little
> > endian for coldfire and correct LE for other arch ? :)
> >
> > I remember something about tcd area was coded LE, but will investigate
> > better, now i am over midnight.
> >
> > Regards,
> > angelo
> >
> > >       Arnd
>
> Regards,
> angelo

Regards,
angelo
