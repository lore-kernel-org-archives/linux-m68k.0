Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F816401
	for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Jan 2024 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f70c085d64so45805177b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Jan 2024 05:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704978719; x=1705583519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQ5ASUjPjhRUwAFEFid0Fjz0cuH2JwdEJzRuxsRLB6E=;
        b=Q/3KfYgkeJqHiWVQKsQDZuWjlPwpVZ2JNJGsIpKjGcE7Z12ZWXd1n/gvaSLYuFTkN2
         /Lo6ubOO3MuBhcc9Gm4XWs9BCjXnQJRoxc25LwMD9BnM12rZzAx0zlrI/2bTBbu2y/+3
         Ed6oui5ehMGsMy7QSrrgkdoTuEqzuoa/8ePLuhBJt0PWOIQr4b/1z1vXOIpRlKI2Wd4I
         rkg/jiTyIJdxw2Istm6f+g8J5creJm7eQ5aQm4fTe/WtXYQ1sOJSkWfNfkuEQW7kmhAR
         +swE2i6ibhlm4B+tKmV2utI+Rz58L4/A8ac1uqsCsep7pnRwc3O4GGJhuU/e/Sf3zEuP
         m60A==
X-Gm-Message-State: AOJu0YwGrYioHD63pbJ/8jwtQyxWynWOEC8s6oLTyqODyZ9AdmSrupiF
	jBQ8K7RHrHPoUbiwnDY6GtMx6/ez5r0KJw==
X-Google-Smtp-Source: AGHT+IHTv3hWduOnQBqWYM/9a4a7JcQnuMrrQ7sKvVVN0cM5Q7MpEiSWAdGg0ItHHTfI7pryPza4oA==
X-Received: by 2002:a0d:ea12:0:b0:5f3:7df:563a with SMTP id t18-20020a0dea12000000b005f307df563amr605287ywe.16.1704978718267;
        Thu, 11 Jan 2024 05:11:58 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id cp10-20020a05690c0e0a00b005f134299392sm391140ywb.52.2024.01.11.05.11.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:11:57 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed4b84667so4727854276.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Jan 2024 05:11:56 -0800 (PST)
X-Received: by 2002:a25:41cf:0:b0:dbd:ab41:60d5 with SMTP id
 o198-20020a2541cf000000b00dbdab4160d5mr1033855yba.123.1704978716687; Thu, 11
 Jan 2024 05:11:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik> <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik> <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
 <20240108090338.GA1552643@pevik> <ZZvJXTshFUYSaMVH@yuki> <SA3PR13MB6372498CC6372F8B16237244FD6A2@SA3PR13MB6372.namprd13.prod.outlook.com>
 <20240110141455.GC1698252@pevik> <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
In-Reply-To: <40996ea1-3417-1c2f-ddd2-e6ed45cb6f4b@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jan 2024 14:11:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5ACKVBQvEwMi7KHZkSVGZPJoocEC1wosfB7zc0u2mbA@mail.gmail.com>
Message-ID: <CAMuHMdX5ACKVBQvEwMi7KHZkSVGZPJoocEC1wosfB7zc0u2mbA@mail.gmail.com>
Subject: Re: [Automated-testing] Call for nommu LTP maintainer [was: Re:
 [PATCH 00/36] Remove UCLINUX from LTP]
To: Rob Landley <rob@landley.net>
Cc: Petr Vorel <pvorel@suse.cz>, Tim Bird <tim.bird@sony.com>, Cyril Hrubis <chrubis@suse.cz>, 
	"ltp@lists.linux.it" <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christophe Lyon <christophe.lyon@linaro.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	"automated-testing@lists.yoctoproject.org" <automated-testing@lists.yoctoproject.org>, 
	"buildroot@buildroot.org" <buildroot@buildroot.org>, Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Jan 10, 2024 at 8:17=E2=80=AFPM Rob Landley <rob@landley.net> wrote=
:
> You can't fork() on nommu because copies of the mappings have different
> addresses, meaning any pointers in the copied mappings would point into t=
he OLD
> mappings (belonging to the parent process), and fixing them up is 100%
> equivalent to the "garbage collection in C" problem. (It's AI-complete. O=
f the
> C3PO kind, not the "autocorrect with syntax checking" kind.) People get h=
ung up
> on the "it would be very inefficient to do that because no copy-on-write"
> problem and miss the "the child couldn't FUNCTION because its pointer var=
iables
> all contain parent addresses" problem.

Actually you can implement fork(), if you teach the compiler to use
separate stacks for return addresses and data:
  - The first stack would contain only absolute addresses, to be
    relocated after copying,
  - The second stack would contain integers and relative pointers
    (see FDPIC below), which do not need relocation after copying.

> The OTHER fun thing about nommu is you can't run conventional ELF binarie=
s,
> because everything is linked at fixed address. So you might be able to ru=
n ONE
> instance of the program as your init task, assuming those addresses were
> available even then, but as soon as you try to run a second one it's a co=
nflict.
>
> The quick and dirty work around is to make PIE binaries, which can reloca=
te
> everything into available space, which works but doesn't scale. The probl=
em with
> ELF PIE is that everything is linked contiguously from a single base poin=
ter,
> meaning your text, rodata, data, and bss segments are all one linear blob=
. So if
> you run two instances of bash, you've loaded two copies of the test and t=
he
> rodoata. This fills up your memory fast.
>
> AND PIE requires contiguous memory, which nommu is bad at providing becau=
se it
> has no page tables to remap stuff. With an mmu it can coalesce scattered
> physical pages into a virtually contiguous range, but without an mmu you =
can
> have plenty of memory free but in tiny chunks, none big enough to satisfy=
 an
> allocation request.
>
> So they invented FDPIC, which is ELF with FOUR base pointers. Each major =
section
> (rodata, text, data, and bss) has its own base pointer, so you need to fi=
nd
> smaller chunks of memory to load them into (and thus it can work on a mor=
e
> fragmented system), AND it means that two instances of the same program c=
an
> share the read-only sections (rodata and text) so you only need new copie=
s of
> the writeable segments (data and bss. And the heap. And the stack.)

Or Amiga LoadSeg() relocatable binaries and shared libraries ;-)
As this supported splitting code, data, and bss in lots of smaller
hunks, it could counter fragmented memory quite well.

BTW, can't you run and thus test nommu-binaries under normal Linux, too?

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
