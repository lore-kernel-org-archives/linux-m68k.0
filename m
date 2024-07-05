Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C4148829
	for <linux-m68k@lists.linux-m68k.org>; Fri,  5 Jul 2024 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179064; cv=none; b=Y8KXqUdeAmV6mn7gP6C0fh3Y8XeBJ5QBDFiaWQ72NRV4VZNyFVxrPbRzR9b/u0h4O4BAZV197WjG326nE1f0xE5lbCH3ByGPxDbjPAqKMlt+f12bAmS3JuD0pcoCndvB0YbNuyW+lJqa7FKd8B2Ork002z/ZupvXgQTKYh6rtoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179064; c=relaxed/simple;
	bh=EgcwXdIvXQDNY3GZ3aYCtzQQGGp7IEMKNKHVTI9HF18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAPHFYlM0q1qPzoybt4up1K5qLtEC+Vxv1rNYD6zaASrueEFyNjjxHK3QSnz2YLF2e/dydIkLA5W6XLPP48vEPcAWsT2jfJsw65Mz3oOmY2Lg3argGWdqMg5/fDSBrpg9GzneTKqt8zV3iKLX0laqBkviPslWAML/X9iV63YbfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64f4fd64773so17247927b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 04:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179061; x=1720783861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hbjZd5X+NaHX9Z8zRl3iN5Nokn1Qy+oFoxrA0AKjGI=;
        b=a/JnG4ax5LUty3TCO6D6hGZkneQDJZalhSByFkbXZg3Pr1ftNUg5jOAkIt3SbE6s+I
         of1mfncncB1Uffp4bN0H1ASZENhATwsdSsBCPAiHKyv6uZq8kqEb2VW8+mPfpLZPig3x
         Q78fSvrRMmUaQUGxMKQdiR+N+ED+qwkxPb1bOBAdWmzAbYo5qnk8wSLN8inTOb4A4EXK
         BH7Ws+r5PrqjRrY79baS2Qwzp5KnLSPWfcahWCrRohVyl2y9q3jNWKa8emIMkV4nHBkY
         b38TEdeHmQ48OWrR585nEToe2cE5mrx3UAnnoElDnSMtT93j6mAMEjvnZy+BJEyGA2N2
         +9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXnqsROg9E3psNlMtuvbOMmw/lkUI+kme9hlxsNcpOOoKrt1lnqs+//mcTv/CAqi6Mn/j+QYKjU3oU5ukM2K0L3lqX2b3XEo/Xochic1sVa
X-Gm-Message-State: AOJu0YwSntj2nVsI93MuQO55LTKSW6SyQ48Ao62wWWK+ATrrbv/KcCkX
	nAVwxoAMvMibglyHxY9LpSt2JCNSYHTdPc75sd71rniWAiKOFLHeD4GVxshC
X-Google-Smtp-Source: AGHT+IH8NipUKDnSODFtr/JYW8T8MUerOoPY0LU784sucKfk2smP0o7saE+6enjRsAKImKl/MGOAxw==
X-Received: by 2002:a05:690c:6c82:b0:63b:b3b8:e834 with SMTP id 00721157ae682-652d7683a93mr53997937b3.32.1720179060719;
        Fri, 05 Jul 2024 04:31:00 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6548d849e27sm565957b3.19.2024.07.05.04.31.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 04:31:00 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64b9f11b92aso12895747b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 05 Jul 2024 04:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC5f1gxrN+GWrx6boZ++pXM6diAD6b0Ay9JftPvdhs1WQBLHnYCX/CXyF8Q6ZnBTvolRiBty4xk7sqC1J9C235qYIFMMQhWmvDV3gcrN2l
X-Received: by 2002:a81:8b45:0:b0:63c:416f:182d with SMTP id
 00721157ae682-652d5444259mr42613887b3.12.1720179060065; Fri, 05 Jul 2024
 04:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705081508.2110169-1-hch@lst.de> <20240705081508.2110169-3-hch@lst.de>
 <CAMuHMdWmqRq2oBtgY0w1ZPcCchqBm7pmsWBGmqQhAPK6V-Tz7g@mail.gmail.com> <20240705112230.GA28636@lst.de>
In-Reply-To: <20240705112230.GA28636@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jul 2024 13:30:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaV+jQZ3+sPc5_BY_9CBr9t4pzy29bWn+okNC3squDow@mail.gmail.com>
Message-ID: <CAMuHMdXaV+jQZ3+sPc5_BY_9CBr9t4pzy29bWn+okNC3squDow@mail.gmail.com>
Subject: Re: [PATCH 2/2] block: add a bvec_phys helper
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, Jul 5, 2024 at 1:22=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrote=
:
> On Fri, Jul 05, 2024 at 10:50:31AM +0200, Geert Uytterhoeven wrote:
> > > +               seg_size =3D get_max_segment_size(lim, bvec_phys(bv) =
+ total_len);
> > >                 seg_size =3D min(seg_size, len);
> > >
> > >                 (*nsegs)++;
> > > @@ -492,8 +491,7 @@ static unsigned blk_bvec_map_sg(struct request_qu=
eue *q,
> > >         while (nbytes > 0) {
> > >                 unsigned offset =3D bvec->bv_offset + total;
> > >                 unsigned len =3D min(get_max_segment_size(&q->limits,
> > > -                                  page_to_phys(bvec->bv_page) + offs=
et),
> > > -                                  nbytes);
> > > +                                  bvec_phys(bvec) + total), nbytes);
> > >                 struct page *page =3D bvec->bv_page;
> > >
> > >                 /*
> >
> > If you would have introduce bvec_phys() first, you could fold the above
> > two hunks into [PATCH 1/2].
>
> Not sure what the advantage of that is, though?

It would avoid having to change these lines twice: once to the open-coded
bvec_phys() variant, and a second time to bvec_phys().

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
