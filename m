Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777823C13F9
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512001; cv=none; b=W0ecjAmg7s1lzbYkBUv+h/IO+ZOGa3ey7pmGtRFr+bgLzYF4mzfuvIh06xU6/4GIJmlwuHPFHJeITdy+2chuzuiT6ifknNKIxYvzjlUIyChwh3UsIOV5ToGLek1GXwqk0ox/3fRkwWKlxHeV0AqudYfxXC5pc/2CQLjZNUyxjYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512001; c=relaxed/simple;
	bh=oNop5lBDeiAxiJltt4clkQ90VfgPeUptu2EMaN8H1Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jd0albFYumgVq7QYLh9X+B2XdEgW1fne8CFmlmNGIfHFsUiHjcHnnCHk0Ee8WTX0wjjTm1sROAaPK0OraTcLBnFzVnoDYVylhY63zGltnPE5HsglhgjabjU/0OUNOKHkMSePeyyz8QcRGuRxJ0thqxXmV9NJQBhAY6HnslCUGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98514b4115eso1505687241.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 05:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790511998; x=1791116798;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rItpLa2n9MiIOqmyRK+ap1Hs0buU9Shrp4pBeop1lGE=;
        b=gP3GS7MxuSR5lbUFo574qHx79oM3/4uUUSxpjK+Nf1rpk6SOxIwe+tFURxKFV40fI/
         HMdahVLtzMUdFF5W6zJSUyYyguYEr8oBEc0IP+Ts5GF1yo2Y3mDmohSWKIr49umdzJbF
         nDQ7sIebfDsGCKJ1yp1RZLoIe64dB4U5PKKXWfsbbFSj/5NdLLIqdhqUixFRv/7RiBVf
         IklLO1noSV6EVMNmDikq9yHfB9+0epVnUuZEbHhjFZo4FfYIs7LRGFD7dWtbCRayJU1F
         3u1gpsGRX0FDoFr9Dwxmkdj/CqmdeB+IxIOrLmgFQB9YMXX+tKL5jru1maCik+OcIsEj
         GVHQ==
X-Gm-Message-State: AFq9FYKGuMWSI0kJDKGtQBlxQB4qsTzRBBdBWBrsrsQn1BPsnu3G0xok
	2froBM9GSMYtPxXQ82qLDDqHwf02KkLolSg7mYbA8vRhwFi4BBjgvdFX5amI1vGP
X-Gm-Gg: AYBFou2dYY072fehXHrSHj46dk2eY9xaD5P7srjHJxJM3FvitSGfzQfzDqqxAww6FZj
	FsmAjF4eGynnfzn5dfeSArpmTIU800+QH/gfQQmmgBKppYcgVOBNxjPB9gFppJIdXXIx/6RQA2Z
	+4KTzE9T7Io9d1KEr7zZm1RokwbMJydG1iQziF7iNolMuBMalvniA5WtdWhVuFcFWUr3Q6xQEJy
	kGOirSFZX722xZ5CyDW+jouUkek9tZ7rFt9CGzt+LdB9MgOySyJALqEzRcPNvRKd84JNIRh8GMG
	95X9YKFXiBt+6hfCFNAaU1yT1ux91WoAJwABSrfzvZy88cl/xqw7XOvj8NZjwOu4RZF+quwB9bB
	pCgUUDiuyJYCtf4wS+oB2zA1xf5ljMD127EinOhDr2cJAtOw7Bau0NoRJCkYHuxl13cO5QJMHx/
	8k1V0/kHHDZQGkgWEifMflBx7bd67wedICpUBGs/GS5V0iOctFixksE/uhjs/nEGHQa9Xm9+fS/
	CPQLaEgOuHLSbm4SVocrjU/hL71CRZrKcsrIg==
X-Received: by 2002:a67:e703:0:b0:7a1:f7c3:3a42 with SMTP id ada2fe7eead31-7af1c17fd4amr4282991137.15.1790511998129;
        Sun, 27 Sep 2026 05:26:38 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1f453bsm2515557241.11.2026.09.27.05.26.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 05:26:37 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b388ead5b1so410504137.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 05:26:37 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:7a0:f7cc:5045 with SMTP id
 ada2fe7eead31-7af1be75fa3mr4441712137.9.1790511996983; Sun, 27 Sep 2026
 05:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev>
In-Reply-To: <20260731094402.741645-3-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 14:26:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
X-Gm-Features: AclHuK-UFiGOvR6vAhEVwRBFXl5YC0sr-Pa_dOlgtOwpSCPiLeaSpNnlvcyuv28
Message-ID: <CAMuHMdXfst6urDAoSKQgbjB0j0vU7c0v=WM-gOe93iBEb0Li=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] m68k/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/serial.h
> +++ b/arch/m68k/include/asm/serial.h
> @@ -7,15 +7,7 @@
>   *
>   */
>
> -
> -/*
> - * This assumes you have a 1.8432 MHz clock for your UART.
> - *
> - * It'd be nice if someone built a serial card with a 24.576 MHz
> - * clock, since the 16550A is capable of handling a top speed of 1.5
> - * megabits/second; but this requires the faster clock.
> - */
> -#define BASE_BAUD ( 1843200 / 16 )
> +#include <asm-generic/serial.h>
>
>  /* Standard COM flags (except for COM4, because of the 8514 problem) */
>  #ifdef CONFIG_SERIAL_8250_DETECT_IRQ

It would be good if this BASE_BAUD 8250-ism could be removed from
drivers/tty/serial/earlycon.c.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
