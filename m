Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CFD26A1B1
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883969; cv=none; b=uVCamnv8Iko2iqtD8gRhiDf/qGjV4e0fyzlN3t6ZlcYhzCQDLyNJoAgEtARvb5yV9plKhHTtrNzP4PcAhcP5gIhsJT4hs2nci/aNG4EYexTH4FI+oWXxkJ2Zo7h5NNCWKXQz/GkpwWyPxMPEs3BwUhkUU1Lw2+FnKMPIaroR7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883969; c=relaxed/simple;
	bh=OA9M23ktuV+7CT2gDU9lgjtvZKpLC4C5QtoRyTzGwUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlI/QK6Wie2mDG6LNrZLqO373ZX/uTvisnwEkzp1HOb9WxsJWr8JS/uway5uoyyoXmLh9Aurb5KlQCg5INQuENZJy6eQauCyUkdHYsL/rkEfDLlQpRAxh2+9ouN1XzStxtxTEMx1PVo6ZL1mBgzlp4azNJv7PnAPgovZdwNxf8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7VfxsWe; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7VfxsWe"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32B65C620E;
	Thu, 13 Mar 2025 16:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A924C4CEE9;
	Thu, 13 Mar 2025 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741883966;
	bh=OA9M23ktuV+7CT2gDU9lgjtvZKpLC4C5QtoRyTzGwUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7VfxsWekdQQHbHVXcqDbPrUFRklMELTVmGmRRQoKwCAHoQU+uE8UtjcuZn41NZXv
	 mWFdS7pmNq2YoxrwuJOyPj4CEG4ZsjQEBe7PQM/DgVJim7JA6ESq8/XerCYd2N6YqO
	 h+adiSmWvaskLz0wfaJXDKqSpandWus02Cjp/lkiAG4y+tFh6it0gPKD4fi9daLaL6
	 9cp6gAIivST3gtgRxppssMzKEVYEyx4Rc0EQnMeJmZo+rJF5DNKuhWGSvPHfwqd3Qz
	 w1TK2wZ8J025DIyRjES9ysK+vfOpbgQ8qnY3azRpYZ0oZgXx0ncIOI691tSbxgsLXx
	 GOwy2O/llZHjg==
Date: Thu, 13 Mar 2025 18:39:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
Message-ID: <Z9MKOeV14WDTO04L@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org>
 <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>

On Thu, Mar 13, 2025 at 04:51:45PM +0100, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
> > On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > >
> > > > The point where the memory is released from memblock to the buddy allocator
> > > > is hidden inside arch-specific mem_init()s and the call to
> > > > memblock_free_all() is needlessly duplicated in every artiste cure and
> > > > after introduction of arch_mm_preinit() hook, mem_init() implementation on
> > > > many architecture only contains the call to memblock_free_all().
> > > >
> > > > Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> > > > relevant architectures to make it more explicit where the free memory is
> > > > released from memblock to the buddy allocator and to reduce code
> > > > duplication in architecture specific code.
> > > >
> > > > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > >
> > > >  arch/m68k/mm/init.c          |  2 --
> > >
> > > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> >
> > Thanks :)
> >
> > While working on this I was wondering if init_pointer_tables() can be moved
> > from mem_init() to motorola::paging_init(). It seems to me that it can, but
> > I wasn't sure enough so I left it there for now.
> 
> Oh, that would be nice, as it would allow us to get rid of the ugly
> #ifdef, and (in the context of this series) of our own mem_init().
> It looked promising at first, but crashed later (on ARAnyM):

Well, we tried :)
Thanks for the quick check!
 
> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> devtmpfs: mounted
> Unable to handle kernel access at virtual address (ptrval)
> Oops: 00000000
> Modules linked in:
> PC: [<0001273b>] xdnrm_dn+0xf/0x10
> SR: 2208  SP: (ptrval)  a2: 01030000
> d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
> d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
> Process swapper (pid: 1, task=(ptrval))
> Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01
> wb 1 stat/addr/data: 0000 00000000 00000000
> wb 2 stat/addr/data: 0000 00000000 00000000
> wb 3 stat/addr/data: 0000 00ffee01 00000000
> push data: 00000000 00000000 00000000 00000000
> Stack from 0102ffb6:
>         00000042 4e9a005f 4bd80042 4e720000 a5240000 00000000 00000000 00000000
>         00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>         00002000 00000000
> Call Trace: [<00002000>] _start+0x0/0x6
> 
> Code: ac08 9000 07ec e800 0800 0267 0408 d000 <07ec> ee01 43ff 1808
> ee00 04ff 2108 ae00 07ff 1908 ae00 02ff 2420 5fe9 ee00 02ff
> Disabling lock debugging due to kernel taint
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.
