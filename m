Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591BC306494
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489657; cv=none; b=KQZEnTogxha6zNNaOpXMNT+zcXv+gGPCldN8xDrvAV9CQteclFw/ox6oYgt+QscCM9jLLKPONzLqps8MZtLENoE5SYrLiKLlDaa7rD4GKcKfINDzvCQUnW3TmSXY60w/DfCL7fpCN685BS31Vk7o8Zs5+mMHwMchl04Zqfp2U/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489657; c=relaxed/simple;
	bh=7JVCTuxNSSrD3gp30fd3z1ICk15oPmTaX7Cu1euHSkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCQxzVklyLUNEK6SetPMqSHLezT9Ofg9aYdfnmgRFlhUdB+wMjWCREQg6vGbwexaPWgd+OXec6PkM77zPcWbhXoi6EBuu4sBdRhC8iaqj7mjhUNCiXWUcd7vBe6VpElWXe+AkwEsGUnuVPrXVimd0iuZrsoNmy5aJG8gaa3KZyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-890190d9f89so3349546241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757489654; x=1758094454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmLXE0lZ84N+xSM1hxrqEkto2TV6tPUT28zoISyt35g=;
        b=C81pMyZqWemeuXupXyBoesJ7eMk7nWpcHne+/ZXYo6VGlcDUgXGCSJvYrw0Psvq059
         uqOQUZyBuuTacwzbt25Ff9sOyc1HuHYuC0dBivoYGLoGSRDBNhWBQHylpXjhuALLI5KS
         2e75OILIsf4+DRGiYlSzDuYa6o4okOBi9aJ20+tJsOSTJMB10KOItqsdiafpYrxqqVaF
         tJ0GEM8ANX1fLJOVfEsgLtEUTm+VpDzCSxLcnyddTE1/up/ZDPUmK64jUJFZw7n39GlZ
         RJeTSRaGK+jRZ+AsJiU4aNMVFy2HQMn0LhzzeYSPsGfF9BMHyKg6fttCFDKG2Q0t0i+j
         2VPw==
X-Forwarded-Encrypted: i=1; AJvYcCV8SasnRjV3MYHI4KNwAW0jph5r/4SDJXf8h/T3GoIDGJFQq3p/+JKn4MSiX8o6LZAnGa4j6h5g0w1t@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxn+wuwmXnM/rtfGDM566vWf7hlQDWBH6YcvY2l826ywtT6RdZe
	1XG9lBMCfzDPwEzar2zxKbLoS6LiT5WPwOanCRjRI7gZwXA5YvrRkuAbcXbhujaD
X-Gm-Gg: ASbGncuSAZnFJjfGn9g8VfYXIlYACNEy2j2Y5CpFD8T0/LgkNgeDJScsHXTNh3FAWhQ
	qSZJM5aJDeUbhxsSgf1FTOAttEES7BVRb7nJ/l7aEzJ98otXFofRaoK5SqFFn/3OP8b8lUiz3rm
	E/ckC0L/eLEwoIQp1pdAM0K0rchObL6HBRmF5cW2qoLnd9501iMP34UOtilaEbdK2Mx/ucNz0yj
	WYr0q4U/xPr1SIdhjELVKnXxxCTRCk5DPq+fxDC6L7h9IzN2LNiWhO5h1YnnlHq7vQobWaLI9vt
	+Sct8C83cUGmgW0/hdYfU8p5hK6TaK0fyE461LmbOfXGPpUhbizOYQ3Z1piVlkj9xOp930KAvYF
	IdJkNFrvlAwNGu5J7um4WIJ9YICH+5Ob5P0vWhgdKxhG5Ov3xJr/a+YtiR8SR5BuKW0G5agY=
X-Google-Smtp-Source: AGHT+IENCtrGUNo9SBBYR+ogs+o9FMjoAWCYopNKgUk+9TtC8rHwlwPynUbUa32YuHPM8th6em6aOQ==
X-Received: by 2002:a05:6102:8025:b0:528:8768:fe7d with SMTP id ada2fe7eead31-53d1d33db9cmr4963382137.15.1757489653956;
        Wed, 10 Sep 2025 00:34:13 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8960ab19f6csm9351691241.8.2025.09.10.00.34.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 00:34:13 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89018ec3597so4026971241.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Sep 2025 00:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIAuoRAheaJgf6u96lmUNSU8ls6tEfMecsIJ1hP//QBqMssM9lhfM3hGpumC7n5x7A9DDGdL7fwF2O@lists.linux-m68k.org
X-Received: by 2002:a67:e7cc:0:b0:51c:77b:2999 with SMTP id
 ada2fe7eead31-53d1aead9a3mr4809500137.2.1757489653635; Wed, 10 Sep 2025
 00:34:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909145243.17119-1-lance.yang@linux.dev> <yqjkjxg25gh4bdtftsdngj5suturft2b4hjbfxwe6hehbg4ctq@6i55py3jaiov>
 <b7db49106e6e7985ea949594f2e43cd53050d839.camel@physik.fu-berlin.de>
In-Reply-To: <b7db49106e6e7985ea949594f2e43cd53050d839.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Sep 2025 09:34:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMw3nUMtXhfhB5mgmsEZNuagna=6ywOuRsRRMFXHYwbA@mail.gmail.com>
X-Gm-Features: AS18NWB-ENOaKkolta8T4p93QhD1mf7fceGRiGIwhtOyM-0RvPLUO80okR5zeVM
Message-ID: <CAMuHMdVMw3nUMtXhfhB5mgmsEZNuagna=6ywOuRsRRMFXHYwbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] hung_task: fix warnings caused by unaligned lock pointers
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
	akpm@linux-foundation.org, amaindex@outlook.com, anna.schumaker@oracle.com, 
	boqun.feng@gmail.com, fthain@linux-m68k.org, ioworker0@gmail.com, 
	joel.granados@kernel.org, jstultz@google.com, leonylgao@tencent.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	longman@redhat.com, mhiramat@kernel.org, mingo@redhat.com, 
	mingzhe.yang@ly.com, oak@helsinkinet.fi, peterz@infradead.org, 
	rostedt@goodmis.org, senozhatsky@chromium.org, tfiga@chromium.org, 
	will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 18:55, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-09-09 at 12:46 -0400, Kent Overstreet wrote:
> > On Tue, Sep 09, 2025 at 10:52:43PM +0800, Lance Yang wrote:
> > > From: Lance Yang <lance.yang@linux.dev>
> > >
> > > The blocker tracking mechanism assumes that lock pointers are at least
> > > 4-byte aligned to use their lower bits for type encoding.
> > >
> > > However, as reported by Eero Tamminen, some architectures like m68k
> > > only guarantee 2-byte alignment of 32-bit values. This breaks the
> > > assumption and causes two related WARN_ON_ONCE checks to trigger.
> >
> > Isn't m68k the only architecture that's weird like this?
>
> Yes, and it does this on Linux only. I have been trying to change it upstream
> though as the official SysV ELF ABI for m68k requires a 4-byte natural alignment [1].

M68k does this on various OSes and ABIs that predate or are not
explicitly compatible with the SysV ELF ABI.

Other architectures like CRIS (1-byte alignment!) are no longer supported
by Linux.

FWIW, doubles (and doublewords) are not naturally aligned in the
SysV ELF ABI for i386, while doubles (no mention of doublewords)
are naturally aligned in the SysV ELF ABI for m68k.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
