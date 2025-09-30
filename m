Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01FBA3D
	for <linux-m68k@vger.kernel.org>; Tue, 30 Sep 2025 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218102; cv=none; b=HTdMNu6s3sp2cXuFBAnQYEhAiCZL2Kx+H92dpJENMsmGI4TUqA3A/nlKSjrGTzlz8gTgYOnRt3iGW9HwMpFeTstj0ZJ/kuvYryr4ud1uRmU4T1mR6i1ochtLC5SChUjBEZE0+TIYr51/d5zEx09W1aEz1wiWgc/14CyeAk2h+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218102; c=relaxed/simple;
	bh=fTwHavaF1SCVZfuafGtVN+0vomY8dJ9l2Z2f28ZmrAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AO9yOLxkRueHGiSyBilG+oPSjP/TGpQBYb3FZ6ZZCUbo0YombhlRSSXyU1fH087TG4nNpt4WpOXgnv9fXgnys0bvZ/o/Eh4UpMkK1giE8MvC6UsrUcXMs/p5Di/90S1IuJjtFX7mK7JeYutqfVcXUrqjEEgNX2SnwqtZLMb3dOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54c09f417e2so1849106e0c.1
        for <linux-m68k@vger.kernel.org>; Tue, 30 Sep 2025 00:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218099; x=1759822899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+5g3R4BFoKeU12X4z++S/cR17tgT9XO68T2ERc1SG0=;
        b=jbtigcRBQz7f6xyaut4oYlVppP+THaf1c75o5QiXmydQandTwsW86dD2u3nHw9FT81
         EVuei33ADZI6wZFwpEQvnTM70jWRGRTM5n1SXqSDQN046V74ORYV5G6SErEoakDQD56p
         8jl1wE8KZ2VS/WNT8T5lPHJLjmFakQH8YoRZ2r3bFvKAEnUBSHKnL37ArsHqXAf82les
         ncC58fsMMzp4Ejm6FrJxAltiytBPrvr2NVMH9Ehn0WWDOMkCasBzPdS91v/FcwoldvtO
         3eaG4i16WkOdtBJTkRv7WKuMEA6e7sc9x4c9czz3FgwcgtHNW5N0iTCxgVsT9fIhFa4Q
         seqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsI/e02uZFnTCrYVb9XYYKgsVNDSZixPZX+jKNf2fxa3Zq10yDEcc1nZlkGHZCp+VLGdoNgPSf9QUK@vger.kernel.org
X-Gm-Message-State: AOJu0YwAT23CDIZ6oTrJJu+xHjBPKLjqoowQ8dwFcDy9j4QUjRslaXky
	i00qxeynko/Bmb/ly2kYQz43IEoNDgs7pLSGfr6fzqNCB2Jcjpb3RoQOml+yFkYp
X-Gm-Gg: ASbGncvkgRnZUK1/lgtWTv/hYwi+s4tr+8pa4iWVvz88ymtL0WZbUmwXa+M4p0BlWC/
	+siSb+zp/q6g2xsUNYZ7Dtm+TOe9oLXdH6QTjtGkfw7sll4kd33B/IPWmNwdBI33ya1CkyrZvDw
	umgaci1AGilNEQ2I9amVqXKqwKIachyzzC0wrmJepXURplRxWXw2dHvce6zJfkP7isBuWFrhKT2
	kmLRlgjZdgh4lcTPeRxETG4+8l6PFzbCIm3j4QJtKJPpDBsc0Rs8cUWKUCjILmk1CDgPmTEJuiK
	BhPo2ZA+YvJwCJNsnZLZ5vqdN5iy2arTm9KzHq4n4a4FkU+2K62SLX8/k34LUorzAQ5KlQs0XwG
	0LslAB6N/HBEDUeiwp7QYwLfkmx0nOzhM1NYhFD5iqSjJwC4w5TWiZDFbvP5z5wHGXcj7+D04uK
	d2IwO69XOU
