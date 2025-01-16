Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE519539F
	for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023857; cv=none; b=US52P9hWI9Xp0xzNiUjE7RsI5EXhC31dRzQggU/UfDbvccpOeZXBY/LYOdCkKqiZJdith9R5pHAocp2YPrH4L8s543pRSppXTJ9RxrE6mTQFqX3nC/fVoqggrMZrVMfJnmJG9Z90TSzLDOPzkd7zCwXdrH8FfjuUBZjJiJo3MDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023857; c=relaxed/simple;
	bh=w49PujCISYLsVCllEIukPwVPPIiY06HwC/CFGkmDhxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSyZ8yfnvVVE7KVXkC0WzrnHIAnM5pzl8TnzQvsQIE7aH8Mfn1dngXt/35QZkeoYojSCYJ5W23FU6qKSMJFY9aNuhbJbt34qSrb6CYejH0By8Uj5X1TQJNP5fulpb37YQM2p9zemmymsYprZIkG3QtmSaMPYuKWhUHUQ/2bFB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afefc876c6so138679137.2
        for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 02:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023854; x=1737628654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpcFtcYJ7C3AaS5KMQShKadwUo3SZdmB2xiSRkabbPc=;
        b=VY6dvXgi3aCO869T7ofmZEBqBicUYu3RTl1rcy09H5QtkzXHA/8Yn48Rre7QTm/H1n
         r5Hj0e1asci9lWftluRt0uW9tME1ovIrgGXB388mtGXhr3WZhM7dgLJVGMjlIvyKdAzQ
         9WQejINiCEpQZHMzAYrl9hS0qzqSm+w4PGMBNr8gYdHOQ+Lj47l+Ouvk6paatLNg8pBg
         YggcinsFGx5RSZPaXk14JrdiM8bBku/p2/EvBL8LvPFdkcMQUl7V9DO4bovdmOFzDdGQ
         PPZj/KzFMpb/oihpao16yF3g0pXOjtolbSeBYfSi6BRIH7stsMXO9b5RqmtGBMHTyxZ5
         PgBA==
X-Gm-Message-State: AOJu0Yxfsdq5RCCCzWi4kPeEDGyLH1LzX1JMBK0GujzCt820QT8TfSJo
	ngElcbyic7gas3p6cw6+9LeMhU+WEV0effcU2VeH5VO6wigqZMD15bOcKip1whA=
X-Gm-Gg: ASbGncs52lyvfbhAT/BotNPt0coklTWtA15bM2/i5PzkZDjdpRVlMn1+93JL1gxT0VR
	pTs+ISw0hrnoQ1S4kpfsO1uFci6qhJSe/DCdYKy6KRKbwjOZJLXgQcLGfPq1g2A1mcQTKApaGe4
	3oqBRXoL4brq4kR3H0wJtdcSdTLFbASRPeA8ZFH+X2e1kZ11Snlb8w90iR+kXX3gu+3ohSfHARA
	My9uBwnDD3hMvy5NwLBzzg45/OVS1EABtkh/v/XeRe5yqPFZx3p8DBtur8GJXd6SZPYzSOmu/rD
	pjlDAonA9eqOcPenSAw=
X-Google-Smtp-Source: AGHT+IESDtt8Zk2DQFxq9zXfckQXGyz/xs3ppx6uFFLwHZy50INDTxT+vf9uA6S7GeE1TjbmAJ5vMQ==
X-Received: by 2002:a05:6102:f9e:b0:4b2:5ce4:2b4f with SMTP id ada2fe7eead31-4b3d0d7611dmr31168089137.2.1737023854234;
        Thu, 16 Jan 2025 02:37:34 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f44f53sm5511073137.8.2025.01.16.02.37.34
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 02:37:34 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85b95896cefso92294241.2
        for <linux-m68k@vger.kernel.org>; Thu, 16 Jan 2025 02:37:34 -0800 (PST)
X-Received: by 2002:a67:e708:0:b0:4af:c58f:4550 with SMTP id
 ada2fe7eead31-4b3d0d9fb16mr30013673137.7.1737023853763; Thu, 16 Jan 2025
 02:37:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112150542.413179-1-p.pisati@gmail.com> <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>
 <Z4je7T0zx0QmF9Dk@amaterasu.local>
In-Reply-To: <Z4je7T0zx0QmF9Dk@amaterasu.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Jan 2025 11:37:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi62FctEsB+k5m7Ue+WZtU_iQ=ppEhBmM1hSAAZJc2SA@mail.gmail.com>
X-Gm-Features: AbW1kvZUQu9GFp7tXii8RbDzbRUWSWQPGPdHyOZmk5VCYLLi-X2YRO6OoKnkmD8
Message-ID: <CAMuHMdUi62FctEsB+k5m7Ue+WZtU_iQ=ppEhBmM1hSAAZJc2SA@mail.gmail.com>
Subject: Re: [PATCH 0/1] [RFC] Commodore's Gayle pcmcia driver
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, Kars de Jong <jongk@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Thu, Jan 16, 2025 at 11:26=E2=80=AFAM Paolo Pisati <p.pisati@gmail.com> =
wrote:
> On Mon, Jan 13, 2025 at 09:04:01AM +0100, Geert Uytterhoeven wrote:
> > > 1) i've forced the word and long I/O helpers to be little endian, and=
 this is
> > > clearly a big no (see io_mm.h).
> >
> > Can't that be avoided by setting ISA_SEX/isa_sex appropriately?
>
> i tried ISA_SEX to do the be->le flipping but it broke all drivers: it se=
ems
> like isa_insw()/isa_outsw()/isa_insl()/isa_outsl() must retain the host
> endianess.

Oh, I missed you're only overriding the non-repeating variants.

So ISA I/O registers are little endian, while ISA FIFO registers are
native endian, as they operate on the raw data stored somewhere else
(network, disk, ...)?

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
