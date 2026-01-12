Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE5359714
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224781; cv=none; b=p7yfJm/xFRlpcx8f0PnI59dfdHXnO6U1KeZq1y0oBg8A85Ob5LUmOsMEjC+tq4RqLOIuehmiTU6Bv0S6xxopZj5AumyyzLhhL6Fk40DpOK5aG9tUO02LOLkIox1ypyEO9UzYUHrljfKxfPKZj8Kq4AS300Xx4djlqWLiwUFYhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224781; c=relaxed/simple;
	bh=e1a/WyOo6dsGEJSbvkxlcazQ4b2Bmj0T2GRrkPO+tCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLTvkkfRxKqcwRUvWh1sdfibY6Ty2k00wC5fMIku+yN8umrGsSJY5AtsQFKspIKmKjfjigTxlJTzuKkgQZYlFEsasp8fl5kBsp5QoMqVdb3yaQ7u0RB4ITCcH3fNJNpUycgUZrTxNpAC6tiGkRiacpVJD14SXjn8nPKOgxPZyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-943d0cafe77so2044632241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 05:32:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224776; x=1768829576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNvK0TVmVkjPtTC5G8v6Nt9Z6O87bcFhpyFbarOKDIk=;
        b=ELRFFm7dZCU0fnv64rYFx5EpLPXAQJE6SApd4V77n0Pe2tvTDcZ8RfxHxsn9e7lHQo
         ivHeeSNXKsz+kTOoD9YxhcssqvMqheYfl4qNaP9aqaHbh7CgvNI7ru7N13tZELumlSJ3
         GHw6MlNSMbWlKhuzCF3e5dPjgMEE+0OvPnwFwvYp9jANFTn3cDID70W+7bbecVEEM7DR
         qX/gK0d3+/r7Ycm6a68+36qar9jNlkVhaWG6+SeMfDFrNIeVs/P2R6DlnxN27oh+a7hW
         3a4iy1SWV/D50JXV3g7SAzimlFmJXfbAxy6cKTMaWG6geeIBduWqpuweOb/bkr5jzxtG
         46TQ==
X-Gm-Message-State: AOJu0YyAJFH8YJ72VmIZdUpnKBvcjBgTxeFj1TWCsQuZEoEQyudBhA9g
	wGTyVcTeX4aRRblMusUwb1xzwqfa7ESIfT7dh9jh66AFAMHqdnnRd/lRfxIvxUVc
X-Gm-Gg: AY/fxX7ghLQ9xQ8q8zJ2Z1+eF+gWuzbRq/PdeB78oH7SD8JET9z2eU6A1hGgdJqn7Gn
	kRMyjLw1YQMS57BHHi2G36OdKBt0OdPzU+1F2fq1SZmp01GUgf9Odqi15pzoh7/fGEXB1q8MvcB
	WJ/VQ8RyltAjceAYQUO/JWJu0GOelUgzFa0t7rLG1Uojn7cn2tvDBC+zGyfZiWDq/2FuL7Jsr7g
	OKnXGufo9phBXMjWQr3bT9oQ3rBY8W7hwnwQFD2cwzjwg95hNvKQ3jxYq2HGLac9CT0usKfBCbH
	D2wvsm2MuptQ9kNllnnSeyHv0D+UjDXP6XkaJRdkheDXSrbmk2DfJhbTn5MygbpcPH/Mo4Kvimj
	2ueXzFFp2fWgqSqWBskhHfFuRPgKeZLEEsZx1jF1LJXHH7bT6DfzLv3/WcaXdcpm6ofkTU7Egiy
	KwFmGVXMwuWxfAS9Ryv9ZJWOC0wKUC9Bnz7RRMLJ+S6SGkBczLneHWbIegq3E=
X-Google-Smtp-Source: AGHT+IHIfx3//Ubz2nDE6vOcClu7cX5NovsZLwZUFQNcduCGpwWQcPClItgnRsfyV2z8omEQcDBTNw==
X-Received: by 2002:a67:e103:0:b0:5ed:bc1:823a with SMTP id ada2fe7eead31-5ed0bc1860fmr5471478137.33.1768224775384;
        Mon, 12 Jan 2026 05:32:55 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec770644d5sm17264704137.8.2026.01.12.05.32.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:32:55 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ed0b816d76so1675516137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 05:32:55 -0800 (PST)
