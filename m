Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40863D6483
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779057697; cv=pass; b=Z6RkyBWZJDqZTBwZsa3MJq+Xb+sPOY9aHqUXuxXSpp3b+W+LwIMxC8EtAUjous1HeWEIXqia9WK4wp5+zIt+yCsAuJTjMJwxdb/K8e9tO11JBrHVA8FksWxO7dKcGUjoNXHuUcWKYPTyoLMnRkj25ESiyElQa43Ft9GpajumMdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779057697; c=relaxed/simple;
	bh=UDRqVbPZNo1rDKG47pl3Cfg1y+NpJU3+9tCj4VzpKzA=;
	h=References:MIME-Version:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nL4t9ChhcmEQvW1uxeZgivDULrlwoT0UF0qsCrcQmtd0Oqlr8xX6VamswNJ5e2m+qaepfs6xqSwoq7MHc18/zXVOPmXM80qy0hEAjTq+8kBcLM4aSpEPvzk58nwEXCv8DTqxEHi+0ssZxv6VAzlNV7ueuWuP2eb2EVhcTMyPsSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=dhgEmZ4y; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="dhgEmZ4y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd2d8bb1068so346465266b.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 15:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779057691; cv=none;
        d=google.com; s=arc-20240605;
        b=d5Qhxvm+CNaEfVhKsKrmZ5+AD2d7Zp8MMH9dKmwTMZoy4dBshVRgq0PQhrphd0BVrm
         OSl42u9nfJ//GzhiqGLTffPT6hTPGZTRe+hkcC6mcI0veHn+6qVG8K51/CQw2HQyoKpb
         bYgZuKL0t463YdjNdZjXQzuH3+MLPA9hXvclP3YsCci+EQJUdo/pcOkoi3TJhIYG5LsJ
         h4YNJ+tbKnmPNva90d6k0i2ZwfKitKItugTI4tNEQbI5GHOtk5OWvko9b0q4z5hoETNj
         TtngvVw3+INPA4v9co7UZZR6lKRYJnvPT2szMASHBAvec8RbdpRP6WCtCiTMeOdF1S+X
         ZzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:dkim-signature;
        bh=6WvnwIRGvHEPeQ8ZKX+R0d/VCeeAw5//At/YqjZNVr0=;
        fh=2WUigMqH/lmGpdiGBC47s0BYKAksjrgo7lsD4I4raEY=;
        b=aRhcMLMgLA14nsq7v2Yth5SBfCWnwemuO31FlxNXp5VpzHclq+7rDh4eM0d+pi2786
         J8xrVc4qY/nTG64eBaNS/Ip1HnPJXrGZoOMgv8ndVjOaSaOOmGquRYwKiT6dA7xxSZ/1
         kBXUUiTamtdjMga8PIjHhku3mSWzBGpLq61nMKmbBspVtuTpMAUx65B4npua1Ba4BWdz
         PupS+KB1NpVeiO6eW/bkydBeWm6k14SSK2SBOPTkDti8+WB0xI5aPjumUuRdd/rnyoGn
         tiiN02Y5s8F55LdqxhcLsFVxwJxDPYJ5cJb6tyB+9c+fcDYaYIaMeWinVkMX4Gif0qOQ
         Yjgw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779057691; x=1779662491; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:from:to:cc:subject:date:message-id:reply-to;
        bh=6WvnwIRGvHEPeQ8ZKX+R0d/VCeeAw5//At/YqjZNVr0=;
        b=dhgEmZ4y5moczIEHeFIBXzx6WDUgkDomx4zzGt1de2A19MTbSDI9soYLicgZyyH6+D
         2Nfl27AFQHwDME/wbtzWlXvO6tx1aomw80RhEz5FaOl71R2QYg5o2HoEr5xIMARIYi9w
         4k13iRF3G3l+f5hxluGOBuwhL7wUSblStXhRqe7nySU9Rm2wdXKDboIgctfsO0u1A5G6
         C0Z5coP5+TnxNuzEqUWbVVGBAk3fCK/LDet9cDIETAT7sj/WLKq+UVgK5RcJkvQEV0yl
         tbw7+U6u10dv7gKYIOQ3M8zt6j1Ca9VBDBSQq7aFUKKeestwvHIM3a/zRQbEPA8qAJAQ
         RhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779057691; x=1779662491;
        h=cc:to:subject:message-id:date:from:in-reply-to:mime-version
         :references:esfrom:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6WvnwIRGvHEPeQ8ZKX+R0d/VCeeAw5//At/YqjZNVr0=;
        b=Ey0HjMDr2llD1sDadMy5uSDU9mmfP5FjuWBOWirA9zT/AL6GaJWemkneRtElQPqrgW
         htxpvqW8fOkdbtPQB3v7TmGSlw/ENFx8Fj3nETVh6sIjtRMPXL/ui8cJVuqm3bNYM7dV
         5aXYfVlmXy3tDybnnTkJ4YXr2MrZvq/nxgmkM2CzSk5yOsgHNs6rxsRaeS5NOUSG/jih
         UoIYXIXT2YO7CLEhZgGyMDBqv7EQgjCBJ5PjTpKJi6Y+7TkyetctsRXOqyigz8NJpCg2
         b6J7geTDL2u0x4gB3x9Zwh57ix1aAOrAQsGowS5hxf2SI1rb9DYayfLBr8O895PZYuSr
         yu+g==
