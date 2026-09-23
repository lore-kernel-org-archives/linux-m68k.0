Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391FF3A641D
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164622; cv=none; b=Zw6NKShqa5BSRurs/+9emx3hUdFnb6nYDRWl7Zny/AjEki3T6QqkhDSo54qypA8q9dnZ/IzzvA2CBiJIWnMgRuFThGxCwNTODYDWF7mH9zUFYBIdJ0I/unRm9iUq51QRJ4e2i3uhCPO0B6he+1Omjiro/qpdxiSet+xDe79XOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164622; c=relaxed/simple;
	bh=Ds2KAw8gvOa+tR2z36qGcwS8SV5iMl/blAUnmIflQkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRaAnsxShO56Miz/aPVwmh95OZX3C5C+4P+NUY7z0p/pTVyIn+I1vH2yXvrchjCxbLyQYd1jsSzO/orV2eTI/TJj9U6QcN65Jea+gTegAEiBW9M2nVyVcnoh7CWcbfCV2e1k7dmBl5HbK0IzwMh8682CyCg5AqvgurdJHK0cNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLzOlpie; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLzOlpie"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D6BC600AA;
	Wed, 23 Sep 2026 11:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2610A1F000FF;
	Wed, 23 Sep 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790164614;
	bh=Ds2KAw8gvOa+tR2z36qGcwS8SV5iMl/blAUnmIflQkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MLzOlpiehBp7rmWLxJ9aplJ887M0HtvnTYcr7Feppz4GpXnrb891HqE1sAdH3CEdJ
	 l+KxVqMBqRNoASgtK1ZWDhIV9vd6xSNNP12m6pFGj2BbzuxpBXMCxSHLYzmSxu6TWY
	 VREKtAqIxlSX2XhdiU58tDKPP9A+aK2QQnnqLStGVJR1fPKeyEbSVAJVeAQ3VTMf9A
	 d/C+oL9WdOE7XZZXqx582LOK0Vav7S1QSMg/Rx3fXHnkivLhsw3ynV4BU43Z8gVVyr
	 XvvM4WhyacwSjjIwFyNJgXErigsiQzZKnEfV38NBbIL0nF4laCa9rcV0Y3Asd/YJ+G
	 a8K3aXfd2AHzA==
Date: Wed, 23 Sep 2026 12:56:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, 
	guoren@kernel.org, bcain@kernel.org, geert@linux-m68k.org, dinguyen@kernel.org, 
	schuster.simon@siemens-energy.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, 
	shorne@gmail.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux@armlinux.org.uk, 
	vgupta@kernel.org, monstr@monstr.eu, chris@zankel.net, jcmvbkbc@gmail.com, 
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org, 
	davem@davemloft.net, andreas@gaisler.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com, mark.rutland@arm.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	arnd@arndb.de, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, 
	ysato@users.sourceforge.jp, shakeel.butt@linux.dev, corbet@lwn.net, rdunlap@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, hughd@google.com, 
	qi.zheng@linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sh-X2
Message-ID: <arO-Y0qZpqpdqzwB@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-8-fe1ad1f1e303@kernel.org>
 <20260923115417.34112-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923115417.34112-1-lance.yang@linux.dev>

On Wed, Sep 23, 2026 at 07:54:17PM +0800, Lance Yang wrote:
>
> On Tue, Sep 22, 2026 at 04:35:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> >Currently, non-x2 sh specifies CONFIG_MMU_GATHER_RCU_TABLE_FREE allowing
> >RCU page table freeing.
> >
> >sh-X2 is problematic because it utilises slab-allocated PMD page tables,
> >and thus tlb_remove_ptdesc() cannot be used in these cases.
> >
> >All other sh variants are fine as commit e3ecf7c7d082 ("mm: pgtable:
> >convert some architectures to use tlb_remove_ptdesc()") already converted
> >page table freeing to use tlb_remove_ptdesc(), which does so after an RCU
> >grace period when CONFIG_MMU_GATHER_RCU_TABLE_FREE is specified.
> >
> >Resolve this issue by firstly specifying CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE
> >for sh-X2, so the arch can provide its own __tlb_remove_table()
> >implementation (called after the RCU grace period).
> >
> >Then, convert __pmd_free_tlb() to tag the pointer to the PMD, and have
> >__tlb_remove_table() check this tag to determine whether to free via the
> >slab or to use pagetable_dtor_free().
>
> Makes sense to me, so RCU callback won't mistake a slab PMD for a PTE
> page :)

Yes indeed :)

>
> >This follows the pattern used by sparc64 as implemented in commit
> >4a0100f7546f ("sparc64: use RCU page table freeing").
> >
> >Previously __pmd_free_tlb() freed PMD page tables immediately, before any
> >TLB flush IPI. This seems to be a pre-existing bug, which this change also
> >resolves.
> >
> >CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE is only specified for sh-X2, as setting
> >it disables CONFIG_PT_RECLAIM and causes __tlb_remove_table_one() to call
> >tlb_remove_table_sync_rcu() and synchronize_rcu() in turn, and this is not
> >necessary for other sh variants.
> >
> >This forms part of an overall effort to switch every architecture to this
> >mode.
> >
> >Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> >Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >---
>
> LGTM, feel free to add:
>
> Acked-by: Lance Yang <lance.yang@linux.dev>

Thanks!

--
Cheers, Lorenzo
