Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC226ACD
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881123; cv=none; b=PCAWmw1tsqxIZ3wWd8RIxpMnK1KmQcULInX5ptodMOZlwjpnALCKHGjDlcF3ebS6+feCkVSwrtIX21M6nVex/WcAzgNo76ZMyiUwB1BArk9XFu7A2rQHd2iGkxn8HeqKaKl+GzBc+O5dH/ue8bqx+G4DQXmcFyMmXHlQ3rriv/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881123; c=relaxed/simple;
	bh=VcqHS2SiwqGD+fWofTxzKboX39VBj+6NWN92Lfg6hdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Me94WyQE3sCGJbnZwyKWO0oPbIqZSIj902aH0QUkmYvVLs+vvo2NBx/ISrM75ry6uXFFEp9FujHd2oLAiF2LM1FgXz42j7zALShm7vCUeTQLWhdelDLlWBWSRGeEw/oFpokmBNNm4XfM1XBDKNEDkFlebd89+rAb3kwJa07Uukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-867129fdb0aso986336241.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881119; x=1742485919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7EuGF2T8awTtMswaXaPJPzCyXRvLr+dN4ZFHlsVxYA=;
        b=gmKmcTR+MN61fz76zGGsJiycBrG4KMGdxcsqqWAiFTHtt5yQOP/HULyIX9xmMwcPlU
         DsT9SWlVCmcrGW/0SgrFcsqzqmpaz6qS1dX9iQjz/yHciYtokYEujQVdBgShE/0Jx7YY
         dINftA9kP6p3TD3O3numla9x+3VBzB9tU1oaYd5DAJnpsBt7fKG7r5zBJAUPsl9YYCmu
         HnUY6opaL2nmdOKeudQdTZHSFAxLE0PqOVfOFKrw+uf98fm9eMV8hKJyc1HrJ+877s4P
         OxB1gB+xHchxsJ2QflEN+BJRah+3fVtZkezlkjhp2zO6bBnmO6L/09P3o+HZjAtPvqOg
         IU1w==
X-Gm-Message-State: AOJu0Ywr5OwhQbub3xa/qKVlBZLucNFnz3fgjbZqlMjUafrOkMegSRLa
	h5ntvpRgEQc7iNBeNknzMRHvXHdbpT88qU0oel1+fKddmdYHvy/2HF/o/d8PNmc=
X-Gm-Gg: ASbGncvOE0GgCLGljtR3gK7Z9kIFK87SqsEdHWuK9Xuv24ie1rznk1abkUUhd9y5l6I
	KipFD0PQmzu8sPAeMp7EnITSCuixAux3W9YhSwG3MMIGeb66LdiOAvjeDDtAOoPwHDQLiR/fYxg
	tmaqJLG+XaB/cX5AXFTh7v6R6Zk1hqGd15fop2OfUsqVQeGJeLSugAL3C7W185w7b1QK9wZQrl2
	/CCJbt2NIvOrUlL50HW7cd6msExWDyFPEu1E88Z009qzLsVNWnff0wIb39fKTeUX+JM2IdwdsbU
	Yvg/SXCJ2NmmqSGNsQQ1IBOfSMrZKfGVmKVSB2ZFPYbUDBPLhEEFd1efQnV3nOyVhuCqVrkjQ9p
	OhVs7fKo=
X-Google-Smtp-Source: AGHT+IFgsKlaj0TStsMPfXKqQjyQGa80Z1FrdZowYCX1gikEx6yhRI+IELG91y91BkSP/lumIZHDlg==
X-Received: by 2002:a05:6102:1505:b0:4bb:cbbc:4c with SMTP id ada2fe7eead31-4c34d1f80d0mr15405040137.2.1741881119341;
        Thu, 13 Mar 2025 08:51:59 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90d911d1sm233779241.9.2025.03.13.08.51.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:51:59 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d2fba8647so952185241.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:51:59 -0700 (PDT)
X-Received: by 2002:a05:6102:c14:b0:4bb:e80b:473d with SMTP id
 ada2fe7eead31-4c34d23a3ccmr12173459137.6.1741881118844; Thu, 13 Mar 2025
 08:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com> <Z9L7H2uugWRNCDVL@kernel.org>
In-Reply-To: <Z9L7H2uugWRNCDVL@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 16:51:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
X-Gm-Features: AQ5f1JoDg4MTEaIvztNWwINebRGi7wsZFAXraoMKRqjZsG2rPKV3LU8YHKUIqFA
Message-ID: <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
> On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > >
> > > The point where the memory is released from memblock to the buddy allocator
> > > is hidden inside arch-specific mem_init()s and the call to
> > > memblock_free_all() is needlessly duplicated in every artiste cure and
> > > after introduction of arch_mm_preinit() hook, mem_init() implementation on
> > > many architecture only contains the call to memblock_free_all().
> > >
> > > Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> > > relevant architectures to make it more explicit where the free memory is
> > > released from memblock to the buddy allocator and to reduce code
> > > duplication in architecture specific code.
> > >
> > > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >
> > >  arch/m68k/mm/init.c          |  2 --
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
>
> Thanks :)
>
> While working on this I was wondering if init_pointer_tables() can be moved
> from mem_init() to motorola::paging_init(). It seems to me that it can, but
> I wasn't sure enough so I left it there for now.

Oh, that would be nice, as it would allow us to get rid of the ugly
#ifdef, and (in the context of this series) of our own mem_init().
It looked promising at first, but crashed later (on ARAnyM):

VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
devtmpfs: mounted
Unable to handle kernel access at virtual address (ptrval)
Oops: 00000000
Modules linked in:
PC: [<0001273b>] xdnrm_dn+0xf/0x10
SR: 2208  SP: (ptrval)  a2: 01030000
d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
Process swapper (pid: 1, task=(ptrval))
Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01
wb 1 stat/addr/data: 0000 00000000 00000000
wb 2 stat/addr/data: 0000 00000000 00000000
wb 3 stat/addr/data: 0000 00ffee01 00000000
push data: 00000000 00000000 00000000 00000000
Stack from 0102ffb6:
        00000042 4e9a005f 4bd80042 4e720000 a5240000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
        00002000 00000000
Call Trace: [<00002000>] _start+0x0/0x6

Code: ac08 9000 07ec e800 0800 0267 0408 d000 <07ec> ee01 43ff 1808
ee00 04ff 2108 ae00 07ff 1908 ae00 02ff 2420 5fe9 ee00 02ff
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
