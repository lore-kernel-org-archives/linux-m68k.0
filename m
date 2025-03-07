Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3A1A314C
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336105; cv=none; b=uzVil+xjs+LC3cqZilEOjwXI69tPqvkgWqZth9cGe3AXT/L+nzhx9pqVdgf3AS+xymrT3OWzLa95bR38RUFzMKz7Hg4heciA2slFtrt2XDYBFJOHmPBILrWWoanR9HiwrKTCrrD9df1+wmADsz+o/k7z47V5K3FMas9mEqu9+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336105; c=relaxed/simple;
	bh=RLW5W7vE6eKHVXzzEER3TJZBcheFUauQWYUYHYGJdj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+2lnzCdHkYtMOaDyez1sItP/Pz+6jmtfvZSKG5EaAfm0y0Nb7ftuydOpEa4uFrYX+agwAEMlKWb9SEmXlE2uA+KCvVxuIob/DNGXZ0k4G0YRyNgOcvIgpjIUWx/DzbrUE9DED6ZQUCenQJFQmSLYM1O9mrLl/tyTX9ExuzN+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86712bc0508so683893241.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 00:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336101; x=1741940901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xum+DVk/hz2H5siGnkfuO3VHERgZhJbJ0D0R2U7DBis=;
        b=aVRjC1l4F4YeZsjOKWjBqln8UFihHNi5MmAXG/Sui7OXxWFNh0mnpN95aV5wD6Xw6e
         mSZJ+lSc6leH27aZgPlwZboUCh12/cpqLnrYSQSu1zEoD7S5VZJBwXf3RmmVeJ0H9Mgz
         x8NMZpKtiz1H8iZtmEc/Ew75rMH40SH7nodahdbRm7tTTLtMrafPjzcgR3OvNuOzudyL
         mBIEvexd/nLEepNtwpI6fprkZRq4n1wGo5CFrOuhmsoHLAxAuUmHcZtd533nuXQ3//bT
         xwZ/SF9E1Q6PDWUuejx/Dm2joyYmUG3pz+wKI79YO9NcFj9ugt0p0VXptOsvNR/8bn/v
         dVKA==
X-Forwarded-Encrypted: i=1; AJvYcCXQeRmYw6mUMMTd0Fzu/MnmZ0+3YTIkFTwBHUIW8BLum+P5P1vpHzm7D79UGZsk+rsttNjg1ZWj2dU1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxSE+7fOZkN3raLVB1MivNLKQp6MbtWjNnilsiXI9IfyVzxn4wF
	gWLlQjUPWh+MZ9mf+SS9hf0Nym+u8u7LqYVv8z5a2+58G5FbZMe/fG3W7aqOEV4=
X-Gm-Gg: ASbGncsyFhwDNyWifFG8AiijMWaQS3f2/EWD36UvNOTkWm3TCwTIMKhgxbNWva+tUnd
	t87b+gy/YKg63mjpMUMHvE5nYE6MSDNDmRkdM+DA7ZPNJKTnVnyRwOkf82+36Qsau8Iu2p/Bwg3
	puAUoKX5nTpjXcjZjP3LLw06Lubu3kX/eir0PhJmvD4ksLB4wvb240MDmrY7fsLfTc+gMITAneB
	gadYe26nheubNO15uraLTrrvACnV6zu4ALO+A8pibnzyQtPgf3Pur0JAOAkyl0e06ok/rESE6nB
	D14NrbdiD4HWqvHOqeyMkey58ozXR9U6Qd3zgwpwvrtb300tBR2He5uxECaCpoqHsAb/hiWMZah
	lvozdmCg=
X-Google-Smtp-Source: AGHT+IHMT+2jQ1m4dRvE+tK4VgSaS+Yc1fedSC90uPC2kpue1ptuRZzCgwQ/4RwpZyFl7Q9D0kVkow==
X-Received: by 2002:a05:6102:3fa7:b0:4c1:9e13:8283 with SMTP id ada2fe7eead31-4c30a731103mr1313941137.25.1741336101216;
        Fri, 07 Mar 2025 00:28:21 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c2fbca5238sm612003137.24.2025.03.07.00.28.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 00:28:21 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-866de72bb82so711662241.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 00:28:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVp8YkWeBNoe2zzDFt9MkrfrcZ5YrFnOmxRoaKuibmybZo5Wf9ln1KG3LC9Cm9qZGTTnAW8x7lPsqo@lists.linux-m68k.org
X-Received: by 2002:a05:6102:38cf:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4c30a6d240emr1447532137.22.1741336100864; Fri, 07 Mar 2025
 00:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302230532.245884-2-thorsten.blum@linux.dev>
 <CAMuHMdUonC54g-XSt-EkNbEGxhkOWMxBc87Qtw0MyeXoPqDD4A@mail.gmail.com> <e5e10808-5cca-243b-304f-4aa8db1d30b6@linux-m68k.org>
In-Reply-To: <e5e10808-5cca-243b-304f-4aa8db1d30b6@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 09:28:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjOkUXy+jf0yghs2_SQM3UWY3e8or3T11=fXYYD-VJEw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr2qcPxvP5d5iuyyv-KmQbBRQb47zOza6WWuoy8m5L3ptAnJ84hV5gOB4E
Message-ID: <CAMuHMdWjOkUXy+jf0yghs2_SQM3UWY3e8or3T11=fXYYD-VJEw@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Remove size argument when calling strscpy()
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

CC Kees

On Fri, 7 Mar 2025 at 00:24, Finn Thain <fthain@linux-m68k.org> wrote:
> On Thu, 6 Mar 2025, Geert Uytterhoeven wrote:
> > On Mon, 3 Mar 2025 at 00:07, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> > > The size parameter of strscpy() is optional and specifying the size of
> > > the destination buffer is unnecessary. Remove it to simplify the code.
> > >
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k tree for v6.15.
>
> The commit message says "simplify the code" which is only true if you
> never scratch the surface (i.e. it's simple code if the reader is simple
> too...)

The code is simpler in the sense that the API is simpler to use,
and harder to abuse (i.e. to get it wrong).

> Commit 30035e45753b ("string: provide strscpy()") was a good idea. It was
> easily auditable. But that's not what we have now.
>
> Patches like this one (which appear across the whole tree) need reviewers
> (lots of them) that know what kind of a bounds check you end up with when
> you ask an arbitary compiler to evaluate this:
>
> sizeof(dst) + __must_be_array(dst) + __must_be_cstr(dst) + __must_be_cstr(src)
>
> Frankly, I can't be sure. But it's a serious question, and not what I'd
> call a "simple" one.

All the __must_be_*() macros evaluate to zero when true, and cause a
build failure when false.

BTW, Linux does not support being built by an "arbitrary compiler":
only gcc and clang are supported.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
