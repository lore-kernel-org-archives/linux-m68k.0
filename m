Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD23845D5
	for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Aug 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743910; cv=none; b=kWaqz9S+Je0oFsepRWVDuS3gILvrsiTu6dTA/9zEgA7j3g7mCrSTQSOqSkymL9uBPx0FFxk7JX6oB8xvlKYp+qghcTVetujfSyrLG1kO9+CBQmiqbm07OWJCIDVC/3kgBbT5q69WC3MHUsMBGMlLaaYWUe6dCXfuuU24ex/LbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743910; c=relaxed/simple;
	bh=8V+wpSjSJxV2AAeXfghH3agN5TnxowPHY0yZNqBqvqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJISNw2xd08jg4VzCfIGJqwE/Dj0uZ/5hNh5QXuIo6hCtX8gKfpTor+Y716A8xs2DgFeS7O/zfmtdoeobTNzMDQ155j/4Qmj5ZwCjb05SFdIcudRO8QUjqQ4gn71yHV2IxRmD4Fgjan4OqmTr2uM4UxDZhHzA/expbdO7PBHWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-75609e844faso1809839137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Aug 2026 00:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743907; x=1786348707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXCo4RuUxd0lbnvmUYal4SwmjMg62SVJ980l3UhWMsE=;
        b=T/c+cVP41PZQpKU7RgtFqOHRpoNjl+a2sKMTTGaxTz9jfEsYcgS4TQhA0m5uHhYc/l
         zxhk1txtb6JOuuPFojpbC2d0UOLjhG5fuLTWeE0N7rSAh0usKISCjWCG7Gep19lCiCbi
         DcplocbEOXFp1Kdcnv3eWuOwQM/JBDo0uv2GtI37n7OMPCh74Jll8luGGbbbE02wFjd5
         JahJu4Wj5ARcD37hQkxN52Y3MbCRRMhuAG44fqUq2irBe+D/p5D6zYYtQ+e5VcM3CbO+
         3WQFMQZyLtc7sYa1fOUznuTsJQFSIMEltl9Utw5L148I35jV8S7Dj7U/9mFwOQDO1yV3
         os9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqL8n9q4d0m2XCrW6ZIz9xI8do5TL51f9v0XW43x/pGFHHQupvXmcGZHAoT7XKoF18EObn8mrGu5TzR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwUO5dbIVKOmSYr9iSbxCkDCGW/AdI+q3B7c+TAIg+KIAdIbReX
	wtnHvmHvH0OmQfPjaALDLODJqE/QffJHeZqsb+PDQvzbi9/C9bVWwoN6PxuleBNB
X-Gm-Gg: AR+sD108arUni0m4BoJL20TDmQnKJv/8/Fv6YhHmeKpJMxRAeoAl1xmmG66XvIAKdYv
	dA2cn5/w+WxA+nTh7gzyrtVL3yqBbJiTc/FDGKS1qkaIDfH425NtrehWOd5P2YaLeWlcIV3LF3O
	2rseRnfHZWTijTpCTGPjLsjg72Crv+pG8ZR7rQY9vinzEPTMIFjoq4KEKMQOveZLU+EpFX+VBuj
	0E/wch6VNvQSV9Y1+pFL94AXpevgg1bzfSSrZDma7JVybqpBLUSeWykrpi+sR7IFu57qUXkaADS
	HkTMN+u4YPufnqeMMk9at5cYG0WVbmsgGhvVvJxC3wsPI2w7RaJvwaglxLe6tuVwllAWeXLtFJI
	9eOCv+UJdf2Bkw1S89Lrhcoh2bQbGnDQTdCkrWZGoPNmdu9UkKCPN+lPU3VP+Drjbngp0f9aMMJ
	7ZfsoTNP8oclymzNyKlje/dN2s/+6U1gEYQxlYPADNsIP7tS6zLK1JrchmQS3MFhsyfFI13Z41v
	9rlgLRPr+LJXXmnAhaXJQPOhw==
X-Received: by 2002:a05:6102:a82:b0:747:560c:e7e0 with SMTP id ada2fe7eead31-758f8774aebmr2313457137.1.1785743907526;
        Mon, 03 Aug 2026 00:58:27 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e61dc0a3sm6147622241.4.2026.08.03.00.58.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 00:58:26 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso2324869241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Aug 2026 00:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoyFj+J0sVTcMxrHuF1pzxrk+nAGOOdu6dlxA5lBmgILhYbPHgO95uBi4wKMiPeiW8STTF3090aSrGI@lists.linux-m68k.org
X-Received: by 2002:a05:6102:34cc:b0:734:54fa:971d with SMTP id
 ada2fe7eead31-758f8e7bac6mr2500996137.7.1785743906274; Mon, 03 Aug 2026
 00:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094950.1988084-2-ukleinek@kernel.org>
In-Reply-To: <20260731094950.1988084-2-ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 09:58:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGKX=3cfOrLWp1uSHX76xf1-=C0+GVCXkA8JTqNPg-ew@mail.gmail.com>
X-Gm-Features: AUfX_myMd8uGu8VFyUdqwUmkIhPBf84bjH1LOjlUrarN31zaAecqhqVwKBevqro
Message-ID: <CAMuHMdVGKX=3cfOrLWp1uSHX76xf1-=C0+GVCXkA8JTqNPg-ew@mail.gmail.com>
Subject: Re: [PATCH] m68k: Define NR_CPUS to 1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Gao Xiang <xiang@kernel.org>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

Thanks for your patch!

On Fri, 31 Jul 2026 at 11:50, Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> w=
rote:
> This fixes a Kconfig warning
>
>         fs/erofs/Kconfig:137:warning: range is invalid
>
> which originates from EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS using
> NR_CPUS which up to now didn't exist for ARCH=3Dm68k. All other
> architectures define this symbol, so fix the outlier.

Apart from the Kconfig warning, this also
  1. Breaks pressing "ENTER" in "make oldconfig" to apply a sensible
     default value, just repeating the question ad infinitum instead
     (the default is 16),
  2. "make olddefconfig" sets it to literal NR_CPUS, which is invalid, too.

> Fixes: c9b47e6b2311 ("erofs: cap LZMA stream pool size")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -549,6 +549,10 @@ config CACHE_COPYBACK
>  endchoice
>  endif # HAVE_CACHE_CB
>
> +config NR_CPUS
> +       int
> +       default "1"

While this does fix the issues on m68k, I don't think this is the
right fix:
  - NR_CPUS depends on SMP on most architectures, so you do not get
     the "range is invalid" warning on non-SMP, but NR_CPUS is zero.
    Hence I managed to reproduce the two issues above (albeit 2 with
    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0) with a non-SMP
    ARM config.
  - Kconfig logic using NR_CPUS typically includes a check for SMP, too.

So I think EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS should be fixed
instead.

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
