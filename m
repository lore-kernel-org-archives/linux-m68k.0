Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE91D5159
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942334; cv=none; b=Cqh370yM7eK9lBnNrsNxubg0lf+pIjkXZ+aavYpZOJyZagU+hKCjZ52pdy1NAUHLkci4baU1ISIEYEF/DESVgfPxZQdIbJjvou0yuYRkcYe8Blo+i8YbMIgWG7IXh7eF03D7dTqOGlb7e2qEviVsMijqigDlNgTxRGR/2gRG2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942334; c=relaxed/simple;
	bh=nZo14K+zik6B80Tft8b3SLB4YTJ7bbTGqGrs47Aq+bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR30wJw7bD3fTTZCLGLHkcS99E4R3j9lPQHl3/gwQKwr5A4ogO2ZOdYTYdV1qXxYrHSXipJ1tF9dhW1ICMYQUuSrQ5+Hqo94hu1UPgPdurfx+a5t0Iq0jf2fpY9kQK+z4JoI3fwao5qtBD7h2+zVyh8TWoEP/GU7P2javkK+npE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d42f08219so755877241.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 01:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741942330; x=1742547130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ly+7SXzCFZ+0lYCTkH0QFO9dHfRUs+9whilmhgwp5Ss=;
        b=GgogOpe5VqTpLqe1ndAdJqmCVIs9Y+HbyWv562cfi9ygRiKmic/7e2bm6co7zwmNZ9
         lgRJywYikn7Cedyel9jbeCFzlzUS4H6i9zho6aZM0kyPO06GrmP7olPeADYixRkfZ/Ca
         pPBh+NbkOCHZl/jHsL3Vvh2mQEaOKhP5MzYxJelYl/VlhuaLVPBX2N1IDLyKdl6TKqhC
         Xk1ow2tz8c5P2KJ8Dnh3kTKbt96EgZG9pcgImy81zFOfNLglA9j4daL5gEuZloM9rX8P
         2VTLhKFJd+2dHGz5XL7fEvFpNpk6XqjQ3w5Fehl3QLlc2qIkK2xRk7n9Sq8GZx+gOcEu
         97nw==
X-Forwarded-Encrypted: i=1; AJvYcCVpspIiswlwzDtnEYJZJSTIvKKIm96+A3mbrhosYb/kOgPrBGh8V4/RNWmhZ+lEZBofFq6cSz4TAke7@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzsX3WgfM4ujIq04rPifHTRoqcJAVe5JXxt7gmL57aWvcISbuIt
	J9QdrHP7dRFNJ3xYknnz1WT14HfIXdmzhWJcUTVu9MeRNT1ZzwNLzVXoB359y+c=
X-Gm-Gg: ASbGnctwlLw5sTjJKal0Qs9go7wK0/K/pnVm9ebTcYPr6TVLYE2npQLC36gjL1V2n2f
	DMRc7aLBADeTfYj02Ib8ATcXpHWbl1kg1BWHlvzbctH/+KhhoPtCMPbNEi3sOlkH9AxvjFUZo5E
	gJvD23C2qKMBZPMQyV970t0qBYGCd4VmQMo9BwZ1vDwAxtUa9VZmJSfw7eCl+ISTn7PwmAmk7TG
	jbpZok1y0rRJX7q8jW5GxPziNGmKhAVwhQlhgo278bwMwWl68p1Et+7wbVNoqo+Y/6ZJhjA5MhP
	c6HynMIPonxSr9cCE0mzPaR4pPvTnGfBkgxsaLIN6hOzxacl9FKnBJEnRd7m9Dbc0lWt4hQz/Da
	zwXl0nE0=
X-Google-Smtp-Source: AGHT+IFD53jgpBcVvkiNu9JkhjbzxKGF/kCFp0wRvxabF8lr25U9vOBNDxg6FeAD1RbM5kIvx0VC9Q==
X-Received: by 2002:a05:6102:41a8:b0:4bd:22d5:fbd7 with SMTP id ada2fe7eead31-4c383163676mr871807137.11.1741942329606;
        Fri, 14 Mar 2025 01:52:09 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c374edd74asm424738137.5.2025.03.14.01.52.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:52:09 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d42f08219so755874241.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 01:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDJeGoV/CXB7uFtXKuYUu5b022yOK4NMsAG4IAEFUqYjTTUgXEbNNfy1Su107v3/z/jwgUw4yrKljI@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3583:b0:4c1:924e:1a2a with SMTP id
 ada2fe7eead31-4c38322cb9bmr608747137.25.1741942329234; Fri, 14 Mar 2025
 01:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org> <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
 <ea797cf9-99b7-434a-91e2-41dc1aa4c131@gmail.com>
In-Reply-To: <ea797cf9-99b7-434a-91e2-41dc1aa4c131@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 09:51:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8kBcxjy7TUKDR-yxhk79umhrRp+L8wrk8BO6N2F4iyw@mail.gmail.com>
X-Gm-Features: AQ5f1JpsoRH0xrvchxQVpc4oBCNkF9vLAcdnz5W1SJ1zWmV2a6gG-1YP-z6terU
Message-ID: <CAMuHMdV8kBcxjy7TUKDR-yxhk79umhrRp+L8wrk8BO6N2F4iyw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Thu, 13 Mar 2025 at 19:32, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 14/03/25 04:51, Geert Uytterhoeven wrote:
> > On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
> >> On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> >>> On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> >>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >>>>
> >>>> The point where the memory is released from memblock to the buddy allocator
> >>>> is hidden inside arch-specific mem_init()s and the call to
> >>>> memblock_free_all() is needlessly duplicated in every artiste cure and
> >>>> after introduction of arch_mm_preinit() hook, mem_init() implementation on
> >>>> many architecture only contains the call to memblock_free_all().
> >>>>
> >>>> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> >>>> relevant architectures to make it more explicit where the free memory is
> >>>> released from memblock to the buddy allocator and to reduce code
> >>>> duplication in architecture specific code.
> >>>>
> >>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> >>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >>>>   arch/m68k/mm/init.c          |  2 --
> >>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> >> Thanks :)
> >>
> >> While working on this I was wondering if init_pointer_tables() can be moved
> >> from mem_init() to motorola::paging_init(). It seems to me that it can, but
> >> I wasn't sure enough so I left it there for now.
> > Oh, that would be nice, as it would allow us to get rid of the ugly
> > #ifdef, and (in the context of this series) of our own mem_init().
> > It looked promising at first, but crashed later (on ARAnyM):
> >
> > VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> > devtmpfs: mounted
> > Unable to handle kernel access at virtual address (ptrval)
> > Oops: 00000000
> > Modules linked in:
> > PC: [<0001273b>] xdnrm_dn+0xf/0x10
> > SR: 2208  SP: (ptrval)  a2: 01030000
> > d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
> > d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
> > Process swapper (pid: 1, task=(ptrval))
> > Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01
>
> What's at that address? The 14 MB ST-RAM ought to end at 0xe00000 (which
> would have been left unmapped if FastRAM is in use). MMIO area starts at
> 0xff0000 but base addresses there are 0xff8xxx, 0xffaxxx or 0xfffxxx
> from what I've found.

As paging_init() is done much earlier than mem_int(), I guess it just
failed to mark the initial pointer table as reserved, and scribbled over
it later, so I wouldn't trust anything in that backtrace...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
