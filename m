Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473A1DE3C0;
	Tue, 28 Jan 2025 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738046825; cv=none; b=oCUEByKdF/8qFvYn18TJFDqgrarODnfrTZ3NKSesXca+xP03l09f6GMD7ClRc7sJIpozLCIW7NDGwEOsQJy8X2RFwNgoL5V3VXzPB4PgceTjJ7Hax1trYLzUj/m7IzXzlh0kgIaP2EZFMWQGpfDh1FKAuXCuqZbNTGEqRQokSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738046825; c=relaxed/simple;
	bh=Esav0loFPRHeteAIXLNdIUVMDBLw+cqFSNCgMByHLLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cgh4BAB+zV9QxsWumDXcce1H+Zh7k3tGPBOtSb7IKxZ/xfcbHZwHXmdDAGghRQgyOlTzY5q/nOzCVArl4+mqiZsjFymw1ajEnv0bRXbFv9dpt9aIAls9bJDmxwmAgvHgRKDty0FGzp/J0CThxBNYATc5xM3aTqE02ZM9abMQaig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c5ZOZzqx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c5ZOZzqx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cCLD4GfrWVFERTqrNJXEG8cNrpLSA7JFQ5fxtz93X7g=; b=c5ZOZzqxG0YAVGGQbfPP5lW129
	wvziuc7Hpr94fplCV2t33+3AZYyYbxa9oqOzOkoqxeqeyCXExqN/teeD765g9iNXrZxZuyDTFlSUr
	gjJ5wwdEoIXczFlvOhYg2370xR2Kqo4BUCCGh2VEMZBScIGurGSlKlEFCNg6RGOyd816S595yPnrz
	vP3aOjONxupfGEfXVb57gtcIUo5Rm3XTe9KkW+2iyrJt3bwLSL4MWasFhE2bsRfjN/FCPANSkCRBO
	WFJxtLc0QjZDztAuw5PCI0PVE0GUughJhPV9UyMiLVLNeIxXfustWMmOpn4zTfxYV/6FOi905LXw4
	bc5Wurug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfNH-00000004FAn-1YCT;
	Tue, 28 Jan 2025 06:47:03 +0000
Date: Mon, 27 Jan 2025 22:47:03 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
Message-ID: <Z5h9ZySKFwHRjg0O@infradead.org>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org>
 <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
 <Z5h70TL6lSWzGA4f@infradead.org>
 <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jan 28, 2025 at 07:43:23AM +0100, Jean-Michel Hautbois wrote:
> > It really should not be hard.  The dynamic mappings already work fine
> > as m68k is using the generic code.  So the only thing you want is
> > to dip into the glonal pool for coherent allocations. For that you
> > need to select the DMA_GLOBAL_POOL config option and fill the pool
> > with dma_init_global_coherent().
> > 
> 
> Isn't it done in patch 1/2 ? Or did I miss something ?

The point is that this is all you need.  No need for new dma ops.

