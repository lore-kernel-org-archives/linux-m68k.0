Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76D83EF0A6
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171024; cv=none; b=LKuMQ5zlfvfknlZ8srcPagHP412vo+Q6X6LBjdrlc9rKyFuvPprEbitX2grYRnmgDQe7TmtSDLIoEi2KTkDEbrArxC4lNcigMGRqM+WzuC6qp7dVjyHS1xx4PinPUi4JmOgLYCaIh07MAojZrKqYekupSZCmS+4jLkEDb7fE/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171024; c=relaxed/simple;
	bh=263Kz0c63eAZU3G8zs+kKv0GGoxPDsYu96TYT+oIxWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlxLBrWFSudNwQmIDOhaj6rP0RT6uZ6CglF01DE1gpRWddNEaTCNDSXnutN9ROAXb3bolchJxbnrRvI1LNkZPPVV1m0lBB61Pp/9RFleK5jNqwBmg4l8FlOg/lXj0n72gDH5bICKG/7czQ4Frb98NhBNN6+0DdhzYUt/pH9G6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odmxHHcp; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odmxHHcp"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC4B2600AA;
	Wed, 23 Sep 2026 13:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A5C1F000FF;
	Wed, 23 Sep 2026 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790171021;
	bh=6xDgTcRD17pMZUKjE+n6zU9uG96i5536rlsM5iR5TPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=odmxHHcphfJU/2dNQHFnLCZHx7qUsOTN2unPx/tuy1nXDSyLZmeYwR7/Rjr7jfT77
	 QnuCynM47lsKoqJC1y97i+U1JvZkZUSXp9zkXwbycdpb9XJ+pApXutz7lCcNFAJ3vm
	 vBWH4cHO+xn5wlHRsn6xzSZJ9/9k5KZaXvlcM22x8ZHXT/+6kz62RqW65s76Lppcuz
	 F5EUgyH8Kf2PVj50ygyL2QutGkc1XBv8xpCS/e6hY65wLgFvWhIpVu4lKscZxay6Tm
	 z5HHhYChWlwV8Hq1DsRMOKqUEfxwlsCQ4YbcBWu/p5tcGD9PmvWztotX9Xy/LdT1Kq
	 9Ab6m9tid+4dA==
Date: Wed, 23 Sep 2026 14:43:16 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Simon Schuster <schuster.simon@siemens-energy.com>, 
	Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Stafford Horne <shorne@gmail.com>, Rich Felker <dalias@libc.org>, 
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
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 11/12] mm: make userland page table freeing RCU-safe
Message-ID: <arPXb084Xbty9O4_@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-0-fe1ad1f1e303@kernel.org>
 <20260922-rcu-pagetable-freeing-v4-11-fe1ad1f1e303@kernel.org>
 <72d1548a-a4ee-4832-b2ab-4bc82f1933f8@kernel.org>
 <arOWZCeV8FrkAvhK@gremlin>
 <802d3999-95fe-4a09-89b4-d01b60f8e963@kernel.org>
 <arO7lSy71meks_sW@gremlin>
 <c62bbd96-d949-4c57-a3c9-ebec14744f35@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c62bbd96-d949-4c57-a3c9-ebec14744f35@kernel.org>

On Wed, Sep 23, 2026 at 03:38:53PM +0200, David Hildenbrand (Arm) wrote:
> On 9/23/26 13:48, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 23, 2026 at 11:13:36AM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/23/26 11:06, Lorenzo Stoakes (ARM) wrote:
> >>>
> >>> It is the final piece that makes that the case, so I think it's OK to allow
> >>> oneself a nice subject line? No? :)
> >>
> >> Just took me longer to figure out if I am missing something important.
> >>
> >> E.g.,
> >>
> >> 	"mm: remove unused RCU-unsafe user page table freeing"
> >>
> >> would have been clearer to me. Anyhow, just stumbled over it, I don't care too much.
> >
> > Compromise on:
> >
> > mm: now userland pgtable freeing is safe, remove unused bits
> >
> > ?
>
> Maybe something along those lines, yes
>
> 	mm: userland pgtable freeing is RCU-safe now, remove leftover bits

Ack OK.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
