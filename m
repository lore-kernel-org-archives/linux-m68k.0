Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936219E965
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417191; cv=none; b=j8fNbQrBbc0YUQigtKZTnWKdsi6tCm2C7AHs2855MRiwAJzv7H2km10B3NAWbgbktgt8NOsA1JEBr9lul3A+ZDtyoFly4X2t++v3XYpYO5LRWaoM/kBxKTrz618ZICzz4G82zJeWkVM53l9dDJO89dsxFOVgiJbAilgUyT5DFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417191; c=relaxed/simple;
	bh=kxWLN1ezIKNM4o7u7dYo4ic8fn7oQgsYtAZjJRFAmlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIeRUjebgGedmuxvPBIyQJkwRGB6dSQWPjVLfYd07H/tVRZIi3Na+xqjOJuJoud5Q8yYEjLz8i949aJr2BxzLZ7lUy4+7pRm27Px8P/gVc+UJu7vOmN7fDP+HoPZyx6HLen+ImTqTeoDAXAcSw7w/JgNxzY5tn6vUvYm2ON+RLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4affbc4dc74so453948137.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417186; x=1737021986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waS6OXMNfxWM8sfBY1M9xO3bF1AiL+GfxiTq+msEDRI=;
        b=YK6mJ3QUUHALUjHWTxLpoJmvNIE1OvkCTn/qTim8K9jgINOMK6B1DWaF9AOPiLelQw
         Eg6Zonr6WsGr7MC6qKRnvnxYwEE80OIJ52hzpRxKBhcA9ppS6hlfH1IV2GR+m1lDr+4O
         cEHNwR6roKBskvSav2TMpmQtagWl9u2yaBELIncAZwUDwgpBcINxbVWxKeuXrkZMajsU
         9CT9D5rumy7ziquOPfkvo0eMqWiS+Vl7ojzR9Y/EJx9QU22903v7Wr/7bSBMa3icW7e2
         hgnCtjQGissvWR+S1JE/OA1tpcvkmM1p2qo0X0MQEdl0UdU8KCQkYPisaeveUm0vnWT/
         fGNw==
X-Forwarded-Encrypted: i=1; AJvYcCWJghywWRLQmrodsSC2O9CLlHUn1gfH+0pCMOHmhT6Rg48Hk7O/3CQ5ITy6ohZycPRbCpy9suPxehyt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxhNk0lBabsn7hdj0lWQdT0rvqO0cc6WegfFkJiHc23O05UMWBK
	+mpfa+zWeMBskLabmgZ5dk3tkUamPIrfrYgaeV9BWn0b6udC2uzCaUEc7C8e
X-Gm-Gg: ASbGncu8lU30FBTenKoF2h/4cN5w5XvyzFaHAIFPwl2U/lPyc4IY8TnRdqmZaavo1ls
	yD3EleybyZOYEz38NX41GPDkI7ccKimUoWU19IsLTTnzBozG8bRiQH66e6u+k7haOqrBqWRr3lE
	6C/1zkBoFLSo5I/HIdwpMokU3HldQ9zemMPh2aWzSq9j50mMHxn/HKhcmOb3PaV/X/NjbZSM310
	bMs+AAp0m2Ij8P9vG+YJE9aVXvN1AedbXpRuO62k6shdWfMAkI3eGPydfQeF2ruUixmTtLDijrQ
	i0R6t9jANPKV5WhNizw=
X-Google-Smtp-Source: AGHT+IG8KLLcTPS+8CnFjEDqQUSKdY6hxsbPhbC3a3ajBOm2d8xVwomHAQ5TNLWFgg8A7USBhBesvg==
X-Received: by 2002:a05:6102:2923:b0:4b2:4877:2de4 with SMTP id ada2fe7eead31-4b3d0e10229mr4869117137.15.1736417185618;
        Thu, 09 Jan 2025 02:06:25 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b6091dab0asm604371137.27.2025.01.09.02.06.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:06:25 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so467275137.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:06:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULNNLlt1s/9zZm3+FrquIsTrivVbQ63ia9IywTLgBlXmLMbavHON+HuvfRQNYNpDDCU7Nzmw33NCZU@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2923:b0:4b2:4877:2de4 with SMTP id
 ada2fe7eead31-4b3d0e10229mr4869108137.15.1736417185043; Thu, 09 Jan 2025
 02:06:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
 <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com> <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
In-Reply-To: <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jan 2025 11:06:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa932fBaJ-sc-38g5n95TepLt+a2RhxucVrfBD0xDF2w@mail.gmail.com>
X-Gm-Features: AbW1kvZIF1R2ptluPy8IPTrvMHoXNg70Bu95qhy_D3vaq9yb4bAjp3Dqr1Um4KQ
Message-ID: <CAMuHMdVa932fBaJ-sc-38g5n95TepLt+a2RhxucVrfBD0xDF2w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 4:28=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> On Sun, 5 Jan 2025, Daniel Palmer wrote:
> > I have u-boot working on DragonBall (68000), my MVME147, QEMU Virt etc.
> > So the u-boot could be made to work for almost anything as long as
> > there is a serial port and a timer driver.
> > On virt I take the bootinfo QEMU creates, turn that into a devicetree
> > in u-boot and then pass the bootinfo and FDT into the kernel. :)
>
> I suppose the benefit of integrating FDT into bootinfo is that you can
> have a new bootloader that's backwards compatible with existing binaries.
>
> I think the embedded FDT option brings a similar result for old
> bootloaders, but can't support a multi-platform vmlinux.
>
> So I see some benefit to keeping bootinfo support and device tree support
> independent. A minimal kernel build is going to omit bootinfo support. In
> the long run, I'm not sure you'd want the FDT stored in a bootinfo record=
.

That was indeed my first thought, too: do not store a pointer to the
FDT in a bootinfo record.  Else you end up with a situation similar
to ARM(32), which supports the can of worms of mixing FDT and ATAGS.

Instead, replace bootinfo by FDT, and differentiate by checking for
the FDT magic value. That way you can have a kernel that supports both
bootinfo and FDT.

Passing FDT using a register is also an option, but might be harder to
auto-detect: when using bootinfo, there may be garbage in the register,
when booting FDT, there may be garbage in memory where bootinfo is
usually stored.

> > I think adding FDT support to some old crusty bootloader for the Amiga
> > or something might be a lot of hassle.
> > Like I'm not sure if I'd even be able to setup a system that could
> > build it if it needs some old Amiga C compiler.

Yes, this complicates things.

> > That's why I think embedded FDTs might be needed in some places and
> > leaving the bootinfo part as-is.

For "simple" (fixed hardware) machines, that is indeed an option,
and already supported on various other architectures.

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
