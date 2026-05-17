Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FFB332615
	for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 22:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779055476; cv=pass; b=csP+eTY8znGCb/C9eLe7hDz77/HupQNpBzAYTUFfkpJANTs37ar6C0O630ISfppEznz08EfcIhC7e1rqfWnA2JcKP7rL2TV4Vzh7iWzX3FFSbsjm3Pf7XYJ6fttaf2oXfceLGPnO6LgNdfa3vLQ067Xepm6NWBdHoy/9RERdKJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779055476; c=relaxed/simple;
	bh=gZHJrfIdPYrab0HpvH9DcCEOEOFnzCPNy8/jE8lgWog=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh4jfFcqndYeyqPn4IgRKGOq0ALpSkBsrO0DVEfdPkVuwj4oA8YOSMiV6LqtiYsbwHlSf3AhkuuyNQqkz9tk1dAJF4mfSy1ZNkm4PXu7i+aVKNZb8vV9f2DdHw1KUX/eeTirfHngWWdR9TOtS4jrC8Yab6ifiuerPrtp0x1rKZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rGnSuuVd; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rGnSuuVd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bce386d5b85so246250466b.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 May 2026 15:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779055465; cv=none;
        d=google.com; s=arc-20240605;
        b=laGnx/z5LRrO4SIxb2G55MQOnv2jBe401lozfQahcxMBe1ZJKbsYJJbdkuHp5k3r7N
         ncCS+76lBHmYE8CujO3Jv/F0PTCwT6COD9mygYpqTesN9oG7kXXNAh6Oh30gTd3zLsWT
         UDSnuYuc0aG4mCdk7BXm3OA5uUTTCsclSMnMenbRgohvvhfYqyngpYTkXVPKrvFiAc0r
         xn5fwt/fYBjWSwF5woz6bAqTnqJ1jWdWTTmlM6Gic0PUQB45cgkOdljnl4cuhB1t66YT
         7yvVY4RqCUA5nF6y/g1IBIOMMEsdGaMi7gQIfRub0vSEGabibjZ9fkvrbytTa8sp1WL1
         R2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=+glZ8x8Rm3dZ3GzM3y1RWyyv+YJrSKIn1wrNvuWwxYc=;
        fh=cJlCval2ewXbqL1mjbrDN5u0R4xHvk8VdrKdAR4hvkM=;
        b=Z3Kv9p4WophON5VoC0NyBNlg+34NWou5aVtW5UPGoK6yEzRz+VLP92nEwrsSKgNaRO
         eQe7WGnkj7c6OukkbU5vwGw7RbVbRZU1eQQVQfJ8MRVJDHEMTAMoWYhLCrAD612o3K95
         yqCQG50pJmKpNPuUsyjalAA6CcrcuBJVwPQV9IlNEIU7QmOzKMHjQfA24OM1ka+2TLr3
         6lqkRgz8B4L3yxmRGzT4nUTLsu2bo7h/as50jq6cSmIiaPJ398Ash+oV5Wwvj/IfHAdj
         gb6jNHLlXvSxFOZmJ9kvyXNAX1FiEuN+MQMjDLA6uj1glHDal3IuP5iWkDoHymqykpUA
         s+Qg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779055465; x=1779660265; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+glZ8x8Rm3dZ3GzM3y1RWyyv+YJrSKIn1wrNvuWwxYc=;
        b=rGnSuuVdc8oG0Ntxoho+HoTYPutf4Aamvyo6aAqd5LjtnLv088ASEitNJ/PbMGKnoq
         eg+xrzbt1tB/mdsQEMTxY+abQ9Sz5DVdLwDWLa01TOroQ9M4c70cp5Bk8c0uFWorrfHO
         hJsR1J4boF5UQHkdodavDobJvU5/ATWLItN3ByjIBYZBUlWaslpjolmFtne7FC5COmF6
         8g2FMpEJkedy9vr6z8C2KLIDmOXIM+z2W7vKkeHbYoP0YdfOzDyeXlFIIsL7uWZh4bH4
         Oz5dMTrnFS4TWIECbiQrwQtU29SPpgoaGTZbJ3nW2H4ZQZdM5cT/J3GPhsWxngTqYcq7
         drqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779055465; x=1779660265;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+glZ8x8Rm3dZ3GzM3y1RWyyv+YJrSKIn1wrNvuWwxYc=;
        b=jEW8dI80uk20CCHctCX5dtK9gQFqd3jVn+XkOyzY54embrJrWrcI8/WM0dGf/BY+/X
         qJyLTo4AW3UKaqXVmap6YjxUieiq31dKwBHuaQui5GdbFnKVaGqdaiMVvXpFBsFM3GhJ
         UstToqZm/VIm7bW3fZBG/50cJBmkBHF0LTQOX+uA6UkxPuAE2Nm6F6kyP6N0jhxUzOd9
         y0TlW9rxZWlTeO2IuXqTOwssuf5vfBb2kX6wCKQTVoFC1oWaO9k6Cb8qKwBJ27yugCN7
         P9J56XV5Ke//afYYmFrgS+dRs8jZf90WPaM13oUwbH2Q9jDTmYfpUckX+ikEno6x6ssE
         uLCA==
