Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4926C3B3
	for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Jul 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520930; cv=none; b=hGErzqkHl7MCkfvBE6s6UePR2k7/Um4f4TMkfDHgjF/73WSxZkF3QJcDoJX5gx1thQvHRvF2XJrKzxspBX+rDlQ8shE3bMCm5SRQAT6yd9lbzjbLKLbHzKFSNw6VWLOtkk/aA75xKbmvXr0NY/WdoNw7UjZdu3zXtQRrvrs1OxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520930; c=relaxed/simple;
	bh=cyKqxF354Kh3jiiJsvMFm0rw2SJcg/Rvana9gIG9/Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjYeHZ7TdpxBCsYJA0IxZTpOAXkIPO16PVYdMm50DjYMbi8/aYe2Oih4KZQqQQ3n9LkJY3TpGGLALFGdzJiMdmhBYULuxmLtM5/0+OAAJTGqWt4BptKiTb1Q2XoT/ZWJjbgrc5hCklL3xvw6aYH5wd2qOPWZ0ONG3+aDZ+hS8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=II+iiKTR; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="II+iiKTR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lyYpP11IV4bpIFu/ApBOf5v9Ko6xUqN4taKSagvjK/M=; b=II+iiKTRIbP7EEoPO6fBG6NuT8
	KAumMfvVQL9jagZZy1XxsYsaHkq4mhSugWHhFSmyPUt7gbBHEHNxrR1425KC1OIUWfCo1tkQBVnBL
	WLeW/1oH6pWr/qJLENwIYK423PEBvvGwDpv9RxA/uLtNg2F5/oXVoEaWYUcOqvgH5aZqXi6wh/Wba
	zvX9RiF3THpbEJvToWOaeVXbS8utGH/rnirN7xHjEsxDDFAC92FLrCPubWF0Cjh4nCKjUGXvA+zkq
	2o2/y29MOWMRADimP+Sjief7/LA8ROswOiDVRd2TMbmAn5fElVNqYMwttX4jINmbvezlzNJklFqA0
	XHDstQNQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOkW-00000008sD1-2ZOq;
	Mon, 14 Jul 2025 19:22:04 +0000
Date: Mon, 14 Jul 2025 20:22:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org
Subject: nommu and folios
Message-ID: <aHVY3PIBI0M7Whi7@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg!

The last user of add_to_page_cache_lru() is fs/ramfs/file-nommu.c I
think I need your advice about how best to proceed with nommu and folios.

The basic idea behind folios is that they represent a physically,
logically and virtually contiguous block of memory that is a power-of-2
bytes in size >= PAGE_SIZE.  struct page is going to be shrunk and it'll
be most efficient if we can arrange for allocations to be larger in size.

UCLinux obviously has very different performance requirements from the
kinds of systems I usually work on -- memory usage minimisation is much
more important.  So ideally we wouldn't split the allocation all the way
to order-0 in ramfs_nommu_expand_for_mapping(), but do a split at just
the break point.  eg if we have a 40kB file, we'd allocate an order-4
folio, split it into an order-3 folio and add that to the page cache;
split the order-2 page from the end and free it; split the remainder
into one order-1 folio, add it to the page cache and free the remaining
order-1 page.

The problem here is that all the code for handling large folios is
currently gated by CONFIG_TRANSPARENT_HUGEPAGE, which I'm guessing is
not enabled by any uclinux configs ;-)

Something I've been wanting to do for a while is split out the code
for handling PMD-sized folios from the code for splitting large folios
into smaller folios.  That's necessarily going to increase the size of
the text section for uclinux, but hopefully it'll be worthwhile because
it'll decrease how much memory is allocated at runtime.

Of course if uclinux files are typically PAGE_SIZE or smaller, this isn't
going to help at all.  Which brings me to the really sticky question
... how much do you care about uclinux support in a 2025 and later kernel?
I have no idea how actively microcontroller people use Linux or update
to recent kernels.  I'm not trying to push uclinux out, just don't want
to do work that nobody will ever use ;-)
