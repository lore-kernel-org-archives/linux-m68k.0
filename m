Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5238E2FF162
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Sep 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716697; cv=none; b=NKA5xIdGGg43VlEcCKbJq/siW9OYTu66ZCuD/1omvsuA9MOxAcLDQ0o7/YvMRDlANUAR6emX2I6/YknF8tnq/F/rjvRMcbvkSlyUXRP3DYkKQYTVeuiGvHU8AQ57NJwj5fH7t+0ZxDx9QBdsHLwSGVBbD3iBpApQIXBjS0k0QsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716697; c=relaxed/simple;
	bh=uSvK41FmgeQ8I6Z+IJZE9+asxAYJK58LDNCtRKIuCfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLsQOw91kO2Av0m8QN8+m4ZvYmZNUJJM/BlrnibQJ5znyRvoAD2W5g2I2onZYU9vjMOp2OUiTtogUWXLbeTSPsm72buwjDh4E6Gd/y3aocXzfTXoDHmYDiNL1D9rly/p+MtlWfTLKyg4O1lx9y5H4PVAa5FDVAguY2oHcILxDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-890190c7912so785285241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716695; x=1757321495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WotrGx0bV1lkHS8mV0WZnLSC2eWHhyQWssws+EOHV0c=;
        b=Mh1jLk4dS4okWmCTIB5pD9mkhLfo6TZsMGo06VyISoWoyZfRxZnpi5D5JfKSk/uI58
         eUWTkL/zKCs5QgnBf1UyzHCZQ7jYJ2CP8Wv9q+79wDgRLyZ8PmI0HCs2I3qtRfEOEs+T
         Ge3R6n/dR9+jiRxGnq/2v874izJ3SCaJmDehUHvszGD/77OawknbCNP6ho96tCZFFSGw
         DDoLad9vD/mE2cmPUqJr5dOaaq3ZYFO7MUGc1Vlq5fRw4jxrzZdB1S6cY6NlYjRFs46U
         C7oqVXdhMx4HrrW6m6C+lzDVSjsEbeQ/wZWJc/2Wf/ZsU7VnQSTpfQJ9CsO0ofvq/Xjb
         DV2A==
X-Forwarded-Encrypted: i=1; AJvYcCXkXyEY/Cq5T6LLVS7WMQLhXhA7MNXY8QofuT7Z2V4Au+M3voBgVoUcrsbHy6kJ3UhcHLHs6gDz+f4L@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyt4W9TA5J++hHySf2ZkTtHJbt35R0VTXZzBszV9TTOrcC63QEG
	4TK8s1OZGGbmTe8AwErK38HirRwQUIAZBqR+auJbXD6n14cHu+MpFr+vQx+Aaybj
X-Gm-Gg: ASbGncvIYSblhWq14+OtB1eWlYoqN82FcUBez95pX42px1qegbbqYG2SpYtfSQ7bPPA
	pFt16QQpFX2QlVSL0CwQdvbmXX4RJo1GgibV8O/wQDR8C0ZCuGfI47dr3/+qjaBlE6BeSxzTmFB
	8m1Igt72rO6/10WddqYJ5qdVySxMwjpbnT0ibNG/TZagZ0/3k0DKDaRE32Utp5aJwijl83g3lZ8
	uQZS+y7wEEyI6mNmZDsi1ulc8HtztwlW9r7yHqoOzpoHPK7GTTYCppgm53veCy6ZePJ/I0da1LS
	U0/bVEG0IbhZrUrUhigh9JByapCR5s4OMFdZfiq0kFpnYGfonOaHsILEYw2fqk2lBQlASRQGUlq
	1rOL1qCBwdqjWDhn+N20Xgy2tcuxKd3DSCJ9+Sze5wk4bgfMRWym3q+AlHzL5la57JkZwuBg=
