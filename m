Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8F5EE9D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706017394; cv=none; b=HDGonS6UzyDXbLHTMktNX5fBNWohCAUlWoBO7hDf6zPcvOGsg5Jk2xlkkjEnT3gsL7yOyj/KHMbV0DbHgOdfCnz4AtgsTktjfJ3eFqG3TkQY8YT9vBsDvTdv2S8AGjUOIEtSzv+FafxI/EsLSvyP/Q7eP8Pgr5FGkoh2TuS6hQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706017394; c=relaxed/simple;
	bh=Jb9itl957EFVoNO5FWQy9uocQU42xFzLex48PwPhTqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5dXAoPySZEJvKmVcbBbxLfs8MNhUStgCTHErPHuGXQmLs3UrreE0JlKwmG0zXiIXTslQgtxwVxAph2yIES/usxCBfDZHXzcSUpSxgy0Oh/3cGSPVEYlVPcMhn/HEAi1/zEqXsGo1Wqx/65R7Hfy3MfMVTEInVJA2dqqcPbwy9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso43943657b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706017391; x=1706622191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta8VXhfkrMNIwJSy/HBWlj17p8HnvVLoiI7h5yLdjII=;
        b=PBCQdahTPpXPgNb1PNPj+CE3pF1yu9rsjgEkEeuTACuSGOPB9/9DwVKBhoIExkSA/B
         7ojGs+EHFeHizYmNIAxFTHhIkv8ePaBAaV68SAtaE5Wvaxv1fKoO31TdvOAKg+2JM87C
         XQxYf0BCjg7I2c4WUrYb86RWl+YaQ03zOI08xI7bzvP8KEMEHFipL0ZbYZVfQrpynClO
         sdbrx9HYrHAoyiBpT2Go4qfXIfBIMgSZEWhxCCFv3Die5QX4/dG8JBOuqlBCt3FhyEGj
         HwXCkSa6yY+jNkmJ54tyvxn7FdYBlGvO2kvzt1IfHWUZQJM7412we2LMUoDIqNl5qz/X
         BeIg==
X-Gm-Message-State: AOJu0YxVOBHJ1m1EfvSUyqBTZLPRwDgRHZmPSxhj+TKkIIOAmPY1w9Q6
	jU3FmWsJfPw0djgGNh5bbwx5zXwTKCy3E9cae5+HxlBKLvEQExe66w3+dg6Gg5w=
X-Google-Smtp-Source: AGHT+IFg/qkT115Ywul6WnbOdnVunmigFC1NadRPQn9xXKyVTUAo0dAomWzMm4xMgpkro506SO40ZQ==
X-Received: by 2002:a0d:f5c3:0:b0:5fb:da77:af07 with SMTP id e186-20020a0df5c3000000b005fbda77af07mr4704580ywf.32.1706017390944;
        Tue, 23 Jan 2024 05:43:10 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id r184-20020a0de8c1000000b005ff56b2b690sm5777539ywe.137.2024.01.23.05.43.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 05:43:10 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ec7a5a4b34so42079437b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 23 Jan 2024 05:43:09 -0800 (PST)
X-Received: by 2002:a0d:f5c3:0:b0:5fb:da77:af07 with SMTP id
 e186-20020a0df5c3000000b005fbda77af07mr4704548ywf.32.1706017389477; Tue, 23
 Jan 2024 05:43:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122235208.work.748-kees@kernel.org> <20240123002814.1396804-27-keescook@chromium.org>
 <CAMuHMdWa9tXQRHkkX-W+5n8kuCvEFZdsfStPtYGA0MZpTGX79Q@mail.gmail.com> <c915b476-784c-4d64-8063-f18837350568@helsinkinet.fi>
