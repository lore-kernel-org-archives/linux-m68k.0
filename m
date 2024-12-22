Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718E180B
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Dec 2024 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734828747; cv=none; b=AiLNBKC4HnIrnaW/VwNtwv8l70f+kng99VwXVo3PA9HYbICEI3TG5tMQ16ffSipYhijo+KYN8YjhueI3HH1bZ00SvIb5e++3ipzQFjMw345tXWHreS82aLjFkWncaTRiiGfMZ6bqlG0s6MOxVv67hbk8+q8WJQz2sy9ku+gglHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734828747; c=relaxed/simple;
	bh=Lwv+95ot2twUX6GsOV+1rAqhwnRBzkh6SEQLcu7rgjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcFmSGUb/24nLXjLwQ0qXnXTMu3J67o+NWeokHvVmhv0NYTMbdNBEPPHF1Pw+2m97UjUOebMNuXmDLEgf98EOKnO/IKSZmzfdgJN0Vrl6+u7TpJEK0GemTioT7ivA0/GebrIPW1N3C8EiKGC81yGqlUvZaPZlIW8O12OxLwucZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac0ahH/w; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac0ahH/w"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2382030276.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 16:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734828744; x=1735433544; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=ac0ahH/wkj9aXD2dYLF7z64pO2uzi+RMc8SP7Gw7o8mKBb/h+HeGpCwuxODbRcyOFH
         rsNs7M91RvJs+1wZWs7V5vljiLgvl/dHPuHIInqsZvAK8gGyn3KN0Ch8VV8xdVk3Awf+
         hOrlyuT0v5sLx7XxoPDZJOMlUH7aWjqPPu8sEPQCbTLtY3fWf59qneEJfkn5dkBVcaun
         WsBSnwh987SA3MJ+wUQWXCOQW2hoRQ3Aj6U3ma14eFuuVIPWtZaABLkrCQNK0As2yGMF
         VtzI2EN/GW7VeFJyPa1/nYw25UotyeEc0h7jxZsiA5dPFoGvDRwJMQ3QmIesK3k1eQJE
         YFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734828744; x=1735433544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=dxLuRnf+ZeYWPzcKetH7on25GLMnadcWznOfKQafZKqyf+V2VCoo70IzxCTqfWlWhB
         RscMqabbzuc1ujO6dK+lEFzRhw66y8oz+UXveV7slnKeomHfL03u3qyQy/vMup6Db476
         WtUA2HATaBf4M4OLkIzFC7l6ENSv+yQnKfLmAYFrDoqLTrT8sARjXGDlkZQuEgf3TYaE
         2jbR562kaOES9Wd6Rp+hJ+ryvIQrkHrnYjtSt/KqMqv5SeuwAd+4lmpqzCmR9o0ZZLPA
         vOdTWWO+RmUY5WSgeGcGzugwnkIB7OrMUj4HzKY0UYUfvvNSyEvEaOy1zz5/WPrhuP16
         UQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCUjwf1n2w6VK5gj0HXSL12nxoEHC1fL5HyKl0vam7zpSPO4/6GnFGSeBv7lWz5rslJRaDjQIxjW6X+J@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzDWGweCEVYpYVO6zty7cy+/pqPwNRAMIZnPr23OuFvZL74pQ44
	TuwWgu58VrmwUaWAWNHNrC036qnF5oEs715UKj+k4APsz9tHsFD8Tfobzxgf1GRNK+RBojXEFvj
	xf53kM6Hi658UIrTVmD1SHgsBjBQ=
X-Gm-Gg: ASbGncvFXfHXoJ4omHbpAJCzNYEJAiNBYZGjpG7M3y/ZIlooLSCxX9JqI2yHZcnCdzC
	APTzURCSOoh06OaEo7vp2KyhnsUW4RmYhS8EV+LY=
X-Google-Smtp-Source: AGHT+IHH5gTAOmFubOYjlrK+2+jdIvePBlyZPYVyBZBy90RljxEGCQgcvHQMo3bTypvAoytVk58QJl8i95oeqQUdh1w=
X-Received: by 2002:a05:690c:4e82:b0:6f0:21d6:4497 with SMTP id
 00721157ae682-6f3f80d911amr42730727b3.9.1734828744363; Sat, 21 Dec 2024
 16:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com> <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 08:52:14 +0800
Message-ID: <CAOm6qn=aN_n3jRc79wr-AGVaQXCbZoyE0yXYcZfw28-uBv+zuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> wrote on Saturday, 21
December 2024 at 22:10
>
> Hi Guo,
>
> On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
> <guoweikang.kernel@gmail.com> wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_N=
O_NODE);
> >  }
> >
> > +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t siz=
e,
> > +                                                      phys_addr_t alig=
n,
> > +                                                      const char *func=
)
> > +{
> > +       void *addr =3D memblock_alloc(size, align);
> > +
> > +       if (unlikely(!addr))
> > +               panic("%s: Failed to allocate %llu bytes\n", func, size=
);
> > +       return addr;
> > +}
>
> Please make this out-of-line, and move it to mm/memblock.c, so we have
> just a single copy in the final binary.
>
Got it, I'll make the change
> > +
> > +#define memblock_alloc_or_panic(size, align)    \
> > +        __memblock_alloc_or_panic(size, align, __func__)
> > +
> >  static inline void *memblock_alloc_raw(phys_addr_t size,
> >                                                phys_addr_t align)
> >  {
> > diff --git a/init/main.c b/init/main.c
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Best regards
             Guo
