Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606D0283FE5
	for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533384; cv=none; b=BuqcpifKNm7WFTn66b3JNBfs4yq3tfx4gJ6YPcPJc5MzM6nT38t3WPtRiresqtK/oHAo4lJKGbyZV32PrYUlYhIdqG4XhgG/fuTdbopBAeIP+a9Mbc3mXi+DcpSK5n5xpw5ThtycRZ2usG1adax8mx6o1+ekPk+v82AqVd80IPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533384; c=relaxed/simple;
	bh=gxid6d73FASpgj+Dbo6qkKXdo6ItVd1h5REmlU4F6PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiXoBu72ZkjV5XVZBf8bgksmBfhPhQT8BKgNlNA3zRiVxWmW73OCls0LCecTOasEEatzPWIC3tCM4ztpXgZQKxXbph3fj4l5Pl67y4/BC9esrTkgKaBUQcyhd7aTDDYhpXwjmTaMreCFLQwxzEj0ibaNFm9KxcorX4bgrtanOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54a94a48debso620984e0c.2
        for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 02:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533382; x=1759138182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebw4sp1U8DsoLtMGrD53MUAXHrZ/k+nhfitncmC356Q=;
        b=Xrtjm7Z6C2j7+jw4X+dXA5u7VVjrd/hgeQ+aPPHv+YWMju1KmSI63gTYZnq3Pph4L+
         l0weipKF/8q9StXLZ7Lgls9YVHMn5hrzpaLchHM1w7NTMG43Oiy8nw+BKKsrwbpCQXfu
         CFExIFFIjqstyMI54dhg/RwcrROt0zZqCdTs7ju9Allh1orJ2zHX4JX0fnG2jh7majD/
         1s0vScZF78s2gJk32ANt7CfDEATnhJINBh+0jM8Z3hxDifGmI+bYGGuzr21LhhvP11Yg
         25fto61y3zbbNZgeHknDJYL9Mzs+53YxXLRW99p7c2iA8iMo0ts3+uCQVfBagcb/dGSJ
         WeTg==
X-Forwarded-Encrypted: i=1; AJvYcCXciIxlJzr39IX9t3zvCRJEJQR4kxrmX3tJI/WLcTC1NCiQa1Am6MHuD7iYz00hGe41X9PocrW17K2K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26XfuADn6zdl9iuEmoBzHzq6GlUy6FhKWBP/PQghH30Yqo2Hd
	4OACrIERt8rIy9yGavZJnhQnjnItZpUF4g7xWvbzBxujcG6HeHqjgKjaDTo8jY5w
X-Gm-Gg: ASbGnct8JmA7dNlkuQG8GE32NSXzTmkQASV/XLwBlS93Qq8LaE7YbEc5x8XiQoQOPlv
	ZgIt98WJUUIr/pq1anYkKWjzoymrQWYZzWhKdhjySRMVP8HePbd7VC29yl3/k88iUiV+59ZGwKc
	b4S4KbUpCmIIbcwLxBmXax164WGhLVBKca2bOTuoeuyU5NkdalbixLeitWrlnajL23Ni3TmvR7W
	rm6a9ilJwJyMKetzc00qwprL+q1uz7RgUfqg13PtduRcXu208I9F9CXStxpQbmAkR7tQP+H8Plz
	Cn5sEANnJRWzbFuCjA/VoE95hz7MACWSw/lhK8Xq8disqO9xxUI7rYqjq7De+JaxZ9ELoqP3jyD
	EoqBrxunWNIPOKrR3L/2zVR8Dwgd4ci9d3A0qJTuOytUN63VCVkiut/2FtUHV
