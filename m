Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E471DD877
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943617; cv=none; b=byGVqe+m/W/XIvatGJCVcIJkrqQNVzgTkbCWetojuJ0tzQITGTIEyOACkpy2M3bkxwgU2an1s7xMen2yvPAovFoap3nI7PGPLwmiTCQ3BcJpKCdYZBrkCAUK4NVPqdIWfWWolWcEOz/wbHrdDf0EMG2XNtadWIMMhvJqz+wGCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943617; c=relaxed/simple;
	bh=IzXfPThsup+scoY+zI5eiVaCGjl7G6DIBLvdzaPZUmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQrDtqowcOVG39mLr5vC9RurY1b9xC0ydWgwhS/n2/aRJpl17Ja/DnaeDw6/gxVFmRCmn0x4CPoXL358XyrYGQ8znGaWFue9qX4lKeUyBcLNTwUotafJv70tZwUnYt4jtgjHBjj5Omj7QNuie/5El6Lxw5Pzu+7udtDCifoHlPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5241abb9761so819112e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 02:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943614; x=1742548414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsBeTCrrRwm+EkChEM2IVcnMfEU4VZmOv3gQ87G+Cq8=;
        b=kKcmW6kMo6Pfg/2c221Yv04/oSwPP2Ql831psr6Ekw1DUP/dfAq29lI/db4KQB2lwZ
         E23Qi59o8HUwsj12Vp9J9hTxk07zu6yueJ9SoXcDtK7uVazlVAFipelGKYnVl4S2E3hG
         ysKMH8iGml887I3kfB/7VVskxtdTYGYpR2A8rfM+Tp8lpQWhW0yoNwHjhl/HgKKxCCPt
         hQEbHDExnxfIPp7DkFHzKHb/InC617sCXUcyltoWZwN49czlr6BfrNAZLiz8mkSwxADS
         pkajRo8CMM5BffmWsUNnjZ1dbagEAozHe+5r8PSuanE1PMLjCNuKJ9/nrLiiVpMaN/IG
         7tiw==
X-Forwarded-Encrypted: i=1; AJvYcCWuK6RY1v7QKMuqyNBL5109Nud/k+9/ULmJnTNSd6I83kq5yhwSY71ImLcjT1aNinlmq1ouzUIRJIF4@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwxS/Q1D+fjvwVEWjSFTTA6H/B1iJrUcj/X3ztF2xoAamgr/KkQ
	MaMK6xfLvCpvNMhjQaS3eJPhVKUsNpcTBpaFawBOtKdnJpcHAVAYF0x39x/0dNA=
X-Gm-Gg: ASbGnctFOAWmLCDZil/3WnXLW2aBCooR2DAc0VJmLAO0s4Evi/EJgVgmT9amJdS062z
	a1ekNxYNdr33xQohjHM1E8qQOkkrt8jk7gjaFQEujzXJwHOCkLVrKqatx4Ar7G5DlQURS0PHNPL
	3gTD5oGjcGW1c3leGrBXJik50E1x5QYsdyWNQF4rKiF12X4VQTKJRk84iC3iO8DKAIfTj5s8gaG
	ijNZON4QRmymiarvRcERCZh0zzhpQiY0K/jKLqcJsYZJS2CzsGxP++GPD8zBBEHYJ6iPc0OwVWS
	7MFwSEPVobtgiO2DY5DZCyRkaD1pVG8OzN9pvRSwORuT9YSy2w+bztgthh1R9F5JaBto2zAfB/x
	/DfPaPTw=
X-Google-Smtp-Source: AGHT+IEruoqkw/5HDxyiQnxC1tcYsSy5To06rCBig6GH9sSnnEazyXhuQ+iNSX83D7GGCQZCOG9/Yg==
X-Received: by 2002:a05:6102:41a7:b0:4c1:99bf:5c00 with SMTP id ada2fe7eead31-4c383234144mr683177137.25.1741943613632;
        Fri, 14 Mar 2025 02:13:33 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c374ee004dsm424312137.3.2025.03.14.02.13.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 02:13:33 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-868da0af0fcso784371241.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 02:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwwPoFHseQ8X7f5dGSWe0DLpEhKaihbG+wls1x2MenJtuqTZdXR+XGtkQqlmlHk+cpwFV8XKN4lfkx@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2ad1:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4c38313e30amr615334137.7.1741943613099; Fri, 14 Mar 2025
 02:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
 <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
 <Z9L7H2uugWRNCDVL@kernel.org> <CAMuHMdWtHqpPHQV+qnEpPe-7pE9uw9tD+qypRVeXYGiXNfhBjA@mail.gmail.com>
 <ea797cf9-99b7-434a-91e2-41dc1aa4c131@gmail.com> <CAMuHMdV8kBcxjy7TUKDR-yxhk79umhrRp+L8wrk8BO6N2F4iyw@mail.gmail.com>
 <bb27d358-2854-e31b-52a0-a9a5a89ac168@gmail.com>
