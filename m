Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DE4F88A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275271; cv=none; b=oFdXfX8KI4MML3nFO1ybKmAFby/SHVyvtuvrngmO8hFgnpLjTdwrC/az8kUh8VrSPhpJo4Xk9mZw7qwCDdPJbm8GxdgxF8LSbD+XY9UxjVsC0NvTXbpBs8j4tRl5QoK8GRbqnxm6yL8uXGNQUsDlcU3hNYbEhS08y/0keHMwQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275271; c=relaxed/simple;
	bh=kgKByH8HcI/vjOHCBvcBMpT6oM2/S477ZU3zDFQGI6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDg0rjkQcT32SbNAsjGD+cjTtSfw6NR0WVZOrPrbUgtaFonx58+VD+6vJrImZF94/sKHbeAMk/57A7vIfBEs6Ghugb1yMW80KQHVVCX4YtQwNMbnOa+5SbMNZ1N+oF9KUgZ5AaRSiNPqqG6e1jkBwDhYLobTGU29yscC06zdowk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61df903aa05so35437687b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 00:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716275268; x=1716880068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK2IDY67gx/4YR+nrYB4LGClsl1mnE6hVJW4CORUsds=;
        b=wACDmrYP1XvaUUaux2VIqabTm1otnKr2sfVkQJYau4MNp0loZqCg/YzJJEcG/PfYaQ
         dAHAV+GazVNdk3BSFumi3KaqzZ40zoEFzMhA9AD+pEbRbuCNpJRn8Yf9pMa46TUpfoJS
         ML+TxJQW4otltyF+BQbzrxomat3M23vmu9TlkD41ILpp6S0RITyk4+gTewjwhXriCekk
         zdMWCzjk1fdh2Dj+hJ2XE+Sre1lNx/jV1Yc/es1Or27GXCT4jtPghWN7D6JFu1ghD9d7
         okqOyFShoXXtOTvdjchcxVLyQrsUVpn9H6UMX0TFiwgFsz7vvJMHC13vBL3sXBp75/na
         ayyg==
X-Forwarded-Encrypted: i=1; AJvYcCWmC3idmfm+6pUPPPvbMqUs5Ehex9TDNUD6S/niD+7wS+mE9itCvUKyFlJCYuCRJ4EFwTnOTZOkyH73aH8oOCQpwkkyaDsMZ+HPphEpH6E/
X-Gm-Message-State: AOJu0Yze4jxo4OZBsOPuoic9h7alZenrbeIFPx7dPmo1IZGMTzbPXA1k
	AXNeKYpF38nX1JTcnrXqPyi5N3V1HM5C3/c4808fmeX0lM8+kTGmG9FDZ6Lt
X-Google-Smtp-Source: AGHT+IHJ1Ms+y+GvDivTSuVDlAX2IrTxsfvgrsqAd8mjHHTl0+jnfOTPsKpcZn3zR9lJxT2hOeF2tg==
X-Received: by 2002:a81:a116:0:b0:61a:e2f8:f7ca with SMTP id 00721157ae682-622aff9a6cdmr420917857b3.21.1716275267477;
        Tue, 21 May 2024 00:07:47 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e347613sm52817457b3.98.2024.05.21.00.07.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 00:07:46 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6209e8a0386so26961537b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 May 2024 00:07:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxV+OeUkyi/V2CXsJa94dcsER74UBWvgP/1gbndTRIStPwXpai7TxjEhJ6Scj3sz7pCe1YoQslFOGF7me7CnX0stQWqX/M86Gn27sdxTuC
X-Received: by 2002:a0d:d708:0:b0:627:74ee:931b with SMTP id
 00721157ae682-62774ee9846mr194660357b3.6.1716275266369; Tue, 21 May 2024
 00:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZkjwzVwYeQtyAPrL@amaterasu.local> <CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
 <ZkuFrTQDw6iM9Z7K@amaterasu.local> <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
In-Reply-To: <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 May 2024 09:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>
Message-ID: <CAMuHMdXAovcF8rhAeWjDVqQsnQPzMaBmNrQ+bQHe=35hcznTEA@mail.gmail.com>
Subject: Re: Amiga, serial and SYSRQ
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, May 20, 2024 at 11:01=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.=
com> wrote:
> On 21/05/24 05:17, Paolo Pisati wrote:
> > On Sun, May 19, 2024 at 04:58:17PM +0200, Geert Uytterhoeven wrote:
> >> Probably some of the Warp 1260 on-board hardware has its interrupt lin=
e
> >> asserted, causing an interrupt storm when Linux enables interrupts.
> >> Amiboot knows how to reset several boards to prevent this, but it
> >> doesn't support Warp 1260 yet.
> >>
> >> https://github.com/geertu/m68kboot/blob/master/common/amiga/linuxboot.=
c#L195
> > Doesn't the kernel print out something like "too many spurious interrup=
ts etcetc" in
> > this case?
> Used to do that, yes. But I haven't found that message in current mainlin=
e.
> >
> > Anyhow, any debug option i could turn on? I've tried everything IRQ rel=
ated, but
>
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT should be high enough to print messages
> of level WARN:
>
> asmlinkage void handle_badint(struct pt_regs *regs)
> {
>          atomic_inc(&irq_err_count);
>          pr_warn("unexpected interrupt from %u\n", regs->vector);
> }
>
> That would help to verify Geert's reading of the problem (which I have
> no doubt is the correct one).
>
> The interrupt vector number will tell us what interrupt level is causing
> the storm (if it's an autovector int).

If it's _not_ an autovector int?

Anyway, unlike Atari, Amiga only uses autovector interrupts, and most
expansion boards use IRQ_AMIGA_PORTS (IRQ_AUTO_2) (some can be jumpered
for IRQ_AMIGA_EXTER (IRQ_AUTO_6).  As lots of other components use
IRQ_AUTO_2, these are all shared interrupts.  Hence handle_badint()
is never called, the "bad" interrupt is never disabled by the irq core
code, and you end up with an eternal interrupt storm.

> > that didn't change a bit. I understand it requires a new fw from the bo=
ard
> > manufacturer or a quirk in the bootloader, but i would like to get some=
thing more
> > verbose before i ping them.
>
> Interrupt level and vector number would help the manufacturer to give us
> the information required to disable the problematic interrupt source.

IRQ_AMIGA_PORTS :-)

I guess the system would boot if you hack arch/m68k/amiga/amiints.c
to never enable IRQ_AMIGA_PORTS in amiga_custom.intena, but then you
would also lose the ability to use e.g. the builtin A1200 IDE.

BTW, code to reset/silence the hardware components on Warp 1260
could not only be added to Amiboot, but also to e.g.
arch/m68k/amiga/config.c:amiga_parse_bootinfo().
Reverse-engineering the AmigaOS interrupt handlers for the board may
also help.

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