X-Google-Smtp-Source: AGHT+IE2ZnMrd7CHQj02GuJjhbqD1KSZfGWWD8c4hkYEc15yJCCm3hcJpRpDfvcFqpOp3u6kjnWs0w==
X-Received: by 2002:a05:6102:441e:b0:522:4c98:17e with SMTP id ada2fe7eead31-52b19539d32mr1651719137.4.1756716694607;
        Mon, 01 Sep 2025 01:51:34 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8943b7f2516sm3433696241.7.2025.09.01.01.51.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:51:33 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-52e6037a484so81001137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJcKikk9YHyQUyBGPBVmOXMyooCR9FsVQq6EHTj1nQuc0Z58yWmcpLj8uqBbIkdUgl34cvz5kRgc+5@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2ac9:b0:529:b446:1743 with SMTP id
 ada2fe7eead31-52b19a55edfmr2096555137.11.1756716693556; Mon, 01 Sep 2025
 01:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d9554bfe2412ed9427bf71ce38a376e06eb9ec4.1756087385.git.fthain@linux-m68k.org>
 <1a5ce56a-d0d0-481e-b663-a7b176682a65@helsinkinet.fi>
In-Reply-To: <1a5ce56a-d0d0-481e-b663-a7b176682a65@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 10:51:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKgMfL+1EnkZbbqNqTv4aMs_XWocXxq5jVGeOMaQXnDQ@mail.gmail.com>
X-Gm-Features: Ac12FXwMdMp9qNSuU3NsSHsJYJoBDJeG51xj4OtzBCmdyfOrJU-V6GtDcIUSO3U
Message-ID: <CAMuHMdUKgMfL+1EnkZbbqNqTv4aMs_XWocXxq5jVGeOMaQXnDQ@mail.gmail.com>
Subject: Re: [PATCH] atomic: Specify natural alignment for atomic_t
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Finn Thain <fthain@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lance Yang <lance.yang@linux.dev>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Eero,

On Tue, 26 Aug 2025 at 17:22, Eero Tamminen <oak@helsinkinet.fi> wrote:
> On 25.8.2025 5.03, Finn Thain wrote:
> > Some recent commits incorrectly assumed the natural alignment of locks.
> > That assumption fails on Linux/m68k (and, interestingly, would have failed
> > on Linux/cris also). This leads to spurious warnings from the hang check
> > code. Fix this bug by adding the necessary 'aligned' attribute.
> [...]
> > Reported-by: Eero Tamminen <oak@helsinkinet.fi>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com/
> > Fixes: e711faaafbe5 ("hung_task: replace blocker_mutex with encoded blocker")
> > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > ---
> > I tested this on m68k using GCC and it fixed the problem for me. AFAIK,
> > the other architectures naturally align ints already so I'm expecting to
> > see no effect there.
>
> Yes, it fixes both of the issues (warnings & broken console):
>         Tested-by: Eero Tamminen <oak@helsinkinet.fi>
>
> (Emulated Atari Falcon) boot up performance with this is within normal
> variation.
>
> On 23.8.2025 10.49, Lance Yang wrote:
>  > Anyway, I've prepared two patches for discussion, either of which should
>  > fix the alignment issue :)
>  >
>  > Patch A[1] adjusts the runtime checks to handle unaligned pointers.
>  > Patch B[2] enforces 4-byte alignment on the core lock structures.
>  >
>  > Both tested on x86-64.
>  >
>  > [1]
> https://lore.kernel.org/lkml/20250823050036.7748-1-lance.yang@linux.dev
>  > [2] https://lore.kernel.org/lkml/20250823074048.92498-1-
>  > lance.yang@linux.dev
>
> Same goes for both of these, except that removing warnings makes minimal
> kernel boot 1-2% faster than 4-aligning the whole struct.

That is an interesting outcome! So the gain of naturally-aligning the
lock is more than offset by the increased cache pressure due to wasting
(a bit?) more memory.

Do you know what was the impact on total kernel size?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
