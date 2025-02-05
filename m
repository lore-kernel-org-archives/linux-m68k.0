Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FB22288C8
	for <linux-m68k@lists.linux-m68k.org>; Wed,  5 Feb 2025 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743280; cv=none; b=oCoImYWOnZoNYdy8Iacx1+Fz6S1cfYoH9NuiQWcuJ6Oit9UhK06xogRSeTUGFN3aQLMPwWh9sWLMXSzNwgTWCB5IT5F2sNaYNSnYgsDx52Qua5xIbtzY1uyBsWxykErsOZ+BRtKZztDLqLyeVRqh6+jZs0y/nalgm5Wl/oWNo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743280; c=relaxed/simple;
	bh=NGSjDB1V6WWM4RX6iVKzZt0kwGkRuzRfak+IJV/Kw+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBw3Y1vR6mRTKl+jr2kAWhQYOs+MDga3qQZ+/nWkkgYHspWsnj9EpSRjHfTdX27wI0bFYu0IcFabXQTH1K1DDYOjETeI2mns+D52EDpT5sP5wDorJwE/mX+DrJQHeSEdEgdz4UAAmsTTdtgTz7r7WvUwGPTzJI6/nxiFifmiVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-866e8d4f856so163350241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Feb 2025 00:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738743277; x=1739348077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2mUp798kx9ThWCpflmx6mCStgYPWT6eTK3413XXAoM=;
        b=TODOBTzIiYF6qMF9U1EeYs539gjfxyaUX2fwhx6v7jr4te+wdDAkoNH/3Ze7JWI5zl
         in/XczMrNh0yM9ZgWNANxT2tEH7Nusu6xbWCKvq7cURXS7mi1Qbvexo4CCz5dpRERZ0T
         cblCAtw3EYMMvtDxOx/rLtxAMSjPUGzQdt+91Wt5JfUihIBIOnj61Sj9hI0yg4eHzhXM
         3l0/0SYWo4BYPbTtHl8IHR/sLaKDZnXo3d5cKxDG664hznY871uvU6O7vyaUAYjBYzQa
         lmfKSbSpbIMkc9JenzPyrlDnuQOzYcOhKBV2rlz2UCsa5TD/vX1epMvXPR4GYWWLKx2S
         XfyA==
X-Forwarded-Encrypted: i=1; AJvYcCVecanIPgsCQhfVSa0Mx/u9qf4ioDbcTbJOBaJzeBmYg5azjYByC4A2rHblZHL4Iy2uTjtYTZ88wG36@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywxq7ZihtJ595IZ02mjugAHNY1luLuS3xbHtITqqkpXsdVszIUZ
	ar6rMViGOG0yYxdI5uPd/9rcvnnvGCZrZvXDu2XpTmx9C4uyXFYBXA5QVbH8
X-Gm-Gg: ASbGnctkJ5cW/w2ZZn2CfQ9NN2VSekftPvT+LRz3F0fK35MuhoK1D6m1Y1Mal/Xr/Hd
	45j0ZDYjvFmI0Tap3cyus10v0OeNkoezluXHhN4ok9eSDF9s62+9NO8mY8zeBoH5MACMp5dO92g
	EUu5IGXgva08LkCPJdKFsnPjMAhCGlULyNTsMgUtwK1kTqzUn+WF5PTo3gwfkOE4fbHW2Cf1egm
	kXgXbQtJSIK23qfA3d3kcD1k2ZxIRS0mGER2qBTRklZ3ES+ucEXbGNlZDb05rwWqCutYqTE+4g5
	tv6IjR7runOHh4LQlbsMfGXi9JvU6wBt0KAVCwWS81kw6KVurzGHLQ==