X-Google-Smtp-Source: AGHT+IGFUeS7fyiqXHNlS1LfpqLZqsstw5EpEUlxOpEAjYG1UXDPXebpeUYSU4NZK7FxUtxO+IQ/gw==
X-Received: by 2002:a05:6102:f8b:b0:535:2f14:ea5e with SMTP id ada2fe7eead31-588d7223aadmr3488792137.8.1758533382108;
        Mon, 22 Sep 2025 02:29:42 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e736csm2007573241.1.2025.09.22.02.29.41
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 02:29:41 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8fea25727a9so112317241.1
        for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 02:29:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVR/V7otRwBVnwVFCI/TOIdYJc/CiSfGr2VVvkU1dBVaL5uImvbOPy9Oh37O5orJuT6gIYDYDhR8HJh@vger.kernel.org
X-Received: by 2002:a05:6102:c08:b0:522:255d:4d19 with SMTP id
 ada2fe7eead31-588eb292bb9mr3073422137.23.1758533380886; Mon, 22 Sep 2025
 02:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
 <CAMuHMdUgkVYyUvc85_P9TyTM5f-=mC=+X=vtCWN45EMPqF7iMg@mail.gmail.com> <6c295a4e-4d18-a004-5db8-db2e57afc957@linux-m68k.org>
In-Reply-To: <6c295a4e-4d18-a004-5db8-db2e57afc957@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 11:29:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-AG-NeGZKuVy1e=TGKN895F2eHEzkjJeaGvAADv-vOQ@mail.gmail.com>
X-Gm-Features: AS18NWDKBc4eQCJYFdlrfn6McdPM_5-5yG-PRssau5_dGdaYxg2W9cfnnLuZ5PU
Message-ID: <CAMuHMdW-AG-NeGZKuVy1e=TGKN895F2eHEzkjJeaGvAADv-vOQ@mail.gmail.com>
Subject: Re: [RFC v2 2/3] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-m68k@vger.kernel.org, Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Mon, 22 Sept 2025 at 10:16, Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 22 Sep 2025, Geert Uytterhoeven wrote:
> > This triggers a failure in kernel/bpf/rqspinlock.c:
> >
> > kernel/bpf/rqspinlock.c: In function =E2=80=98bpf_res_spin_lock=E2=80=
=99:
> > include/linux/compiler_types.h:572:45: error: call to
> > =E2=80=98__compiletime_assert_397=E2=80=99 declared with attribute erro=
r: BUILD_BUG_ON
> > failed: __alignof__(rqspinlock_t) !=3D __alignof__(struct
> > bpf_res_spin_lock)
> >   572 |         _compiletime_assert(condition, msg,
> > __compiletime_assert_, __COUNTER__)
> >       |                                             ^
> > include/linux/compiler_types.h:553:25: note: in definition of macro
> > =E2=80=98__compiletime_assert=E2=80=99
> >   553 |                         prefix ## suffix();
> >          \
> >       |                         ^~~~~~
> > include/linux/compiler_types.h:572:9: note: in expansion of macro
> > =E2=80=98_compiletime_assert=E2=80=99
> >   572 |         _compiletime_assert(condition, msg,
> > __compiletime_assert_, __COUNTER__)
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:39:37: note: in expansion of macro
> > =E2=80=98compiletime_assert=E2=80=99
> >    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond),=
 msg)
> >       |                                     ^~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:50:9: note: in expansion of macro =E2=80=98BU=
ILD_BUG_ON_MSG=E2=80=99
> >    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #co=
ndition)
> >       |         ^~~~~~~~~~~~~~~~
> > kernel/bpf/rqspinlock.c:695:9: note: in expansion of macro =E2=80=98BUI=
LD_BUG_ON=E2=80=99
> >   695 |         BUILD_BUG_ON(__alignof__(rqspinlock_t) !=3D
> > __alignof__(struct bpf_res_spin_lock));
> >       |         ^~~~~~~~~~~~
> >
> > I haven't investigated it yet.
>
> Yes, I noticed that also, after I started building with defconfigs.
> I pushed a new patch to my github repo.
>
> https://github.com/fthain/linux/tree/atomic_t

Thanks, the updated version fixes the issue.

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
