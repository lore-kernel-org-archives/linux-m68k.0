Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29E35E936
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jun 2026 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040628; cv=pass; b=FQllbD4OwgaakcCFVBh00csVXz+fbJvu5YpgiJGFbJ8/pMCzl/a1/c0z6CikeR2/8jHT1BawIhFA1OioId5+4nQ16fkwojdgWYUHO0S74zn3WvL6JAsrURE3yuKyZU2DzkT75Zhi07jrjm9xI0hIbDyq1p180hKSBcpXwwh2xJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040628; c=relaxed/simple;
	bh=TbynbP/rbCQk2ywH5TiPVu9krPSvulMPQby7aN5rr0s=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjsbOI4UReXhp2L01jjl8dB2jXxUw3GDj3sF93Q6Iu4n6Q5wj2ELNj5Z/6A5DUjw1BKaTihezcLoIOVZta2TwZSa5Z/MaDxR82RqVsRUOJZV8TIz9dMu5m72YjnWHhWmrhDGKxigPGstbXzaCHR1S/AYXciECsGH3ejzksnwQ0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=C9x17JWr; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="C9x17JWr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bed2195323cso898439066b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 09 Jun 2026 14:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781040625; cv=none;
        d=google.com; s=arc-20240605;
        b=egnLKbsrXHAWtwQN5kjA1j5o6GuVSdx3DW2J0IyWOZ0PTvch9wGA2jH3IJpiVjdRc0
         ub70tNmOR+cn6YqaImfA9hfi7bgl8qqfAXl4bq/A4HrZ+83M86RrYjOeH4bHKxPRcL7q
         Z6Hzhf3WUXoQD3KwJxC/J88N33bVkOpfA6SLufixXIUx1MJmAEKVfJyneXgLk6167ymG
         2q1tj63afSERkL/zcdo4pewQBYw0IU0SRvFJbeny1XLvXz/QQurPm1HCXeLKbHSjRg4V
         m2HCV22kjZsae7+CNJTX52KQltrHE/ATdZ25VKu4+eVxhLp7u7adhM7I+sszpUBbZOt1
         k+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=OyaoLWvSBSKiTIcOe7IFeaXY8jjEo9UJ9whgcmi/C6I=;
        fh=0EbgUx3DgajjFaxV2GPLilj+42B1NF2G/rUWZ1mXZ8Y=;
        b=jmYFrPQroyux5V+hjWzVc4apZ9I0g9AzST9SjAhB6L9D8XmSwn9sQ6cKCMctDxxvZg
         jciJ/B7VBjxCtn4ytvDSZJxTm7J3gWd9G+4B4CJwxzP91c2+vFzNTgpSGwZcS+BtTI/G
         0Q3DOBjcZKjGaZKROmIoP05KOLY8ncxYcL0JZQhc0kcs8i6BMlTp/HFre4rF/3r6n7za
         jThpvOajUu25qgl8UCvlfy5AlUloQzU/ct0M0/PkCQo2FTmXaiaXjEQY+fzm88rljIX7
         AY7VlKpYnaA1/wsr947Li7ASLVxU5CQ9wCgJSwBfbK7Si8Our6tQk//Fj+3OLwOcnoVL
         AAdw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781040625; x=1781645425; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OyaoLWvSBSKiTIcOe7IFeaXY8jjEo9UJ9whgcmi/C6I=;
        b=C9x17JWrtHB9a/GLV8V/F89qNJ7ActFCuV6rZLjMhlGdcZZhC2sz258oDYjM7TP7v+
         QaeDlqq2f8otsxZKMkBHQw2l0nq2/4dd+v404FzJbSqTADHfSCMGAo/0rmZRIGfHqWI8
         sk1hvbOZ8Q11c3i40+oFExovM+I0ZUh0ii/rAuFDWYDvI8VHTN4YZYR72SyaHNL55kHb
         N66bIRWY76qQnU7ZMm4fwBe+NuadD3Pgo6k3PbtmRMen/x2AenGytrZ0ifTWU+rE719r
         QZN059MlRuOavA8mjM6RHb6sSgtdOkl5cEp7rc6KWKsPunxMGRSrcBZEtad/8dqSLD8n
         6OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040625; x=1781645425;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyaoLWvSBSKiTIcOe7IFeaXY8jjEo9UJ9whgcmi/C6I=;
        b=s+YbYp8xrIM9WqludaQJKxPDknrcnwVrFiCZLTDg4lBnIrKg4CLdPLhDgXJQLOQm7Q
         lkzILHfvzpVQpEG+/wB5Fx1uRTa1zoeBZRh4aHZAPgMdHtfkpIHQYRPUnUu8w48Y2GCm
         x9mn28sOoTpqhfGsc+yYYxpNWwzZA6AEtvbBwy/KSDnNfK4N1YIwucBjQUgTVBXuozPm
         GdUxKsshVC/1ZQ3mZVInmPkaU7rY35jo+EZIGegPics1qDND8en3+8ByzVhqs0q28sgF
         nnULSwSbcrOg65FvV1IFaI5QuDCMvvQWkNiA7m/Cbyuk50UK9uUUXyMhwlQnDW5n3kdO
         3MMg==
