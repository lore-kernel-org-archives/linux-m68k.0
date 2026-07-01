Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EB03F5BE3
	for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Jul 2026 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899333; cv=none; b=LxkR+cvkpHBOuVQRr5hvC2z05DA1cqYi6eE/ZH5EmRfHv4xKV+95bOX4Pa/OFPjmvVpeUYTzXg/8x48LNuQEG+g4hV3cFiMFEhK1xYysalCtXjeRryT+IR6MpHIXIGql6JWmk8NO1CqRoa4fk+VWvwGrmKtd4U2C/1djBRzNKdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899333; c=relaxed/simple;
	bh=VguWA+JZcbBuPsldUmZGSqh5R48z849umH9Mfg+vDk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbPQvIg1QZDd4MibUXxyabYkcfMKYN1niVhoMG2drG7tkphQ6X7buO4nmeFJOZhNOdh4PK/Gvf6uNg2ZGKp7kKJCmMx0+lAFgH0wVxbcz62DKwR/yYdstCntkh6dMj3NHhtXzU75G7uDuj+RsNSYH1KizDRRtyuawKowiJoWAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59ebb89109aso247851e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2026 02:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899329; x=1783504129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5qxPUoE0Iv24xl7jBl2/E4QLXx7b2viT34r66JFJIQ=;
        b=Bb4IobCNkKptLU/A/j3vvwzYonLKX+55SfmXYuoJCmLE87JGcsJTHXRDGsJRsYd/7w
         lMWpr7F3MlHJVX5Uz7xLfEynBY3q2CHRNNEuM9iiZvSBypXFI2gpnMn8zsfr3dg94h5c
         G3me67/Dw9y80ys+ouVEykxs29joqK5emHGHXTHY1z2lHIzN1ILY4+LOzfAdlfSeNdCS
         NG4OQvUOG34Z1J4RGL57E6/fmAwP+uT9+IAV8poKQF5J5VpgJSk8bmuniYBhzqRtmmqk
         Q4Qfi49w0ZZFhAaahLfHNY+t1wbQmBGrah29d6CwSCgqOkx2MtRqGnq0gxcijDOqYOjz
         +1Xw==
X-Forwarded-Encrypted: i=1; AHgh+RoxXTPbbDbnY7AV1fKmiY21R2oy2Wq+dDNRH/tSiAbaBq03u5XOyAn2KI5HspaDEMl98avo4TB+HTFJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxA+3RKbS1K55NxrYzB9klRyINcN/V68Uf8hehFC8kdzN5eT1FA
	MXcqXPrJj81xiI67VdQmtUn6yElsD2UcsgO3WrbRf6FMvuap0vp5TdpdYMFQVKu8VJg=
X-Gm-Gg: AfdE7cmhFcWMb9qXtGIAqVEwJQd+nvkS0Wgt/EOtOtxsBXBNTgSnp8fbWGbrEFgp2te
	wSX9C+Vgtzm3uHLCf6h6t8be3pBpTDutCEN059F5eqt9M2aQmhYDTnTbQ6HK1AvGFnGZg4oXIRm
	XlHiMQ0PKbFYxTtPCHl/3aQkqDGVSyJipLu7mLSedVKw/LHWuoGy2/unMLC7zBROGHhHWPP84M9
	RUGpS/C8lAnLv+KhnSz6MIrpzMhhg/WEx0TiMHnq/Qn4V94UFidbgSHZLSP//KjxTnvmw6SdXOh
	E8dgomqbOejDTJPRL1O/xqfJyPy9TZ6HNvuSyoxhsMZGCLtLDUA8LvHsc9bvHqhS9AVOTM5XAeV
	tOfMusvqtsJsHSxYvxgtyXdDDN9E/lagFViVy6gbAKAl1MdI5/HSiocFGEsWsamSHXhtoicIVke
	Ak0O3da/fIKzNgnZAIKA4o22P/smXzMXYkpt1nmb1bMXIo3rm+QA==