X-Forwarded-Encrypted: i=1; AFNElJ+0aTHz/uzFqboM+sXI0dIh1orGznSTU4oDr4IglU+0OprgGmFB9yg1hl4idGGIz9D6w01X4hgjk06i@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzGxN1hFzVtshyHLzMbG7VDKknjmS+jMc+hqcf2kJit4KZIz5AN
	S1E4mpFByouEKjNqKVVbve3/vwCIXeujXllClREPxQUf+y0EzFXDfUS/Qm4mG5qlbGzpru5y/K+
	x/w2lcCg/0rOhMFz+hxbEQChVCXRVIBcwUZc0rEPPJw==
X-Gm-Gg: Acq92OHZTkgAu/ycIRziLRfWQtl3/9iBiqTfD7KwsrT6tA5erUvOfIqyqeHWXQslpVJ
	UX4HHp5eGiyubo2BZRnJXiv4lGuN9H0KJLBX6/biARyPh5i0xgi2ZyuuDzl3e70rn15BAR2xmev
	Rd60XacWQSd2i3+PVa8L5+o88g4W+yocx/ybqMcsN01rj4PYJNdh8AyvtsMreOj8UJAQHdZdMiq
	LHt+oIJ4FmpRpbTmZA0v9CW3rQ5BISo6JQ9NHerFKoqGKbJwVOu4iof4bUx7XMhlw+61ERLvIiD
	Z3tlA4DZ+wr1UOZF99HMn648x1aLLwF4XUUR
X-Received: by 2002:a17:907:1c8d:b0:bd2:bd2:6ca0 with SMTP id
 a640c23a62f3a-bd5177bd03fmr585833066b.11.1779057691600; Sun, 17 May 2026
 15:41:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 15:41:31 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 15:41:31 -0700
esFrom: angelo@archlinux
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com> <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
 <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com>
 <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com> <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
From: Angelo Dureghello <adureghello@baylibre.com>
Date: Sun, 17 May 2026 15:41:31 -0700
X-Gm-Features: AVHnY4L86sFPwvstwRi47J91deZeB_tEn5rDsykk8GHRpiEzaTYsrGzZ-WixK9I
Message-ID: <CALSJ-wCuZs9cBJsuOOYMEYM6xOXZbdOm_pr=70d3HRYYSYJ0KA@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Ungerer <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, May 17, 2026 at 03:04:23PM -0700, Angelo Dureghello wrote:
> Hi Arnd,
>
> On Sun, May 17, 2026 at 10:08:22PM +0200, Arnd Bergmann wrote:
> > On Sun, May 17, 2026, at 21:43, Angelo Dureghello wrote:
> > > On Thu, May 07, 2026 at 10:43:01PM +1000, Greg Ungerer wrote:
> > >> On 7/5/26 05:12, Arnd Bergmann wrote:
> > >> > On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> > >
> > > [    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
> > > [    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
> > > [    2.280000] spi_master spi0: failed to transfer one message from queue
> > > [    2.290000] spi_master spi0: noqueue transfer failed
> > > [    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5
> > >

About this issue, it fails on dma_pool_alloc(), so tomorrow will check,
i probably lost some dma config option.

> > > DSPI is using edma, i will try to understand where the issue is asap.
> > >
> > > About how it works:
> > > - for accesses to edma module (IP) mmio registers, must be native
> > > big_endian, so using the "be" suffix in "mcf"_edma looks ok for me.
> >
> > The twist here is that with the way that readl() is defined on
> > coldfire as a non-swapping operation, and the generic
> > definition assuming the opposite in
> >
> > static inline u32 ioread32be(const void __iomem *addr)
> > {
> >         return swab32(readl(addr));
> > }
> >
> > the function called ioread32be() actually tries to access
> > the registers as little-endian. I can see two possible ways
> > we got here, but don't know which one is currect:
> >
> > a) the device actually has little-endian registers (like it
> >    does on i.MX, but unlike all other coldfire devices), and
> >    you just never noticed because using ioread32be() worked
> >    as you expected.
> >
> > b) you tested the driver using an ioread32be() definition that
> >    did not have a byteswap and it correctly accessed big-endian
> >    registers at the time, but the version in mainline today does
> >    not.
>
> Ok. The ioread32be now works properly since i had applied Greg patches.
> I generated an error in _probe on edma channel 2, reading status reg.
> looks consistent:
>
> 	iowrite16(2121, regs->erqh);
> 	iowrite8(0x77, regs->serq);
> 	iowrite8(0x12, regs->ssrt);
> 	
> 	u32 status = ioread32be(regs->es);
> 	printk("%s() status: %04x\n", __func__, status);
>
> [    0.140000] mcf_edma_probe() entering
> [    0.140000] mcf_edma_probe(): allocating data
> [    0.140000] mcf_edma_probe() status: 800012f8
>
> If i am not loosing myself in this r/w labyrinth, the path should be:
>
> 1) Greg removed coldfire readl/writel, leaving now the standard LE r/w,
> 2) So the ioread32be swaps the standard LE read giving BE.
>
> Am i correct ?
>
>
> >
> > > - for accessing the "tcd" memory structure, that must be, from what i
> > > remember, anyway in little endian, independently from the cpu core
> > > endiannes, this is the reason that big_endian flag is needed, it is
> > > used for tcd area accesses, so the IP module was built.
> > > The tcd area may be similar to pci accesses (see mcf54415 RM 19.4.16).
> >
> > edma_read_tcdreg() calls into edma_readl(), which is the same function
> > that is used for normal register access, so from what I can tell,
> > they always use the same endianess here.
> >
>
> If edma_readl was using
>
>         if (edma->big_endian)
>                 val = ioread32be(addr);
>
> and never changed, without Greg patch, it was likely returning little
> endian for coldfire and correct LE for other arch ? :)
>
> I remember something about tcd area was coded LE, but will investigate
> better, now i am over midnight.
>
> Regards,
> angelo
>
> >       Arnd

Regards,
angelo
