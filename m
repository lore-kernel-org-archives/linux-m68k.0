Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66926A09D
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883994; cv=none; b=eRApLAaCotH0fyYuIZqi5ccnxk4am14Gouru75ZTOQgRcqN9xIaxfBZhbIVCGnV+A6TdxRn/ZI9cQI+TgTdek2XUTuFvvLUvfrtzOvGyr6szTy4sJcE/hEgF2XQkSi1K2dQJcWmMZchSjvtMzQ4g+ugt1l5VZ9cA2x/QJFanEU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883994; c=relaxed/simple;
	bh=SJIh4TOyAnLQgRaND+z2LtBYQ5hvnSYhcxMltVARNHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSFhJNF2C75x1yAk39tg/3essHBW1J1maJkyKqK8HryBU3YgqEiapsYtZRE682KnTPXTewaeCVF1OGyRkSSDsl0UflgEnB+KWRjOoNBk/JJwIsZl67ojZr5X/DxhF1eJb4UZMdINeZZa5oeEFVUp6naUFD33KsgdyemcIAG3K9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXsvsd/l; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXsvsd/l"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF76BA477BB;
	Thu, 13 Mar 2025 16:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112F0C4CEDD;
	Thu, 13 Mar 2025 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741883990;
	bh=SJIh4TOyAnLQgRaND+z2LtBYQ5hvnSYhcxMltVARNHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXsvsd/lxGJNEoAX6HtYBN5kSEz6YHB6jkvfmSGlAYkaC6zejLPn/jhjOGbnxowV9
	 G4ObNvl3IBz4OwYO2TlZ/bLh8DZduHi5CkgzYMn1CVOppgH6xx0HzA9IMhHkCryYCY
	 ZnelQtcYuqYVLCo8RDAfcA5wrN0rilAxNY4bxJB3K1CqJlX1tG+a3qgJkkTCsPFO7h
	 mIMi9CWIvAGiys0Idmh6XXVvAFEOzxC+aoae1uw6WzZghXN98gnejmZ33szJK51KlP
	 WWbGYBsBTpQxs6TW4o+VUbqyqW8YHpq93CdsecoGwYUTU6EUH46GDnnPb9iVFpOFP+
	 OQMV0Bj8JCyMQ==
Date: Thu, 13 Mar 2025 16:39:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH v2 00/13] arch, mm: reduce code duplication in mem_init()
Message-ID: <5de71a98-d87f-4bfd-83a1-3f6e11c84d7d@sirena.org.uk>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
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
References: <20250313135003.836600-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2QbfUHTxTDOlgUSw"
Content-Disposition: inline
In-Reply-To: <20250313135003.836600-1-rppt@kernel.org>
X-Cookie: A beer delayed is a beer denied.


--2QbfUHTxTDOlgUSw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2025 at 03:49:50PM +0200, Mike Rapoport wrote:

> v2 changes:
> * don't use generic version for setting high_memory on architectures
>   that use that varialble earlier than free_area_init()
> * use memblock_alloc_or_panig() to allocate zero pages on MIPS and s390
> * fix alignment in allocation of zero pages on s390
> * add Acked-by

This resolves the issues for 32 bit arm, at least the v7 boards:

Tested-by: Mark Brown <broonie@kernel.org>

My v5 and v6 boards are having issues but I think that's unrelated
infrastructure (in one case definitely so).

--2QbfUHTxTDOlgUSw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfTCkgACgkQJNaLcl1U
h9BPbAf/SDBWCt481g26uw69KoHpeH2cGq0Z5NH3zUIIBiu3gpRrex/BeLXVuY79
d57+lsymFEsgnNbhXNvzjAzmaRTSMBu9C1S5o4Jo3+sz8kEnBS/myycnCrbU+lVy
9R4LmwA4hhMZw2+UhgRPVFMTjd7fsFFLAsxmHyCheEOGfLGKMTKleusqFbK2phbu
IrDc/IU6mCxqGrgZ3lO0fV7w2SfpkBANi9bXJz7aeAbqsOBeVyLCKgAL/gsbZxDZ
g6Y0lOdm1gfigEHb8d5DiireqslCdgHnoH90rRI+3YBQiT8QOJLd/3W3G7YrKPNy
/ufJa9n1CuXbfkYbynfJxmTOHNUPHw==
=M7tK
-----END PGP SIGNATURE-----

--2QbfUHTxTDOlgUSw--
