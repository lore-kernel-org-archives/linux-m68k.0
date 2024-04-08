Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02EE381B9
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Apr 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564407; cv=none; b=p0ELTR8NZWlmJQe7MEJ49bOs7SuVdzjMZqEnQ/UbUwPe05Gl6gMcq4GM0Ke4lnAUdX3+bFErAN7Kg9rV7EyQyC3icI70jvpA80Q2HSYu3eFyUd/Rj1c/M3yewb5xbyB3ogGNmw0gnlZTwOgkPn53+72d5pxljUWNWqnOxjDvj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564407; c=relaxed/simple;
	bh=FECalRfsPYMgUnHnR9uK33bW2Ie9uw1bxEOLdNNFhTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwteC9HUO/7sKxPhhlqZz34WlaFfmLSzdlku9xeoUsxTwyiPWKZ6STQbtpQ/VsSwG91Sm+px5icLrQ7/CvKN3yQcUTijLIC7/E9by/2PgnHaakpu+zwXQ7M8XpJTuqLLARHrusO966XtBFaByvzan6bLO1SEaqaz9VKRM/Lcb4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6114c9b4d83so33608477b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564403; x=1713169203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DVx4gd97DdgVJM34xzjKUIJDxKQktsSHSSvIhLo0M4=;
        b=UoegIGC6rOENhRgeTu5+M57z2+lHW/CNEBB6E2wDA5UfQuV3fzD9BP5Z81Yykn3OuV
         kyGveHnRC5Es1fV66w50s2VVYKBmr3+Q3OQoQzwTGq17RWLPk4BWRcnVWi78cGxAHXl+
         oruo0kGhdUfcedRYB+dP36otKLHY9YpaqSvWEv8tWcC82iYDWzPbme9uve03C3MAsUq4
         Za8rl88Mehr2sdOZpAIwtDG70g8HrUFRE/pCrMJKHR89hiOLEYZ7N+yKqqJjE7Md7ImM
         V3fSF9n3WKkDuxfJdCTJCPEY5Y7l90VA8O47nHonnjaE0gff9J567As7tNX3wGXhgIVB
         vsDw==
X-Forwarded-Encrypted: i=1; AJvYcCV1w5SZ9a+1k8ad+1fzA0k4XxVR35JhV9bKk5zdyfFPJ0rdieWCW7L/B6X8viPRTJU5GA+EDz2GV58ryrDxrVoFJHQ9TMBpwcYLEtrf8NjF
X-Gm-Message-State: AOJu0YyhxyBfUGAB6O15SkpTlwk+csnGCVazAtMtQt4alNfj2/Rn8PhN
	In+pNVZDJoKPCltBuR/3ANyC/vhkx3ylnUAmY1vQvLu7g4DnLFujUiq8h801r28=
X-Google-Smtp-Source: AGHT+IFKxVcYD8UwSOqFGoIjauj4w/dexFtfcmndSxZLoHi5VP6I1ceKuxKKIK2mAh99tTSiwi1xaw==
X-Received: by 2002:a0d:e855:0:b0:615:35e1:e512 with SMTP id r82-20020a0de855000000b0061535e1e512mr6033950ywe.0.1712564402988;
        Mon, 08 Apr 2024 01:20:02 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id l2-20020a81d542000000b006152af6131dsm623893ywj.119.2024.04.08.01.20.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:20:02 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc742543119so3904902276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Apr 2024 01:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3oKdwauuJdjpoGgWnIKuOEXvQfkkWGJkIfxuOcCTM/xYLPM142WOpFhFlYOVBfPMBrCNtz29TTZwB6vLxC7ouKe2IlK1f/1OH5pwUsESG
X-Received: by 2002:a25:9cc3:0:b0:dc7:43fe:e124 with SMTP id
 z3-20020a259cc3000000b00dc743fee124mr5474927ybo.11.1712564402349; Mon, 08 Apr
 2024 01:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403122851.38808-1-schnelle@linux.ibm.com>
 <dd55afa6-8cb6-4e25-b720-d2df62dbb5e6@gmail.com> <bf276f98-2712-4fcf-a119-f984a1aedbf2@app.fastmail.com>
 <CAMuHMdX+M1VuhDVnC9n4hCBDjHywwsByNK1w8ibazc+-8_C53A@mail.gmail.com> <d9bdfa48-572a-caa1-229b-44565690d9e6@gmail.com>
In-Reply-To: <d9bdfa48-572a-caa1-229b-44565690d9e6@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:19:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVRSneRLU6OpXGKZMG5azXn_81eeS8vA8pvBvQPYnexQ@mail.gmail.com>
Message-ID: <CAMuHMdWVRSneRLU6OpXGKZMG5azXn_81eeS8vA8pvBvQPYnexQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] m68k: Handle HAS_IOPORT dependencies
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	linux-m68k@lists.linux-m68k.org, Heiko Carstens <hca@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 8:36=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.co=
m> wrote:
> Am 05.04.2024 um 23:16 schrieb Geert Uytterhoeven:
> > On Wed, Apr 3, 2024 at 8:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >> On Wed, Apr 3, 2024, at 20:11, Michael Schmitz wrote:
> >>> how do you propose we handle legacy drivers that do depend on
> >>> inb()/outb() functions (_not_ actual ISA I/O) on architectures that m=
ap
> >>> inb()/outb() to MMIO functions?
> >>>
> >>> (In my case, that's at least ne.c - Geert ought to have a better
> >>> overview what else does use inb()/outb() on m68k)
> >>
> >> If a machine provides an inb()/outb() set of operations that
> >> is actually used, it should set HAS_IOPORT.
> >>
> >> For the Q40, it may be better in the long run to change the
> >> drivers to just use MMIO directly though.
> >
> > Q40 uses ISA.
> >
> > Michael is worried about non-ISA drivers using inb() and friends.
> > At some point in time (i.e. eons ago), we were told it was better to
> > use in[bwl]()/read[bwl]() instead of directly dereferencing volatile
> > pointers...
> >
> > Anyway, I don't think we have many users of inb() and friends left, and
> > I assume the bots should have detected any/most remaining users in Nikl=
as'
> > branch...
>
> All the 8390 based ethernet drivers still use inb() and friends.
>
> That is the main reason for the terrible hacks in
> arch/m68k/include/asm/io_mm.h ...
>
> The last time I tried to add support for a different PCMCIA ethernet
> adapter to apne.c _without_ adding to the hacks in io_mm.h, I wasn't
> getting anywhere with the netdev crowd. That was ages ago, and I doubt
> their enthusiasm for a rewrite of the 8390 code base to avoid using
> inb() on MMIO architectures will be any better now.

As Arnd already discovered later in this thread, AMIGA_PCMCIA
(sort of) selects ISA, so APNE can be considered a "real" ISA. driver,
so it can keep on using inb() and friends.

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
