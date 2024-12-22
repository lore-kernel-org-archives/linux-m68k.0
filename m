Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29165674E
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Dec 2024 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847642; cv=none; b=dbD1tz9U3HpZpmYgiz8hRDyiDkYSzDjXZvfLNAkyy73v7Fwvm46ZvN1TuoK2QpZfbGLVcneYSFd8ba9ueFelm2AYlmVIgKsniZ8TAJa3VN2kz0YRE4rskuAcZEgEoXqeTLwkJ2Db73jSziTxOqmU3DyzwWuwDzoZfsczYJ16Et4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847642; c=relaxed/simple;
	bh=ZI7mtoNdl+3R+xCvx6C6G12E13skabgOFMAvirAjF+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOQr0zkSZe7f7T8WdIyQeXZ+BiVQ7HBpzboezfJqdMoY8XkpuvpDHjSLbMimwF910dY11XP2s3BNdegzsPefebHuXQ/nupJH8lbvs1AZi9X3cG20sw+vblpn1vTOlfGqEGBiWfbk/M+vYSIbyD03gjuJ/d5oHNZ9qF05VUUPHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHB55FPU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHB55FPU"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef66a7ac14so41123317b3.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Dec 2024 22:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734847639; x=1735452439; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=YHB55FPUsvILnmcYdVXo8kEKFG3AMnFV3OE5m0VhPjRVFycQwKO97Gwj8zP6lASCY7
         OqUn10MKJnMF8IzbNS+X9qJU5f9pXVudZnf/cbekrJaM/qVduDuYkcxxHGXQPe1UtWhP
         vWfn7yppsRrkCKPXGo2P08Nl8jqYCbYKryLiTMLuz2ECmT4N2WusprEGfMWa+XQYNSVx
         PvYNJV3E3nEvpEuVHfecCiMXsOsEjlt74azBCHg/lxbAZioK0vpvGUhR7gbpJubvZ9pl
         M8TjHGBW/Zznf/4O6o5eVxJCylZ+RdHetb7djnNvuII8TawYubkgy2yNV0uNBY+Mzlzb
         9NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734847639; x=1735452439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htlpToW+3tDMXYk9LHSjN7kEjprwT0u1X/m/1Vl/oro=;
        b=MJdmB8baVwdapKiNX0sbD5txsI3PB6X/3LqogkkW0Oibd8WTmH8iKjhFXDpv9i7aEV
         1GK4HvZCOucJ7CP/ftjec73XLmdgAKWU3jsxi2MROVNa5hOIbk00q5Fd2leVd+W9STxN
         0DTrs5Q+zt3T9KLnnABQ48tVHhNYEX1OMMwg9/z9W5OGKOzWFJMLM45k2uUirGUuAeLh
         juUtWovog38nFRXDQ/Geq0Qz49k7MW202SbWSISwOrzpebcB119h/dy1CVbzOuNrs5gx
         vbQCB3adM73GQRaxPSeKo49YVYA42Bp8Y7jv5CmKyO/Ffrmv80St4cHqw/5Wxr2GXTqX
         Z2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW59TQR5appXS392mR1WULOBXQm8Dkq5cFEEhw36W83+vYfboc826cR1wBNBrZLMY2+gpj+xcQ6A2tx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxf6KqTpTfWs4EEGKrHxgAKuslPNF1+uIHhP8S7ggEWigR261/y
	fc9SfDT/RYEBhAg9ta2u3Dj5jNPq3P72wDGYdMUZozoPbe8pEO//Uz2nXRVSajbKLwet3MFr0xo
	QcYhc8aYYYsywM9mOkaNu9GO7jHI=
X-Gm-Gg: ASbGncslYIWSaCDu0BimLP8T8iW4S7jkH/2eerML386VdfuQTcoocoFxbkfia+Bfkto
	8p5Zh9psP7VhUzGcy9/qsTT8EMHZJuKxjugvd1eM=
X-Google-Smtp-Source: AGHT+IHTObibTWvFBx2RCqB+bk/1ZpT+xydtv33cOquvAas7ggMPQiaYSrqKqDsv5/UZU90VEPoAsSH6qDx1lw2KYn4=
X-Received: by 2002:a05:690c:6908:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f3e2a65668mr105552167b3.1.1734847638651; Sat, 21 Dec 2024
 22:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com> <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
In-Reply-To: <02d042a6590ddb1fadb9f98d95de169c4683b9e7.camel@xry111.site>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 14:07:09 +0800
Message-ID: <CAOm6qnk0KYJXuCLU=7Y10wjMjWnUQ+n_RDsJZv5rAqBmq9bkug@mail.gmail.com>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
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

Xi Ruoyao <xry111@xry111.site> wrote on Sunday, 22 December 2024 13:51:
>
> On Sun, 2024-12-22 at 13:43 +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > ---
>
>
> Please try to avoid bumping the patch revision number so quickly.
>
you are right,  I'll pay more attention to this in the future.
> And if you must do it, you should embed a ChangeLog of your patch (below
> this "---" line) so people can know what has been changed.
>
The update was indeed due to my problem. CI prompted me that there
were some compilation warnings that needed to be dealt with, so this
update was to fix the CI warnings. Refer to this:
- https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/

> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