In-Reply-To: <bb27d358-2854-e31b-52a0-a9a5a89ac168@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 10:13:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWF8jhqPub+FvA=DMHSJ1SzVc4CezxYKE06dqp6qwwfnQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo90qxtwVZIPFas_c1NyXEzFsRnERHMIbLmMyDACRNPpGpa0ynhdWy3w6s
Message-ID: <CAMuHMdWF8jhqPub+FvA=DMHSJ1SzVc4CezxYKE06dqp6qwwfnQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 14 Mar 2025 at 10:06, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 14.03.2025 um 21:51 schrieb Geert Uytterhoeven:
> > On Thu, 13 Mar 2025 at 19:32, Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> On 14/03/25 04:51, Geert Uytterhoeven wrote:
> >>> On Thu, 13 Mar 2025 at 16:35, Mike Rapoport <rppt@kernel.org> wrote:
> >>>> On Thu, Mar 13, 2025 at 04:19:10PM +0100, Geert Uytterhoeven wrote:
> >>>>> On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> >>>>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >>>>>>
> >>>>>> The point where the memory is released from memblock to the buddy allocator
> >>>>>> is hidden inside arch-specific mem_init()s and the call to
> >>>>>> memblock_free_all() is needlessly duplicated in every artiste cure and
> >>>>>> after introduction of arch_mm_preinit() hook, mem_init() implementation on
> >>>>>> many architecture only contains the call to memblock_free_all().
> >>>>>>
> >>>>>> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> >>>>>> relevant architectures to make it more explicit where the free memory is
> >>>>>> released from memblock to the buddy allocator and to reduce code
> >>>>>> duplication in architecture specific code.
> >>>>>>
> >>>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> >>>>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >>>>>>   arch/m68k/mm/init.c          |  2 --
> >>>>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> >>>> Thanks :)
> >>>>
> >>>> While working on this I was wondering if init_pointer_tables() can be moved
> >>>> from mem_init() to motorola::paging_init(). It seems to me that it can, but
> >>>> I wasn't sure enough so I left it there for now.
> >>> Oh, that would be nice, as it would allow us to get rid of the ugly
> >>> #ifdef, and (in the context of this series) of our own mem_init().
> >>> It looked promising at first, but crashed later (on ARAnyM):
> >>>
> >>> VFS: Mounted root (ext3 filesystem) readonly on device 8:1.
> >>> devtmpfs: mounted
> >>> Unable to handle kernel access at virtual address (ptrval)
> >>> Oops: 00000000
> >>> Modules linked in:
> >>> PC: [<0001273b>] xdnrm_dn+0xf/0x10
> >>> SR: 2208  SP: (ptrval)  a2: 01030000
> >>> d0: 00000097    d1: ffffffff    d2: 00000001    d3: 00563000
> >>> d4: 0055f924    d5: 00421b56    a0: 0102e000    a1: 0102e000
> >>> Process swapper (pid: 1, task=(ptrval))
> >>> Frame format=7 eff addr=00ffee01 ssw=0545 faddr=00ffee01
> >>
> >> What's at that address? The 14 MB ST-RAM ought to end at 0xe00000 (which
> >> would have been left unmapped if FastRAM is in use). MMIO area starts at
> >> 0xff0000 but base addresses there are 0xff8xxx, 0xffaxxx or 0xfffxxx
> >> from what I've found.
> >
> > As paging_init() is done much earlier than mem_int(), I guess it just
> > failed to mark the initial pointer table as reserved, and scribbled over
> > it later, so I wouldn't trust anything in that backtrace...
>
> That wasn't from the backtrace but from the exception frame. I'd hope we
> can trust that one ...

You can trust the exception frame, but not how you got there...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
