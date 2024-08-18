Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCC51CA84
	for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Aug 2024 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723979314; cv=none; b=jV3tovmnhydfieKRezjQVcarjVIPtt40r1eudC354elTCwPb1mzQ2wFkbRgQ2oNl+7iAUhOJtXKuIgYrAGOezvz4Y8cr3KWoDMmTsA/Mht9HDWfZWCTmBeKD+Xsw6bx0LooNLmTFAuh/98pEHFnZ98Db39unQW831M62prWqZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723979314; c=relaxed/simple;
	bh=Vk7FsvELc0bmhWbFnVgZpeh0BC2wwY6ZVQbR0gwu45g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESOOsIvhWz6r6McS7q704y11tg4B9wdNbhn5+amRmuRhYvG0u0IvSmYc666pcnzO0RsZw7jxHgRo/rvz2d70XOROoGEkz03lFa2mgiydrDkb5JGfF1EbVJNc+3t6Eapq0yBwUeVvO9gnZrq4jE0BEQYslnk16/dXHb+Cc++2tGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e026a2238d8so3445214276.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Aug 2024 04:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723979310; x=1724584110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LMS5uQbz0tMfNGBhJ57pvNdfv3GrBQOuF18D6qiaXE=;
        b=nYriyYeQ5DAB37FJQ4dc+45+83CXt/eGUeJGncZtFRPowfYEvn7YrJjvpeSjL9SF/l
         8J8NmAhcOjbXONw1QKbK1+KgE5B5/R6yDQlx8c1dSBNzkAoUG/qVAH7+r0TNVGrIkXdv
         9owV+vLe3gfVde2pBkeXCJD+9CwYlLdPdpC2UY3OxzXbErISDU9OIG5dYSSJyInO3Ny6
         ryFfSmPTY3y/zPz8uVu9OM41qAk4RanN/qSRRAafOmUv1Zk8WnHYLJSuhjEE0WtMP9bO
         UI8aB2J0Oq6pZ5UPOfvYMGNvukIZ8l9LaJGWGm8fhiRm4dglUdbH0rzrJMKwQ0VFA1Y7
         CptA==
X-Forwarded-Encrypted: i=1; AJvYcCUZOXpPCPeFZCvIHSgBfpxQuNP97/FrPYosge7DmIcPzsn+av+jyoql1ch7/LPSPtUCgp3fjpdGje9A+u77Y/fzqg3d5JD7e6d2ZH93IV5+
X-Gm-Message-State: AOJu0YyC3dpevOjGcdJFd2ebnA9mTX2ie3Om3L/FcCDujpr/Eg7RmqsP
	ZOMMNnYZC1bfuNMTL6N7zNTGaLJoqh+nte4wolVRKbfup50v1QOck7fKf8tp
X-Google-Smtp-Source: AGHT+IHFBo/gsTJq/mUFEuUUzIwZLSfFO+kMz1jg6gg1wvxOo8sMGNgZo2+h/ujlDN2hTPx9Llyidw==
X-Received: by 2002:a05:6902:2b13:b0:e0b:db06:18cc with SMTP id 3f1490d57ef6-e1180e84fe2mr9605403276.12.1723979309953;
        Sun, 18 Aug 2024 04:08:29 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e13ca5b894bsm953242276.21.2024.08.18.04.08.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 04:08:29 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso3501739276.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Aug 2024 04:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfj3F+s+GnW9jTOSvoxCATb26Dyx+t7H84ApsmyhJThvZ9H8W3fBEySiRBuMa1YRqI28pJVyB8qpcAh8IkusQdloxrAcNzlJUWk7cFquvf
X-Received: by 2002:a05:690c:288c:b0:665:b351:25e7 with SMTP id
 00721157ae682-6b1ba7e6036mr70081327b3.14.1723979308616; Sun, 18 Aug 2024
 04:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240803140115.3305547-1-arnd@kernel.org>
