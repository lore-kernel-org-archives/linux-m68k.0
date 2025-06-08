Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6713C3CD
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Jun 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749375605; cv=none; b=opnm6PI7WvFb6SeWHqrmYiMnn/xVS/xR4A8TruS6yoo8c7R8PJox9qjNhVEBDdsigCeXr4ROp1Wx8dL12qO0vxqbViXV2yOqzPF/mVbJVzVOWG2ppG5wFPE18+gmhse2iac1pX2QMo5es23zEaFwI3C4kDEFNAOTps1CBA7wQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749375605; c=relaxed/simple;
	bh=jmOKtbWnlZR/Qj4SRxgpy6Bosb3xk2ulOZQUv/2xbV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecQUzQErT1M1CcgbPDCW9/XYHpx+NB+XY2LhahwBYsEB4vJmnAviIJxFduT3CYIaU8lwWXUfOeYD1/+J1lUKhp9pbyMoPt2zcOqudFbs3fysJx9c+ySGzYcL2/KttgqbIj+W556+eM2pfbEWLGS+yTZ3fXsIq5XYXvqj24PWu5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-530807a856fso3185800e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Jun 2025 02:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749375602; x=1749980402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEIWuLmQRMVnfGdgxWwMM+uZrcmSfOPwu48WTLXFYZc=;
        b=ltQZQhapaM5ESLMpBhX098AV87wQi5EXByPKEwR9NWQrTroHMAamWdlJmq9ucsI2f5
         cg6NHpvKGb40WfFTeitHHltyQrwRslfgPaP4Soo62zeQSwFkvYZsW+CvedeJlW3CisLF
         o7DJFgpGWeFU5AFNU3+y3BOg5TGtoy3MDJrU28EANZmmmgyq9jkedRHeyJANgCh+MYfW
         YVfKvay0PFucO8UBBpfwZSg9YWmTLEE8FzRd/0qdtqqA56cWEmcr7IRU7bk1i6hNfV26
         x+A1JdJauKW1IA5jdYJwQfLEPiv4lf+g4CYntJZKmoAK9umpkYFIdmKhnYjeEstSh+Y4
         fRdg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Vy+jgpyZv/oGAx3WQpe2V1hynrQbMl98XA1dZ+uegZtQRqdTl4p8l0F04N6L7GRSKh8rw+fCByj9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz6hjyCBr8lNLWRe8Xa+GLm91E0SASkAlcZoKTv4NvhUvGjwifb
	cwtZUtKAw7RMiqXcyqzPoUKr0vHljwxY/ekMyPfDUHlDWn6IGHdbahiWB/Q64YfS
X-Gm-Gg: ASbGncv47sohbBxR8duDdoh+4ctJa6nNdjf/3CLHluzpzLztdvKhxq4juWph+EEW+EL
	aZqEl3hiirGvjDNlxypJ2gCK+vHMqaqmJR4rTee3p3s8v78FAgNFxIMU0k2gerf16+6nfHBoHOT
	QVY5QZ3jemo1+7TmsFUHcdH/j3zdy662vtIujLBb0EtmCV/7sO4474rTFxZo0oYoKGkymiZgKrI
	L3N+4BZsAOrA3o3wq4D87Sowc8hTpl3MNYYdawTkb6HamHexVS4DTS0j+cLW85Zkj5uMtQkkgLp
	5BUtEuVQAOYMFcMFK+ySkOZyUP/SJDaHsGwj3t+GDu24Uvx5Ro8KH5x3xiy5dhvAG0Gi9O8kbi/
	SaYXuCgqWV4bv6xyUIf9fKE5H
X-Google-Smtp-Source: AGHT+IH8lO07iVmFe8Ro2gPEEY/EYOToYRl8GIa3JqDecShyAMydB21gEzxXRAvchlEw/bqxctn7Yw==
X-Received: by 2002:a05:6122:478c:b0:530:5b54:e035 with SMTP id 71dfb90a1353d-530f34a12damr2629064e0c.4.1749375601876;
        Sun, 08 Jun 2025 02:40:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e63e5829sm3316341e0c.31.2025.06.08.02.40.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 02:40:01 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso3311592241.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Jun 2025 02:40:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsDHCi+RByQnpoqh2oNa5TFjuv5XDG9nvpERk8jk5ZJuymzGWn2DvSfbCAS4aXjo5ETDXilU1xCI5a@lists.linux-m68k.org
X-Received: by 2002:a05:6102:12c7:b0:4e1:ec70:536 with SMTP id
 ada2fe7eead31-4e784052d39mr1902461137.4.1749375601424; Sun, 08 Jun 2025
 02:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315105907.1275012-1-arnd@kernel.org> <20250315105907.1275012-3-arnd@kernel.org>
 <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
In-Reply-To: <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 8 Jun 2025 11:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
X-Gm-Features: AX0GCFt4vabIohtnnm_mFUKWYT8sgcrvXqd5vSNi-se7k7UhxzRe5PjaG9sA3nI
Message-ID: <CAMuHMdXeTWSU64jQt+nybsSBOpBEu_zO0WmE5FK1PnA3YkALUQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] sh: remove duplicate ioread/iowrite helpers
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Julian Vetter <julian@outer-limits.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sat, 7 Jun 2025 at 14:08, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Sat, 2025-03-15 at 11:59 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The ioread/iowrite functions on sh only do memory mapped I/O like the
> > generic verion, and never map onto non-MMIO inb/outb variants, so they
> > just add complexity. In particular, the use of asm-generic/iomap.h
> > ties the declaration to the x86 implementation.
> >
> > Remove the custom versions and use the architecture-independent fallback
> > code instead. Some of the calling conventions on sh are different here,
> > so fix that by adding 'volatile' keywords where required by the generic
> > implementation and change the cpg clock driver to no longer depend on
> > the interesting choice of return types for ioread8/ioread16/ioread32.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>

> Those are quite a number of changes that I would like to test on real hardware
> first before merging them into the kernel.
>
> @Geert: Could you test it on your SH-7751 LANDISK board as well?

Already done for a while, as this patch is commit 2494fce26e434071 ("sh:
remove duplicate ioread/iowrite helpers") in v6.15-rc1 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