X-Google-Smtp-Source: AGHT+IHBu8wrAkfgMOXOnNDfzWvpcgHWXK3rPk8Q9+AmLkbs6Qpzbqk1Fuxpc9C53Uc18kF572QKjw==
X-Received: by 2002:a05:6102:3f4c:b0:4b2:c391:7d16 with SMTP id ada2fe7eead31-4ba478900c0mr1382798137.7.1738743276792;
        Wed, 05 Feb 2025 00:14:36 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baadae67sm2293174137.15.2025.02.05.00.14.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:14:36 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-866ef456dc3so15971241.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 05 Feb 2025 00:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ22KcFRAP5+Icb+SXdh3o3mJJEuU621lSUtgJXXtUC2XUSDkY/EAfPo4w8APpi1IGCL2K8sgEZBJv@lists.linux-m68k.org
X-Received: by 2002:a05:6102:41a5:b0:4b6:44ff:415a with SMTP id
 ada2fe7eead31-4ba47ab25eemr1270389137.21.1738743276301; Wed, 05 Feb 2025
 00:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
 <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com> <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
In-Reply-To: <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 09:14:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
X-Gm-Features: AWEUYZkMVSFkZSsrSgSBTQGObQzpU1fj9AacZI5GS-30X390deDW9PO1ikBqK5A
Message-ID: <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking IMR
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Wed, 5 Feb 2025 at 08:07, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> On 04/02/2025 20:27, Geert Uytterhoeven wrote:
> > On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
> > <jeanmichel.hautbois@yoseli.org> wrote:
> >> The ColdFire interrupt controller can generate spurious interrupts if =
an
> >> interrupt source is masked in the IMR while the CPU interrupt priority
> >> mask (SR[I]) is set lower than the interrupt level.
> >>
> >> The reference manual states:
> >>
> >> To avoid this situation for interrupts sources with levels 1-6, first
> >> write a higher level interrupt mask to the status register, before
> >> setting the mask in the IMR or the module=E2=80=99s interrupt mask reg=
ister.
> >> After the mask is set, return the interrupt mask in the status registe=
r
> >> to its previous value.
> >>
> >> It can be tested like this:
> >> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
> >> - Start a high priority cyclictest:
> >>      cyclictest --secaligned -m -p 99 -i 2500 -q
> >> - Start iperf3 -c $COLDFIRE_IP -t 0
> >>
> >> After a few seconds the dmesg may display:
> >> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: =
0
> >> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
> >> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
> >> [   84.784719] ->action(): 00000000
> >> [   84.784770] unexpected IRQ trap at vector 18
> >>
> >> With this patch, I never saw it in a few hours testing.
> >>
> >> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/coldfire/intc-simr.c
> >> +++ b/arch/m68k/coldfire/intc-simr.c
> >> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int ir=
q)
> >>
> >>   #endif
> >>
> >> +static inline void intc_irq_setlevel(unsigned long level)
> >> +{
> >> +       asm volatile ("move.w %0,%%sr"
> >> +                     : /* no outputs */
> >> +                     : "d" (0x2000 | ((level) << 8))
> >> +                     : "memory");
> >> +}
> >> +
> >>   /*
> >>    *     There maybe one, two or three interrupt control units, each h=
as 64
> >>    *     interrupts. If there is no second or third unit then MCFINTC1=
_* or
> >> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int i=
rq)
> >>   static void intc_irq_mask(struct irq_data *d)
> >>   {
> >>          unsigned int irq =3D d->irq - MCFINT_VECBASE;
> >> +       unsigned long flags =3D arch_local_save_flags();
> >>
> >> +       intc_irq_setlevel(7);
> >
> > Can't all of the above just be replaced by
> >
> >      unsigned long flags =3D arch_local_irq_save();
>
> The only change is the Supervisor bit in SR which is not changed in
> arch_local_irq_disable() while it is forced to 1 in my function (setting
> it to 0x2700 AFAICT).
>
> But I can confirm I couldn't see the issue with this code, while using
> the existing arch_local_irq_save() it still appears (less frequently
> than without it at all, but still).
>
> Any suggestion :-) ?

There are other differences: your version clears all other bits, incl.
condition codes and master/interrupt state.

Can you save the flags above in a global, and print it in the
unexpected IRQ handler, to see which other bits are set when
it happens?

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
