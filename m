Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028240D587
	for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Jul 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979653; cv=none; b=FSSn7ELYe9ELbZGQjd7eRvhgRTVzAaKgtdr9JIYHJi8Ht3gQ1vWIURfUdKLsMe8FNopuOzCC3RqX05HFKckDi4FL1crWVe1mf0Fd9pzFQMqoVaNwXb5i6bCnyioZhIewyTn98XNkFJAVMO2ZrhYuCtht1ur1gkHC+drSN93EZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979653; c=relaxed/simple;
	bh=GYxTfmNSRB/NKZ/x06KAzLvXQ0OvuzbD14QgSFFJqvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMVSiGlfWmnWNxbUXfP3KItpFqwHGPcxuA5hLGMyJOIyc5bsaYWtXQg0C4wCg4qKUQf7J/sIx28ejyhs3AxVogfrOvR4VxGWsbDhMDknti1QM0A67LtAQ/bW4WFnI5OU3bzTJE4Pm3E0Rcxwa9PAtU7AJlIHjA1RjnpYEoF1AYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-96358d0a024so1173032241.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jul 2026 01:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979651; x=1783584451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2BZgp1vNLGqnj/BWSIeG3ZaINfcn1tTXmUx6P/Mp6k=;
        b=dSsz4l60yFY+eM2WckTUCDSkquQUkcfGf9pPswH0SADqqdWDYbl1gXkS8+8KsuntSh
         MRuhxtcp0R0wC8kSkHWujqLNi1/5wizViUtbKRwc5CT/xPkA7AlCOTgYn93sw5qHKjTt
         CJpaXUEppYGD4Y3hFsAUJ3pmeI4XJ6umHk0lpDEvHQTzxb6DMp+EM2g+J9X75JiBr0nd
         97Q8ebxUsM6tSx3gW8ciV1xvS82yJTDq+8fgpr+LnZwtdMjQEjecJVsz7LFuunpjRmIc
         4PGNZRcu6/F1BTSP19dUEEKCCBK2d5hSpnYob5SFi4o/G1wLpzVZMtQVNf0iCjeuzEkm
         b+OQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq006/okeUKZxKZCDjrB0OdENVubVoIQasicceNowYSd0tfq1eIZcfcBDpX0hIuqTBzwpy92zz6MlO@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw3c0lS6fnaZo+WePo/t1irzuX9jFLieBFYBKxcrXon9yBb8h/r
	soLxWUWxFgI4PMMPqcKgygogx9TLD4iMroTRB7kNghZwGsP3w2Ty2GbPNm4eHKkr1xg=
X-Gm-Gg: AfdE7cnzRqTGgdEFD4tAR3clFWWPsm21f8kHgd7pgeoWXaydxs8x2XcQxHWHeb/mDNg
	1l6ab+Z4v580+UMeUUy01tdyr9GbeXhN3kOSPJjYC7fVQsQQsBMFx2vy5WlDMpYApRN3xdMo7Gf
	0QzcNySU5cpRl/zyBQbHvv7CTNxbh8nq2jKn7DSP0H8KUtk6ynKvwrn/z+ExnSmbyn5ouvcsfTH
	oawWZ1Phcb35MyhsW7dNOI9XdxcygHwstQnJ9gNtSJpN8E/Jt8A6QFNXCjD0afzgPVbtxHj0Opc
	h2PNMyQ+3qzRGUeWKJt0lvR4GzfSI07ItdK/eeJ45w8MT0QmFKmMFY84ujo4naMdjwL/Xqeb3xw
	JBw+3/Fap/H6DdVzrU784RsuLuXwhLP0Asls8A9azwmCorjfyuD9UUuEnQxW2vUtRLVxU36mQgG
	vQqvKdVWnqx6z5OINZhUKJwQcMc5sIKluK+TABgeu0WmnlNvW0Ww==
X-Received: by 2002:a05:6102:1484:b0:633:d7ec:153c with SMTP id ada2fe7eead31-73da80fa272mr2511336137.3.1782979650553;
        Thu, 02 Jul 2026 01:07:30 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983899f28sm697502241.3.2026.07.02.01.07.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:07:30 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9670c23ca7fso672836241.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jul 2026 01:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqsVnUOIN3YRBdXCnCAjCjKu17lCg0ZbkuQlSvzQ86KjLbduoPWqU0zR6vVr+rUZ76EFf2kbdfqvYdM@lists.linux-m68k.org
X-Received: by 2002:a05:6102:f11:b0:739:d787:beb with SMTP id
 ada2fe7eead31-73daa332842mr2327245137.14.1782979649746; Thu, 02 Jul 2026
 01:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-m68k-clear_user_page-v2-1-0c8981c6eca1@weissschuh.net>
 <20260525125441.6a3a74300d73f1e0d32db4f8@linux-foundation.org>
 <CAMuHMdXsfo=BR-e7gBKvTx=cH84vQoNXN8hZv9+8E+EmirMpEQ@mail.gmail.com> <20260701161214.5f381f2882af5fffd909a0b1@linux-foundation.org>
In-Reply-To: <20260701161214.5f381f2882af5fffd909a0b1@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 10:07:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOeHNK7P3A_2c9sWaz_Hq7K_z_uvXzy8qpLCfGG-ojgQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfi_CU0dSPPB0anSBpIASJR8N7RyggXmYhiT3kC4EVHLrK1-ul2Z1n9C3I
Message-ID: <CAMuHMdUOeHNK7P3A_2c9sWaz_Hq7K_z_uvXzy8qpLCfGG-ojgQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: Avoid -Wunused-but-set-parameter in clear_user_page()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 2 Jul 2026 at 01:12, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Wed, 1 Jul 2026 11:48:35 +0200 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > --- a/arch/m68k/include/asm/page_mm.h
> > > > +++ b/arch/m68k/include/asm/page_mm.h
> > > > @@ -55,10 +55,12 @@ static inline void clear_page(void *page)
> > > >  #define clear_user_page(addr, vaddr, page)   \
> > > >       do {    clear_page(addr);               \
> > > >               flush_dcache_page(page);        \
> > > > +             (void)(vaddr);                  \
> > > >       } while (0)
> > > >  #define copy_user_page(to, from, vaddr, page)        \
> > > >       do {    copy_page(to, from);            \
> > > >               flush_dcache_page(page);        \
> > > > +             (void)(vaddr);                  \
> > > >       } while (0)
> > > >
> > > >  extern unsigned long m68k_memoffset;
> >
> > People are starting to report this, now gcc-16 is getting more
> > widespread use.
> >
> > Andrew: can you please take this, or shall I queue it for m68k fixes
> > (I don't have any other fixes at the moment)?
> >
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Sorry, this fell through a crack.  I've queued it for 7.2-rcX,
> cc:stable.

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
