Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B01CAA90
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Mar 2025 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795773; cv=none; b=eqUaDu/qw7FMl1JVCPT3+H2BtW0xRBErYRl6M6bHmOjvdysTFMlIOzCPEcKksTZLjmYhmdpJixqAsa+Eg+qE7d4GRDdd8hhhK546pb5RZ6W5nUEj/p3otYX5BPbci5y7Ut2haiUpQahoeJumUinc83hou40QcROTqn4OMc0oOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795773; c=relaxed/simple;
	bh=U+kn0eqCA1vTkLcceUerHMcbUlG4P1T7ky+SM+cNeZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsllr2nfPD4lU/90S5xgJJx0BL17R390MQ4HGJDlHRir6JHy2mvEM2KylX3X2lfo5AKuybFBJ0ZQ9M2bwweOr5wZHO/DpQVT0hw9ces1pLNCeDAgqSHCxJ3Qq/vXUToZKoysxyHJjUnqNwm0qx8wAoE9jfJDEYXscpXXGkE2/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1nXbH0l; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1nXbH0l"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE4BCA41156;
	Wed, 12 Mar 2025 16:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA43C4CEDD;
	Wed, 12 Mar 2025 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795770;
	bh=U+kn0eqCA1vTkLcceUerHMcbUlG4P1T7ky+SM+cNeZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1nXbH0lAp/Eqh29Z9apDenWiT7PjuKxKiO2JQvLOJVWK5GP4OmPvFpXi6asrnzZT
	 nu94zZUymz0UiYH5e2oHwUKtTI1fSzIDWOtzi+i34Gkz1xkL6x5U9bzNGRhUtzuTKS
	 DXX5HBMSnM0KQHz9TeDEZUAKZi2/XgNg8n+fKtj+coTJt3gRJNcK3xsnp4c0Rfm92c
	 yO1JQdFiH5w2Gbb11wg1ZkFYIseNAErd8Fb7JJ7KzSSF/QC6tMXJP/39miA0uSvCwy
	 IrlqFK1R0v32Dh9qsAKLmrl9vNb/vAYRou4oKyLZKKWsSVO2mj5QR0FroBYJHAdDo/
	 ffW5IRilofYyA==
Date: Wed, 12 Mar 2025 18:09:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Message-ID: <Z9GxozjZTKOGDPv1@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com>
 <Z8_Qawg0dGtZdys7@kernel.org>
 <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>

On Wed, Mar 12, 2025 at 04:56:59PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 06:56, Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> > > On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > >
> > > > Allocating the zero pages from memblock is simpler because the memory is
> > > > already reserved.
> > > >
> > > > This will also help with pulling out memblock_free_all() to the generic
> > > > code and reducing code duplication in arch::mem_init().
> > > >
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > ---
> > > >  arch/s390/mm/init.c | 14 +++-----------
> > > >  1 file changed, 3 insertions(+), 11 deletions(-)
> > >
> > > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> > >
> > > > -   empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > > +   empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > > >     if (!empty_zero_page)
> > > >             panic("Out of memory in setup_zero_pages");
> > >
> > > This could have been converted to memblock_alloc_or_panic(), but I
> > > guess this can also be done at a later point in time.
> >
> > Duh, I should have remembered about memblock_alloc_or_panic() :)
> >
> > @Andrew, can you please pick this as a fixup?
> >
> > From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > Date: Tue, 11 Mar 2025 07:51:27 +0200
> > Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/s390/mm/init.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> > index ab8ece3c41f1..c6a97329d7e7 100644
> > --- a/arch/s390/mm/init.c
> > +++ b/arch/s390/mm/init.c
> > @@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
> >         while (order > 2 && (total_pages >> 10) < (1UL << order))
> >                 order--;
> >
> > -       empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > -       if (!empty_zero_page)
> > -               panic("Out of memory in setup_zero_pages");
> > +       empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
> >
> 
> memblock_alloc_or_panic() takes the alignment is in bytes, no? So
> shouldn't the second argument be BIT(order)?

The second argument should be PAGE_SIZE. Thanks for catching that!

-- 
Sincerely yours,
Mike.