X-Received: by 2002:a05:6102:dcb:b0:5ef:a666:5654 with SMTP id
 ada2fe7eead31-5efa66659e2mr3718129137.34.1768224774952; Mon, 12 Jan 2026
 05:32:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108060533.3891380-1-stefan.reinauer@coreboot.org> <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
In-Reply-To: <20260108060533.3891380-5-stefan.reinauer@coreboot.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:32:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6OrDfn79wOmR6dBWq6Qu6cq-Z--Sa3ncZkZkpbxeGPA@mail.gmail.com>
X-Gm-Features: AZwV_Qi0wsL7I6iD1ao2FLadckN-6Fzg_PPeyPvhVoPBBumNO0BwKQrbn8FIWu0
Message-ID: <CAMuHMdV6OrDfn79wOmR6dBWq6Qu6cq-Z--Sa3ncZkZkpbxeGPA@mail.gmail.com>
Subject: Re: [PATCH 4/5] m68k: Add vDSO userspace clock_gettime64 implementation
To: Stefan <stefan.reinauer@coreboot.org>
Cc: linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu, 8 Jan 2026 at 07:06, Stefan <stefan.reinauer@coreboot.org> wrote:
> Add the userspace vDSO code that provides fast clock_gettime() without
> syscall overhead on m68k.
>
> The implementation in vdso-clock.c includes:
>
>  - Custom 64-bit arithmetic helpers (shr64, divmod_1e9) to avoid libgcc
>    dependencies, since m68k lacks native 64-bit operations
>
>  - PC-relative addressing to locate the vvar data page and memory-mapped
>    timer register page relative to the vDSO code
>
>  - VIA timer reading with proper handling of the 0xFF wrap condition
>
>  - Seqlock-based synchronization to ensure consistent reads while the
>    kernel may be updating the shared data
>
>  - Syscall fallback for unsupported clock IDs or when vDSO timer
>    support is not configured
>
> The vDSO memory layout places the vvar page at offset -0x2000 and the
> timer page at offset -0x1000 relative to the code page, allowing
> efficient PC-relative access without needing absolute addresses.
>
> Currently supports CLOCK_MONOTONIC and CLOCK_REALTIME (both return
> monotonic time; wall clock offset support can be added later).
>
> Export __vdso_clock_gettime64 in the vDSO symbol version map.
>
> Signed-off-by: Stefan Reinauer <stefan.reinauer@coreboot.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/vdso/Makefile
> +++ b/arch/m68k/kernel/vdso/Makefile
> @@ -4,7 +4,7 @@
>  #
>
>  # vDSO object files (userspace code)
> -obj-vdso :=3D vdso-note.o vdso-tls.o
> +obj-vdso :=3D vdso-note.o vdso-tls.o vdso-clock.o

Somehow this change causes:

    m68k-linux-gnu-ld: warning: arch/m68k/kernel/vdso/vdso-tls.o:
missing .note.GNU-stack section implies executable stack
    m68k-linux-gnu-ld: NOTE: This behaviour is deprecated and will be
removed in a future version of the linker

GNU ld (GNU Binutils for Ubuntu) 2.42

> --- /dev/null
> +++ b/arch/m68k/kernel/vdso/vdso-clock.c

[...]

> +/*
> + * Timespec structure for clock_gettime64.
> + * Must match glibc's struct __timespec64 on big-endian 32-bit systems:
> + * - tv_sec: 64-bit at offset 0
> + * - padding: 32-bit at offset 8 (big-endian only)
> + * - tv_nsec: 32-bit at offset 12
> + */
> +struct vdso_timespec {
> +       __s64 tv_sec;
> +       __u32 __pad;
> +       __u32 tv_nsec;
> +};

Can'y you just use vdso_timespec(), like __vdso_clock_gettime64()
in include/vdso/gettime.h uses?

[...]

> +/*
> + * __vdso_clock_gettime64 - vDSO implementation of clock_gettime64
> + *
> + * Supports CLOCK_MONOTONIC and CLOCK_REALTIME using the hardware timer.
> + * Falls back to syscall for other clocks or if vDSO timer is not config=
ured.
> + */
> +int __vdso_clock_gettime64(int clk_id, struct vdso_timespec *ts)

warning: no previous prototype for =E2=80=98__vdso_clock_gettime64=E2=80=99
[-Wmissing-prototypes]
(or error with CONFIG_WERROR=3Dy)

Missing #include <vdso/gettime.h>, and you have to match the
signature of the definition there.

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
