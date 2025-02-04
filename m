Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9E217658
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Feb 2025 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697241; cv=none; b=pCKG7lHk3zNHXjInbwZXjoU2gh1SSzZUHdAyYpcRr4jU0TZHAm070qT9vmv2wUWk4EeOF/kyU9U7IqSsjylM2H4ihlqU3G6taEcj7PdnZPqbcnqesYXn+g3SbpNy7Sr0dffZuwUMbERQsYQvRzpCxxvvTFMlJdrl2ep/sFfRgjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697241; c=relaxed/simple;
	bh=zPxLiOkXtzGsjn+GwakusEDM0bh+sGQcblbpxtQvUQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EASqvDoUaWprt+OEM4nMBKm+ZaImynUDoeU0KGNsL4TIwwLuw1Wz2GAyFSHfSCvUdThHounW1mQLJQcZH1z53c9f2CaNyEXOnUvG/a9682A3F94fsnpjhinRPYWq+bz9ZfyVsVlzvLz2rEKvWorhbpZuk9T6E/yjTkyjp8Vm1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51c7b5f3b8bso1822515e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Feb 2025 11:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697237; x=1739302037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zw3b78cuhWs6gaHyyCJx1BQab0LmoernGKdWe4nH8fo=;
        b=GTP6sNAoOvAdkx8ySnnprV9D5SGcoa/hLWLIjCUTcddhuDt006c3ofxkgrDvQPHZ32
         vayBGNlma+hJFonqqQW1egjSJZhaogRmahP7kwFP8rSK9+6fT/nI8HIWRnGSOZSO66lu
         XP0M5EWYln8AkkAo7sm2uZ07THVO7aOOdNWGP89PPViE+MO20hocZQXSRIybCQ1E74ry
         6RvulyQq1OSQk7rdCCo32CMYqhHkSCQMGNHF3/441QeeBPfbQVn8mqPIGlWXkIWM1CaT
         lqe1uBYSKN+KsG0LsxnGVgRIuEUIXhRcnMlriaBhxAW+FcGCnIb9tTdZaESltBxsGHMF
         SdVg==
X-Forwarded-Encrypted: i=1; AJvYcCXZjgi2CISJ7IuLBrBQ402rYZ8lOvrayG5JEaBddWh/VzTZ55mxmzhT7snSGjaXs0Cy2HUgsK3Aa4pf@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwJZkf8+/+vyvpRV7kYz3taqKMvE2WXg3Xgjmf0khX+6h9p1M7J
	0frxDq8IaGc0Bt3HB09aHucnTG02Aqk0LH6pE1Y//XLxZQaO764Absm636Kn
X-Gm-Gg: ASbGncu5ZHw8+wsqD/o0v0rJAnjnVxDGZjXIVo8HSwMiY9evLuEzhQ15v8utilwHQgg
	/wUZjZ/wgOZawVrusvEDNXRBS7R6hjKOqV/P7lSqLLvmiyxTD4arpteL7ZNipFSgzbPpVERY6jk
	8woS3Z7YNpkJxaDpbwYlWFrcqF1V23NKiNNbpR4qyopChkfgCSUFJK8mSdm+QqKAm0foJzJD414
	BWRZfcG5bnpm49pQfHt0dicGgCioQOZsbCoxUvy3rxSuTDOg5CsBhLCEM4/L6u1CMx39nYX6mYg
	+1aaYRhRiilGokDW1id3YZ2PgB7SIvUzqoEisq8DMYPWfyiHVq1/8Q==
X-Google-Smtp-Source: AGHT+IE4qTD/0wWjeG+E+LudsfSQTa3QeQyyeThPrV21CLd11Bkaw6tAIaYiYWYV8PmPZp3PdbIfeA==
X-Received: by 2002:a05:6122:886:b0:518:965c:34a with SMTP id 71dfb90a1353d-51f0c355218mr384974e0c.2.1738697236614;
        Tue, 04 Feb 2025 11:27:16 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c3b2b0sm1572424e0c.22.2025.02.04.11.27.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:27:16 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so1691909137.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 04 Feb 2025 11:27:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhYtn6chNyilUKNDIP2/PTVNMlqVDwGnVIWzbm7pyGNr/757etwmFXA9QoF/nHB/ZIqmpWxU9teUGB@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3306:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4ba478b3694mr307261137.7.1738697235724; Tue, 04 Feb 2025
 11:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
In-Reply-To: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 20:27:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
X-Gm-Features: AWEUYZlQlNmj76XCoOTX0pCM3TvZkeXSJsqQ37Clwjit-zuQeYs4pDamYCinouQ
Message-ID: <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking IMR
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> The ColdFire interrupt controller can generate spurious interrupts if an
> interrupt source is masked in the IMR while the CPU interrupt priority
> mask (SR[I]) is set lower than the interrupt level.
>
> The reference manual states:
>
> To avoid this situation for interrupts sources with levels 1-6, first
> write a higher level interrupt mask to the status register, before
> setting the mask in the IMR or the module=E2=80=99s interrupt mask regist=
er.
> After the mask is set, return the interrupt mask in the status register
> to its previous value.
>
> It can be tested like this:
> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
> - Start a high priority cyclictest:
>     cyclictest --secaligned -m -p 99 -i 2500 -q
> - Start iperf3 -c $COLDFIRE_IP -t 0
>
> After a few seconds the dmesg may display:
> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: 0
> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
> [   84.784719] ->action(): 00000000
> [   84.784770] unexpected IRQ trap at vector 18
>
> With this patch, I never saw it in a few hours testing.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/arch/m68k/coldfire/intc-simr.c
> +++ b/arch/m68k/coldfire/intc-simr.c
> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int irq)
>
>  #endif
>
> +static inline void intc_irq_setlevel(unsigned long level)
> +{
> +       asm volatile ("move.w %0,%%sr"
> +                     : /* no outputs */
> +                     : "d" (0x2000 | ((level) << 8))
> +                     : "memory");
> +}
> +
>  /*
>   *     There maybe one, two or three interrupt control units, each has 6=
4
>   *     interrupts. If there is no second or third unit then MCFINTC1_* o=
r
> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int irq)
>  static void intc_irq_mask(struct irq_data *d)
>  {
>         unsigned int irq =3D d->irq - MCFINT_VECBASE;
> +       unsigned long flags =3D arch_local_save_flags();
>
> +       intc_irq_setlevel(7);

Can't all of the above just be replaced by

    unsigned long flags =3D arch_local_irq_save();

>         if (MCFINTC2_SIMR && (irq > 127))
>                 __raw_writeb(irq - 128, MCFINTC2_SIMR);
>         else if (MCFINTC1_SIMR && (irq > 63))
>                 __raw_writeb(irq - 64, MCFINTC1_SIMR);
>         else
>                 __raw_writeb(irq, MCFINTC0_SIMR);
> +
> +       arch_local_irq_restore(flags);
>  }
>
>  static void intc_irq_unmask(struct irq_data *d)
>

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
