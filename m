Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2A23741
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709114964; cv=none; b=dLLhAoRmPU5qzKXA9/XYHONZz1lkpUHct4Xf4eBEMeik1hCIUsVIKemRa4zV8/Yq9hbESJvAW5/HuC6Gal7FzqBJoaNauhIuFTNI3JiYejTzlC8PpgeTB0RiZrjdryWZGnIgrujaiA36fX/b8PcMdfdUM2KQPoooo9PJuPZ+GnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709114964; c=relaxed/simple;
	bh=Y/N54uYuQQOGm0T/0RrXeURdYc6prMJfZOab8x8pTyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzuS6EkLhmbmt7YtxuveaZ8KrqgXEOK1VNUahXVHuA5Cw3tKreh8Tmwk9kEGmoAOQ2URPS9d25dWXzsJLiM3yHJeQ9dZ5uJYX0e/thY00ZpQUha23lEZeFC62VkPqVNNqCLl7r/3i+GRlElJNjCeWXfJ6B7dsvJZf0mlm1ZQzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6093247d1acso12633927b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 02:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709114960; x=1709719760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JkF52itMFctZfGHkRFOKbmrL2KHMgOrT0AHL5pYx+8=;
        b=li0UwqG7xekpfbMDijtzLMF9UcId4jOMC9sx/t6m95SBu3/ChDPVGYYOMQgY5MFOjb
         OUsY5k78TFs5caWK/zY1HOl8b/Jlpi9bj0Ikorg9179R8+z3mUxouC7Had4BOKqb1bez
         eBWN6F8XHrgDQUNhtObgfQzRenO+ZmaBAuINJCxZtEzJoQU19PkeBla88aoZM0PYwA6n
         F+ZikqtBVnwCd4CMBNldQGG9xMSSIHJGkofqG1PD4IbflKsKGCR2NNeYngfiVaOFEPMd
         hZp7Grfq26kZOPhPB/Nzvk8K0mYYpR3ZMl55Hf5j+FsYb7s64pNPEah4heI8AzNP26TG
         aOsg==
X-Forwarded-Encrypted: i=1; AJvYcCVOPPevF/f4XiYMMgSMi6+ITfkiDJVvDUM2xje/ckrk8NnrXVnlOeRMtbI8TlXGJx+eOJRJGa4JT6vqTACwHgLiUT6c8nqD9hhVrQ59o4bw
X-Gm-Message-State: AOJu0YxX1igZRUgDIJRv9zbdVEwXSHIwk5c6l+BGdlARlkDtN2KYjh2f
	HJCV1DYcgLQUm4I3guI6J5IXVkPriOszdZYkIbjr8DHdAu1IjgvgOzbBmoMAofrb9A==
X-Google-Smtp-Source: AGHT+IGBTyljAmoLDiqXPmeRbiIpOh2SdfXDWWEhFxv7L7hkoLcgV8aIYkyyLTXD3IxC6tJ5ys0icg==
X-Received: by 2002:a05:690c:ec8:b0:609:15e2:1e2c with SMTP id cs8-20020a05690c0ec800b0060915e21e2cmr6195441ywb.27.1709114960484;
        Wed, 28 Feb 2024 02:09:20 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id u73-20020a0deb4c000000b006088f5c314asm2305645ywe.39.2024.02.28.02.09.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 02:09:19 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so5427583276.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 02:09:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtENo/Ov8iOMjOtkj+eLnRZwDIif3l01UhPa6pHterudF0X4FC23NCaAaK9yWW/4D/rFyKyz/5kS9wUrlP7/9ODdtJUKD3Mzu25coN/FNt
X-Received: by 2002:a25:e401:0:b0:dbe:4f15:b5cf with SMTP id
 b1-20020a25e401000000b00dbe4f15b5cfmr2155194ybh.15.1709114959404; Wed, 28 Feb
 2024 02:09:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228085824.74639-1-dawei.li@shingroup.cn> <754c3acb-538d-45a1-84a1-0bebd02fd945@kernel.org>
 <673EAB52C5659E99+Zd799lrOHAVIdm3S@centos8>
In-Reply-To: <673EAB52C5659E99+Zd799lrOHAVIdm3S@centos8>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Feb 2024 11:09:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSK2Ek6=uRE=FwibOqbCYifYsJ5otRXBpA1vW6tBqPMg@mail.gmail.com>
Message-ID: <CAMuHMdVSK2Ek6=uRE=FwibOqbCYifYsJ5otRXBpA1vW6tBqPMg@mail.gmail.com>
Subject: Re: [PATCH] mk68k: Fix broken THREAD_SIZE_ORDER
To: Dawei Li <dawei.li@shingroup.cn>
Cc: Jiri Slaby <jirislaby@kernel.org>, gerg@snapgear.com, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	set_pte_at@outlook.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dawei,

On Wed, Feb 28, 2024 at 10:34=E2=80=AFAM Dawei Li <dawei.li@shingroup.cn> w=
rote:
> On Wed, Feb 28, 2024 at 10:11:05AM +0100, Jiri Slaby wrote:
> > On 28. 02. 24, 9:58, Dawei Li wrote:
> > > Current THREAD_SIZE_ORDER implementation for m68k is incorrect, fix i=
t
> > > by ilog2().
> >
> > This is not a good commit log. Incorrect in what way and why is the fix=
ed
>
> Agreed.
>
> > version correct? And what is affected? Note you're referring to a chang=
e
> > which was done 14 years ago. It definitely must not be that incorrect (=
for
> > everybody).
>
> It's 'right' just for current PAGE_SIZE & THREAD_SIZE configs:
>
> // arch/m68k/include/asm/thread_info.h
> #if PAGE_SHIFT < 13
> #ifdef CONFIG_4KSTACKS
> #define THREAD_SIZE     4096
> #else
> #define THREAD_SIZE     8192
> #endif
> #else
> #define THREAD_SIZE     PAGE_SIZE
> #endif
> #define THREAD_SIZE_ORDER       ((THREAD_SIZE / PAGE_SIZE) - 1)

Indeed.  The only supported values for THREAD_SIZE_ORDER on m68k are
0 and 1.

> But it's incorrect in generic/mathematical way.

True.  But does it matter much?
I.e. do you plan to add support for larger values of THREAD_SIZE?

What about changing the #ifdeffery to set THREAD_SIZE_ORDER to an
explicit value, and calculating THREAD_SIZE from THREAD_SIZE_ORDER
instead?

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
