Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F5282FA
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741880103; cv=none; b=RlFg+3NqeHuTkBNuO06VtQli9KQsueu7hXHydq/fx7jrKO0lH2Ymud3AGHrJyPvdRRXa5mPEJcT+WLfIy9QvX1++SHPVoU1ZrS+5I1s9B764JAUGXBLaowjdJtx3gqoLyLm5clf2bjuJw4V+TM/aHfkAVSuiW7Cti3LAxAP5r30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741880103; c=relaxed/simple;
	bh=ogwqcbMmssg4GR/Kt8NfravOKelmxzNe7E/JNhhg8Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7LicDoyn1/+q/mGuLoxezcWaMSAukZFL7MkgtHDp+4W6xhK4XnnFZ1dJm8NvKxFghN62cTSamKl+F2SWENLiBHXJdzWtHuAZwKR/rWqcld5pVzTSzfd8gPZg0wsvEGCVp6CXzMZjYu9m6wovdXwFujdsLrccX+P5wgfdax9H5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4ZVS2n0; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4ZVS2n0"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BDDA5C5620;
	Thu, 13 Mar 2025 15:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70007C4CEDD;
	Thu, 13 Mar 2025 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741880100;
	bh=ogwqcbMmssg4GR/Kt8NfravOKelmxzNe7E/JNhhg8Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4ZVS2n0KqKYiL/cB2uvRqz2b4N8bETkPmyW+MlKAhWO+bYAl4XvDqDn0BKACqwWi
	 J9SBiNswMP/LKJBUq2iMX0G/H3QnvkMtOt4VCmPq9tB5CjLr3dVu6CFl0hm4ZaIR1h
	 /oA1ykblr0aMCzmFKJfyCziMgZ9SimHwvqjE7Gws0v9sboLdA86Q/9r4aPvCKwBEhZ
	 HOLjSS+IdxVz+u0/E3INZHIrcxfPpdrOErJyrRyYq8r7VS0rVAfgiMsX3kF/tELFgQ
	 OisMVb3iL7i4jdpYeOji9lZPyuM7eV0MZSlSo5epKAbHLXJ9zxldIm0y1yXMLftrK7
	 FI5XF+tZJvemA==
Date: Thu, 13 Mar 2025 17:34:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
Message-ID: <Z9L7H2uugWRNCDVL@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>

(reduced 'cc to m68k list)

Hi Geert,

On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > The point where the memory is released from memblock to the buddy allocator
> > is hidden inside arch-specific mem_init()s and the call to
> > memblock_free_all() is needlessly duplicated in every artiste cure and
> > after introduction of arch_mm_preinit() hook, mem_init() implementation on
> > many architecture only contains the call to memblock_free_all().
> >
> > Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> > relevant architectures to make it more explicit where the free memory is
> > released from memblock to the buddy allocator and to reduce code
> > duplication in architecture specific code.
> >
> > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> >  arch/m68k/mm/init.c          |  2 --
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Thanks :)

While working on this I was wondering if init_pointer_tables() can be moved
from mem_init() to motorola::paging_init(). It seems to me that it can, but
I wasn't sure enough so I left it there for now.
 
> Gr{oetje,eeting}s,
> 
>                         Geert

-- 
Sincerely yours,
Mike.
