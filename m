Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103421667F1
	for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723301710; cv=none; b=Vav+7wlbThqybNefaSnpjSUVEdUypBDlDAd5fMaK9kwYvb9528IFUS8nvqGTQaOWnjMNq3IWeeSLMzFOZZ2nzBDVb47sal8l/FJfe18lntpk/D/OG5Rl5vPtljmLzAtyoYng04BYO80DUhZSKvIQVDql0WSHtBLXoyD7AKgiL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723301710; c=relaxed/simple;
	bh=ROi86op9+HhiiZfwGZqTkNsrz7ISpudg5uB31tBrbBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6i8++zNEeVkelphPbtkpdk0Z3wcCIyPCK9+01iIlRJPoK1H8aqbgpB3yPn6VyJ2R2dQvqT7DErveLZ0+hCcm5+UAkwtZL/wTT6DvGiFdXRDaGqaRja4fcwRp9pUNvEs9gB5sLQaKupTZJlaAcEUiPoQPvevYghhOxbN5qx9Qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-654cf0a069eso27961547b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 07:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723301706; x=1723906506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRACj4wO9O3XggjnuGoh49or/oZGkIBmwwrO7YmkKcs=;
        b=p0uno7UhdfLHHkoPOR4rkzyg0eNNmLKs/bPEmgl7fU1GESmBcnpHdtAV51DKKLSgp4
         iyViiOXnYjy4+qAhmMZhzmlQBbnAdWGmj+6ZMoejc72OagL+DVKsaUI2anM9LIblRTqw
         +5Ah9ZFhQ7TEBY4C8M73kBMD5vBhOfadY1ce3nqx9/GVB4qqJTrJG5y2ivNjJQIWbFg6
         40Nrb69PeJZMNiPY5yXiAOFO7c7DBSxF/eZycXoJtnxwlpPM1/xB9uFkXcrW4V4vlryQ
         PLyGKQvK3wQKepf3cefabQyAbbWhozSYVirfRhMAUAuBopiGV29wYBxEXEBUItqMLsn5
         t19w==
X-Forwarded-Encrypted: i=1; AJvYcCUmCu/PwJflEWvqE/xEHo5z/i2APQ8HdzsB4w89rBhsipUdBRI1UjVLlKOOeLFe0BNqy5440tB4ZIT23pJvmu+kuDK9ZpCCY2LzfOWFW/bo
X-Gm-Message-State: AOJu0YzNHyQnDSvrfkKv5m4KJq5LOsCnDEyxruKDxsr5NIMEPBKwQIBn
	yxbe/FjLBbHh4ZX3LDy03zotQ9nmU2pIwMXDe/4uzRZtdIraKcJ4cp8wAsnX
X-Google-Smtp-Source: AGHT+IHPbcWAi32VSa/CutlJ2wJ9mYcEyZaHviy2xVD9pGJZI/wJ46tKZ0DF+Nxed4JkVexPk9MjrQ==
X-Received: by 2002:a05:690c:5703:b0:64a:e2ab:be33 with SMTP id 00721157ae682-69ec5e4bbc7mr45967007b3.22.1723301706336;
        Sat, 10 Aug 2024 07:55:06 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a4800ab6sm2759597b3.131.2024.08.10.07.55.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 07:55:05 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0bf677e0feso3107467276.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 07:55:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWx1jEv63po22mXO7KLFFkng3h1rbqUSDNe7QK5UhI1hL6nXrc87+RX1HYulXFeasSyirWlzqelzUUHpXM4c3/0JSOYYeBLBzIqT5TGXVl3
X-Received: by 2002:a05:6902:a09:b0:e0b:2e04:2c10 with SMTP id
 3f1490d57ef6-e0eb9945d87mr4221061276.18.1723301705611; Sat, 10 Aug 2024
 07:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ac8100050f448caa1dc46c131079e615e73021a4.1723273396.git.fthain@linux-m68k.org>
In-Reply-To: <ac8100050f448caa1dc46c131079e615e73021a4.1723273396.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 10 Aug 2024 16:54:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURykHCL1KEvgK=yC5sW-DAkEo+C+bbOBMUsbhD8aPSMw@mail.gmail.com>
Message-ID: <CAMuHMdURykHCL1KEvgK=yC5sW-DAkEo+C+bbOBMUsbhD8aPSMw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix kernel_clone_args.flags in m68k_clone()
To: Finn Thain <fthain@linux-m68k.org>
Cc: Christian Brauner <brauner@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Stan Johnson <userm57@yahoo.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Sat, Aug 10, 2024 at 9:14=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Stan Johnson recently reported a failure from the 'dump' command:
>
>   DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
>   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
>   DUMP: Label: none
>   DUMP: Writing 10 Kilobyte records
>   DUMP: mapping (Pass I) [regular files]
>   DUMP: mapping (Pass II) [directories]
>   DUMP: estimated 3595695 blocks.
>   DUMP: Context save fork fails in parent 671
>
> The dump program uses the clone syscall with the CLONE_IO flag, that is,
> flags =3D=3D 0x80000000. When that value is cast from long int to u64 by
> m68k_clone(), it undergoes sign-extension. The new value includes
> CLONE_INTO_CGROUP so the validation in cgroup_css_set_fork() fails and
> the syscall returns -EBADFD.
>
> Avoid sign-extension by adopting the idiom used in kernel/fork.c when
> casting clone flags.
>
> Cc: Stan Johnson <userm57@yahoo.com>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Closes: https://lists.debian.org/debian-68k/2024/08/msg00000.html
> Fixes: 6aabc1facdb2 ("m68k: Implement copy_thread_tls()")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/process.c
> +++ b/arch/m68k/kernel/process.c
> @@ -117,7 +117,7 @@ asmlinkage int m68k_clone(struct pt_regs *regs)
>  {
>         /* regs will be equal to current_pt_regs() */
>         struct kernel_clone_args args =3D {
> -               .flags          =3D regs->d1 & ~CSIGNAL,
> +               .flags          =3D (lower_32_bits(regs->d1) & ~CSIGNAL),

While other architectures (nios2, sparc, generic code) do use
lower_32_bits() in similar code[*], IMHO this is misleading here, as
regs->d1 is never 64-bit.  What you really want is to avoid the sign
extension in the promotion from signed 32-bit to unsigned 64-bit.
So I think a cast to u32 makes more sense?

>                 .pidfd          =3D (int __user *)regs->d3,
>                 .child_tid      =3D (int __user *)regs->d4,
>                 .parent_tid     =3D (int __user *)regs->d3,

[*] The shared sparc32/64 code uses lower_32_bits on unsigned long,
    which is 64-bit on sparc64. Likewise for the generic code in kernel/for=
k.c.
    The nios2 code is a bit moot, as clone_flags is already unsigned, and
    unsigned long is always 32-bit on nios2.

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
