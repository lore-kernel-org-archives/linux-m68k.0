Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18545139563
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709032381; cv=none; b=QutkTX3vAdA5CvixecMDyPVfA6HsvVrL+4XuXTI2zYiwkXcvbVdvQf5tZwsPLomhKiVlc1rxODNWrcqRNzllioTfT6VBH/mZR+IuecY+5dOATrGU8djvc+x3fMR/1B55lusZALiGF7hLxIxX+ihOddBFrI+/ogMWo6sVc0w+h84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709032381; c=relaxed/simple;
	bh=O6UtDTaDn834cQ2sd7oFrdw4KjK6pBp4PggykizhEd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgtuVSDpFMwulT1XcorvYH854BvuGovdQt7jmQl2OiLf0EvgMo3GPsCsJRVnH3loM97XDwlyVwiChyNT6L56JbvKMtyC3tO8fd+Rs3G3DnDQh8r4QzHzOsonNvqdTpMVDOesZz4fg/gX0ceM6oCgrTxggf9IwYLGDcoibZd88Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a034c12090so1767869eaf.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 03:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032378; x=1709637178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4Tv6sdcFEpWvZL/hYJEF+Ju7qt4AFqMkWFUs5NrLKU=;
        b=stsGYiJp2yIp6lWTY9ireL4TBr+vq/xSdLel+PTcnxrTpSStgxAY1m0qzXNTIXvqFh
         C3IioxhxbuXX7bP9lm6leP5Nevsrb5CvOwXKa2l5thUR0HH1p9ime5hmQwd3TCTVfaoa
         CXTMhBI3C+QnDCIBUgaRc1yBjcUGbStHXwPuuTuiXCHeQZVL+i8QcmnbTwVBnDCF06rn
         hHfVyY5ci8cq6eA2g3hxE0v8OcU/MWiW68y7Wddwe6lK+xCqTjdBOGDHHNWSfXF3wLYJ
         9qbwpvZJXaTrGc2fDuauhOCWb/qu6yXa8qWtZDMsA/PEYgZEeLzbwz6gfZ+qzvD6QopM
         41Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUv5GwmmkyLm1JhPjelMJIlntqmvhZdaQOUzK4VSk0ylh6NUabAexhYRh20wHvHshrK5LWvwQxCZJISaiha+ldf6oPxrArCHl9pjCRhQEfr
X-Gm-Message-State: AOJu0Yw05B65veSJg1XBq4CgS2+w2j7smiemvssFmDfCxtrBWRJ8s4FZ
	k9pU/51+/zRP2XViuTnu+v2fQcp/xZrShW+dMEb+GFfz+XJ6fIK3idYWBtY7LJKsow==
X-Google-Smtp-Source: AGHT+IHYFNcYjJ/CmGX425W86/i56h0hW8M30RmimJcScwCyFs2+Sm3XfQZ/UQOq2w8498nVsqaY7g==
X-Received: by 2002:a4a:650f:0:b0:5a0:aff6:a8f2 with SMTP id y15-20020a4a650f000000b005a0aff6a8f2mr1132643ooc.9.1709032378188;
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id q28-20020a4a301c000000b005a0bd582a0fsm34635oof.1.2024.02.27.03.12.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:12:58 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c19e8d4a9eso1053705b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 03:12:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmIYHT8EpS+X385lPaJn7EUTqGr+COqN8ifjCLKII8qQPLr/usvM2iFaA85vDzEdgL0ZbfMezImLNz5Ly6m+B4BD0VuFEi8nc5KxLwbwLR
X-Received: by 2002:a5b:ecc:0:b0:dc6:c32f:6126 with SMTP id
 a12-20020a5b0ecc000000b00dc6c32f6126mr1607871ybs.22.1709032357452; Tue, 27
 Feb 2024 03:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com> <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
In-Reply-To: <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 12:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Message-ID: <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, guoren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

CC Greg

On Tue, Feb 27, 2024 at 11:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Tue, Feb 27, 2024, at 09:54, Geert Uytterhoeven wrote:
> >> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> >> index 9dcf245c9cbf..c777a129768a 100644
> >> --- a/arch/m68k/Kconfig.cpu
> >> +++ b/arch/m68k/Kconfig.cpu
> >> @@ -30,6 +30,7 @@ config COLDFIRE
> >>         select GENERIC_CSUM
> >>         select GPIOLIB
> >>         select HAVE_LEGACY_CLK
> >> +       select HAVE_PAGE_SIZE_8KB if !MMU
> >
> > .... if you would drop the !MMU-dependency here.
> >
> >>
> >>  endchoice
> >>
> >> @@ -45,6 +46,7 @@ config M68000
> >>         select GENERIC_CSUM
> >>         select CPU_NO_EFFICIENT_FFS
> >>         select HAVE_ARCH_HASH
> >> +       select HAVE_PAGE_SIZE_4KB
> >
> > Perhaps replace this by
> >
> >     config M68KCLASSIC
> >             bool "Classic M68K CPU family support"
> >             select HAVE_ARCH_PFN_VALID
> >   +         select HAVE_PAGE_SIZE_4KB if !MMU
> >
> > so it covers all 680x0 CPUs without MMU?
>
> I was a bit unsure about how to best do this since there
> is not really a need for a fixed page size on nommu kernels,
> whereas the three MMU configs clearly tie the page size to
> the MMU rather than the platform.
>
> There should be no reason for coldfire to have a different
> page size from dragonball if neither of them actually uses
> hardware pages, so one of them could be changed later.

Indeed, in theory, PAGE_SIZE doesn't matter for nommu, but the concept
of pages is used all over the place in Linux.

I'm mostly worried about some Coldfire code relying on the actual value
of PAGE_SIZE in some other context. e.g. for configuring non-cacheable
regions.

And does this impact running nommu binaries on a system with MMU?
I.e. if nommu binaries were built with a 4 KiB PAGE_SIZE, do they
still run on MMU systems with an 8 KiB PAGE_SIZE (coldfire and sun3),
or are there some subtleties to take into account?

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