X-Google-Smtp-Source: AGHT+IFdkbpYGmd1VzPLbR2aAUnEvYv5MNYn4W8yWbvYdh2x3QYtVxftjx5Q/ojHGWsHBH5YaD36zw==
X-Received: by 2002:a05:6122:91f:b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-54bea22dc76mr7741828e0c.12.1759218098800;
        Tue, 30 Sep 2025 00:41:38 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d98d73d6sm2885046241.15.2025.09.30.00.41.38
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 00:41:38 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e30a19da78so4411179241.2
        for <linux-m68k@vger.kernel.org>; Tue, 30 Sep 2025 00:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBpaqVVUF8AAW9KBfG46vyQbteGAJnAhGhnFSGtvk6q47Y08Axtv28DbtlOiYfb2J9WUDfIdKjTEC3@vger.kernel.org
X-Received: by 2002:a05:6102:50a0:b0:59c:93df:4fe with SMTP id
 ada2fe7eead31-5acc8e96fdfmr7499750137.9.1759218097979; Tue, 30 Sep 2025
 00:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
 <CAMuHMdUgkVYyUvc85_P9TyTM5f-=mC=+X=vtCWN45EMPqF7iMg@mail.gmail.com>
 <6c295a4e-4d18-a004-5db8-db2e57afc957@linux-m68k.org> <57ac401b-222b-4c85-b719-9e671a4617cf@app.fastmail.com>
 <86be5cf0-065e-d55d-fdb6-b9cf6655165e@linux-m68k.org> <ec2982e3-2996-918e-f406-32f67a0decfe@linux-m68k.org>
In-Reply-To: <ec2982e3-2996-918e-f406-32f67a0decfe@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 09:41:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1eGkq_kOPTGbfDt4E2V5zCTdYc_BGJg-56-ZUS353YQ@mail.gmail.com>
X-Gm-Features: AS18NWAfx6HdJiP6HG3pvvDkgqXmfVsm3y8cTCSy1KPMOu0E9WrRTl3w7eUQ96A
Message-ID: <CAMuHMdV1eGkq_kOPTGbfDt4E2V5zCTdYc_BGJg-56-ZUS353YQ@mail.gmail.com>
Subject: Re: [RFC v2 2/3] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-m68k@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 30 Sept 2025 at 04:18, Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 23 Sep 2025, I wrote:
> > ... there's still some kmem cache or other allocator somewhere that has
> > produced some misaligned path and dentry structures. So we get
> > misaligned atomics somewhere in the VFS and TTY layers. I was unable to
> > find those allocations.
>
> It turned out that the problem wasn't dynamic allocations, it was a local
> variable in the core locking code (kernel/locking/rwsem.c): a misaligned
> long used with an atomic operation (cmpxchg). To get natural alignment for
> 64-bit quantities, I had to align other local variables as well, such as
> the one in ktime_get_real_ts64_mg() that's used with
> atomic64_try_cmpxchg(). The atomic_t branch in my github repo has the
> patches I wrote for that.

So cmpxchg() and friends should not take a volatile void *, but (new)
properly-aligned types, using the new _Generic()?

> To silence the misalignment WARN from CONFIG_DEBUG_ATOMIC, for 64-bit
> atomic operations, for my small m68k .config, it was also necesary to
> increase ARCH_SLAB_MINALIGN to 8. However, I'm not advocating a

Probably ARCH_SLAB_MINALIGN should be 4 on m68k.  Somehow I thought
that was already the case, but it is __alignof__(unsigned long long) = 2.

> ARCH_SLAB_MINALIGN increase, as that wastes memory. I think it might be
> more useful to limit the alignment test for CONFIG_DEBUG_ATOMIC, as
> follows.

Did you check what would be the actual impact of increasing it to 4 or 8?

> --- a/include/linux/instrumented.h
> +++ b/include/linux/instrumented.h
> @@ -68,7 +68,7 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
>  {
>         kasan_check_read(v, size);
>         kcsan_check_atomic_read(v, size);
> -       WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
> +       WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1) & 3));

I'd make that an arch-overridable define instead of hardcoded 3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