X-Forwarded-Encrypted: i=1; AFNElJ/DiCGNJmYXy9XnEor0A16ldzKZ9iTPnqoZfOMWyfw6b6i0ugF0+h3d4aVPfNZeEd0Iy7VFXLIwRqlq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw/gNdwnTwXcE7tRSYZEvkjF32yI/GFw20XnRDF9nE1xQHljZ/y
	0Cu75B5JceyCCeW0DZ0tgbfzcKrrH/TE2P/04bD/0HfATduuUbHp7wjpX8thrbtA0FZKihI+Iuc
	KwpJ395earw22zClKCukE+Ubnis3+n7mCW/Rfz506Qw==
X-Gm-Gg: Acq92OHHwMYozliHjdM+yui5nVpIkHxvaMzgFjRdkn1ZO+vuDofZYbqqD7Fgt4Hv7Ni
	aTsF/cbVv8nXQ8sX/lL/Q3AyTkwvbqrRBLjJ+anmY1DSvIUqtdwjuKWcqx1zWJoSDp3qwBkJ97S
	wIqGZNZp8ExWKzKmh+RTksTZmPZx7IHI10EDicsu0ojl13ZdNWpRXeyYYWis8iQuQe0LmhdVcbf
	zicEHsBf1BjF0BM/fut+7q5974zDw6WF2rtbVIsd2L19KvbXJ/JOLYh8nDMk1GBJdm4tTdWRJsf
	nNSiuezU1NBzlJmYY9iGYGciNkNeSPvZYNNa
X-Received: by 2002:a17:907:3cc7:b0:bd5:18e8:1ad8 with SMTP id
 a640c23a62f3a-bd518e82334mr600884066b.4.1779055464251; Sun, 17 May 2026
 15:04:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 15:04:23 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 May 2026 15:04:23 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260506142644.3234270-2-gerg@kernel.org> <20260506142644.3234270-8-gerg@kernel.org>
 <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com> <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org>
 <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com> <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com>
Date: Sun, 17 May 2026 15:04:23 -0700
X-Gm-Features: AVHnY4IqhiV2sSnDG3bDc8vtXUEslTxnP4xgh859XRbJ5eiok2HZwd1skAiBlBc
Message-ID: <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Arnd Bergmann <arnd@kernel.org>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Greg Ungerer <gerg@kernel.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-spi@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Sun, May 17, 2026 at 10:08:22PM +0200, Arnd Bergmann wrote:
> On Sun, May 17, 2026, at 21:43, Angelo Dureghello wrote:
> > On Thu, May 07, 2026 at 10:43:01PM +1000, Greg Ungerer wrote:
> >> On 7/5/26 05:12, Arnd Bergmann wrote:
> >> > On Wed, May 6, 2026, at 16:26, Greg Ungerer wrote:
> >
> > [    2.270000] fsl-dspi fsl-dspi.0: Not able to get desc for DMA xfer
> > [    2.280000] fsl-dspi fsl-dspi.0: DMA transfer failed
> > [    2.280000] spi_master spi0: failed to transfer one message from queue
> > [    2.290000] spi_master spi0: noqueue transfer failed
> > [    2.290000] spi-nor spi0.1: probe with driver spi-nor failed with error -5
> >
> > DSPI is using edma, i will try to understand where the issue is asap.
> >
> > About how it works:
> > - for accesses to edma module (IP) mmio registers, must be native
> > big_endian, so using the "be" suffix in "mcf"_edma looks ok for me.
>
> The twist here is that with the way that readl() is defined on
> coldfire as a non-swapping operation, and the generic
> definition assuming the opposite in
>
> static inline u32 ioread32be(const void __iomem *addr)
> {
>         return swab32(readl(addr));
> }
>
> the function called ioread32be() actually tries to access
> the registers as little-endian. I can see two possible ways
> we got here, but don't know which one is currect:
>
> a) the device actually has little-endian registers (like it
>    does on i.MX, but unlike all other coldfire devices), and
>    you just never noticed because using ioread32be() worked
>    as you expected.
>
> b) you tested the driver using an ioread32be() definition that
>    did not have a byteswap and it correctly accessed big-endian
>    registers at the time, but the version in mainline today does
>    not.

Ok. The ioread32be now works properly since i had applied Greg patches.
I generated an error in _probe on edma channel 2, reading status reg.
looks consistent:

	iowrite16(2121, regs->erqh);
	iowrite8(0x77, regs->serq);
	iowrite8(0x12, regs->ssrt);
	
	u32 status = ioread32be(regs->es);
	printk("%s() status: %04x\n", __func__, status);

[    0.140000] mcf_edma_probe() entering
[    0.140000] mcf_edma_probe(): allocating data
[    0.140000] mcf_edma_probe() status: 800012f8

If i am not loosing myself in this r/w labyrinth, the path should be:

1) Greg removed coldfire readl/writel, leaving now the standard LE r/w,
2) So the ioread32be swaps the standard LE read giving BE.

Am i correct ?


>
> > - for accessing the "tcd" memory structure, that must be, from what i
> > remember, anyway in little endian, independently from the cpu core
> > endiannes, this is the reason that big_endian flag is needed, it is
> > used for tcd area accesses, so the IP module was built.
> > The tcd area may be similar to pci accesses (see mcf54415 RM 19.4.16).
>
> edma_read_tcdreg() calls into edma_readl(), which is the same function
> that is used for normal register access, so from what I can tell,
> they always use the same endianess here.
>

If edma_readl was using

        if (edma->big_endian)
                val = ioread32be(addr);

and never changed, without Greg patch, it was likely returning little
endian for coldfire and correct LE for other arch ? :)

I remember something about tcd area was coded LE, but will investigate
better, now i am over midnight.

Regards,
angelo

>       Arnd
