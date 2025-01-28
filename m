Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56356291E;
	Tue, 28 Jan 2025 06:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738044609; cv=none; b=gYAGZYdda1csaSNYIDJDwMFhBCx0wVY/3kDh0hahQrkh9hCsK25xgH7r+p+E0G8uckPGNcb7xSE1RdaBDBxJYD1UuuJGlDTiPN4eRUE8KcgkiwVHrSsitYkS3E9MAN26e9WiGZDClTCDf9ulPnFy03Udob8b4rMVr7kM1wNDOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738044609; c=relaxed/simple;
	bh=bj+qKLPCCK9SwCVnGXufrJNuFDjIK8MJd2y4Z+W5J20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+tHpuXHVZoqaGBb50v0ALDtKAsbYud2WWX3QCbq2RPVSFf3M78F4CUurDlBPKx8NRHAReIaxfZ0cPeU/4Z2xLmbdTBGadaMvkIB3cTMqLMBaNNthhah5RkmCc1jK2nXOWNRxwDgFv3iH/3dRQjD7zmsCcDp0pbmCuvrZwCclZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NnBQjwM1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NnBQjwM1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OYhutla0Ll7y2hOsg0l/7rErRxfVmSH4ie78uJnZ0uU=; b=NnBQjwM1J0JWBzXge1pEnfSczc
	oMRR1+2iiGDQaTkHAegNIdrMucXvxUl5BEuuLAvt+15bcTrKUcw8BqPmn5jC1fmlYrUIeuPlH6Rgi
	XZAj9zuZATMD05hPnXbgBtcnvSbLIIp9x0DjUfJWAv9aizjZCYqEzQzpu7VVTMT+K/nIR9YHfrwXX
	o9P+J9DceEjJeGMAHXWeiAUaAytHiKQ1n9KYW+GWmN7CvsIO/9upNdYR2ykCiF9bQNtdBC60S3k+g
	/IIDueuKHTytpya6JmHG+vvk7CPoTGV9m+P4ElPD/gO9SyltBeAfTzzYXDrQ02+d7deFDAz3msDJz
	qq6seKag==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcenW-00000004Bzu-16UJ;
	Tue, 28 Jan 2025 06:10:06 +0000
Date: Mon, 27 Jan 2025 22:10:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
Message-ID: <Z5h0vvL0B5ktd3sM@infradead.org>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Jan 21, 2025 at 11:54:14AM +0100, Jean-Michel Hautbois wrote:
> Introduce `dma_ops` for the Coldfire M5441x platform, enabling both
> coherent and streaming DMA operations. This addition should fill the gap
> for DMA support integrates with the existing kernel DMA framework.

Arch dma code should not implement DMA OPS, but use the generic
dma-direct code with the right helpes for handling coherency.  This
variant looks like it should be using the DMA_COHERENT_POOL allocator
for dma coherent memory.
