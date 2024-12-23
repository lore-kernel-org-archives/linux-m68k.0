Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1623E18C924
	for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Dec 2024 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734939136; cv=none; b=eJJAxHd/kJb2Jrw/jvAm9wGMa95SQsT9f89ucbTxTifKQvNz9cuAzIzx2Gq5dFHdl651yHO1mCo3pYe3eeA75FJ/vUYwtqbt1WUzIlBif+56OR7au58929Eg+kzo3ZHQIKjkjn4w3vPryc2kqSTpPQwHKwjlNMho15EHVz5r6Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734939136; c=relaxed/simple;
	bh=OHoKVoEfq+gvl63nyXxm0Fs3Th2pjhxHONc5vMgjP0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIYiD3pE4C3t/ygl3PtXBwsGH062dT7Wb8GLdGxjfR3Bb6M2y6pOWiE/VnD95KGrrvoftLHcr3GDF2w4uOvcRdrbqNWzTEYCNqy5zVtLz0fB0IVtfu41wM9cc4+UFm9ygNG88SP3amVwNJ5pqfYUZ69H3G95kAUoZtFPrH9Mih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg3x/ZGh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg3x/ZGh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eff4f0d627so33673097b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Dec 2024 23:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734939132; x=1735543932; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=Eg3x/ZGhA7MaKCEQYPSrl4rsaXfHU8c9RiJvN9OxR3ibKBvcyYEx5lDCS7Gw4DdUuu
         kG6PyKPXfBhMwM3j8K7/XJI9VY78DlCUYdcRFl/fqS0kU9IHZ7b6bNSFuhl7OoWdqcKL
         YuMORGg1TflTbO4K955J0yryuCTTYVfDScAx3avf1iZb2uO1+lRyCfntgYiLBtMystm8
         A0J3bKv9FkX/wrVng6MXFq+uD3jAYaybHBnU4omx1WsQjhsiG0sOJxUn24t35VBiF68C
         VdxpHsR2zUPsosit2olTIbj/AnCRYqJjkZJSmVMA36v0mquLacOo8WzzbshdpnE9mp8V
         ogbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734939132; x=1735543932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=HvvfNfmhDi3gt6H2vYFnIiUiTLXhonQ2fVsLPRR1RXyQzqT4BSBnxctAJtCJVZ0RqZ
         aex6+X79+hGcgAMiM62nr1oJJDPG9OuO6CuS9fRStxAdYgcQQWv+0CO/uGCJunnLAASm
         L2atI65WTuUV6AujiXb+KT+NSYOZd1p9yIDq0wGQM8ac35ROVhx6YhOJG5cj5gWoCs8L
         lf/2up0E0di3lc4jzEP99tMpTXX804+BIS1Dkt3rAHtTQGxARQAH3R1ZJYrDxqhGODCa
         fgdgX40cfUG2YyXSLdbFBZ4ZhtO9DAT8tQclwLhNVdbczdhAci99AvTJ/FhdURToOO0c
         2WbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE9mYBbPIqkoEIjqejEXrdj7z9Z2YGcGZljsdVqKW98zjb/0A92zU1S5Nzgi8JDe2JwzRfvVxWAC0s@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwWNviojy+O7GJrpZRbOaI6DIaB4hk/JXHHMPpy+itwwwHVpQkn
	8Xnv3rr2TRjFWk4gZ+UGUbXaq9d8nlGpFzkWKGintAWWqmhmgARY/7teyfBxUf7eQqeK7aJhwvB
	q3CvnnIDjIR+jKdIw5snqlUL3Vuw=
X-Gm-Gg: ASbGncv1iCtF4KpWk0dnJ2UafrghaV/g5ze+ZsxD4LZyynt6zQOVWnMv+Pp8TV0IIQa
	OJwbLC44Q4v7aXgVWeZYi8Btbk8xAt+c30dD+rDQ=
X-Google-Smtp-Source: AGHT+IE9Zx6rrSxmo/TfVMJEMfCSEvv5kTOAJj2WU/ZWv6yREWR2EgA4NDWJv08ZAUMMHtBOTiCxaj5H+lZ0CIJRFqw=
X-Received: by 2002:a05:690c:6e0c:b0:6ef:6b56:fb46 with SMTP id
 00721157ae682-6f3f824cb08mr87351047b3.40.1734939131915; Sun, 22 Dec 2024
 23:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com> <Z2kNTjO8hXzN66bX@kernel.org>
In-Reply-To: <Z2kNTjO8hXzN66bX@kernel.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Mon, 23 Dec 2024 15:32:01 +0800
Message-ID: <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> wrote on Monday 23 December 2024 at 15:12
>
> On Sun, Dec 22, 2024 at 07:15:37PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Changelog:
> > ----------
> > v1: initial version
> > v2: add __memblock_alloc_or_panic support panic output caller
> > v3: panic output phys_addr_t use printk's %pap
> > v4: make __memblock_alloc_or_panic out-of-line, move to memblock.c
> > v6: Fix CI compile error
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/
> > v6: Fix CI compile warinigs
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/
> > v7: add chagelog and adjust function declaration alignment format
> > ----------
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: Xi Ruoyao <xry111@xry111.site>
>
> If people commented on your patch it does not mean you should add
> Reviewed-by or Acked-by tags for them. Wait for explicit tags from the
> reviewers.

First of all, thank you for your reminder and patience. In fact, this
is the first time I received a patch discussion when submitting a
patch.
About Reviewed-by or Acked-by tags, I will not add it myself in the
future. Regarding this patch, do I need to provide a new patch to
update it? Or will you modify it?  Looking forward to your reply

>
> And don't respin that often, "Reviewers are busy people and may not get to
> your patch right away" [1].
>

OK, I will be more patient and update after confirming that there are
no more comments.

> [1] https://docs.kernel.org/process/submitting-patches.html
>
>
> --
> Sincerely yours,
> Mike.


--
Best regards,
Guo
