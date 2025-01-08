Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8A8F6B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 14:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345994; cv=none; b=pK+prv6tjuyhLI1sTIhxxELb9FpDS4HVxi3J9NCQa/FX5kH4Kd3apDUcnKHwmHL1FbTFAHcx0aopqEk9UFx4loCI1CdOoBGXXCxPWYbApz7Ft2uKdeDToWx/6HHC2tctDXMMnTaEjl17bQbBJ86y7vlEeHgVHmpYJduLGU1m33c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345994; c=relaxed/simple;
	bh=ez3+HrLfVutu5Mm5304q+PpzenkT3+5qXxkhnae7xTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajMk6/gG46Mu8pf5jco+Q5a5ERJJ+4wf3fri1mue7+pb5d/iQz4BV8tYkczhskZzcWwHoD4/oTXvEAt/+wmt42H9fKg/hSmnbI3GmjRWcRYK57eQVZh308jWi/kMWqob+wLHnKi8PqmX/jogGHkPpWugPcYn3RfG+O3/tme3rHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff5b3845eso6169116137.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 06:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345991; x=1736950791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLqxPrKY1TOV+euKVeE/94FdmePkGlHZLqqcrwE2XJg=;
        b=wqWMeZEyRTaexU0/hCCmxqFV6807l7lyDkdFJ/lRG+yRZhKjhfmmIvQ/MknRn07vlH
         R9DzMSMWp+i9i/ZpXNoDJHGGd19EEMSVIZcyebx3WQENWUekT95HBngCj0sxmMLgL6fd
         SKvIWIUSlCZi9yo6z2hNCMvlmNVMevdunkeX8sXNIZWPNhgzbccT6aWfAz4fXM7vPODl
         aD9lVsUL5OZCKpM9H/X+YSyV+uFJ8CszNRKKFFbtbANpdqznV2U9PgXN9N+L1uGd/FTe
         bn7db48eU+5nvDgwD26xS7/yDYdL8XnpsmWuwpjhjfg6Gk7RoYNfz/aFGZy2Xfja+wJq
         SeiA==
X-Forwarded-Encrypted: i=1; AJvYcCU2yS3EdaFbRVfbAEHT4AIYqBMrzmEuDnfuZDZ/3pXlFFhqpZMtI6/4wF/f/z5WkZauOZ7BFOLsmhfQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy2OUIHfxzKQXCSIUf/8tT4DuPe/b5S0oC4sF7MDQchQPSDDWex
	0oiUKhkXluA3o6VDFj8mhoa07eNs/UTGLPL2FMFRYPs2F8IH0XBqeJTztdeS
X-Gm-Gg: ASbGncsCbM2S7T7C4b6xk+PxZTZYxsL0WUCqx8COGrnO+ajQRASooeQbkvSkJuOD+AC
	br7buuxS8HLh+4nz2WYeQPgwoAZVQUlfPqveoQKVnNc/RSI8vNd21yIKiJn95D6pc4MHh4Y76Df
	ZI68BAGcTrcpPOU4gj+o4SEhshOi53zmXjkClQ36w3vjvKb0uB+fJBwm10A60+lWwZj0hCsOO+Q
	u/wRzrivTG7wvsMYo22nv16mRPXftvbWcerRe4F9QGyBBPc4BXUBmM/bklhq+DhGCRWv9bDiOuf
	MzNULENz2Xi7MwQtjIQ=
X-Google-Smtp-Source: AGHT+IHmNLb5K/xghFUZ/HNhUea7eXuax5SdxliYF/P+EVtHcZkSmDQrQhI53+lY7/kJTY92p+JwbA==
X-Received: by 2002:a05:6102:370f:b0:4b2:5d10:29db with SMTP id ada2fe7eead31-4b3d0f91911mr2054913137.7.1736345991031;
        Wed, 08 Jan 2025 06:19:51 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1f8a8sm8448171241.7.2025.01.08.06.19.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:19:50 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff78a39e1so4853296137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 06:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFouacJ31simljb+3rDnClBIgc/ZZmAhIfba87skS+YYnbc0DvkwqX5lWPa1E7tG2AofZOfoMhPQN2@lists.linux-m68k.org
X-Received: by 2002:a05:6102:548d:b0:4b2:73f7:5adf with SMTP id
 ada2fe7eead31-4b3d0f947f5mr1699824137.9.1736345990519; Wed, 08 Jan 2025
 06:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
 <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
In-Reply-To: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 15:19:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
X-Gm-Features: AbW1kvaeBuWDdo2Mkx6lDOn6aHMKd182W90s65hQ52N3Jihquiz5sh0YRuRezHU
Message-ID: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Jan 5, 2025 at 10:51=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, 3 Jan 2025 at 01:22, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > Perhaps this is an issue with sparse?
>
> No, this is just m68k doing disgusting things that happen to work with
> gcc, because gcc considers casts to be lvalues (which in turn is comes
> from some horrid C++ thing, since in C++ casting is a whole magical
> extra complexity).
>
> IOW, this m68k pattern is horrendous, and sparse quite reasonably
> complains about it:
>
>   #define umul_ppmm(w1, w0, u, v) \
>     __asm__ ("mulu%.l %3,%1:%0"                                          =
 \
>              : "=3Dd" ((USItype)(w0)),                                   =
   \
>                "=3Dd" ((USItype)(w1))                                    =
   \
>              : "%0" ((USItype)(u)),                                      =
 \
>                "dmi" ((USItype)(v)))
>
> notice how it has two register outputs (the "=3Dd"), and the destination
> of said output is not a proper lvalue, but a cast expression.
>
> I think you could just remove the cast. Afaik the w0/w1 arguments come fr=
om
>
> #define __umulsidi3(u, v) \
>   ({DIunion __w;                                                        \
>     umul_ppmm (__w.s.high, __w.s.low, u, v);                            \
>     __w.ll; })
>
> and __w.s.high and __w.s.low are from struct DIstruct, which uses
> "SItype". So all the cast does is to change the signedness of the
> variable, but that has no *meaning* when you assign to it and the
> sizes match.
>
> Alternatively, you could just use the right types explicitly and write
> the umul_ppmm() macro something like
>
> #define umul_ppmm(w1, w0, u, v) do {            \
>         USItype __w0, __w1;                     \
>         __asm__ ("mulu%.l %3,%1:%0"             \
>                 : "=3Dd" (__w0)                   \
>                   "=3Dd" (__w1)                   \
>                 : "%0" ((USItype)(u)),          \
>                   "dmi" ((USItype)(v)));        \
>         w0 =3D __w0; w1 =3D __w1; } while (0)
>
> NOTE! UNTESTED! Treat the above as a "something like this, perhaps".

Thank you, using intermediate variables instead of casts for the output
operands gets rid of the lvalue-related sparse warnings.
That leaves us with the "not addressable" sparse error.  Apparently
that goes away by dropping the cast on the last input operand,
so I will introduce intermediate variables for all input operands, too.

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
