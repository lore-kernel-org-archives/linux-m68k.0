Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEE2D7BF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305436; cv=none; b=KgBMJM0BIIJs+x+tnW0B7x9X3CgIIea0a2T10WEar1IQitgs8ipfYVwyaDSVeGoeq9wNaHfrqvfn4gapZS42V5WjUy5tVYUZD/9DqEX/Y2T5yPRNske66/UlRFbqLPa54lGhPubP1dvWoxb3igv3Q56gptw9gDUaiCG37rCcLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305436; c=relaxed/simple;
	bh=tYbMWgCVMGf6YZWOsnPA1SsgNuLrNVou12YJYKuZRmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcxKKkwwwUYaDL6F3viAmErW73Jcz+xxlYP9Far6YlpC/+cRSylUhrJLBUDx+MOR0T1dUIOFlT2KN0u9he8kOOkTpzbaKWvm2rHBgS1jTV6mlhAFDki74ecZfq3LtrDPYbaDrTSHXPqhJ/NxZwSW4SbLHTLgmJLB6UVwkM9isxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1655485e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 00:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305431; x=1745910231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjQ6P7xPHpYA5hR0NBtg5+glzAqNpKTB4hO/66i0slM=;
        b=UGE8ZKdGIUNlknYRPZzSGp/5jbdYoMs9RcDgy4JF9AO6hAWneBKCBy/VFq1DG6zQjI
         4Pxol6zbbfErRZd/Dj22bAd6mHOurSJd6qxPBqOrYSjTneKaZcihhHZd9pPI7bsOHjqf
         5zzrMcX5JJtVFqLIMIFpBYEKTpqp5O2aexzKGACdetHvK0pp0mBXyBvtFmE58jvDiUqz
         X7up1WlpCabO9tWcepyJPeuyY5uDdIihyn7tuuxtJtP2d558dELZ4MUqh6y4Vt0c8uGN
         C6bFQLO3dKe1H+ZuFu5/EAJfHPhlbTKLjWUebKgONjV5BeklaggDceJQtebZzL8D6ujU
         nnNA==
X-Forwarded-Encrypted: i=1; AJvYcCWkSUs5WPlAM4U0o0KHDbDxiIsstLV2Gjiuj1DsfLKfzVYeu6Y/VYf8leBniIR+F9Ia5Wo/BegbCYoI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwrQ53lXjz6G5IIkofXqJFgPiPEDdTyKx9oWCk1Z/+fD7l2dSEa
	vthxeMe+NS8poK04jqRPI5tf8QA1cA2CD81JWCr6Cl1tRygjnuLo0IFlbBSf
X-Gm-Gg: ASbGncu3cXr4nEmFkb2DuTYKQlkcNiH8FPTMPD+hM9l/1NKybuWfF9Jl9QMQh9VU1h2
	1J83HTBfoqZ4sdat2zf9XY97DOdxcPe31z9MnFwDIgjToPmEc7W7XgTb1KwvBblFtm6YV8GlfEv
	0gb/N8Q21eQlm7k9M/tBjPPiTN9mMxM8/cIU5D3lQMgAi/XGHvWDMqbIUNeFv5YfxtlNrZ4TjQ5
	OxZvYzYTL3LuuySnO9Dmkwc0QTSTVyS31UABYCoE1WHj0asZ3bdAnOarcD87l/omyfT7vAG1sZr
	57wn79tKi/DZbOw07fpnnbbBM8QSFtv8HHHcM4kTleot7AFXU07PaS0u0nMm1OWf/iKjB0GJ7DB
	DEUo=
X-Google-Smtp-Source: AGHT+IHwKSqDAI+w1/EdZBFUqslJr/9SxgV3WjH4alkI2W5axku0Mr2VuAKZWEzZUGlhPGdRhpwblQ==
X-Received: by 2002:a05:6122:2211:b0:520:535e:89f2 with SMTP id 71dfb90a1353d-529253cc28bmr10117993e0c.3.1745305431280;
        Tue, 22 Apr 2025 00:03:51 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87764651923sm2192528241.3.2025.04.22.00.03.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:03:51 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso1820671241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 00:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYVmLYLHwUhVHv3fh+q5z0jcxFzcTOvrlmmQSDqDYcIDk3XHsbXNVDZ13y14ClfD698c6Bx8oVKfP6@lists.linux-m68k.org
X-Received: by 2002:a05:6102:311a:b0:4c4:e42c:38ba with SMTP id
 ada2fe7eead31-4cb80145a4bmr7009563137.13.1745305430717; Tue, 22 Apr 2025
 00:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421122839.363619-1-thorsten.blum@linux.dev> <f178cc44-1b97-4e72-94ae-cffa08173a99@yoseli.org>
In-Reply-To: <f178cc44-1b97-4e72-94ae-cffa08173a99@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 09:03:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxdhTrxHuP5AmZEj2c+RRnUf0qfwsdmJ4CJNGg2AwXug@mail.gmail.com>
X-Gm-Features: ATxdqUEaMllpvSmtk5uCeOO86P44ubvL2-2J492ivHDXIiPpiUf3EKaelrDCJLY
Message-ID: <CAMuHMdWxdhTrxHuP5AmZEj2c+RRnUf0qfwsdmJ4CJNGg2AwXug@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Replace strcpy() with strscpy() in hardware_proc_show()
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-hardening@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Michel,

On Mon, 21 Apr 2025 at 15:02, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> On 21/04/2025 14:28, Thorsten Blum wrote:
> > strcpy() is deprecated; use strscpy() instead.
> >
> > Link: https://github.com/KSPP/linux/issues/88
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >   arch/m68k/kernel/setup_mm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> > index 0fba32552836..c7e8de0d34bb 100644
> > --- a/arch/m68k/kernel/setup_mm.c
> > +++ b/arch/m68k/kernel/setup_mm.c
> > @@ -484,7 +484,7 @@ static int hardware_proc_show(struct seq_file *m, void *v)
> >       if (mach_get_model)
> >               mach_get_model(model);
> >       else
> > -             strcpy(model, "Unknown m68k");
> > +             strscpy(model, "Unknown m68k");
> >
> >       seq_printf(m, "Model:\t\t%s\n", model);
> >       for (mem = 0, i = 0; i < m68k_num_memory; i++)
>
> As we are not using the return value, I think it is a safe replacement.

strcpy() and strscpy() not only differ in return value: the (optional)
third parameter of strscpy() specifies the destination buffer size.
When not passed, the size is taken from the actual destination buffer.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
