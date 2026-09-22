Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B349F129
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Sep 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097761; cv=none; b=FJEipu1QPTQ6yV/e4SfgLlny/VvZPmBdFnG1fqxpUotdGirc4YnO7uKSqKsd0NRnq9L50v+DX5GubwpERTkUwsk0XMAvFBFl6fd3Y/bv+Fql4qLjYAJunjVPB9lnOT/jk0lMNFYG9RiokF0i/yuP9LDu2cPs3SKAq5tkc17SkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097761; c=relaxed/simple;
	bh=ykI6bqtAnan0fCwbd3pxLqU3hmd3EO2QMgG3+lJljBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c95kYqJtS33orve+/5GtUEDsvFVBXwA1ivgbURv3lWuDoQYC41Xj/5raBErcj87g0YwyPUIEiphqZHbHFJQIRqONr0kbDyw77EI9bQ/vIn7PWdJbFR5SPW2YXnRtjDT0OeTOBDdKCoKgeagZ7JU8x6j5ugGcs2gsEHfZp7gopNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9l/h2sg; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9l/h2sg"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 238A742E98;
	Tue, 22 Sep 2026 17:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DCD1F000FF;
	Tue, 22 Sep 2026 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790097759;
	bh=UNh8IajC2C7W4xAVN/5A4Te3DbNvUnFRUUUmja4mmRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9l/h2sgeG6pItIpsl4UOUD5LPuOPYalAOj3lX7iN1SKQRQx/7vSe8Y8wJYuJaFa9
	 tegjTwQVFA9hXGIt+1oJvFwKspvEmTZEeRl/rL3Z+1/vMB7N90Y9ljH8EiqVFiWGMa
	 llb7G+u8p4G82Y3NfZpa4T6VyMnit/o1genoOGjAzyku0OZj1fvAIP0nPa5BRjaZ1s
	 0LsiYA1bWAjQ698sUHV9gBhPhcHOkUs5jCvX2Aqi8QkSHyLlAciZyH7C9FEowKSWF8
	 GvrRJLzG6nhqL2FhCQxRW0vNDBGCdIskECu8iSBeB5zhpcl0fRPI9Q5+bVasWrDLde
	 t0gfKdsjFaNOA==
Date: Tue, 22 Sep 2026 18:22:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
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
Subject: Re: [PATCH v4 00/12] mm: make userland page table freeing RCU-safe
Message-ID: <arK4XnDTuFpwPV38@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-0-fe1ad1f1e303@kernel.org>
 <arKv4qbF04KB2WxQ@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKv4qbF04KB2WxQ@casper.infradead.org>

On Tue, Sep 22, 2026 at 05:42:10PM +0100, Matthew Wilcox wrote:
> On Tue, Sep 22, 2026 at 04:35:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> > m68k-motorola required the biggest change - since RCU page table freeing
> > uses call_rcu(), this means page table freeing can arise from softirq
> > context.
> >
> > This was fixed with an IRQ-safe spin lock used in both get_pointer_table()
> > and free_pointer_table().
>
> You don't need to use an irq-safe spinlock for softirqs.  It does work,
> but it's overkill since it disables hardirqs.  If you use spin_lock_bh(),
> only softirqs are prevented from running (and it's safe to call
> spin_lock_bh() when in softirq context, just like it's safe to call
> spin_lock_irqsave() in hardirq or softirq context).

Right yup, I know _bh() is fine for softirq, I think this was being overly
cautious (for sparc32 you do actually need irq saving).

But this is m68k :) functionally there's really not that much difference, and
it's over very few instrucitons so the delta here is likely to be functionally
little to nothing.

If I need to respin again I'll fix it up!

--
Cheers, Lorenzo
