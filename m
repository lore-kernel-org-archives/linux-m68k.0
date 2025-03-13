Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FBF268684
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879187; cv=none; b=UWRrmN53dIfyQkof6f+UUJAPbPt7CII1pSGz6lBF0sYrXhAq0gd7c//LoAu6rsj1N6gzmbyneHQGyBMibjzWqhpiL1PGp7of26QlOaOJcb4907KKDO0lmTA0UeeUPkTg92If/eVsqCqg4MwhgAbdKpT4I97mSzhRDJdGPOYzyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879187; c=relaxed/simple;
	bh=FrNrmRF03ghmNEwfL8ovFyb6iLc0RrAEOh0F/ghf4Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZBjQQiRcCofwJ6KX9hXEiIoLqrpfOHNz98zM1MlV1PQmV3QN3R/3DyPlB353viY0Kq//lQSiJ6Dn7huN3qgsUIXJoa24kEMQcU8ybsp/4NgUAveOl091/2oRLpTWVA0MKAitLM8t356w2b3l036SCNZVvhFULk3Y4kre+ZmP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so4123093a12.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879182; x=1742483982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ii1IFZdoC6n5uv3UgvYeObshpXYt3dV3HzZ5zG8DvA=;
        b=uQ6VmZMoou33uh9CuK0sMvMid17dn725WBIXvuFklcq2u9MOJk11XbVXpoe09m0gxI
         ECHji5KRJAQiZfAxFyHZnCv9m+Yb3N0sHb7RLifF6iAOEjmBUz5BXO2HWUAxreQsSTx8
         7D/siANKuysmrxdZ/+3Fuw18A7eYSS+BWPJGwy+g8QB4vkRkgRBCO3xebdN0zC7UjYAr
         RR66EnMezXa1WJZZ0ZUXxxqp/00o9ZFsoasB13P3ziowA56HOPvkOot8R3ElPERqn9L6
         RcR2MAhMVbmkTETiB/Beo4CXl9704WR4mble2ViZEbnk/oaqVL2kESN7Fym12f3GEm4j
         tFrg==
X-Forwarded-Encrypted: i=1; AJvYcCXmsbwNECAJHJT3o2t+0h0cmr6DvnRWbw/eegxi9iabNBUjE3hKAf36JKdt2z0gQkvh5L50d2wUg74E@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxqbuWPS8ZGwrBKOkidpu828LsFEcGz8/lozUDecrSltfX+qXDa
	p5XxWY5H3OqrduwuLb+RMGcIXbRzjUCopwPJ4fmSR6MG0B2y2C3x7PXWdqfuXXQ=
X-Gm-Gg: ASbGncvitY9aUtlpMAf7HaK6nSswDBl+ytt1fKTZSflEH+BHH3n77psQj9nAmXufCSq
	sm/BuURSt0bH8s0ZGVA1BGuw3Ov3FFyOYYXicUfJPaElF0WzlBUHplGCfjsfRzT9UOy2XsPbVQk
	dY6EBhHa9AmKVj/I8RQkFW6v3RVKjSl0MK3ZS64IAMFXuarxAJ7HbUH2l4sxXOh+/OP7g91D14R
	pmURlUb24FARp4m4Lfr14cyMOM6YzIhfWLuBVCWPqg7+oO0NQO3wT5df5oIPkuYxvPw/6RtrYmy
	+4gOotNK+bRD4Os4IYH/H+2BsJi5UZFKgg3/ioLEmoakdoEKYZDHxlg1Zv6WB0SZiNoRk7aF0AW
	u/EBjudynL2Mon8X3Kg==
X-Google-Smtp-Source: AGHT+IHLjOPxTYHFe3KnzmVXc4yhUw3kSHXX21WXkufI4zNLAXbgkOB+rnnTW5gEHl3+YWqG1xjOzA==
X-Received: by 2002:a17:907:7d93:b0:ac2:4f30:5033 with SMTP id a640c23a62f3a-ac312376a28mr290969266b.15.1741879182021;
        Thu, 13 Mar 2025 08:19:42 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfbfasm92884766b.104.2025.03.13.08.19.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:19:39 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso3899083a12.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 08:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSD7VsxNPFgZ8Qq5maZe+/9pJh79nu83Guvi18vCpBQthRCe4u/0bUQ8QCgsip8e+akac6KRRF1tO+@lists.linux-m68k.org
X-Received: by 2002:a17:907:9626:b0:ac3:d1c:89ce with SMTP id
 a640c23a62f3a-ac312305664mr252326866b.9.1741879178133; Thu, 13 Mar 2025
 08:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-14-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-14-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Mar 2025 16:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9qHWq5jtnIT3-BmFGhQQ_nRM0uVNr9PeQK5Y9eEomJSZyndfwbc1wpbs
Message-ID: <CAMuHMdWCBL_cg1NgbHCA3e9GTob_P9mTuN_Tepvigci6rxDmbg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arch, mm: make releasing of memory to page
 allocator more explicit
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 14:53, Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> The point where the memory is released from memblock to the buddy allocator
> is hidden inside arch-specific mem_init()s and the call to
> memblock_free_all() is needlessly duplicated in every artiste cure and
> after introduction of arch_mm_preinit() hook, mem_init() implementation on
> many architecture only contains the call to memblock_free_all().
>
> Pull memblock_free_all() call into mm_core_init() and drop mem_init() on
> relevant architectures to make it more explicit where the free memory is
> released from memblock to the buddy allocator and to reduce code
> duplication in architecture specific code.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>     # x86
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/mm/init.c          |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
