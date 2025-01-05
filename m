Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A073224
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736113903; cv=none; b=l4vgaHeoNSqRp9e9H/UjYc9kkZthiqRwhR5zyktjn6dDzULEBxtILzas+G5w29E+l1JVOonDe4clWMGWWC6ykXcBmdEozkWhmmCmslXarsM3/PAD0+VlFAyD2bE4LB5E5tpbeloGGagwXOhclUVeUiPMlPPcLeKQRzPg5CCSqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736113903; c=relaxed/simple;
	bh=+Iv4GzdSfyP/K9u9CoJb2eqJJr5fi++CFIMk1H2xTVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlH92FeBdvTc65J9QKKBcGjP3n61vioaBjNG8q/w55i48WAFf1wrJZwC6/AfZE2IZFbXghER0SwZ0qd7hW/hSDrWJ82QsQ2+70vy1sXv4xw4C3ZzvVcEhF/JKoYJH9JdM+skMep0FzFi62yZua6UTolxaC/SxQXJ1eqGw6oMXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gzMzrPZ5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gzMzrPZ5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so20946169a12.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Jan 2025 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736113899; x=1736718699; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rpmRkGX5eC8WQcFjbwo5fM+X4EHi5ZBIwXmu7JGQna8=;
        b=gzMzrPZ5bxvUBSptSsVZjnDQPT65R6/JcWP93bPHvicwH9mI0Zhng20ZWl2bpMYowi
         xxIVYTIRdkBCqqwCBse2E1vcu3Px9poCgzIrtSJP/HhTej6oA8kW4Og/hiXMnkf5MjBD
         rjqYndvlHXpCBYBGgHi2ypDPNa5rOlwmLDaJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736113899; x=1736718699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpmRkGX5eC8WQcFjbwo5fM+X4EHi5ZBIwXmu7JGQna8=;
        b=ZogroBcL8YGGb+uUKm9GkRkWbpurywmYA7lsltYPtRB8wwwN72TGBdMbC3uBgZq4H6
         Cv6z/SFIErKbGdgE45sydND7Iwn0sik+FPQGN7tRgKJ2uaz1ShQ/iw/pChLfAhv3SI/i
         bgYVxS34ATREU1v+ChVmqKbXswxrtZj6agdpzisaxFvOXdcoXwGMQetLwva4RyyXcfAx
         PdG8fmt8q/58VN4XuD2NDYULq4LKSQiY5tb6+grtT4gP6ZKzYKfrCtc/JpMa5ENjiSIh
         1Cg/mbCDsdpr64KpfBrxkAY7JUTey3H3FMMroBk2yZlFD1Fho2CbEcissgaRJgFzxXSz
         yQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtfCIwHgO7GGcS5KnnzYWPjSBEnLHbAdmycdvmHSqx1izbJ3aZugNj+bhjeGwQppkQUeNE2CyUeSay@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz9tbpbuyAyg+dmRCy1uPiai68FSs+DQ7OeVSIlf0FR8VDhPluT
	W/zw8CLJetItczhpQ8eulEpUgO5oy9eS90xHbi68iSrOav14Med8PVelPnI6eTrZ9Usn8g97tRf
	3PZ4=
X-Gm-Gg: ASbGncvktgegn1CwvaBy/NRL4mM6qKVsRdlqd25Xoq6AVFnoP1WxClUs9XKdfZBvFL0
	2y0cGz2bIGn+BSssh4wwLMlDTEWlZsF1Vo8oZMHjcqAF/JtGg8WRWIsh//wOuKBT86roJEitqGs
	CHiulIqVzzpk7YSEDvYHDBx9z/COcXO/h1rnNEWN//LrpCGf63WytNz+OKaqCUlJVF1SQH7tVIY
	vd7vW7fZQ0LYCUeJbgG7bc+ZtEPiUIOgXPyQe0wYzmEIX1xcVeVKJJty2hKYKM5jqPE/Shm6k0V
	k5L++Di7sAPEalAQoWEGKqvoVjn40ZE=
X-Google-Smtp-Source: AGHT+IF6NEo6R4PLY8mjWMJYpbI4GIa0i50BOuJe4BArOuHYMIAnS6w7zofO9RdEExQCdMNqVzcdow==
X-Received: by 2002:a05:6402:510a:b0:5d2:60d9:a2ae with SMTP id 4fb4d7f45d1cf-5d81de19afcmr51400625a12.33.1736113899113;
        Sun, 05 Jan 2025 13:51:39 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ae1sm2171644066b.147.2025.01.05.13.51.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 13:51:38 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee0b309adso1622497566b.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Jan 2025 13:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaHg/V6MIa1AiaXbXXUEhYfZ8pGPmnxWEZc0/sYC1P4lbfafcGGBzmhV+0aFvIUpnPk2OP4EMUKcuJ@lists.linux-m68k.org
X-Received: by 2002:a17:907:728c:b0:aab:9430:40e9 with SMTP id
 a640c23a62f3a-aac2d420441mr4954091566b.32.1736113898164; Sun, 05 Jan 2025
 13:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
In-Reply-To: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Jan 2025 13:51:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
Message-ID: <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jan 2025 at 01:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Perhaps this is an issue with sparse?

No, this is just m68k doing disgusting things that happen to work with
gcc, because gcc considers casts to be lvalues (which in turn is comes
from some horrid C++ thing, since in C++ casting is a whole magical
extra complexity).

IOW, this m68k pattern is horrendous, and sparse quite reasonably
complains about it:

  #define umul_ppmm(w1, w0, u, v) \
    __asm__ ("mulu%.l %3,%1:%0"                                           \
             : "=d" ((USItype)(w0)),                                      \
               "=d" ((USItype)(w1))                                       \
             : "%0" ((USItype)(u)),                                       \
               "dmi" ((USItype)(v)))

notice how it has two register outputs (the "=d"), and the destination
of said output is not a proper lvalue, but a cast expression.

I think you could just remove the cast. Afaik the w0/w1 arguments come from

#define __umulsidi3(u, v) \
  ({DIunion __w;                                                        \
    umul_ppmm (__w.s.high, __w.s.low, u, v);                            \
    __w.ll; })

and __w.s.high and __w.s.low are from struct DIstruct, which uses
"SItype". So all the cast does is to change the signedness of the
variable, but that has no *meaning* when you assign to it and the
sizes match.

Alternatively, you could just use the right types explicitly and write
the umul_ppmm() macro something like

#define umul_ppmm(w1, w0, u, v) do {            \
        USItype __w0, __w1;                     \
        __asm__ ("mulu%.l %3,%1:%0"             \
                : "=d" (__w0)                   \
                  "=d" (__w1)                   \
                : "%0" ((USItype)(u)),          \
                  "dmi" ((USItype)(v)));        \
        w0 = __w0; w1 = __w1; } while (0)

NOTE! UNTESTED! Treat the above as a "something like this, perhaps".

              Linus