In-Reply-To: <c915b476-784c-4d64-8063-f18837350568@helsinkinet.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jan 2024 14:42:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhPV0-BCe-90oh5tpwt1S8bOQsyRE+vemVGORSfS-gBg@mail.gmail.com>
Message-ID: <CAMuHMdVhPV0-BCe-90oh5tpwt1S8bOQsyRE+vemVGORSfS-gBg@mail.gmail.com>
Subject: Re: [PATCH 27/82] m68k: Refactor intentional wrap-around calculation
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Liam Howlett <liam.howlett@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, linux-m68k@lists.linux-m68k.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eero,

On Tue, Jan 23, 2024 at 2:30=E2=80=AFPM Eero Tamminen <oak@helsinkinet.fi> =
wrote:
> On 23.1.2024 10.13, Geert Uytterhoeven wrote:
> > On Tue, Jan 23, 2024 at 1:35=E2=80=AFAM Kees Cook <keescook@chromium.or=
g> wrote:
> >> In an effort to separate intentional arithmetic wrap-around from
> >> unexpected wrap-around, we need to refactor places that depend on this
> >> kind of math. One of the most common code patterns of this is:
> >>
> >>          VAR + value < VAR
> >>
> >> Notably, this is considered "undefined behavior" for signed and pointe=
r
> >> types, which the kernel works around by using the -fno-strict-overflow
> >> option in the build[1] (which used to just be -fwrapv). Regardless, we
> >> want to get the kernel source to the position where we can meaningfull=
y
> >> instrument arithmetic wrap-around conditions and catch them when they
> >> are unexpected, regardless of whether they are signed[2], unsigned[3],
> >> or pointer[4] types.
> >>
> >> Refactor open-coded unsigned wrap-around addition test to use
> >> check_add_overflow(), retaining the result for later usage (which remo=
ves
> >> the redundant open-coded addition). This paves the way to enabling the
> >> unsigned wrap-around sanitizer[2] in the future.
> >>
> >> Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f185=
36594 [1]
> >> Link: https://github.com/KSPP/linux/issues/26 [2]
> >> Link: https://github.com/KSPP/linux/issues/27 [3]
> >> Link: https://github.com/KSPP/linux/issues/344 [4]
> >> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Cc: Liam Howlett <liam.howlett@oracle.com>
> >> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >> Cc: Hugh Dickins <hughd@google.com>
> >> Cc: linux-m68k@lists.linux-m68k.org
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/kernel/sys_m68k.c
> >> +++ b/arch/m68k/kernel/sys_m68k.c
> >> @@ -391,10 +391,11 @@ sys_cacheflush (unsigned long addr, int scope, i=
nt cache, unsigned long len)
> >>
> >>                  mmap_read_lock(current->mm);
> >>          } else {
> >> +               unsigned long sum;
> >
> > "sum" sounds like this is a dummy variable, to please the third
> > parameter of check_add_overflow()...
> >
> >>                  struct vm_area_struct *vma;
> >>
> >>                  /* Check for overflow.  */
> >
> > I agree with Liam: please drop the comment.
> >
> >> -               if (addr + len < addr)
> >> +               if (check_add_overflow(addr, len, &sum))
> >>                          goto out;
> >>
> >>                  /*
> >> @@ -403,7 +404,7 @@ sys_cacheflush (unsigned long addr, int scope, int=
 cache, unsigned long len)
> >>                   */
> >>                  mmap_read_lock(current->mm);
> >>                  vma =3D vma_lookup(current->mm, addr);
> >> -               if (!vma || addr + len > vma->vm_end)
> >> +               if (!vma || sum > vma->vm_end)
> >
> > ... Oh, it is actually used. What about renaming it to "end" instead?
>
> IMHO this is more descriptive:
> +               if (check_add_overflow(addr, len, &sum))
>
> than this:
> +               if (check_add_overflow(addr, len, &end))
>
> "sum" is IMHO quite obviously sum of the preceding args, whereas I do
> not know what "end" would be.

"end" is the end of the block of size "len" pointed to by "addr".

IMHO "if (sum > vma->vm_end)" is less descriptive...

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
