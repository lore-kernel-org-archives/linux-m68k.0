Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2A6996F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710230411; cv=none; b=otTLIdVQlLcPosFaF+h0goZVvlkSberlaiSPFIdCZEBaD8eUx5qzuG2g2zueuuf+smgom3MZM59oDwwiWPHPuICEbImhAuv2QYWocWKcOvuBytaGFoxDZbMUPQQs+Rp4FHkWb0wwUMF1rIezx9BAMhRsKEnZrjs0298YAkzHd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710230411; c=relaxed/simple;
	bh=mmrF8yMXwDTkX3hdooC6vCCtcgEmjjBYSB1yIwSpsaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwipCf5DNn0t57A0o1OtdTnKjVPdgfswXQLNPTYOSyl1W2maGkfuHEV6kEdhydzd+Rh+5s4f+7Banu/PxB/foFB+NFZnlv6uf+W1cKWveHHx/3OqONfwOyj+EcH0y+dR503nwpgjb8DqAKCw0sTUZc8lLZqniEFK/PQR2N4UTuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a0a54869bso27825217b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 01:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710230408; x=1710835208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mitwUwuBkzRJhcno0hb1E/FSdy3JpCrB/NQRBE7zuW0=;
        b=SDp/bONVsoFK1NAvlhBhhFcew0RJAFcCamhiwNCMhBONx5HJd+Kd6w1KacLF3dyLHH
         3KX4ahQ4dEmBGLXb5h8faNiV3cA3nOIeHXT6JMEx/r9sb8RNF9UQLgTIHYDMuGa0Mup3
         bBugsfovNiErmXtbIG8+dmm0fgTJKuhfuXR7D99+JRC2fvuocpx6+Fv9XrbaEtJ27oHC
         kFCA3vb5eLDUuKIvxbCpv1BaTtzCraGPU1MXbIiDCv1ng1Ow3YDRaraPwViZSps8lE0t
         7QIajuqlptOXel70Hw66PfeD2ou9IElE/YQ6yZuKMvgG5bsmcBoOeIf96ecKiRtbdPIB
         hEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+40NPcRC5bqvTDHBOvFFJBWlp43Se1Es3qXUl64yEGhxXK3VWYZmMtCnaSb8JA7W+j0FVXxFf/x4hk3TbyDB8ae1AMMUJo40tw5JOUiZ
X-Gm-Message-State: AOJu0YzpUIKCuDeNrTjgsY/EiwonKa0hCl/09NvFofaetDZCRvEpdDag
	963ZhTSDmrGGfYRv32dlkKBa8UuDfGNzqs9ZaGY8NUobunKpXtoBferLUX+5MxY=
X-Google-Smtp-Source: AGHT+IH840h7qFceSLuNCELxD0esMMda1Rig1CKG8NIcQv5VMLu7BcZqnNtGnGjaRrb0uDoIIKKHxg==
X-Received: by 2002:a05:690c:3392:b0:60a:5420:5dcf with SMTP id fl18-20020a05690c339200b0060a54205dcfmr1712930ywb.12.1710230407808;
        Tue, 12 Mar 2024 01:00:07 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id c123-20020a814e81000000b0060a28132b21sm1328486ywb.106.2024.03.12.01.00.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 01:00:07 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60a0a54869bso27825087b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Mar 2024 01:00:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk7Eyo5aWmK9ZUkDRjs7hq+reHarvWs6sx941BZu5/qIdddKkkZqSLXLhLOcOy23kJtfqWo7GSFmr68BZAoA0IfQ0n7kcQuo+YG/71X+kF
X-Received: by 2002:a81:83d1:0:b0:609:ed7d:19eb with SMTP id
 t200-20020a8183d1000000b00609ed7d19ebmr5343874ywf.2.1710230407418; Tue, 12
 Mar 2024 01:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net>
 <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <40205038-a7cd-2568-5f8e-2540aca2f84d@linux-m68k.org>
 <56f79fc8-1a62-48af-b2fb-cddace7c828f@gmail.com> <60029130-022e-8ec7-2dc5-678b077f1d69@linux-m68k.org>
 <6eeccba7-6877-dd3c-2a67-94ea448bead6@gmail.com> <cb98b504-0669-eb91-4da0-8ee7bb7663ba@linux-m68k.org>
 <5076e848-9bd3-3fea-0aca-5f62a8739a73@linux-m68k.org> <bd6eb981-0dfe-a9c9-7777-0cfa0703efc0@gmail.com>
 <fbc5d581-dcad-8627-3a19-6e2d10614870@linux-m68k.org> <2465c81d-d2dd-320e-cb4c-1c23fd485aed@gmail.com>
 <9e5ce055-8af4-4cca-3505-a3186b86926d@linux-m68k.org> <ad9a7be6-e2f4-f17b-04fe-393a409e523d@gmail.com>
 <745f844f-a100-5f38-99b3-97ace157b2a2@linux-m68k.org> <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
In-Reply-To: <afcd0605-49e4-49c6-90a3-2d5b6a2cbf78@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2024 08:59:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
Message-ID: <CAMuHMdX-4kPgg99k7VJhnHNKp2F2w9+gStyvKnrDwB0NTm5EqA@mail.gmail.com>
Subject: Re: spinlock recursion when running q800 emulation in qemu
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 1:51=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On 11/03/24 21:35, Finn Thain wrote:
> > I think spin_lock() reduces to preempt_disable() on UP.
> > In include/linux/spinlock_api_up.h it says,
> >
> > /*
> >   * In the UP-nondebug case there's no real locking going on, so the
> >   * only thing we have to do is to keep the preempt counts and irq
> >   * flags straight, to suppress compiler warnings of unused lock
> >   * variables, and to add the proper checker annotations:
> >   */
>
> That's only true in the debug case - there, preempt_disable() is used
> inside the spin loop. But m68k is one of the last CONFIG_PREEMPT_NONE
> archs AFAIR, and preempt_disable() reduces to barrier() on those.

M68k does have experimental preempt support. I have been running
that for the last 5 months. Works fine most of the time, except for
the one BUG[1] that happens every 10 boots or so.

[1] https://lore.kernel.org/all/CAMuHMdUQ72KOPw5vxNfhjoTR-SsaELeKneBmyQPYEW=
a_o5OZZA@mail.gmail.com

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
