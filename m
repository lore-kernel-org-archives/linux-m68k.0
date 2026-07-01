Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3234DB52
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2026 23:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782947537; cv=none; b=pCVdcECYZGTdqZMVgu5mG9InM9iHMBuBsNjATo7JB6wAMF9oGvD7uTPpiKFrpkl9uVn3oGmtxHhmgGnFNmKJLaGtBTkpLePQZ53JFZbzULLZBM8SV3hpKUM3dWO7LlmCYwsUQJePG1vHy94PMjKKQV/sOBxH9rYDFkXEBJ0uqvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782947537; c=relaxed/simple;
	bh=SsT3U4SEdjl0Z1K+I5bgW9t+7q3+Qy+s8FR+8VVx34Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IsPE5wAJRG4ICELk1uvcsGl68TzQ4IQiWRmUjY1XrqwlIoa3wsu/Xlf4mcp5m6bRQfc7K/+G9SJ2IEs8BvryBsSjhIroL1FsjN/0GfSv8CVFQn4XXb4GvcQzv4A/+PWhI2Gr+vbg3zK2JflQ5spaPb8sCgtkxXZvDp+ud+J3Svc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ujOM0R3m; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ujOM0R3m"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C7D40B34;
	Wed,  1 Jul 2026 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3011F000E9;
	Wed,  1 Jul 2026 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782947535;
	bh=zPRo7VnNTPA9Z8a/Y0PH2tMDGeydEl8Hz/i181T8nxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ujOM0R3mrNTz+tiTbz5LtTypwrm3bvSDNDATXiiL19PLh4XeS0yVRnny0BqDoap7X
	 snYV8RchvJgY6u9Pt0yiiQre5Y4Geg8w2Kddwqmvszo82vnAeyvvqfd7hyM0IMPcD2
	 O/KoAaRzJUtySx+3u7ads1KAPbkmDQfkt2NA5PNQ=
Date: Wed, 1 Jul 2026 16:12:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>, Ankur Arora
 <ankur.a.arora@oracle.com>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: Avoid -Wunused-but-set-parameter in
 clear_user_page()
Message-Id: <20260701161214.5f381f2882af5fffd909a0b1@linux-foundation.org>
In-Reply-To: <CAMuHMdXsfo=BR-e7gBKvTx=cH84vQoNXN8hZv9+8E+EmirMpEQ@mail.gmail.com>
References: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net>
	<20260525125441.6a3a74300d73f1e0d32db4f8@linux-foundation.org>
	<CAMuHMdXsfo=BR-e7gBKvTx=cH84vQoNXN8hZv9+8E+EmirMpEQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Jul 2026 11:48:35 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > > --- a/arch/m68k/include/asm/page_mm.h
> > > +++ b/arch/m68k/include/asm/page_mm.h
> > > @@ -55,10 +55,12 @@ static inline void clear_page(void *page)
> > >  #define clear_user_page(addr, vaddr, page)   \
> > >       do {    clear_page(addr);               \
> > >               flush_dcache_page(page);        \
> > > +             (void)(vaddr);                  \
> > >       } while (0)
> > >  #define copy_user_page(to, from, vaddr, page)        \
> > >       do {    copy_page(to, from);            \
> > >               flush_dcache_page(page);        \
> > > +             (void)(vaddr);                  \
> > >       } while (0)
> > >
> > >  extern unsigned long m68k_memoffset;
> 
> People are starting to report this, now gcc-16 is getting more
> widespread use.
> 
> Andrew: can you please take this, or shall I queue it for m68k fixes
> (I don't have any other fixes at the moment)?
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Sorry, this fell through a crack.  I've queued it for 7.2-rcX,
cc:stable.
