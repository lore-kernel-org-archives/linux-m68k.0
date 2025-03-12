Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DC2571A5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Mar 2025 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795036; cv=none; b=fvDBBmJcM95WOQaGkZcMR9FFTGZjs5ETVRb97o37on4LnwhwkoZWqLoVSjFIsod4rzzzPvIEGleRL+S5bW9oY5iF6o3VlFyNOx/RJq0Y25FICIuCvuH3GXFoYW4k2BNAJ2Ypn4cXWvSlq95bAJXPdPBkyazNia7v0CkrhGrjrkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795036; c=relaxed/simple;
	bh=dgU35NJAC9FuhPfl4fCxI5+qb1wmL7e+GyilvA+NxwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnP5s6jbVN07V15rhF44RLsHG3BTNEVdf8QBI7hp+kv14GQ0b67g2QZETtf+VglXw2JH2VOonfH/kohx+cuyCcW0vlQwkgUQe/VcDx0CnaOvmvjuyGwGqPSfPk7xAaOREPjNEgQenxWDIlP/VNyiW3QCfiu5rVHwKN6Rdt0PMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMGDPNzr; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMGDPNzr"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 020F55C5C40
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Mar 2025 15:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A29CC4CEFC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Mar 2025 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795033;
	bh=dgU35NJAC9FuhPfl4fCxI5+qb1wmL7e+GyilvA+NxwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VMGDPNzrQPf5TkD0b7NrkaL9vBedP++HcJIYppS3OacGh+lmMlyllNbJ65T8EUwpe
	 X6mgQAvFxmpr+7NeL+U8J5eO9mUFyF9iC/Bpw3Fnv2dGtL6Hrt/Yx6uH52UPkON/Bd
	 bMd4vd1sat3O7CafhieqmZ6kqMEcz/ppjRlQKe5fcS7fyHE/3Y4vyt7IpKYAo5CVFc
	 NGaHqUjovj3IqQIA6D2VmMJyyRyouA92R+HwQ7lUhQMLRtbPXzmj+6/9l+YNIMzd2o
	 aGu6LYyHU+u7IYNYk6FT81OA0rsZ70e5lk7oXpt1fRBo8+yNkDj8UUhHY3Of+SO/GN
	 Rivwxuyc+GVag==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54963160818so7670586e87.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Mar 2025 08:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ/qhNa2Q0ynjfMREZ//uy/zUbzyQ8pegXAxUrdI+Yec5Nh7iKK7YpWPoCEBN7P11BBPvmXZnq5fuP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz1k1URTmxE6kWo9fCO565bstRUvFiI4/2KVUgJawfPFcCiMho3
	4t4B21DBmusP+L/6mhpTptGQprL91pSwSPft2wfQ+kE1NcqlTtfntkJPF0vgozklvxb+zHX2xiF
	7Ia/T0e9nhEMyOACFHoPidBabdI0=
X-Google-Smtp-Source: AGHT+IHd+FrUHToN8zCIkYvgOINETMZJki/NvRa0TX9T0SvIe4EkJVM+k58lts/E3WmtqFbt0GpXCZ7ftrMtmqZt6y8=
X-Received: by 2002:a05:6512:3e1a:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54990e2becamr8141673e87.4.1741795031214; Wed, 12 Mar 2025
 08:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com> <Z8_Qawg0dGtZdys7@kernel.org>
In-Reply-To: <Z8_Qawg0dGtZdys7@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 12 Mar 2025 16:56:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrq0NRixaZgOe6Zrlj_W8SN3MQrS2p8OQe5yMSfjVPvuZ4c51CBlAcj7NU
Message-ID: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
To: Mike Rapoport <rppt@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 06:56, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> > On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > >
> > > Allocating the zero pages from memblock is simpler because the memory is
> > > already reserved.
> > >
> > > This will also help with pulling out memblock_free_all() to the generic
> > > code and reducing code duplication in arch::mem_init().
> > >
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  arch/s390/mm/init.c | 14 +++-----------
> > >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> >
> > > -   empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > +   empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > >     if (!empty_zero_page)
> > >             panic("Out of memory in setup_zero_pages");
> >
> > This could have been converted to memblock_alloc_or_panic(), but I
> > guess this can also be done at a later point in time.
>
> Duh, I should have remembered about memblock_alloc_or_panic() :)
>
> @Andrew, can you please pick this as a fixup?
>
> From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Date: Tue, 11 Mar 2025 07:51:27 +0200
> Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/s390/mm/init.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index ab8ece3c41f1..c6a97329d7e7 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
>         while (order > 2 && (total_pages >> 10) < (1UL << order))
>                 order--;
>
> -       empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> -       if (!empty_zero_page)
> -               panic("Out of memory in setup_zero_pages");
> +       empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
>

memblock_alloc_or_panic() takes the alignment is in bytes, no? So
shouldn't the second argument be BIT(order)?
