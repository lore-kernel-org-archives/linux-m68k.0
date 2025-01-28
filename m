Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01F31DC98C;
	Tue, 28 Jan 2025 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738046420; cv=none; b=iv9c+/oq3bX2Y/BnQGM7z2j5tFIRi/+IkqytpmZFM/502fXkSEH1EMevY4aDoUKTyFCXA1S8GegJF3jeLmj8t6g6Pr9/2ZGzjqYrafgO6UFvf3KASOnbsBExzq3PjdxEmAkqWqZ5x5NtINYPt+ryicKLH9tYytfCjT3mVH6yc9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738046420; c=relaxed/simple;
	bh=OxPEwU41HRAX/WbHQGPw+vkiSiec40XL+Mznv66KiSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c05/tKAjRxXbXgwXViPBeX9nzspP94oqbgBXQRinmIWWrEiQXa+/8Sdcagf5bhQf/H1J2Xw6dH/4ailPM/4MIVvZolV4DqT4JlPHwQXhY6aufd/y5r6s/xRrPajpR3JgpcGz+4+nWxdOS/4hrcycB6b0G1Sd2iJ68eHJL8ZdcoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z4tRVQ+y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z4tRVQ+y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7aULS3I8KrhISY2phTk/OUazR9gqglmU2l8ykD9SlHE=; b=Z4tRVQ+ybc8AiMiR60oaCmC7Uu
	J/nJuwzFpzsYNpmt7qSbAqv1VBnV+i5ozBuboCpZnGhtQb+5AJxYvR8Lsd9ZFxgsoaGpC2SF6WkRD
	ssEBq1rAcUX/OPtThbUAlk5TDdplxqk9ZILcGkm4TkwzurPiU0Iaj+5iC2P1GuzyfNmtijh0ZdXsU
	aIjjFB16mpG7yDITE+R5G/J7s6Go4w1eBosIfzJDjgqn26SLig7XCcmRTPzuNGUc+REx/QAMZeWSi
	rttdpOUCixpXPwAGUzohWagBigA47PWX3A4yYWnRQajjV5yyd4rF8mj9K3PWEV7t7fQoMeJ3NaXvi
	B7IJxhJQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfGj-00000004Edr-3mbw;
	Tue, 28 Jan 2025 06:40:17 +0000
Date: Mon, 27 Jan 2025 22:40:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
Message-ID: <Z5h70TL6lSWzGA4f@infradead.org>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org>
 <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jan 28, 2025 at 07:33:37AM +0100, Jean-Michel Hautbois wrote:
> > Arch dma code should not implement DMA OPS, but use the generic
> > dma-direct code with the right helpes for handling coherency.  This
> > variant looks like it should be using the DMA_COHERENT_POOL allocator
> > for dma coherent memory.
> 
> Thanks for your answer.
> I am not sure to understand it though :-) because I can see a few
> dma_map_ops implementations in arch code.

The last one left for the direct mapping are arm32 and parisc, and
they should go away eventually.

> I tried to let dma_direct do the
> work, I can't remember exactly what happened but it was not great :-).
> I can give it a second try.

It really should not be hard.  The dynamic mappings already work fine
as m68k is using the generic code.  So the only thing you want is
to dip into the glonal pool for coherent allocations. For that you
need to select the DMA_GLOBAL_POOL config option and fill the pool
with dma_init_global_coherent().

