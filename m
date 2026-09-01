Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA37483806
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Sep 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282883; cv=none; b=RClcqFmND4Urlahn9CAFQM10ZkB4FkjTJ/IeiDLhNPHx0Ss3a1VmOTQToidexK8E+jqavk+XtQT5Tb89WXts7NrstfVFAIgAbQL/kCXA0GSXmGK9SNk7b55QGjVskxOJ9Y6UrqYDvpOkU9+wgsaMxFUHAGtiL2v83QbaFtpsGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282883; c=relaxed/simple;
	bh=OGFb2qA3B+EORDiZjd3N4e7IHZOF+p92KhhsxoTYZ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diElZpEHxOloyRNaybRlt1MqvfPjY/6+yXGZMrj2xj0Rqb3CP5e5KbJp3wWvrB+f9EaJ7nWPh9bgCG74BKzBcsI82pVt0hG3/Wq3abGl9+3GYYTbHzu3h5rbHEFzLQIVq6MjxPO9tL60PeS54ZnoZgBSKkbwmf/aL4uiyyOPwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyGc8XSV; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyGc8XSV"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 481356013A;
	Tue,  1 Sep 2026 17:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563FE1F000E9;
	Tue,  1 Sep 2026 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282881;
	bh=1PNkp7ez9jErakiPQKOI7B9sFRUtxTNZU0kcpf3jJWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WyGc8XSV+h5QaC5hrytW/vJLWXzYZQZJxWveh4LcjaDsd1IWOINhAcGPiYhISOsLo
	 OSSdCjOizMPKQZXR2T+u5d8YeyJ0w0XUMVwautKGnwupK6xSsdLd57wV979q/6rA8i
	 2+TkAPP7HmGk/XtHJ3EpB24En1Ix+6oYBfTNUJrEQf5D3oyrMxBXMXCYFfIwSlgEHM
	 pSTP37qXlVGUJw0e/z1Tii9u2hm4ByGXX+kZTv428piYykVP1aDkLZkvtkl8B4vVrZ
	 r+SRmOn2ziSMauikcMFr/wbjsF/EUiHXzzHcyMBvmKBcKGquGY/wktocgGQ6amFEia
	 w36rT04Ny6Ffg==
Date: Tue, 1 Sep 2026 18:14:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 01/12] mm/huge_memory: zap deposited page tables after an
 RCU grace period
Message-ID: <apcH2jMKVfKtnppD@gremlin>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-1-5456a81c8212@kernel.org>
 <apbOlyF77yDCV4cF@thinkstation>
 <apbcoMTVlL42G5tg@gremlin>
 <20260901142408.GA56830@ziepe.ca>
 <apbiB51hjm-9pRzf@gremlin>
 <apbuO_QveZNAz3ns@thinkstation>
 <apbvoN6ttgHfI_xg@gremlin>
 <apcFUthh0XSFg3JQ@thinkstation>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcFUthh0XSFg3JQ@thinkstation>

On Tue, Sep 01, 2026 at 06:11:57PM +0100, Kiryl Shutsemau wrote:
> On Tue, Sep 01, 2026 at 04:45:14PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > munmap() of 64G worth of THP should be enough to demonstrate the
> > > problem.
> >
> > I mean you're going to hit that from RCU freeing page tables already, which
> > most architectures already do right?
>
> Not at the same rate -- tlb_remove_table() batches into struct
> mmu_table_batch. One call_rcu() per MAX_TABLE_BATCH.
>
> > So if RCU saturation is a problem, that problem already exists, but I've
> > not heard of that being a problem at all?
>
> I did quick test and I don't see a measurable difference in munmap()
> wall time of 40G of THPs. I see ~17x more softirqs, but this is
> expected.
>
> The objection is retracted.
>
> We can return to this later if it is going to be visible anywhere.

Great thanks! :)

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

--
Cheers, Lorenzo