X-Forwarded-Encrypted: i=1; AFNElJ8S1Cevz+UjrvtWO2qWqbfe+b6JDf006wXvo/moI0RkdOQlSZERlGlM7Q3pMO24geREvzf6TdVFKdI0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwHQXt1B/KAK/ubXLFAtg9t3UQ9K7F9LjF5s+dx1+nFHLh5kJCB
	icWG2DPqGO/Z21yEk4YfbB86B6ISR83BLcChMCIC7APdgBmilo6n9gGQJhoqR+rYNYBU6ga0xf+
	jm3Zbr/0XsUS1hJSCyLNIoZxby230DKYytsXsbTn6ww==
X-Gm-Gg: Acq92OEt6b/cL2IkJoSey12fbK4YLZElz2k4RkhVc+QCa4JUrIwKMQhrvXTV2CTrC4I
	vtXiBtBctv9YLNcXfBPhq2XRZkJeolx4/zr7mgv2Qd0sX1qEUBNeC+0fga+24IVy4lTfnUk/1m4
	zLa9k8GDKHETSOLOqVZlvSOvrwY71xzYeQr8+RjOE1Di0yEB/ky3vU8F9/FTtMhioV3EUDfgZff
	DMioRuAK1z3w7zLKlizZvzhQaDGe4cLbp2FtuxzFC44gx3opaYAsWLz2ANq/e0oqomg01nIEOmr
	1rF5ngQxOoQs3ps6Z3+HmW3i1uYVi2aTdVCByNUDZgp25+o=
X-Received: by 2002:a17:907:8693:b0:bea:3e9b:83b5 with SMTP id
 a640c23a62f3a-bf370e63a84mr999800966b.22.1781040625083; Tue, 09 Jun 2026
 14:30:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 16:30:23 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Jun 2026 16:30:23 -0500
From: Angelo Dureghello <adureghello@baylibre.com>
References: <40aefc39-bd98-460d-8aa7-5dd79f562e0d@app.fastmail.com>
 <fdd6fc14-f607-4186-8db4-25de973ac322@kernel.org> <CALSJ-wCrNDv3N2Kdo0uoXsKGtp0GthJRBeYTNQA1gGE2akUWFg@mail.gmail.com>
 <9391b782-7727-47fa-ac37-05cd50821d35@app.fastmail.com> <CALSJ-wBRmUpjz-_ehZ0U0Gu+fPqRUeAn47E0_pwpXQa0tCNzVA@mail.gmail.com>
 <CALSJ-wCuZs9cBJsuOOYMEYM6xOXZbdOm_pr=70d3HRYYSYJ0KA@mail.gmail.com>
 <CALSJ-wDm8NoB8mF3KSx49XMSWz1vjwFhSmgJZWq8pN2pCf12mw@mail.gmail.com>
 <CALSJ-wDY_8SMAvKT0L6wMbH1=w5pZNmV=xyeX1REb=BMRZWj-g@mail.gmail.com>
 <2b532d56-dce4-4f6d-84e0-2fd87d5494f8@kernel.org> <20260601144332.GC4918@lst.de>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260601144332.GC4918@lst.de>
Date: Tue, 9 Jun 2026 16:30:23 -0500
X-Gm-Features: AVVi8CezOGOq-MNrhv5y2nA_4hBEGDCtfXzAaSWT86Uo7sqynIRfYGOJbVIBc1M
Message-ID: <CALSJ-wAaOsizvHGiCdL_mSKS-LQGJKgbnUeBAnE8H+h-7xOGhg@mail.gmail.com>
Subject: Re: [RFC 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@kernel.org>, Angelo Dureghello <adureghello@baylibre.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, 
	Vladimir Oltean <olteanv@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jun 01, 2026 at 04:43:32PM +0200, Christoph Hellwig wrote:
> On Sun, May 31, 2026 at 11:42:26PM +1000, Greg Ungerer wrote:
> > I don't think that is right. The way the underlying data cache is setup for
> > MMU ColdFire (via the ACR/CACR registers) means that individual pages cannot
> > be marked as non-cached. So coherent memory allocations are not possible -
> > at least the way things are today.
> >
> > It would be possible to set aside a chunk of RAM at kernel startup time
> > to use as a pool for coherent allocations (since it could be marked as
> > non-cached via the ACR/CACR registers), but there is no code to support doing
> > that today.
>
> With CONFIG_DMA_GLOBAL_POOL there is some generic code dealing with
> most of this.  But if this driver worked on coldfire in the past,
> it must have been fine with non-coherent memory and could use the
> non-coherent allocator.
>

Ok, thanks, so the driver is working fine with non coherent memory but may
be just for a case. I will try to setup a better SD test. And will send
another patch to have dma enabled with non coherent allocator.

Regards,
angelo
