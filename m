Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418571CD1E4
	for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658447; cv=pass; b=ajSrn8LBLOt9XOzHj4LZXkNhP1/e4qudNee4YxVrgygQQsrjjoTXqzi9r9ICQUU02UOAB8RBv6GOWKkDEdykAaUTDJRx8En9KEhfbCrqHg8Yknj4RB+vR5ddfpekXrq5ysTOJ3Vh324BYW/NhDcGBExpim0pmDJ/xnvvQ8rxJcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658447; c=relaxed/simple;
	bh=scbTGzWKrkbb2tr2ByuUctuCpzVcmORNYkqkGCRtn9g=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTTcVbuZnKglijBV6Id2NYd0TU8tg0b0ywv3xWzYuhyVdENrd7htAScqe21yX6TBLkz2wUeIwvcMX/rf9g6ZLFmiSJG5bGsIcvdAcdX3/G8IWtmujo9tcPZejDkdfEx/+ZojArTyoLcZT3jyxxoEuqZ2kUnTWNTWgQs8xWOL7eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PuNz6MIc; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PuNz6MIc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1320352066b.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 24 May 2026 14:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779658444; cv=none;
        d=google.com; s=arc-20240605;
        b=Cz8b0o2kg4Wtt3hDmwfUzz80CRmypXUgOW12zs86ro+7J7l25QYkKf3NmKPXiJtzQN
         SEzGx9a+GGC5huRm92+XyHfX5cf2hlTUZqRjbjhCsxYbyb8DQtouBuCfP23Mn5fSDc8w
         iIEwGSpu3B8wTvqjLox04bSqk0Dssj1DS4WuEDCnKnupLhnzKenWmtkXnjyMaQ06ckUX
         HXBi58eypOpA8jzRxAYZBtAQDsBisSv+e5Qr6LdKoDWHLhB1VIwUidMNSGScgRK8y+OL
         Db+3chMAnwp9StEeRVmJ2ITLGQB38XTpnGvgvGibi6hP4ZBpZTv6nJzGL/dKwPA8DKMn
         UyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=4v82pm3nplUGvi0gYlaKk5FJ7bsCM62ozlNkSbZa6Zs=;
        fh=DO3YlUa3EFseMHcIoXqU4QPAtRN5OD8XgtUFKc5yoTs=;
        b=UA0HThTTUIEEmDSZzhwEQRsR8mbHVyJxodVYcOIf2B/O8FFPUN2ht44siilaIHuhiy
         HC+dLBYPVaUQyv5dKPCGDVdcCpkE1QdWCAEcv4sv4vPFEIzusDn8yoKg1Ksw5QIOJrHc
         e7umrXi/J+BKFKnYpuwO0QPqyA5O86yoLr21rYhNcyarv8jd/GCKvNZ1HH4hNSpn0fjo
         YqgH4NmRMwzS4pBQxJGRZ7iSLXusi6nhFD2LttqjgF09bt+CVWtjRDrZEDh56x2wku3P
         s5ggAzU3uRXwp9miKDpfTeMAfGgo3/Xit1gOEqgeGaARb2DDccDRAjFvjCj2LC1hjGgu
         mtWA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779658444; x=1780263244; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4v82pm3nplUGvi0gYlaKk5FJ7bsCM62ozlNkSbZa6Zs=;
        b=PuNz6MIcXRydisyPJ9ua8bdsybq4p5t8I0zvjyKRemyC9HK/7qCxB1X+0+W3nI/w7B
         PTvf+XJPD6VNxUasGJatXZ74iZ9ZaZJ4posR0cNO+999kBgNY/k+4rZ0tIzrbKjKSBZ4
         SSpV+MVcedNbs/80cESkcJWurnnGTDX8ssIwVgdEkjgWCljglaqCzJjxKoBimNHcgR+k
         hwUc0nPdryMI71vLZuojoJnkwfTWQBkd1quPA0z3lzKBN5ajaLfrmfl6kOhl5fgzs18E
         867m8+KvnUuV3deufJd7aq50eeYjssZip2W3nhqvVTlWqcrYITWkaaVBHjCqwr/ZYB2a
         9ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779658444; x=1780263244;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4v82pm3nplUGvi0gYlaKk5FJ7bsCM62ozlNkSbZa6Zs=;
        b=R/BpYrUp3BwwU4mKcVVaIbfFgcWo8cgqz+h4zUVA6PmiOUFZxVwgEexgvAZUk2CHRi
         XZqzMNhwXM/aY8psAx3kXL60Th8vlHuPtL5rsu59f/mR+kSt0HhaawWkt0sT9//38IXV
         SxJGWgoDL2ypCWJKWlvJzEwhKhSJi4hynuehpucGIiBCi8uWTjTJG3UEjDQ4Nw/Rnnhr
         kB3+jy94ftMHg0O2hRX5h9Gbi7e4nluKya7oVPjjq9CgOvTH0iYSgoNzOJSqv+K1wydR
         XrdP+umXHyuJdOHEJ1rxHpcKr32LiLsYd/tV+ORH/MkbSMaasuE9X0Nou84TNTTN7mbE
         yMww==