X-Received: by 2002:a05:6122:1d41:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bddf6adaf7mr229114e0c.12.1782899329147;
        Wed, 01 Jul 2026 02:48:49 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc189bfc0sm2910902e0c.7.2026.07.01.02.48.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:48:48 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7383cdb7800so356710137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Jul 2026 02:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpdIFZfFQBOG/wo6z2KnFY3rlcaSg5ZF8dMaxzUCf9/dViw1nO2s+xmX7Y6rL5rurZbfZMZ4uvmUjxp@lists.linux-m68k.org
X-Received: by 2002:a05:6102:508f:b0:738:472f:2cb3 with SMTP id
 ada2fe7eead31-73dbe24f67amr47696137.8.1782899326458; Wed, 01 Jul 2026
 02:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net> <20260525125441.6a3a74300d73f1e0d32db4f8@linux-foundation.org>
In-Reply-To: <20260525125441.6a3a74300d73f1e0d32db4f8@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Jul 2026 11:48:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsfo=BR-e7gBKvTx=cH84vQoNXN8hZv9+8E+EmirMpEQ@mail.gmail.com>
X-Gm-Features: AVVi8CdZu0Y31up0ht2N_qd9X98wB0ld19cPP35FoEceyh9uTYoAYJPqjs1tuPA
Message-ID: <CAMuHMdXsfo=BR-e7gBKvTx=cH84vQoNXN8hZv9+8E+EmirMpEQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: Avoid -Wunused-but-set-parameter in clear_user_page()
To: Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew, Thomas,

On Mon, 25 May 2026 at 21:54, Andrew Morton <akpm@linux-foundation.org> wro=
te:
> On Mon, 25 May 2026 10:33:52 +0200 Thomas Wei=C3=9Fschuh <linux@weissschu=
h.net> wrote:
> > The loop in clear_user_pages() iterates over all pages and calls
> > clear_user_page() for each of them. During the loop "vaddr" is modified=
.
> > However on m68k clear_user() is a macro which does not use "vaddr".
> > The compiler sees a variable which is modified but never used and emits
> > a warning for that:
> >
> > include/linux/highmem.h: In function 'clear_user_pages':
> > include/linux/highmem.h:234:63: warning: parameter 'vaddr' set but not =
used [-Wunused-but-set-parameter=3D]
> >     static inline void clear_user_pages(void *addr, unsigned long vaddr=
,
> >
> > Other architectures use an inline function for clear_user_page() which
> > avoids the warning. This is not possible on m68k, as dlush_dcache_page(=
)
> > is another macro which is not yet defined where clear_user_page() is
> > defined. Including cacheflush_mm.h will trigger recursive and lots of
> > other issues.
> >
> > So hide the warning with a cast to (void) instead.
> >
> > While we are here, do the same for copy_user_page().
> >
>
> As with sparc, can this be addressed by converting these macros into
> static inline C functions?

That would fail for similar reasons as on sparc: flush_dcache_page() is
not yet defined, and trying to include <asm/page.h> causes include hell.

> > --- a/arch/m68k/include/asm/page_mm.h
> > +++ b/arch/m68k/include/asm/page_mm.h
> > @@ -55,10 +55,12 @@ static inline void clear_page(void *page)
> >  #define clear_user_page(addr, vaddr, page)   \
> >       do {    clear_page(addr);               \
> >               flush_dcache_page(page);        \
> > +             (void)(vaddr);                  \
> >       } while (0)
> >  #define copy_user_page(to, from, vaddr, page)        \
> >       do {    copy_page(to, from);            \
> >               flush_dcache_page(page);        \
> > +             (void)(vaddr);                  \
> >       } while (0)
> >
> >  extern unsigned long m68k_memoffset;

People are starting to report this, now gcc-16 is getting more
widespread use.

Andrew: can you please take this, or shall I queue it for m68k fixes
(I don't have any other fixes at the moment)?

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
