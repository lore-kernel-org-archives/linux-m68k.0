Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCB275AE2
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816589; cv=none; b=repvobVR3pxPtoI/CmsHrZuxany6Ua//jJdsaUBDyXW9zRDEFR/BZbP9k/QcAJ2ncRVcIvAUhIRhnm2k57G02fnfbCa1wc1Y2yPuX9+rkd/Ed8u0SqGfzHXy2+UgqjulzAPXQBIFoYoQGYaSK0gp5hoMc5MHZoyk3nB7oRSvUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816589; c=relaxed/simple;
	bh=jy9LjgUN+JojEYiqIkRcQoXCR27+Fp7iaeSGnwZwBKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFt9CB8KXDH9zb1KPKWOYdz0E8Env5Y9FOPKY/RGEXnYe8toWbs9kwApuJKL62QKbx0r1f2h1irgXtwhBwqJRqT95cXgwEaxpK/uQRHNpB1FErjKJbzhLnQ+pplb9e/GcN7BGda1/8LKj7wgqO7eG/6eIUexGNPWjlxq+kWBFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a44b3526e6so27482331cf.0
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 05:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816585; x=1750421385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rwhRe2K6SchO9OxAermbuoQn4P8dyFyKEvoRi3Q8LY=;
        b=iisbVcsKbiqiHqSztPjPlxHRZuf5StYZvtDpVm3Uh2DXov2Glqyne2jl/bhlAoiS6U
         PE7fbkx2lJ2SXS6uQeolVxGKHKMu8p90mZYx8tGh9ze05au/xn+BBL9Lgmsteu40GMSc
         N02zwJb+rTT8wcnuRQHy6OBlolW0HLvXbzn3ehcZ3VYsurytq56YyViVfkIFzPr0Od9A
         2bQJTMdmwxUn9dfIl/iP/zixSQ2w0gQ62/V36dhmR9FAP5g69djzUHs4cCJ3Vh1J01Db
         S4TTuM6jdzxMt1oj/3qJOI0SorRroBvQnIm0KkUm8/sDJlGlbA6GNgXGOz6GZZLPh5xp
         5cTw==
X-Forwarded-Encrypted: i=1; AJvYcCVD73m1Arqb51J1/hVp3FNmcwhl7t0V3gX1xWWzPBeGiuIPIXiGPKqnbCtbUHFElS1KCmhmBiuPXSHn@vger.kernel.org
X-Gm-Message-State: AOJu0YwtADLZMBbSEelvLbPXUSStKD3WtTQOFuboHP0fyIJ/VpnpY8Cg
	WB+KiEe3Ajl9dxilqMgDsvOOj3Vj7iFX0FVbgjMhXItjrWOJdFS0UZgNPBUNbkEh
X-Gm-Gg: ASbGncs289HRF8Wk5lSPUCoe2ywxeJRQFfKqdZg9uvyKXG/RjE2mco9SH3ZhUk6JiCt
	TgY2ZSQRko5h77efwEww6Im5xX7i/42lf0kV94i4uYukYX6OMPensf5KI/dPVQNQYA5RHnDlRbq
	dKsAYb9pmrbVcv/Vjvv2G6j+E36h3Nz2sTB5boZqXSCS5Z1uK0B2igqiZXL2VTi5/sgNPNQLOG4
	FPhSsrD6Q19XBWMEawayYP25LLcDDE/ptj+Gqpb5pQ5yPTsye/WlRnBCPVyG9548mp6Gf/WeeYu
	DDF+FYcFL9lzERh4oQyPrwi3n/WARV73mleGIM2T+GPtDGE1ub4moljUNTosAjRD6hJ7+w1wFI0
	kXv8HESQEykIu1xosVedyk5YivUMZJDI63vXLcPY=
X-Google-Smtp-Source: AGHT+IFvEq+/yEQPXlb41c1wDd6UoRRx5CaIuI3tnnAyB1eU+7zwJUzKo+fYJon0FUaBbeuR+rxY4w==
X-Received: by 2002:a05:622a:1c16:b0:477:4224:9607 with SMTP id d75a77b69052e-4a72fe7a9f2mr45330401cf.12.1749816584925;
        Fri, 13 Jun 2025 05:09:44 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e7ecdsm16034361cf.66.2025.06.13.05.09.44
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:09:44 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d38cfa9773so211321385a.2
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 05:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK5b8BU0qDt83Ad8aVNTdR2gQlQZBMKMnKH7LDoJ68P+1Lv4KWLSpKDIWYESuBSAm/WO6TvAUINjtB@vger.kernel.org
X-Received: by 2002:a05:620a:1b83:b0:7cd:1f2e:dadd with SMTP id
 af79cd13be357-7d3bc51e1f9mr462740685a.55.1749816583993; Fri, 13 Jun 2025
 05:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com> <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
In-Reply-To: <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 14:09:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
X-Gm-Features: AX0GCFuwrpFkoqU64FGdJEPBnQSYw1XWWfuxIBb15XvQFrHKJRen_K9ZjAqkH70
Message-ID: <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Fri, 13 Jun 2025 at 14:00, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2025-06-13 at 13:55 +0200, Geert Uytterhoeven wrote:
> > From its inception, Linux/m68k used an ABI compatible with SunOS,
> > which dates back to the MC68000, and was probably the most popular
> > UNIX OS running on m68k at that time.  Several other UNIX vendors
> > followed a similar path, starting from the MC68000.  E.g. the HP-UX
> > Portability Guide[1] states that HP-UX on HP9000/300 (based on SVR2
> > at that time, apparently) uses an alignment of 2 bytes, too.

> > Linux has a strong history of not breaking the ABI between kernel and
> > user space, so changing that ABI is a no-go.

> Okay and how does this now fix the problems we're having on Linux/m68k?
>
> https://wiki.debian.org/M68k/Alignment
>
> We're compatible to "fails to build from source" now. I'm not sure how this
> is any helpful.
>
> I'm not sure why several people are contributing to this discussion with
> the argument that this change would break the "Linux ABI" when the Linux
> ABI is currently broken and doesn't even allow for Python to be built without
> further modifications.

You mean Python is broken, as it makes assumptions that are not
guaranteed by the C standard (oops, which one? ;-) ? ;-)

Lots of older packages used to build fine on much more obscure systems
than Linux/m68k.  Unfortunately people stopped caring for anything
not 64-bit little endian.  Yes, I know saying that doesn't help...

> What is your suggested alternative? Do you expect me to patch broken packages
> into all eternity? If keeping 2 bytes alignment ABI is so important to so many
> people, I would expect proponents to come up with solutions.
>
> So far, I haven't seen any. Just arguments why my approach is wrong.

You are completely ignoring the last sentence I wrote...

> >  What you do in the layers
> > above (in the kernel), or above (in userspace) is something different...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
