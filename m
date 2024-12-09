Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC022D4D5
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Dec 2024 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747583; cv=none; b=MxFRMdrSuHd1WIqHlD+nAEFCAWAMbvUV1aPebYeqnZTawaTBEFmkYpZYFx+3oH0XOcp4fz5NZZadJqj7+AkSfU2vjumo5EJqLZ21PSm5dxFoFE2LouOWKs/zGOCViQNZvpH2UvUFUZDHuZfzaPQBejb84rtmXldeWoojG9QrhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747583; c=relaxed/simple;
	bh=J3Zd3opQgaR9Wv4HMjE20VpB+33oQF/OvHZ61snu5/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HE1PTMSeAPk17aJyLLL4PpSyxXrHKT8cUD+hBz4+p3lribMISZh0Cod3vGj8+LDYMeA9YuWAosSuzH5l0fscRVR6/SF9Nj8/6VCbHGLjott/tOroSUhbLjuNuwZEQCtyoBLtrEWq9aT7Sx59aESlypT1gmaO5gtAktNpxeDtB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5152a86a097so2044730e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Dec 2024 04:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747579; x=1734352379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmzIME5hBzHIgRc790Loeon/HCVGezkSFNU9PjKgjeg=;
        b=FLdLq6JF3IxGex5jm3LFN717aiQxZ85sf66zZZ3e6XF5iwKB04L3lqrLdevCzjuxjj
         V6oGkeRnJBmKaGNd14UPdgKOKWqaoWE1362XjElVLOYRZ1Tdj5cjUEMpznn8/F0vaQPB
         wlsPL5A3vWOt/uPglmlgAx+K1XStyJzqw7wUtWXtw4NhGdbeejquLY5XshFVYyfECT8l
         fAaUvqWZz3hVMYHTCnu5Y70DzWRje/mT/NM0QVVzASfhXoseQNnrnMRqM2gearruumpu
         7wKXLHiR7vx6/ub3bFBx6h49DiDfiOHNcvjCHZZXB+upGqqD8k1Dmo5tRdcfNTy6r8B6
         jJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIOgLVZ/gDvJ0eutKsGkJERzzSrFPGIBfCxTeywqJF87z4OcXWBOtGd/Y8KpxZGRGC4HvaqNGlQWRa@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy5IgLUJUgaM//VqBP5N/hSMGjpg/f1064i57OnAPQ2zmnxPkWL
	z5/68bjQPyH2L1CDtycttbDdmJy/6ivktE7QV+scPhYE+q3DMUX87j5T5YH9nYo=
X-Gm-Gg: ASbGncvfuJ7xsq72O5b+dt5Oz075gtJouXHwFJnqWW/2McRmbouaaFJk9X9mqCgqDRw
	au1imxs9YwJBTZhCmpMBbS4PCZtxQQ2UN+ASaqvMQCeEXbMblMhJOCiqvdJAZ0gL4oppzEmJcO+
	IdqGiVkSe8FpkOdcDhI+LwQxkdd4HXgErQLhKtdqPeZ6LJdw8bANPJcadiDdVAN80BePveXAgjH
	9ShLjgvWrj362d2MzkwqQ+/yhyRzjAtmWUo0HcJgwOqYrELkCq0UmshLVvZ3lyXp4tIUGtleKKD
	PSjafQfQh/wnQZx9
X-Google-Smtp-Source: AGHT+IH97T7u6eP3nX6emJkGscZwqetWSx6wPQC034/5bfZuuqhskgUx8AxBkiE+gmpKY4kzD+4b+A==
X-Received: by 2002:a05:6122:4211:b0:515:e4c4:3664 with SMTP id 71dfb90a1353d-51888559627mr285554e0c.9.1733747578673;
        Mon, 09 Dec 2024 04:32:58 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae3edfcsm722685e0c.12.2024.12.09.04.32.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:32:58 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5152a86a097so2044722e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Dec 2024 04:32:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnZ1cp7oLUJ/xeijViHEpEQcz5hoFH3t/dioAW9kMAN4w9bSz8y0kfZBovhq3ekkMqWS879GvaRvel@lists.linux-m68k.org
