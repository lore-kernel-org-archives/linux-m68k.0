Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7303C2F
	for <linux-m68k@vger.kernel.org>; Thu,  5 Jun 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107810; cv=none; b=NUhWQhQQSLqfnApWeGW7UEajO5RJ5T5f3BlrCkV0cpZPLO8dcf0MIE+TmSrgtBipk2kEr4NIN2SKjZkIv7kBNALmWhrZFQmX3X7QP5gG6WG4Rz28x+KCgP+YfZ3mDfKVwKhPj6SParSCRHsQLvJVVlZAWyhgy1+4KbhAvLIDOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107810; c=relaxed/simple;
	bh=xh8jtc/LjY6zOq5bQ3zapTuZmFNfx7OiHnxAyjx5mro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOgtjkCGoFPAwqnYA10LRuJEgICmxXsQvWE3Hmm/ujlzu/6ZPv/ykwp8yhKQhjAE8NPVcGSgGBi3+QVWGozhRIzzjCFEQ/w6RzUGd/yjE+Zs+u85GXE14sy2D+H4LQZq4XRfRHfQuxX6A1oFYk4Y+rp8gguJYwIbKtX1Ta6oEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87eaaf1f587so592145241.0
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jun 2025 00:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107805; x=1749712605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbZAjYotqpIpV76DK/hCxDRe5QXnXeW0h2EV1ixyqX8=;
        b=Ac0CIRgaq7+PV3Vu1N1iDXRlRlG7L1IaQBzH6FERZHM6q233aZwBupz17008mKNSUb
         hkLwtWkDSs6wynNDGB6KHM58U5W/H34QI6KKjQbtNFdRYWf+CBARbRkkUaHDfQLG4qeZ
         vw1IwNSVos6mQaflDaCieTKq1HnLXXdafR46RfkdkjuUJfjtMHmFPM5SIx3fcnuFQAsj
         rXf3otUlRxs+y1Iayy6Ouwayt+drRq6GAR2XftjQpnjbABjpD3K7ePoWmrr799lamU+q
         UkquAdEuVWsaN8X9cx2tFVCtFsy1whohRIYgTEMdiL3I2xROBFkwaSJcrVfOweCTCT/e
         x0bg==
X-Forwarded-Encrypted: i=1; AJvYcCU3dO/PtJ9HHp1J8mYdOLbbw4xh8U7KpUhtx3cbyTVg/ydrOO91lCmaiISOj2vs4FV+nyjfBqyIyDrE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4JLLQ0BtpgUwoKgoJ7cg77/G+5gCIQ3w962psILwn1iw5xYV
	AMF5YNpOMEtnvxYa63FBzCo6L7yhwqY1ont3C1GHGh7RzAqCEqTV9st/N+9Q3QIN
X-Gm-Gg: ASbGnct/QLPJXjE553Unglia3A6xj20W/Zl7HZenLAVYyVVNGnpJ/+jvsWXwfhkD8iG
	fJp20pmVt5ATJkzk4eMfZrvoBi6TwVPfHQPXnmm7HNclh/nVzi8LY1M+4ZzoCigd/9ryKDWcl/9
	I1aXKYx3ltvoZ40eATbWClVtkyCyLUCa38ud0wpQIteRmfiY6wiIFMLdrY+exX5GPaRA3Gw1L+3
	ayHwx72I9JJk/rvyabBgfQRpw3Oo5974Y2Nejw6CnfHApuLKmK0LKkZt9wCDePg7hSZTPvoC/Xf
	rUg3Mo56kJHyMwatzUcOAihsqtV3sOz2QF/4vjrlnMHf8pbS4sXbl9xKjLqG0EIlY/M9BHxOksl
	g20bjXIWsYr62wNT1V+vbBApn
X-Google-Smtp-Source: AGHT+IGfkgvS8tK2VIWVCeFQlfyz0wREOrV23JiirlsrZ2jesVEm5WyZeJkzDnO4fyTcJzc6Nr25cw==
X-Received: by 2002:a05:6102:5086:b0:4de:ed21:480a with SMTP id ada2fe7eead31-4e746f84096mr4530402137.25.1749107805006;
        Thu, 05 Jun 2025 00:16:45 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87ea70e5ac1sm1796649241.17.2025.06.05.00.16.44
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:16:44 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e59012c7eeso422413137.1
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jun 2025 00:16:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZec6bWkhOn4Z7O6Q1xxgdD6UTwUe5BizjExTeGMp1iDUfbQqKwy2VTCszGVt/pRD93nXTdVeJB8Jd@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:4dd:b192:960f with SMTP id
 ada2fe7eead31-4e746e18d59mr4237263137.13.1749107804453; Thu, 05 Jun 2025
 00:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
In-Reply-To: <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 09:16:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
X-Gm-Features: AX0GCFt-e6g6hzVqgEhFkXq6eRX_zV4YL_5NdQWU_gzUO8jPAOP10_ZhJpuKqsw
Message-ID: <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Thu, 5 Jun 2025 at 08:56, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2025-06-05 at 08:50 +0200, Jean-Michel Hautbois wrote:
> > I had to change three offsets:
> > diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> > index e628b859ef21..5b8ef98565c2 100644
> > --- a/arch/m68k/kernel/signal.c
> > +++ b/arch/m68k/kernel/signal.c
> > @@ -618,11 +618,11 @@ static inline void siginfo_build_tests(void)
> >          BUILD_BUG_ON(offsetof(siginfo_t, si_addr_lsb) != 0x10);
> >
> >          /* _sigfault._addr_bnd */
> > -       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x12);
> > -       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) != 0x16);
> > +       BUILD_BUG_ON(offsetof(siginfo_t, si_lower) != 0x14);
> > +       BUILD_BUG_ON(offsetof(siginfo_t, si_upper) != 0x18);
> >
> >          /* _sigfault._addr_pkey */
> > -       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) != 0x12);
> > +       BUILD_BUG_ON(offsetof(siginfo_t, si_pkey) != 0x14);
> >
> >          /* _sigfault._perf */
> >          BUILD_BUG_ON(offsetof(siginfo_t, si_perf_data) != 0x10);
>
> OK, great. This is valuable information.
>
> > The kernel is booting, so, I suppose it is working :-).
> > Now, I can't send a patch fixing the offsets like that, as it depends on
> > the BIGGEST_ALIGNMENT value...
>
> Yes, please send a patch. I don't expect it to be accepted immediately, but
> it will help us spur a discussion on the necessary changes in the kernel.

It will be NAKed, because it would break the ABI.

Thank you for providing solid evidence that changing the default
alignment in the compiler will break the ABI, and is thus unacceptable.
(I wanted to test-compile all uapi headers to find differences, but
ran into many headers not being self-contained, or causing conflicts).

Feel free to start arch/m68k32/ to work around this ;-)

BTW, looking into the history of __ADDR_BND_PKEY_PAD() (which is
overkill on m68k, as __alignof__(void *) = 2, but might still be useful
for anyone wanting to revive CRIS support ;-), I ran into Andreas'
explanation why the minimal alignment is still 2 bytes:
https://lore.kernel.org/all/87y3i442w1.fsf@linux-m68k.org/.
(TL;DR: SunOS started on 68000).

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