In-Reply-To: <20240803140115.3305547-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Aug 2024 13:08:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC-FUSA5C9aNrvP3=RaRWrchhUEC5UYcSGMz_ep1PEhg@mail.gmail.com>
Message-ID: <CAMuHMdVC-FUSA5C9aNrvP3=RaRWrchhUEC5UYcSGMz_ep1PEhg@mail.gmail.com>
Subject: Re: [PATCH] m68k: move sun3 into a top-level platform option
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Sat, Aug 3, 2024 at 4:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> It is possible to select an m68k MMU build but not actually
> enable any of the three MMU options, which then results in a
> build failure:
>
>  arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undeclare=
d here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
>
> Change the Kconfig selection to ensure that exactly one of the
> three options is always enabled whenever an MMU-enabled kernel
> is built, but moving CONFIG_SUN3 into a top-level option next
> to M68KCLASSIC and COLDFIRE.
>
> All defconfig files should keep working without changes,
> but alldefconfig now builds support for the classic MMU.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408032138.P7sBvIns-lkp@i=
ntel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I saw another copy of the bug report today.
>
> Geert, any opinions on this approach? I posted this before but
> it looks like you missed it.

I was still thinking about it, and then holidays kicked in...

> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -32,13 +32,23 @@ config COLDFIRE
>         select HAVE_LEGACY_CLK
>         select HAVE_PAGE_SIZE_8KB if !MMU
>
> -endchoice
> +config SUN3
> +       bool "Sun3 support"
> +       depends on MMU
> +       select HAVE_ARCH_PFN_VALID
> +       select LEGACY_TIMER_TICK
> +       select NO_DMA
> +       select M68020
> +       help
> +         This option enables support for the Sun 3 series of workstation=
s
> +         (3/50, 3/60, 3/1xx, 3/2xx systems). These use a classic 68020 C=
PU
> +         but the custom memory management unit makes them incompatible w=
ith
> +         all other classic m68k machines, including Sun 3x.

Yes, it's a good idea to factor out at the top level machines that
need special handling.

However, the name of the choice now sounds a bit odd. Perhaps it should
be changed to "CPU/machine family support"?
Likewise for M68KCLASSIC.

>
> -if M68KCLASSIC
> +endchoice
>
>  config M68000
> -       def_bool y
> -       depends on !MMU
> +       def_bool M68KCLASSIC && !MMU

I think this is unrelated, and should be spun-off into a separate patch
to fix the "no CPU type selected" issue?

>         select CPU_HAS_NO_BITFIELDS
>         select CPU_HAS_NO_CAS
>         select CPU_HAS_NO_MULDIV64
> @@ -56,7 +66,8 @@ config M68000
>           a paging MMU.
>
>  config M68020
> -       bool "68020 support"
> +       bool "68020 support" if M68KCLASSIC
> +       default !(M68030 || M68040 || M68060)

Part of the "no CPU type selected" fix?

>         depends on MMU
>         select FPU
>         select CPU_HAS_ADDRESS_SPACES

You also need:

    config M68KFPU_EMU
            bool "Math emulation support"
   -        depends on M68KCLASSIC && FPU
   +        depends on (M68KCLASSIC || SUN3) && FPU

> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -5,16 +5,8 @@
>
>  extra-y                        +=3D vmlinux.lds
>
> -obj-$(CONFIG_AMIGA)    :=3D head.o
> -obj-$(CONFIG_ATARI)    :=3D head.o
> -obj-$(CONFIG_MAC)      :=3D head.o
> -obj-$(CONFIG_APOLLO)   :=3D head.o
> -obj-$(CONFIG_VME)      :=3D head.o
> -obj-$(CONFIG_HP300)    :=3D head.o
> -obj-$(CONFIG_Q40)      :=3D head.o
> -obj-$(CONFIG_SUN3X)    :=3D head.o
> -obj-$(CONFIG_VIRT)     :=3D head.o
> -obj-$(CONFIG_SUN3)     :=3D sun3-head.o
> +obj-$(CONFIG_M68KCLASSIC)      :=3D head.o
> +obj-$(CONFIG_SUN3)             :=3D sun3-head.o

Nice cleanup ;-)

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
