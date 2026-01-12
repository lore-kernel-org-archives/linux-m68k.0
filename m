Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF4280309
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218456; cv=none; b=Ewn/HhdEzLxScu+94RtXBUftb1/RZOxByw8NZ8/sQvr7NU/YgZ9kdnaqq8k0tPdO4XqnCt7tWKgFIzqMynnbtZxb3dqI/L1v3iF8PCUKk9p3dC0ewt4mLYrwPxf9rRYKwA1bYMphW837QLWlt0hSeQsiVg0NY6Q4lciJ/8vWRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218456; c=relaxed/simple;
	bh=D5b+/UDZi6cpQxIjAhIoKxqvZn0FuBHcpRu1YxIN9n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMiINp+m6N0AR6wUWCouI5o41IChfN6ELQweHyXEK6aWQ/+h2ftSNoKjUAtCMnXMqvkpmEAd9V8bDSWCGWWXY296XBd0XIeMqwd9Mp2qqR+0Cmc6o2Ej9mIJHS2yYGxsAJ33454g3jIFuusKZS7GMsZqf+sbDoulR+t855l8niM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93a9f700a8cso2164387241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 03:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218454; x=1768823254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVuOuOb7DoSSZcXZY9h1+da8h1pp/KIIY3XupH0MXmE=;
        b=gLvLKyyyN6U59DL1We9mPZ2IP8mFz0Vo4VcCcJtt2c58UOo+fFXs7Un38yubnd4cJm
         HG5zVyaSduIvzsk8a/YYuufD8XpfwItOJiJRV2FrUngoCxBwWGZndr/ho/91yBR6Z/gs
         pmF4o8p+wwUPSioXUdebMavGWwgsw/iEv/u2vXAxBv3XIVmS30oFDQdWf3V/xfj6XEHC
         8KqIjPT/c82yRAMxgvMsqiHqQbRP4xJhsx0jlmGStA7sMfpzb1eeUkHNSHR6LRPuvOlc
         vZe1CR+ijt5d0w+wSQTk4BNc79haMrDOrh+7XcFv2z18ALoCGExtcOATA/NEIPlN7YvA
         E8TQ==
X-Gm-Message-State: AOJu0YzmFWsBxfrLItTfulR0868QO2KEElTH3H5Vw+Fa2G7BttwWHLSK
	ClTVtkV5FwDlGabcq4IPrgQ+5dKwgY46DRN917KKuQGRIyRqqMl+pfta9BWREoP2
X-Gm-Gg: AY/fxX5qatk2nH/wFALpEc58/NY0uUfMETuh3srWeSYt94shcE66zZx+iSHW6T1WMMb
	fAfxeYcQfQHZiuhg7B4dDlhahht8eOJdE0GXHz3y9g5EjKMaW1SWPv2v0BTISYBu9brJY2LQFrB
	DCnWjXyxZp8lSu8I6j6PuaaAj/Yj/iF4sBM8DVAirMiPX+oK+XWBmW0PRTAnZHgHWolRUAJgD8V
	sA28S/WJd7cdOjYxbXyBhvSSxgt42jNzrykAJXMr69Hvym3uU9lE95ZQNlkgZhc9GkKnBhoUSfy
	RL5kcpcp9k4TaPAQ2OVxOY/9hUjhPXK7yJtXs6cZXJu2EkYuGvF6TzD3IyacVhhojKWnaw0oc2c
	fd86tEZfv3w14PT4T8H04FU8PaP0MKLNjeM8PU+GBVWtYQhDWvIOcU9gkD9dsYRp3Otm4w2jWhO
	gj9SjhDBRWGswh2me6pIeYWTCjW4bUG3cZVhQpnGn0P5LgqM+it1H2GUhPsaU=
X-Google-Smtp-Source: AGHT+IGCBnqvBQblfoBCgzTtq039BNYHCZ8GZF8QYGuNxOPwrSMawgSTkwZd6bdwVyEXc4rWjnNMTw==
X-Received: by 2002:a05:6102:6443:b0:5ef:aeff:82f9 with SMTP id ada2fe7eead31-5efaeff837fmr2225408137.35.1768218453811;
        Mon, 12 Jan 2026 03:47:33 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124e97b1sm16083435241.15.2026.01.12.03.47.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:47:33 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93a9f700a8cso2164381241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 03:47:33 -0800 (PST)
X-Received: by 2002:a05:6102:3352:b0:5dd:b2a0:ac69 with SMTP id
 ada2fe7eead31-5ecb647e8e1mr6519597137.5.1768218453220; Mon, 12 Jan 2026
 03:47:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org> <20260108060533.3891380-2-stefan.reinauer@coreboot.org>
In-Reply-To: <20260108060533.3891380-2-stefan.reinauer@coreboot.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 12:47:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtdVWSaTUkbAaKmDsc6PrN=kMH2XpgQ6S_Fm0AZuW9cg@mail.gmail.com>
X-Gm-Features: AZwV_Qj0NQw6FV_NrcEdiHQAE1JIwvDnA47X6WTLfFkjrUBosUXIFCrdUFDnL40
Message-ID: <CAMuHMdXtdVWSaTUkbAaKmDsc6PrN=kMH2XpgQ6S_Fm0AZuW9cg@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68k: Add vDSO support for fast TLS access
To: Stefan <stefan.reinauer@coreboot.org>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

On Thu, 8 Jan 2026 at 07:06, Stefan <stefan.reinauer@coreboot.org> wrote:
> Implement a vDSO (virtual dynamic shared object) for the m68k
> architecture to provide fast userspace access to the thread-local
> storage (TLS) pointer without requiring a system call.
>
> The vDSO consists of two mappings installed during execve:
>   - A data page ([vvar]) mapped read-only to userspace containing
>     the TLS pointer at offset 0, updated by the kernel on context
>     switch and set_thread_area() calls
>   - A code page ([vdso]) containing a minimal ELF with the vDSO
>     symbol __vdso_m68k_tls for identification
>
> This significantly improves pthread performance on m68k systems with
> MMU enabled, as TLS pointer access is extremely frequent in threaded
> applications. Instead of trapping into the kernel, userspace can now
> read the TLS pointer directly from the vDSO data page.
>
> The implementation follows the standard kernel vDSO patterns using
> vm_special_mapping with fault handlers for the data page and
> arch_setup_additional_pages() for installation.
>
> Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>

Thanks for your patch!

> --- a/arch/m68k/sun3/mmu_emu.c
> +++ b/arch/m68k/sun3/mmu_emu.c
> @@ -363,7 +363,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, int read_flag, int kernel_fault)
>                 crp = swapper_pg_dir;
>                 context = 0;
>         } else {
> -               context = current->mm->context;
> +               context = current->mm->context.id;
>                 if(kernel_fault)
>                         crp = swapper_pg_dir;
>                 else

Missing:

--- a/arch/m68k/sun3/mmu_emu.c
+++ b/arch/m68k/sun3/mmu_emu.c
@@ -215,7 +215,7 @@ void clear_context(unsigned long context)
                if (!ctx_alloc[context])
                        panic("%s: context not allocated\n", __func__);

-               ctx_alloc[context]->context = SUN3_INVALID_CONTEXT;
+               ctx_alloc[context]->context.id = SUN3_INVALID_CONTEXT;
                ctx_alloc[context] = (struct mm_struct *)0;
                ctx_avail++;
        }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