X-Received: by 2002:a05:6122:2895:b0:515:f586:5298 with SMTP id
 71dfb90a1353d-51888558a82mr274113e0c.7.1733747577876; Mon, 09 Dec 2024
 04:32:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113133209.1367286-1-gerg@linux-m68k.org> <CAMuHMdVZh6-64hfx1jgOijBEG6cTftinqf+4fZvqjJtV1hO95g@mail.gmail.com>
 <1dd8be4b-d5c3-4074-a91e-3ce998ce3050@linux-m68k.org> <7bb57485-c08c-4121-ade5-8c76bc48e615@linux-m68k.org>
 <992c4d62-380d-4908-a688-77197d9c4cbd@app.fastmail.com>
In-Reply-To: <992c4d62-380d-4908-a688-77197d9c4cbd@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 13:32:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkeeUD7x4s8F8AtdAcXP4A_Z5Vq2--UwasJC3xtZAzVg@mail.gmail.com>
Message-ID: <CAMuHMdUkeeUD7x4s8F8AtdAcXP4A_Z5Vq2--UwasJC3xtZAzVg@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: use kernel's generic muldi3 libgcc function
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 10:28=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Mon, Dec 2, 2024, at 02:34, Greg Ungerer wrote:
> > On 6/11/24 08:04, Greg Ungerer wrote:
> >> On 5/11/24 21:46, Geert Uytterhoeven wrote:
> >>> On Mon, Nov 13, 2023 at 2:32=E2=80=AFPM Greg Ungerer <gerg@linux-m68k=
.org> wrote:
> >>>> Use the kernels own generic lib/muldi3.c implementation of muldi3 fo=
r
> >>>> 68K machines. Some 68K CPUs support 64bit multiplies so move the arc=
h
> >>>> specific umul_ppmm() macro into a header file that is included by
> >>>> lib/muldi3.c. That way it can take advantage of the single instructi=
on
> >>>> when available.
> >>>>
> >>>> There does not appear to be any existing mechanism for the generic
> >>>> lib/muldi3.c code to pick up an external arch definition of umul_ppm=
m().
> >>>> Create an arch specific libgcc.h that can optionally be included by
> >>>> the system include/linux/libgcc.h to allow for this.
> >>>>
> >>>> Somewhat oddly there is also a similar definition of umul_ppmm() in
> >>>> the non-architecture code in lib/crypto/mpi/longlong.h for a wide ra=
nge
> >>>> or machines. Its presence ends up complicating the include setup and
> >>>> means not being able to use something like compiler.h instead. Actua=
lly
> >>>> there is a few other defines of umul_ppmm() macros spread around in
> >>>> various architectures, but not directly usable for the m68k case.
> >>>>
> >>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> >>>
> >>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>>
> >>>>   arch/Kconfig                   |  8 +++
> >>>>   arch/m68k/Kconfig              |  2 +
> >>>>   arch/m68k/include/asm/libgcc.h | 20 +++++++
> >>>>   arch/m68k/lib/Makefile         |  2 +-
> >>>>   arch/m68k/lib/muldi3.c         | 97 ------------------------------=
----
> >>>>   include/linux/libgcc.h         |  4 ++
> >>>>   6 files changed, 35 insertions(+), 98 deletions(-)
> >>>>   create mode 100644 arch/m68k/include/asm/libgcc.h
> >>>>   delete mode 100644 arch/m68k/lib/muldi3.c
> >>>
> >>> I had this in my local tree for about a year.
> >>> Is it fine to queue this in the m68k tree, or does this need a broade=
r
> >>> coverage?
> >>
> >> I am still in favor of it :-)
> >> Would be good to get some feedback on the common code changes, like th=
e change
> >> to libgcc.h.
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> This looks fine to me, nice cleanup. My instinct at first was
> to add an asm-generic/libgcc.h as a fallback in place of
> the Kconfig symbol and move the common macro there, but there
> really isn't much benefit to that over your version. Either way,
> please merge this through the m68k tree.

Thanks, queued in the m68k tree for v6.14.

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