X-Forwarded-Encrypted: i=1; AFNElJ91Egeh0lSNhgR0wIQoATHCc5e4xMvrFiTTyNwV1ecDW3xGOJLGGCjR475XQGZ5moR7AJFSPCW8cq2A@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxDNf06g63OQ6vSUnxn/wg1Dne+vKzHAiIui2dKtsZukVsH9a2B
	ER0KwUnXhiHnO06FIJlvznKbskLfClyKgP4qQkdH6YAwrDukkqrGqLksfveL7Aif9RBQpJkreZf
	BG4XCEK4TkA6+edqUWeuKJ2WQ+UH7e7yyNQUmiS+eiQ==
X-Gm-Gg: Acq92OH/CY4y5lABNAtjxEG4cj5S5L3sYwBu/rO70Yl9yToZ140k3hDc1bhQhvXoxz2
	oUSnG03QDeOtE+xUCMeZDYXqYCmzUvte/ubD6RpZ0owRXxHY2KabFd8D2U3dxuwtCAhTR2Guy+H
	yP1USBu24jyiqIYVagYUqJ6wpvFVw+cd7BMuJNieCjHB62ugYuVa7yK59SeY3Y/bx5D6q9JYIfV
	o1Dbzkn9gjN3pJFCP2e8W2srUEoDbdG2/Hz55zQRPeKB1DVZ4gAyZ7FJVhh5k1bM/eio1a8tk5q
	3BG3Px3liY36YH+t/5VSeRe7buZhE6ve0/BcVg9VjqfCb2E=
X-Received: by 2002:a17:907:75f8:b0:bc6:1c2:ee46 with SMTP id
 a640c23a62f3a-bdd22e30ca3mr532419766b.11.1779658443593; Sun, 24 May 2026
 14:34:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 May 2026 16:34:03 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 May 2026 16:34:03 -0500
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com> <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
 <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com>
 <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com> <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
 <CALSJ-wCuZs9cBJsuOOYMEYM6xOXZbdOm_pr=70d3HRYYSYJ0KA@mail.gmail.com> <CALSJ-wDm8NoB8mF3KSx49XMSWz1vjwFhSmgJZWq8pN2pCf12mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CALSJ-wDm8NoB8mF3KSx49XMSWz1vjwFhSmgJZWq8pN2pCf12mw@mail.gmail.com>
