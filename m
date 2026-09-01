Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3446399365
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Sep 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273111; cv=none; b=qaObI21o+uZ72W2YcVkQuSKM/DzFBueyDKbLX7IUdtrvFKuSGf/1PMde9DuzWPP6jmCSxqZDVQQ8ImLel69z5/vUsLSRB58AoYkAJjX0fxvkOeDxW8wGC/Y1yuDccmYscOtNCwEMsY1jcv+zw5t/vFf3tiBtkcrLLyg0C7yJ9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273111; c=relaxed/simple;
	bh=4eRXzCEKLHnVuHhHec1QDBGzs4P0YiwAHOUGGNbpqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da2iTvPh+paPNk2QW1SRt8X4w2OEC8d9T4gUqxQ/VWVZJ688o/873ZflfsfY9fZhBNYm905sEcwmV0rpZBNv/lnBMqcOAxpAqQXVz3gz7KerMGRbgi+E3tbXgQqlj3VDDrA9thimFfrIO42y44pSJB9aO9DfJG/2LZxDBnMNLOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My/Zkw7E; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My/Zkw7E"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B07AB60267;
	Tue,  1 Sep 2026 14:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5767E1F000E9;
	Tue,  1 Sep 2026 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273108;
	bh=+SM87dKxgHKoTgR6BSYO1fL6Rd9rD874uyPlzcJDnuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=My/Zkw7EkDQLUSB5jkacAppt65djuYrOjFPJWtAE+uuNKaseNbscCeIJiLFL5tjOF
	 zK/l3KkQ2N9S29hI3UzfgzFa0i3rNCpVRYFstyNcwPJV5mzts5D3rGRQPGBcL2r5sl
	 M4LoV6VJ/3D2KAGExFMGP7y9KIyumhdCGZjgQtts1w0HwS2NaKaLtzngF9+7NuNxTq
	 97Ypv59rrpwA8Xfdjav2hWACORC+/7eWDiEOl7fC+2HguCIpqRQRocLFjIYq8tNPwN
	 1Rl+PvXhytTcmeBeZ03XozFMVE7XZhTphKZmP8mF89keRLxkpfMQ1iGRJldtR0luyc
	 IzD2SuW+PoJHA==
Date: Tue, 1 Sep 2026 15:31:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
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
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 12/12] mm: change the contract for free_pgtables(),
 update docs
Message-ID: <apbfzUwBQyxe3P9R@gremlin>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
 <apbUpMDJglS99_yK@thinkstation>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apbUpMDJglS99_yK@thinkstation>

On Tue, Sep 01, 2026 at 02:57:13PM +0100, Kiryl Shutsemau wrote:
> On Tue, Sep 01, 2026 at 12:01:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > index b91b1a98029c..ff8ff3706485 100644
> > --- a/mm/pgtable-generic.c
> > +++ b/mm/pgtable-generic.c
> > @@ -386,9 +386,21 @@ pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
> >   * be read-only/read-write protected.
> >   *
> >   * Note that free_pgtables(), used after unmapping detached vmas, or when
> > - * exiting the whole mm, does not take page table lock before freeing a page
> > - * table, and may not use RCU at all: "outsiders" like khugepaged should avoid
> > - * pte_offset_map() and co once the vma is detached from mm or mm_users is zero.
> > + * exiting the whole mm, does not take the page table lock before freeing a
> > + * table.
> > + *
> > + * However, the PMD entry is cleared first, and the table freed only after
> > + * an RCU grace period, so a walker that mapped the table under
> > + * rcu_read_lock() stays safe, and the pmd_same() recheck in
> > + * pte_offset_map_lock() detects the teardown.
> > + *
> > + * Therefore it is safe for "outsiders" like khugepaged to use
> > + * pte_offset_map() and co. for VMAs that might be undergoing page table
> > + * teardown.
>
> Is it strictly true?
>
> free_pte_range() clears the pmd without taking the PTL, so the
> pmd_same() recheck in pte_offset_map_lock() can pass and the pmd gets
> cleared right after.
>
> Readers are fine -- __pte_offset_map() holds rcu_read_lock() until
> pte_unmap(), so the table cannot go away.
>
> khugepaged is an odd example here. collapse_pte_mapped_thp() and
> retract_page_tables() don't rely on this recheck -- they take pmd_lock()
> plus the ptl and do their own pmd_same() under both.
>
> Can we say walks are safe and leave the write rule where it is?

Hmm yeah, ah page tables, what a rabbit hole of horror :)

I guess this is effectively a reflection of the 'write lock on write, RCU load
on read' pattern in RCU itself generally.

So, maybe something like:

 * Note that free_pgtables(), used after unampping detached vmas, or when
 * exiting the whoel mm, does not take a page table lock before freeing a page
 * table.
 *
 * As page table freeing itself is RCU-safe, page table readers can safely run
 * concurrently with page table teardown. However, writers cannot, as without
 * a lock nothing prevents concurrent teardown.
 */

Instead? What do you think?

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

--
Cheers, Lorenzo
