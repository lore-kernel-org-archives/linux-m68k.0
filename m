Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12452E64A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790233; cv=none; b=INkI8D6o92kB/cdXWEZhWzmEv/8WnC+9hvUQOcaj2bkOL94w8nqe/UL1CGF/tl2D52djVi5pX8pJCdOa7luEvu7pbqS7xUYeF38WT0Gy67tiRbeUzxuBIPC+pxmvex1ApbfhG/iIz4HCLPIyZ3W0Jvhc9EqOpWEWjFg402jX5mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790233; c=relaxed/simple;
	bh=nGWeQg8S6y6shLHbmW3aMKeXpkYiYJxrmAinLDsKRyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTlzE00yj/Q4zVw/4PAKnJgEY/XlmIgDTCsJUzRB0GB3zaKv204BBrtLYpeEnN5CpkWXOqh7TA9WKLJexxaQJdPwRhI0WEls1QQcdhn0j+1WlwJfVcij8rQ5Z3No0VIh5IPzurUxK0ceLuFjzdovLRvJLnaXBw4YOkSzyW8AQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so1563723fac.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 06:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734790230; x=1735395030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
        b=I1dAo3mQA/L8D2mqdTDnJ/9Zd4mQiD2Y7WZ47dYqBib6Woxf8YjYAlSmzkJgJGEYTM
         ETEc5g8FwGKbMdDCTn12515qcFKC6+avyIHrU7afjrP2UP2o5WK+26qUpptmZbvn8xOP
         yd6spnzktBgCDT/bg70R5GX9LVef19PlxfWdKsVEdKdbtb4AX6YxLrQTrHTNXwmNeF7E
         og5aYZOThk1zGMyRD/jXHwZtQEw7Ee7UXRyiWeBk6DUQ+p8n3j8huJH+Y5cs3Z3w2U/F
         5sUtow8yn2QNco7Tt/7BZ5GNPuJ2lOfp1vUtK6fbc4AzYX25bgvOo7G8HnITp2IRJXCi
         Vm+A==
X-Forwarded-Encrypted: i=1; AJvYcCXn7GHBFyTf3uyNankit0pPcwDgzaufx0/1rO2rv2Wr1LyYCZ336/8QejW+L89YNWzEqLAWHcdp1n/8@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxry48Gijle141DFlIqIrxqqO1+008yMQz1jagoa6DdXwuOYY3q
	3xKWI8Jd6hIpkLiVc9jzOxeVo7EGN1xO6wh7LfUEwrWicXPN+7HV8xN5Ofed
X-Gm-Gg: ASbGncsDeIWbVpCxV/2UQg1XMHSL57voIZKSwtB1MmsJtOl5oVlgX3fm+b2bvq5Gz03
	NCPFdzRIp/Aul5LUa1rDt1eSXwWoYdGOx0ZiJTq6PLfe2DxeBmaQQ1Qv1ro8v4Gvgil/zy4Ug6P
	94canmPyPq9HtC7EffbstzdU2SLSKfhs86o9YvSwiInqMtn4c3RZgRY3neEZrTR4SmDjAlMFtkM
	EHyl5ZRwQRHZf6aJsvYEQ63ezZKu0tLgK9k53Z/udDLvxmw9N71yCRCM/v/m2sjwJiK6behiCt9
	JaQL+oYjCCnL6phAHuvtQjM=
X-Google-Smtp-Source: AGHT+IGS7/Ef5nhvKOY+cTSU82yJhHHoJ6nIphlSvhiHGTSGEAs0M/a4Sa0EkMBGxvnMaSKaIR/H/g==
X-Received: by 2002:a05:6870:c14d:b0:29e:5897:e9ed with SMTP id 586e51a60fabf-2a7fb557ad4mr4082190fac.35.1734790230324;
        Sat, 21 Dec 2024 06:10:30 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6475sm1523555fac.53.2024.12.21.06.10.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 06:10:29 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eb9101419cso1521987b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 06:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPXV0fVjzxbmxmhfC1FjdxJtbq/HRH9SmqeJmcZs40+LYfNW4WRISJOcDHHoXQr0Ak6mEfaJLKNWnC@lists.linux-m68k.org
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr7064126137.5.1734789822327; Sat, 21 Dec 2024
 06:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
In-Reply-To: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Dec 2024 15:03:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Guo Weikang <guoweikang.kernel@gmail.com>
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

Hi Guo,

On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
<guoweikang.kernel@gmail.com> wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediat=
e
> panic is required. To simplify this behavior and reduce repetitive checks=
,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
>
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>

Thanks for your patch!

> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_add=
r_t size, phys_addr_t align)
>                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
>  }
>
> +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t size,
> +                                                      phys_addr_t align,
> +                                                      const char *func)
> +{
> +       void *addr =3D memblock_alloc(size, align);
> +
> +       if (unlikely(!addr))
> +               panic("%s: Failed to allocate %llu bytes\n", func, size);
> +       return addr;
> +}

Please make this out-of-line, and move it to mm/memblock.c, so we have
just a single copy in the final binary.

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +        __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>                                                phys_addr_t align)
>  {
> diff --git a/init/main.c b/init/main.c

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
