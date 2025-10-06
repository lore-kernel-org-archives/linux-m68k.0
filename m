Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C79233155
	for <linux-m68k@vger.kernel.org>; Mon,  6 Oct 2025 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759749737; cv=none; b=A9j9T2T21FR7M2onvJ1G0TI8PitXzERZyvKW8zpG2IJhZCvZcPksUlDyK2sIcDc2Hp5B2BEFcJI39giVIzJkFdB9d8d7ARGrv4vfMJpi9dOKoHzNcg/lpvJCxLAYLRihB0EHRrU+DheVy/8l54rN4/wZtWuthiMMm3iispVbj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759749737; c=relaxed/simple;
	bh=Y3Atn65xFGH/0e1A2PaPhs3F2p+GKPI48e94fdpGas4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkEdFkH1WFmYycH5itEk48HJqD7Y1PAjcErD+4uvQ1RYzhajMOywFhZVpZ/saBM2yKM6Qp8YQp7keoOf+VwakwXczWoa146mOb9RIzOQ2+N3rIeK55I9QrUfq+mSo4joGE5OddWMWkdInsjfPKgYQB+H4Fwg1SwjeRLSBszlLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1359590241.0
        for <linux-m68k@vger.kernel.org>; Mon, 06 Oct 2025 04:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749734; x=1760354534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5v6YXX9bgIrUD9M85TqnlXajae/PoAZkbY3xvYAmEY=;
        b=pZOP+HCir33nyHPsJ5slDpOkDwr8jaArSHkZ2/Ib7h5zg5+0MShp7OVWdvgJNsm/nV
         M8Zkr91ajvJltu2/MSo6GcJJk1geDft75jAx0se+mFWxzl9Y2/kiFpHiO305wL2Ud8rQ
         9dq/FenkxqBeTqOK71zRnee5ImsUzl1z7c8jeEU17i1vPpPePcXR9maJ9FdUouQe7Xjg
         nHR5jDn/KQL5K18PNmACDBmVeX75nN58jdX+W5r4rTlM9hKJhysQfhihexf69r7AEacB
         SULKs4j8fBq46RjsVws7XR+YDZYRhR0SqEfUNXYYFOY+8kW4AvW2whrtwmKYA07uG6+W
         VHIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5ACueR+FNkOn1WXUPL7g1PyXXNhkS9apND9eZ74J9gXoMv7mv0tlcpcj9mIWsa6yaEakmo54nibbO@vger.kernel.org
X-Gm-Message-State: AOJu0YyRtEaQkhNt1ka83EQgceCtXif7d0GQJQtYL/9WgmLM2VqmOG3i
	rUWGWm1sV737uddOcWhgAb71CAW3rUKUZzvJMVqMCUOvuNn1poXHBJj8yGk2tSXq
X-Gm-Gg: ASbGnctDXTaq+8De02gEMT1hSk86/eKkUHflCLNTiOYuzPLIaNtauCLju+8SOUGEaYl
	S1Ff2ScpA/aqDC5qa8dx4vqEqqnMWSs3VbY1MHgRBt1BaTcbrkfVoZdcWV4sfiHDELyXUiGFVz8
	liNdtTyH6XZGzYWpDZD8O3BQ5irhkWlVSJTXs1qaHWTnr1iSRuqgmflUV9sNo71JceyxsD994AT
	XQKgC0wWoaV7moTaXsyAD0pYItqmR3gv5KXcJqFH20tlVWdQpH7Vx5xwjFEmKN5et1fAgiaZVVw
	qhgnglhZQ9AdovpvvMcntrw+hi4v6aSEsFSUojFBo8vLqvQoMpHLMUCq1KrTWPtovDBxOA2UHjV
	JcpMV2PCXkpi6ixWOJyTZPt/QCRdkYGN+rAPSjeovuYZQGP/9v1VUE/O15+HzE0VwhT2Bsu22Tu
	od90slF63y/7IqBrnJLhg=
X-Google-Smtp-Source: AGHT+IH5aBn/62Zw+yjK2aIYVtAjnIVO8Gjng8ExJa9wQ9/4+4SXiytlJLdY1ghJc4/LauGYm9YLZA==
X-Received: by 2002:a05:6102:8015:b0:5a2:8ace:c921 with SMTP id ada2fe7eead31-5d41cfd5822mr4183857137.4.1759749733572;
        Mon, 06 Oct 2025 04:22:13 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c509443sm3295493137.6.2025.10.06.04.22.13
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:22:13 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5d4018cb45fso2075664137.2
        for <linux-m68k@vger.kernel.org>; Mon, 06 Oct 2025 04:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXS9Gb4zehCaRkRFa0yZ0Df6HMjgIREs+sPb0olxfQMspit9tEZqyCDsbThwVIeAQKAaXpEhcE4PwSq@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:51f:66fc:53b8 with SMTP id
 ada2fe7eead31-5d41d10c1e6mr3769193137.25.1759749732995; Mon, 06 Oct 2025
 04:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>
 <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
In-Reply-To: <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:22:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>
X-Gm-Features: AS18NWCyOXitXU3rGEXUiPmnEZfW-xN2u5xkzC9-zt4O_5XgyELmHdg8FqqTPME
Message-ID: <CAMuHMdWydvUtYUiT23HcgRA3+6di0sZmVqrAPMGM_v5B208=zw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: uapi: Strip comments before size type check
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 6 Oct 2025 at 12:31, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
> On Mon, Oct 06, 2025 at 10:49:28AM +0200, Geert Uytterhoeven wrote:
> > On m68k, check_sizetypes in headers_check reports:
> >
> >     ./usr/include/asm/bootinfo-amiga.h:17: found __[us]{8,16,32,64} typ=
e without #include <linux/types.h>
> >
> > This header file does not use any of the Linux-specific integer types,
> > but merely refers to them from comments, so this is a false positive.
> > As of commit c3a9d74ee413bdb3 ("kbuild: uapi: upgrade check_sizetypes()
> > warning to error"), this check was promoted to an error, breaking m68k
> > all{mod,yes}config builds.
>
> This commit has been in -next for some time. Any idea why the issue did
> not show up there?

No idea. Looks like the build bots that are still running don't exercise m6=
8k
builds on linux-next?
Perhaps this is just collateral damage of the loss of the kisskb build serv=
ice?

> > Fix this by stripping simple comments before looking for Linux-specific
> > integer types.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Thanks!

>
> > ---
> >  usr/include/headers_check.pl | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.p=
l
> > index 21c2fb9520e6af2d..75dfdce39e7f4610 100755
> > --- a/usr/include/headers_check.pl
> > +++ b/usr/include/headers_check.pl
> > @@ -155,6 +155,9 @@ sub check_sizetypes
> >       if (my $included =3D ($line =3D~ /^\s*#\s*include\s+[<"](\S+)[>"]=
/)[0]) {
> >               check_include_typesh($included);
> >       }
> > +     # strip comments (single-line and C99 only)
> > +     $line =3D~ s@\/\*.*?\*\/@@;
> > +     $line =3D~ s@\/\/.*$@@;
>
> C99/C++ comments are rejected in UAPI headers, so this line can be droppe=
d.

'git grep "//" -- "*uapi*.h"' disagrees...

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
