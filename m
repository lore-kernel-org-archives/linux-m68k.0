Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C054BC8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Feb 2024 07:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019723; cv=none; b=LdHblanpR+DjhZU7OJIQVKy8eT2RZZT4rUtsrO1DMOmiZHdGfPpRbL/Bk9uwwPsfRWDhNpHWY/sQMZy2giGpyihUj28XRLBNy6cRELYEwXVJJKGju08b/QnMRQwtrfzUaHg7Em/rYyxQ28kdRh/7fm0IjzCii9hlVEAHuJW0JbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019723; c=relaxed/simple;
	bh=PRocj1N0mGG48q41v7UAxjcCgltfFv4sY0S/bF2PfVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NioBUYp0pCs/6Ha75xkVsNfb2Lu9b++4Ii2/wmQEmViYd+LKY7Z0lzJB6Nm2Gj1NmY2x3E3SCe2NgUWYz+lK1faBKXH/dZU7YmjxRj7CLLOBY3Cunc2OhchZwW6R/V38oWVqyajUP6wHkp+doWhDLew0oqpnYTqGM7UJWoMWIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-609228c4171so6359987b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Feb 2024 23:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019719; x=1709624519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFl5adFzYYsCMJUvAOgdtPjYk4mF+SvLHr40WscSKV8=;
        b=Uu5D4RiuTjOpPQ2hUM5vn6zS7io6Xx3NI42KmlHMplfjRiH51LkJGw9w7nyae7r+A6
         HZgVyKQJR8zwzt2TgJnjc1PeeqAjTTz1/xQTTcf5SxSjGgLrIwAYYPQGzfsMcouTyRx2
         tRiZmR6VLFSUAIWpQNdbQkTsalo8RQRfT+0t00iAzHbKvGLNwA/usENIf6bUcOEnXq2N
         1rjXWK4UzwW5+lSCsc6Q048oM7D527DTy7LKY5TgRqRMMXN8MB+DGn9c24qmMUfBFE8f
         wU+UixFSZ4s8FnHaBoj6rdH/KbIUSXM4BntAeDMiOOCPBMZnFYC/VOXHPQd9P11JRleD
         ctew==
X-Forwarded-Encrypted: i=1; AJvYcCWVRv/ewiSWgp5VNQMmpP0dggweAb/zNqlANe34w8ffMr4P8btlgEVvZFhm7Qssm7YUD+NhvAt5VYd0nGQOweBOYfxEi2t/AOmQ58HtWiit
X-Gm-Message-State: AOJu0YzoeiAobuMzIi8sNvU3yA/vybxFStZWPF3nMFuwb9a1FyHpFnD2
	XF+MYUmZEw66j3506j6Yjt+guqMq0w/oYNEuEawjI66lytfcitw9D0taAWAw3EQ=
X-Google-Smtp-Source: AGHT+IGlVhzdg6BEJq74bB738C+GzFeeJxLXCG0EBLUOp5tK03K/C7rVhvTUjS8hVAvJ2JEpJLkLcA==
X-Received: by 2002:a0d:caca:0:b0:607:82e9:17a8 with SMTP id m193-20020a0dcaca000000b0060782e917a8mr1506472ywd.7.1709019719496;
        Mon, 26 Feb 2024 23:41:59 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id x205-20020a0dd5d6000000b00604a3e9c407sm1659245ywd.41.2024.02.26.23.41.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 23:41:59 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so3159740276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Feb 2024 23:41:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9Ui4YMVZjQEBJpu1Q/P3WPO+auam/Z/6s5rXS6kuQJYSEJvI3yLYXCGe4DueoXobw90WvCctb2Ig+T8kWxLMqD66ixGXxnle+KL5MttYN
X-Received: by 2002:a25:aa47:0:b0:dcc:4cdc:e98e with SMTP id
 s65-20020a25aa47000000b00dcc4cdce98emr1469633ybi.5.1709019719163; Mon, 26 Feb
 2024 23:41:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=whZ=iA6DhijePcW-pJjZ8YD4T5qLpLKVSUT+4gWNm_0sA@mail.gmail.com>
 <6bb3f88b-bf57-442a-8b46-cb4784dd4cab@roeck-us.net>
In-Reply-To: <6bb3f88b-bf57-442a-8b46-cb4784dd4cab@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 08:41:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYjw9CEBUzxuJ-10wudK_mvJZgqP3gR4kuv-FDYBZ-Aw@mail.gmail.com>
Message-ID: <CAMuHMdVYjw9CEBUzxuJ-10wudK_mvJZgqP3gR4kuv-FDYBZ-Aw@mail.gmail.com>
Subject: Re: Linux 6.8-rc6
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

CC Kees

On Mon, Feb 26, 2024 at 6:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> stackinit
> ---------
>
> Seen with m68k:q800 emulation.
>
>     # test_char_array_zero: ASSERTION FAILED at lib/stackinit_kunit.c:333
>     Expected stackinit_range_contains(fill_start, fill_size, target_start=
, target_size) to be true, but is false
> stack fill missed target!? (fill 16 wide, target offset by -12)
>
>     # test_char_array_none: ASSERTION FAILED at lib/stackinit_kunit.c:343
>     Expected stackinit_range_contains(fill_start, fill_size, target_start=
, target_size) to be true, but is false
> stack fill missed target!? (fill 16 wide, target offset by -12)
>
> Report:
> https://lore.kernel.org/lkml/a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-u=
s.net/

I don't think these have ever succeeded before, see
https://lore.kernel.org/all/CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4Tzv=
stFg@mail.gmail.com

> I suspect this may be caused by the test assuming that stack growth is
> downward, but I don't really understand the test well enough to be sure.
> I'll disable this set of tests for m68k going forward, so I am not going
> to report the problem again in the future.

On m68k, the stack does grow downward.
AFAIK only parisc has a stack that grows upward.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