Date: Sun, 24 May 2026 16:34:03 -0500
X-Gm-Features: AVHnY4KPts6giB7v-VLhDVFgaj3UBt2D1rd6Lp0dLsbZHZD9ROK0A3o-BziA5dQ
Message-ID: <CALSJ-wDY_8SMAvKT0L6wMbH1=w5pZNmV=xyeX1REb=BMRZWj-g@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Ungerer <gerg@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 24, 2026 at 02:17:07PM -0700, Angelo Dureghello wrote:
> Hi All,
>
> On Sun, May 17, 2026 at 03:41:31PM -0700, Angelo Dureghello wrote:
> > Hi,
> >
> > On Sun, May 17, 2026 at 03:04:23PM -0700, Angelo Dureghello wrote:
> > > Hi Arnd,
> > >
> > > On Sun, May 17, 2026 at 10:08:22PM +0200, Arnd Bergmann wrote:
> > > > On Sun, May 17, 2026, at 21:43, Angelo Dureghello wrote:
> > > > > On Thu, May 07, 2026 at 10:43:01PM +1000, Greg Ungerer wrote:
> > > > >> On 7/5/26 05:12, Arnd Bergmann wrote:
> > > > >> > On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> > > > >
> > > > > [    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
> > > > > [    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
> > > > > [    2.280000] spi_master spi0: failed to transfer one message from queue
> > > > > [    2.290000] spi_master spi0: noqueue transfer failed
> > > > > [    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5
> > > > >
> >
> > About this issue, it fails on dma_pool_alloc(), so tomorrow will check,
> > i probably lost some dma config option.
> >
>
> so i worked on this open issue above:
>
> - moved to master and rebased,
> - crated a wip/edma branch,
> - bisected and found the offending commit, before this, mcf-edma driver
>   and connected spi-fsl-dspi (using edma) was both working correctly.
>
> 7a360df941a4bd60847208de59f1ac8b166265a2 is the first bad commit
> commit 7a360df941a4bd60847208de59f1ac8b166265a2 (HEAD)
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Oct 12 09:52:27 2023 +0200
>
>     m68k: don't provide arch_dma_alloc for nommu/coldfire
>
>     Coldfire cores configured with a data cache can't provide coherent
>     DMA allocations at all.
>
>     Instead of returning non-coherent kernel memory in this case,
>     return NULL and fail the allocation.
>
>     The only driver that used to rely on the previous behavior (fec) has
>     been switched to use non-coherent allocations for this case recently.
>
>     Signed-off-by: Christoph Hellwig <hch@lst.de>
>     Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
>     Tested-by: Greg Ungerer <gerg@linux-m68k.org>
>
>  arch/m68k/Kconfig      |  1 -
>  arch/m68k/kernel/dma.c | 23 -----------------------
>  2 files changed, 24 deletions(-)
>
> So i can try next week a patch for edma looking what has been done
> in fec, and since i am probably the only with mcf54415, will test it
> here.
>

Looking into this better, looks like the above commit was meant for the
majority on non-mmu ColdFire. I think mcf5441x and some other with mmu
enabled can flag pages as "page cache disabled".

So i would re-enabled that code only for such mmu families.

Please let me know if i am correct.
Thanks.

> > > > > DSPI is using edma, i will try to understand where the issue is asap.
> > > > >
> > > > > About how it works:
> > > > > - for accesses to edma module (IP) mmio registers, must be native
> > > > > big_endian, so using the "be" suffix in "mcf"_edma looks ok for me.
> > > >
> > > > The twist here is that with the way that readl() is defined on
> > > > coldfire as a non-swapping operation, and the generic
> > > > definition assuming the opposite in
> > > >
> > > > static inline u32 ioread32be(const void __iomem *addr)
> > > > {
> > > >         return swab32(readl(addr));
> > > > }
> > > >
> > > > the function called ioread32be() actually tries to access
> > > > the registers as little-endian. I can see two possible ways
> > > > we got here, but don't know which one is currect:
> > > >
> > > > a) the device actually has little-endian registers (like it
> > > >    does on i.MX, but unlike all other coldfire devices), and
> > > >    you just never noticed because using ioread32be() worked
> > > >    as you expected.
> > > >
> > > > b) you tested the driver using an ioread32be() definition that
> > > >    did not have a byteswap and it correctly accessed big-endian
> > > >    registers at the time, but the version in mainline today does
> > > >    not.
> > >
> > > Ok. The ioread32be now works properly since i had applied Greg patches.
> > > I generated an error in _probe on edma channel 2, reading status reg.
> > > looks consistent:
> > >
> > > 	iowrite16(2121, regs->erqh);
> > > 	iowrite8(0x77, regs->serq);
> > > 	iowrite8(0x12, regs->ssrt);
> > > 	
> > > 	u32 status = ioread32be(regs->es);
> > > 	printk("%s() status: %04x\n", __func__, status);
> > >
> > > [    0.140000] mcf_edma_probe() entering
> > > [    0.140000] mcf_edma_probe(): allocating data
> > > [    0.140000] mcf_edma_probe() status: 800012f8
> > >
> > > If i am not loosing myself in this r/w labyrinth, the path should be:
> > >
> > > 1) Greg removed coldfire readl/writel, leaving now the standard LE r/w,
> > > 2) So the ioread32be swaps the standard LE read giving BE.
> > >
> > > Am i correct ?
> > >
> > >
> > > >
> > > > > - for accessing the "tcd" memory structure, that must be, from what i
> > > > > remember, anyway in little endian, independently from the cpu core
> > > > > endiannes, this is the reason that big_endian flag is needed, it is
> > > > > used for tcd area accesses, so the IP module was built.
> > > > > The tcd area may be similar to pci accesses (see mcf54415 RM 19.4.16).
> > > >
> > > > edma_read_tcdreg() calls into edma_readl(), which is the same function
> > > > that is used for normal register access, so from what I can tell,
> > > > they always use the same endianess here.
> > > >
> > >
> > > If edma_readl was using
> > >
> > >         if (edma->big_endian)
> > >                 val = ioread32be(addr);
> > >
> > > and never changed, without Greg patch, it was likely returning little
> > > endian for coldfire and correct LE for other arch ? :)
> > >
> > > I remember something about tcd area was coded LE, but will investigate
> > > better, now i am over midnight.
> > >
> > > Regards,
> > > angelo
> > >
> > > >       Arnd
> >
> > Regards,
> > angelo
>
> Regards,
> angelo

Regards,
angelo
