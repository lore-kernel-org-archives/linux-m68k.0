Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCC71FE46F
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736353438; cv=none; b=ML1Yow+nJFCVqVjK83e4hlqVEtrF2kB9SuE848+lK6wDGv2YFWtr6se1uG/6aQHx07Oip4OAfuNaquxbHfIsUXlOWnsxMJczyB6JOVOdG9yZnOh3Za3f+p4JK8i71LdYD7ajuVBdFxL6VHg8kMx92qyRhFTuf6aGMvuPtLYeU2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736353438; c=relaxed/simple;
	bh=6CJG+MljdJ4odyTsRX1HY7g1SI8IaFyVX5WxqVxooCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUGe//0HuTMBFdY4mV7pWsUqGxHUOEt9DiBuulOAkkzOkg5vhNlaPQsbkcL7sEalv+dO2l2yzaYad1rj7DXFrPLAemy61OxQgh72V/scdFFSYV+aZjGn5IG/SeRXTLmBU7S8PC0fhXUD7OG24hOu292tEdqaJjcbLlFX05yVO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85c559ed230so3099493241.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 08:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736353435; x=1736958235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWaN/8ptyC2cYFUazZR9DiU44cT/Ebl32OM7k/AY7UI=;
        b=RwhyINPvJ2G7NRBdycdAshC9ZlCJYGNj0CY0MrPgIVT0bWYa5WpFASJPfMOSD6wr/6
         EzWapuawF0LRg+zVjoNuw/RvtZ0o3zopNCIx/SHz8NbuRNG6vf3QUbap3auFp3l6PfqK
         FYQH14WoI6FKdl9GhcegYjN6Pj7B/GwKems38VajDDgLrCxyGN9aYW7QFZt24VhQ3pxk
         UMGmr0rW5YsR1xvxI9Zk2j8dDU8U12JAjkeUKH4dYZxpyLJpiS6mWE5quz5HaJ8Rq0CF
         xIOrqzklDfqMIGq3uiQPJK3cXfRpC3oIvBlF9g5AU8ijufBBD7q3Gf+ssLMSZWbVSLu5
         DYsQ==
X-Gm-Message-State: AOJu0Yw6Tx/7x73gwmfIICnGW0VmIWr+72e0Q1T0qEsU5EtwYPXVDf7D
	f+N+w22TJEIM99ePsDfLmctINwP20Ss7ODtqJQqO1+N4l24vUUmuOUYGAwN4
X-Gm-Gg: ASbGnctZ1fhpoTVBu3cz6eFC4bWDKKUJZLyHBOE0hPE/r/XAt4HZAeImC+26TgbWmKk
	g22/N/zaKkMVOWyMVtfLi3KAcFibGmqfpocbDtmem3oSloOjt9XjfyADRsFn4XoJy6571RRS5J5
	hFxf+jdomBJD+dstuCHdAXGnPEtJp1vycNlBRNLBuARLX8IzsouroLTzL57gNem/PRKCXx55jA1
	u46A/OISE84Yx1YHNbFAJuWGFx31uRnmsJnY07NWxS6LZuIMBOYcrnb8xcR01wFDawUlrcAHN3H
	wrJJ5BaozRiSDsmedJA=
X-Google-Smtp-Source: AGHT+IEBcz9sqiEfIQmXnoCvdlKR2rl0NN+qdQ8Mz08BknTD9jOQvOVa9zhZXgNYpEsS4caqXjAj9A==
X-Received: by 2002:a05:6102:1629:b0:4b1:130f:9fbb with SMTP id ada2fe7eead31-4b3d106f647mr2897813137.26.1736353433920;
        Wed, 08 Jan 2025 08:23:53 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98d1c9sm8468885137.4.2025.01.08.08.23.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:23:53 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afe7429d37so701137.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 08:23:53 -0800 (PST)
X-Received: by 2002:a05:6102:26d4:b0:4b2:5d63:ff72 with SMTP id
 ada2fe7eead31-4b3d0fc1ca8mr2837377137.13.1736353432987; Wed, 08 Jan 2025
 08:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107095912.130530-1-tzimmermann@suse.de>
In-Reply-To: <20250107095912.130530-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 17:23:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKNq2PAef0tF_AJv7zgmXQpPgYs5Rwokjo=1M+2n2EBQ@mail.gmail.com>
X-Gm-Features: AbW1kvZp0cV5Of05CmFxR0NTT0IyghMVuM7nBAA7tF5qwUX0JfhnOOwbtasx9h8
Message-ID: <CAMuHMdXKNq2PAef0tF_AJv7zgmXQpPgYs5Rwokjo=1M+2n2EBQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix VGA I/O defines
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, Jan 7, 2025 at 10:59=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Including m86k's <asm/raw_io.h> in vga.h on nommu platforms results
> in conflicting defines with io_no.h for various I/O macros from the
> __raw_read and __raw_write families. An example error is
>
>    In file included from arch/m68k/include/asm/vga.h:12,
>                  from include/video/vga.h:22,
>                  from include/linux/vgaarb.h:34,
>                  from drivers/video/aperture.c:12:
> >> arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
>       39 | #define __raw_readb in_8
>          |
>    In file included from arch/m68k/include/asm/io.h:6,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:17,
>                     from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                     from include/linux/hardirq.h:11,
>                     from include/linux/interrupt.h:11,
>                     from include/linux/trace_recursion.h:5,
>                     from include/linux/ftrace.h:10,
>                     from include/linux/kprobes.h:28,
>                     from include/linux/kgdb.h:19,
>                     from include/linux/fb.h:6,
>                     from drivers/video/aperture.c:5:
>    arch/m68k/include/asm/io_no.h:16: note: this is the location of the pr=
evious definition
>       16 | #define __raw_readb(addr) \
>          |
>
> Include <asm/io.h>, which avoid raw_io.h on nommu platforms. Also change
> the defined values of some of the read/write symbols in vga.h to
> __raw_read/__raw_write as the raw_in/raw_out symbols are not generally
> available.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.DNEswlm8-lkp@i=
ntel.com/
> Fixes: 5c3f968712ce ("m68k/video: Create <asm/vga.h>")
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Helge Deller <deller@gmx.de>
> Cc: <stable@vger.kernel.org> # v3.5+

Thanks for your patch!

> --- a/arch/m68k/include/asm/vga.h
> +++ b/arch/m68k/include/asm/vga.h
> @@ -9,7 +9,7 @@
>   */
>  #ifndef CONFIG_PCI
>
> -#include <asm/raw_io.h>
> +#include <asm/io.h>

It definitely makes sense to include <asm/io.h> instead of
<asm/raw_io.h> in this file.

>  #include <asm/kmap.h>
>
>  /*
> @@ -29,9 +29,9 @@
>  #define inw_p(port)            0
>  #define outb_p(port, val)      do { } while (0)
>  #define outw(port, val)                do { } while (0)
> -#define readb                  raw_inb
> -#define writeb                 raw_outb
> -#define writew                 raw_outw
> +#define readb                  __raw_readb
> +#define writeb                 __raw_writeb
> +#define writew                 __raw_writew

OK

>
>  #endif /* CONFIG_PCI */
>  #endif /* _ASM_M68K_VGA_H */

I gave it a try on various configs, and inspected the impact
(none, except for killing the warnings), so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.14.

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
