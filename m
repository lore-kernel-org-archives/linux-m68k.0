Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A4319995E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674815; cv=none; b=gndlcjncQIm/Q56N5y38rmNAJ6ubhThZvZUo0rPYFzrLd+mLyzYMk/WrSivdQj9lq+cO5Ow0rSVsd1hB66eZRwe9g7g6NDGcQvzWDYDkftt/eGekI+iyjhX/OC13NL+Ugnf/TZCu6jYFxEk8Bj1NGhlmEbBxhZX5D3+kF5iHlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674815; c=relaxed/simple;
	bh=imUayfZ6FdcexhoYxLlSs1KViSlJqRC9UqM6NkcTej8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo1oOnj2AAxP8mygn+8wFeonEklP7LCYFIlLA+hro/DfjAQ0934svCMhHk9tSnmoZf6raapNA2E5k4nM6AhLGnFd5KzBfp6XBJe18IoPLJm1lIduAZc+HttQtG1D4FXa2RwAe5xYkAFzQ0PqzybRvgCBsIbC8glB9l15/6UY6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e3cdbc25a0so71584117b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 02:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729674812; x=1730279612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+oDcqb1QYvL5id/iCpKgV/nPQYafdkBvaUvh/k83pY=;
        b=diZzvaaSFWhORyi42W39g3v6RGIXlyBLUTy1hfVT1ZSWSS9h3oP2wlZekLmxxM0MUz
         YAZ7V4lkcHAKt5ij72PFPzQnyUooMy+JWV68oTFgmTAW0GDKSnqnLVjIwxzLSWYw4gAv
         9JUQF/h6H512ofr1V0BNUktddO/gPu1LVey1iADKnslvGhrnC5j4X7nBv0I/Rd5P/WEu
         Pr1WgK+LNR+Lgs6P6O9QKI8aXIEWeRh5AFsqcGQ3FoWpeYl2wvkLRMhazTgODJY35DNU
         iT78JgKs0TQyU8dd0rUl3CFPm5kRY3Zj1kfq5PLZ0jtd6vQdz67m6MSBWtlTRK0NszDH
         Flqg==
X-Forwarded-Encrypted: i=1; AJvYcCVN4ju7nrhVQRAcuIikWc/8LGMTlzyIKb5EKs0CN/JjI2auAR2NigJ0FO9wRJafqFCzB55GHfhwE4uN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxQik6tUEOchgyUhW+cz8XwJwsJXA6/CQPh0Jub5CqDHmoxI6Wb
	tUncIZAfW5QY4WCmBe13LBdgRp50/PSHXZXvr7o4jatg6AA+87D83xIAN/N/
X-Google-Smtp-Source: AGHT+IHJZOr4d2p3OJpKQ3K0tb1a1wcuVyxknJPrFHRCs8JH746TWerXaBdLYClxHZZzbG7vCnlthg==
X-Received: by 2002:a05:690c:6d0c:b0:66a:ba89:d671 with SMTP id 00721157ae682-6e7f0fa6ee9mr21596367b3.35.1729674812489;
        Wed, 23 Oct 2024 02:13:32 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm14407487b3.123.2024.10.23.02.13.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:13:31 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e3881042dcso58750977b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Oct 2024 02:13:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlG+s0K5eCL58KlgI1xQ94YehmG7a+btvL3SjStOlJa5yzKLn1ZrDXvSODQLYpu0ZiaSzAKcdHnq/J@lists.linux-m68k.org
X-Received: by 2002:a05:690c:fd5:b0:6e3:4436:56ba with SMTP id
 00721157ae682-6e7f0df6312mr22676227b3.8.1729674811120; Wed, 23 Oct 2024
 02:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-add-m68k-tracing-support-v1-0-0883d704525b@yoseli.org>
 <20241021-add-m68k-tracing-support-v1-1-0883d704525b@yoseli.org>
 <20241022012809.1ef083cd@rorschach.local.home> <075d6720-a690-437c-a10f-e2746651e2a8@yoseli.org>
 <20241022043037.13efb239@rorschach.local.home> <2c79be22-1157-41e4-9f3a-53443112ca9a@yoseli.org>
 <20241023044711.3eb838fe@rorschach.local.home> <262d7758-c752-49f6-87ef-4f75d681a919@yoseli.org>
In-Reply-To: <262d7758-c752-49f6-87ef-4f75d681a919@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 11:13:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKCWnFuyOzQyAWdEV4EhqXYXJFn4vCw5ptZ5=sbOCbxg@mail.gmail.com>
Message-ID: <CAMuHMdXKCWnFuyOzQyAWdEV4EhqXYXJFn4vCw5ptZ5=sbOCbxg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] m68k: Add tracirqs
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Wed, Oct 23, 2024 at 11:07=E2=80=AFAM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> On 23/10/2024 10:47, Steven Rostedt wrote:
> > On Tue, 22 Oct 2024 11:21:34 +0200
> > Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> wrote:
> >> I was not really expecting you to review the m68k one no :-).
> >> I think I have other issues which might have impact on ftrace too.
> >> For instance, when I launch cyclictest I have a warning about HRTIMERS=
:
> >> # cyclictest -p 99
> >> WARN: stat /dev/cpu_dma_latency failed: No such file or directory
> >> WARN: High resolution timers not available
> >> policy: fifo: loadavg: 1.21 0.40 0.14 1/122 245
> >>
> >> T: 0 (  245) P:99 I:1000 C:  11203 Min:     92 Act:  623 Avg:  775 Max=
:
> >>     3516
> >>
> >> The latencies are quite high...
> >
> > Yes, if you don't have high resolution timers, the latency will be high=
.
>
> According to my config, I should have those:
> CONFIG_HIGH_RES_TIMERS=3Dy

Does your hardware have a high resolution timer, and do you have
a driver for it?

$ git grep hrtimer -- arch/m68k/
$

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
