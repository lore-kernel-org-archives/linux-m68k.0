Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76915443A89
	for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Jul 2026 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112145; cv=none; b=GtmmdBH25aMHKgfTd0qGwAkGyCIlVbkRnzjbwXrHcDvDUe8iPq6LgjgNO1eky6BUeNUAzELNRrHecW8lU7Oc9Q1U/a5LLrjUK7e4C8hhdHEzaDX/BOwVAwWngJ/It2CH8d0RI+yWQ8nQ7/IVVJ+UMH6zf6mIWFlHkDXfoi+B/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112145; c=relaxed/simple;
	bh=dYuyA6Dz/ajxhYT4dU+02MPd/j4lWQd1ctOD3UM1CNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZL9fq6MTGWgOoxJ4Kimej8en/GTJLNOCoHIhP4QNrGExtISI3bcI1VNFYYqhDQYjDtlCGiOwkkSRxGgy8EApw+pw45WA/ZLuwNGFK/Ib9vEFnSF7GihZLsPapsvw5WqwJwxAHpfvbLr8DIN7f1Jkt/+gn8EBJhfl7ARzl0yqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ee88fce572so28507936d6.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Jul 2026 03:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112140; x=1784716940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BcTdMoZv6JVy6M/fO3WdP9FofoXGw30zAP9bsFgIqfs=;
        b=qCFRfPlvzxoZMJ0AgUyPRSZPAWGyYQf+TOH4YMkOSySKrc9ApMhoXfYQrXrEvAFp5Y
         5ZW88HRgwkjf3vWfgjxA+kzbRLeahwyFp0KLcU7vWBgX0BNyP2kDfmlroA6v37pLJ0Fs
         dIcPDCR4qKYWwktxxn9WY6ZrhcAozvrE9EyGleA3imMLwNb7fSvnwWERl4bc9eqydP5j
         nT1RGQfkncj3avWyGqWAYJgnZElV01PTthi5mwerxy0A7VTwXFvyP36tpxDf1u8lLZUv
         nQXjzEM6TpLyvTXjdn1I2X2TCsf9qVmdfzej1d+A3gOEuJAzrjfqMg9p8hl0Bt+/JFx7
         APpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGpk+gnnzmHHIprUXG+KGTRmiiB8IZWqh9yOyufLVMlJ2EGh23FQRu4WcLHXvBuTrzcVjClKDcoiGW@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzd2ZU8VBsGnOUCaqfGZb6KhJFI8Cy/uUTidDYOv+2qHBUNMyHT
	m9xp4SjEaXm16BIQsUj+k0JxWS7yDuUHaGUVFVKV+YrZ+AWqgbMYvPu6IOk0Vv47uHg=
X-Gm-Gg: AfdE7clcgTtxBsdJMBjMdwHBcYkfVkJobY0th6cH/3eAH3FnGQojQSHVUTudYCTpfKT
	gPluoaRGPu6GmUl0Jqrs4D/ImBBaxfqzuWohY/mpAlnqTC3hU+r7aDGb7qky/Osln+gwRNR+yRE
	47HXwEC+Z7rkZhhWOBqENyKvdloNsB8bc3XeNP0ksBAX/sC9I660rEyOzEr/Ut05aABd7RHkMQX
	+FFidhcWpvpdxegBrOfapELGkJzVKRb7s4gN/FleWw/20EBZg62kSNIQOoCD0AhgPjXxVDw4qap
	ccBcvMMQd3XLliN79BF5NudsISD3sNfL8SrKUm1X4aA8cl8zVo7YxCVyLQld1NAyz6HAhht5KCa
	Awr8bg3qC+j4fLEwI6BmoNqNb4M4sauY8m9tEhI5oqFVH68vIvd1m2Z6F1XBKG8sUjeMLiEveIK
	fHF2m/bYfDXkchPyZFMWp3YbwSN8bBh/tl/H1esN0InqjfIED+hN38Hg==
X-Received: by 2002:a05:6214:3bc8:b0:8e9:f5de:d628 with SMTP id 6a1803df08f44-90404148515mr185888656d6.55.1784112139678;
        Wed, 15 Jul 2026 03:42:19 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e0811sm191191956d6.3.2026.07.15.03.42.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:42:19 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2149571dso16048401cf.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Jul 2026 03:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqm+nmvidoMuI3m6aixQ1QaFNB+Aj+s32oDwJzdIhV1HqafAxSoanPbD5XsFIWxFiQ5aN/BKVYZ0L4b@lists.linux-m68k.org
X-Received: by 2002:a05:6102:94c:b0:730:db02:1d08 with SMTP id
 ada2fe7eead31-74533c1eae8mr11245328137.10.1784111681255; Wed, 15 Jul 2026
 03:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com> <aldV23PwIXnFloaN@e129823.arm.com>
In-Reply-To: <aldV23PwIXnFloaN@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 12:34:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-Gm-Features: AUfX_mxU0lxjO-fzCeQeNX344H_SVkvovWXaE8EEgaGKFYO5e9NLd2LkTofC79k
Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, 
	zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de, 
	ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org, 
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, 
	guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev, 
	vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Content-Type: text/plain; charset="UTF-8"

Hi Yeoreum,

On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > --- a/mm/ptdump.c
> > > +++ b/mm/ptdump.c
> > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > >         st->note_page_flush(st);
> > >  }
> > >
> > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > +{
> > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > +               return false;
> > > +
> > > +       if (mm_pmd_folded(mm) && level == 3)
> > > +               return true;
> > > +       if (mm_pud_folded(mm) && level == 2)
> > > +               return true;
> > > +       if (mm_p4d_folded(mm) && level == 1)
> > > +               return true;
> >
> > Is this order (... && level == ...) the optimal order?
> > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> >
> > > +       if (level == 0)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
>
> It is. since the purpose of ptdump_pt_level_first is designed to be used
> in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> it always returns wrong return in folded case.

I meant the order inside the if () conditions.
E.g.
"if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
"if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
