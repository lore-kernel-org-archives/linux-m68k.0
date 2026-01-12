Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4C3328E4
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768203305; cv=none; b=G3E0WyPC2SEPFJhioAbf4MJ+ytdzBaRVwoYE+675UuXZFnu1qQNvaI0800zkviAp3sRLWCB60hBBSKmt0ZmG0pz/yRlUGRdCyF6MIHddGgx19UpG8G1eRj4Mqosb6EAZKLoAWVf3rmemTom9by0dQKn6v5Eqyrx19wpvWdDfhcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768203305; c=relaxed/simple;
	bh=H0wpDyU4+hGvGadEaJXaoKwU4fABU87rkRhUJIykrtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkTEuz2ame2kX2R8AULLRgUSC25wTxPqEXXEOlWc673E+IZ/wTWW0L6TWIAYIkW1NKBROQROUc+UOwkvxflMJIGTQjOfD1OIDv7wMupHX7oMIT9ygUPrRBBgb6vg5Ds2XwvAM/ibE5cgMXQH5WTyyjrbPRXeGA1vL0jotO8GpQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cB9JlNOs; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cB9JlNOs"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CBFE43C1F;
	Mon, 12 Jan 2026 07:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61041C19422;
	Mon, 12 Jan 2026 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768203303;
	bh=H0wpDyU4+hGvGadEaJXaoKwU4fABU87rkRhUJIykrtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB9JlNOsE5ASTDSwfciaJvBRecBB1lB0Uwj+GaWwyCjgypyJQWPdkiELZQ8iVJPfz
	 nMocJbirHN/1lk3J7Si3fdDg+XjkNRlIqWpD36vowiVH0S+GvTZEHLt/X4w6L2bjbX
	 MW70tMpH6LtqJ9xirliNmH6ey3Jn3uobFlK0X2Mc7rV2i4ddTSmSf1HxKEBm5toCRi
	 d46Yvu6ZlmDb9ZF7jcWZyute2z21cTSvo7YbjPFCodLjqoxUiSIWkDnwdalYjHh76y
	 ow7pMfD3F6CiXLdHJYJqrOQj4clSEc/bsWScF8TIIT22yhLrTWzvu1RJLquyFnQ26r
	 U5L75tv4dABXw==
Date: Mon, 12 Jan 2026 09:34:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 17/29] s390: introduce arch_zone_limits_init()
Message-ID: <aWSkELL7xJ04QAct@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-18-rppt@kernel.org>
 <b211f877-f9bb-4892-b67c-d2610048575a-agordeev@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b211f877-f9bb-4892-b67c-d2610048575a-agordeev@linux.ibm.com>

Hi,

On Mon, Jan 12, 2026 at 08:02:48AM +0100, Alexander Gordeev wrote:
> On Sun, Jan 11, 2026 at 10:20:51AM +0200, Mike Rapoport wrote:
> 
> Hi Mike,
> 
> ...
> > +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> > +{
> > +	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> > +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> > +}
> > +
> >  /*
> >   * paging_init() sets up the page tables
> >   */
> > @@ -97,8 +103,7 @@ void __init paging_init(void)
> >  	sparse_init();
> >  	zone_dma_limit = DMA_BIT_MASK(31);
> >  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> > -	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> > -	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> > +	arch_zone_limits_init(max_zone_pfns);
> 
> You move initialization of max_zone_pfns[] to a function, name the
> function arch_zone_limits_init(), but leave the initializatio of
> max_zone_pfns[] to zeroes outside. Should not it be brought along?

The idea is that is the caller responsibility to initialize max_zone_pfns
to zero. After patch 24: "arch, mm: consolidate initialization of
SPARSE memory model" there is a single caller of arch_zone_limits_init()
and having initialization of max_zone_pfns() there is more optimal than
having 20-something of those.
 
> >  	free_area_init(max_zone_pfns);
> >  }
> 
> Thanks!

-- 
Sincerely yours,
Mike.
