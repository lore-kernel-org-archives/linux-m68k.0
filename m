Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E756450
	for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705997651; cv=none; b=TZH1aDVqoS6ILbPsEhQ6YbxEK0ee46eJEpnMQ4bkFS4EscYsCdV+Yn0ZpspAt8dr1UWWrIVan66CcCV0P8Az+m3WfQ5g/iNXFtqn4/M+1ob0306NdkZNhBRkq8aMCqlwsolEHbmh+M/L307icmvxY1HspNtPdDcRMSn8qNKWtTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705997651; c=relaxed/simple;
	bh=nzuOFA+tLJ46VDzCzSWAXp7X7RWGYzJ+SUPa4Tl1kYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5obw34hX38S2NYJWuvYVTZjBX24rysPAbb7GCOXPJ5rR7yVbywe9ElsH85SkBaAOPW4wZhMj9cS1lJKDbfeYDSjmK3TztnKtXQCehAx2ghzS6c9YRgyEfpWGK1NhqYIXk2obBx2Sd9aIx7ZYWTAm1okLC131vpqQ7NhunKVCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ffa694d8e5so27026987b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 00:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705997647; x=1706602447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfMZ1E3cUmfIUyRbJhcNUyxEYBNYe0N54hD1T9iqNv0=;
        b=fOFwPKag21omi0NNFLf5AMwfxjemDBPkzZcnCjPlCNubNUGHqu8E1BE8Hv9558HIHt
         r0Cg1DFxEO3xr6vtd6jjoT+oiG7ehrHuK+Vv/1NP1bMleMWAqClg0XDRSGsY7AfNUfGT
         NuYQ/ccQkGgQ0TGSt5eqXO/1Mis880g0iKm/9ez9LputO/buIOUY9/PwnNfFe3Uhguvn
         NMrd1Hk1DXz6KMh//9/+h3tc9JDZsXWjE8XdIWSalEt89+K0gqOpgyEBbSP51zbkdl3H
         xgLRAziApaoYR0MuTm1gGmipiHWY7siGu/HtKxWdiCwqw9FoY005aZbd3mlv9kwI2z4B
         Lm0g==
X-Gm-Message-State: AOJu0Yx9/Qlepd6vz4BnRiwbBZQt3R/l9Jhn3kCnJ1VjEvvO8aDVkssZ
	pS2GgcilmGHP/WVdkOGIspSxv2roQxe7vdIzZHo11XHXVxluiWS+Pw2/UAzsNOI=
X-Google-Smtp-Source: AGHT+IG87df2jrEaFswihUUt7/M3KBiY6MXKN4aCpk3fqGepByyYBqWCsK9nHTN5fXZF6TslSVTHaQ==
X-Received: by 2002:a81:5f46:0:b0:5ff:a885:665 with SMTP id t67-20020a815f46000000b005ffa8850665mr4072724ywb.40.1705997647427;
        Tue, 23 Jan 2024 00:14:07 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id x70-20020a81a049000000b005ff5fc95e2esm5258751ywg.142.2024.01.23.00.14.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 00:14:06 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ffcb478512so15288747b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 00:14:06 -0800 (PST)
X-Received: by 2002:a81:6dd7:0:b0:5ff:9175:b102 with SMTP id
 i206-20020a816dd7000000b005ff9175b102mr4257992ywc.25.1705997646645; Tue, 23
 Jan 2024 00:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122235208.work.748-kees@kernel.org> <20240123002814.1396804-27-keescook@chromium.org>
In-Reply-To: <20240123002814.1396804-27-keescook@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jan 2024 09:13:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWa9tXQRHkkX-W+5n8kuCvEFZdsfStPtYGA0MZpTGX79Q@mail.gmail.com>
Message-ID: <CAMuHMdWa9tXQRHkkX-W+5n8kuCvEFZdsfStPtYGA0MZpTGX79Q@mail.gmail.com>
Subject: Re: [PATCH 27/82] m68k: Refactor intentional wrap-around calculation
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Liam Howlett <liam.howlett@oracle.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Hugh Dickins <hughd@google.com>, linux-m68k@lists.linux-m68k.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Tue, Jan 23, 2024 at 1:35=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
> In an effort to separate intentional arithmetic wrap-around from
> unexpected wrap-around, we need to refactor places that depend on this
> kind of math. One of the most common code patterns of this is:
>
>         VAR + value < VAR
>
> Notably, this is considered "undefined behavior" for signed and pointer
> types, which the kernel works around by using the -fno-strict-overflow
> option in the build[1] (which used to just be -fwrapv). Regardless, we
> want to get the kernel source to the position where we can meaningfully
> instrument arithmetic wrap-around conditions and catch them when they
> are unexpected, regardless of whether they are signed[2], unsigned[3],
> or pointer[4] types.
>
> Refactor open-coded unsigned wrap-around addition test to use
> check_add_overflow(), retaining the result for later usage (which removes
> the redundant open-coded addition). This paves the way to enabling the
> unsigned wrap-around sanitizer[2] in the future.
>
> Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f185365=
94 [1]
> Link: https://github.com/KSPP/linux/issues/26 [2]
> Link: https://github.com/KSPP/linux/issues/27 [3]
> Link: https://github.com/KSPP/linux/issues/344 [4]
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Liam Howlett <liam.howlett@oracle.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/sys_m68k.c
> +++ b/arch/m68k/kernel/sys_m68k.c
> @@ -391,10 +391,11 @@ sys_cacheflush (unsigned long addr, int scope, int =
cache, unsigned long len)
>
>                 mmap_read_lock(current->mm);
>         } else {
> +               unsigned long sum;

"sum" sounds like this is a dummy variable, to please the third
parameter of check_add_overflow()...

>                 struct vm_area_struct *vma;
>
>                 /* Check for overflow.  */

I agree with Liam: please drop the comment.

> -               if (addr + len < addr)
> +               if (check_add_overflow(addr, len, &sum))
>                         goto out;
>
>                 /*
> @@ -403,7 +404,7 @@ sys_cacheflush (unsigned long addr, int scope, int ca=
che, unsigned long len)
>                  */
>                 mmap_read_lock(current->mm);
>                 vma =3D vma_lookup(current->mm, addr);
> -               if (!vma || addr + len > vma->vm_end)
> +               if (!vma || sum > vma->vm_end)

... Oh, it is actually used. What about renaming it to "end" instead?

>                         goto out_unlock;
>         }

With the above fixed:

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

If you want me to take this through the m68k tree (for v6.9), please
let me know.
Thanks!

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
