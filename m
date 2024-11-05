Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442F1D173E
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730807211; cv=none; b=ZKNmPmUoLhEiwiUzCGEzyNFRX0dLGOSaisxxHfPgN4QNvMVSYYJkZuFHYA0A8rO/p4eJFFhOYxPTvgDo36EArfSm2owYOPVZY7UYEVvUFdXiW8TFbSu4ybAjTQTz12aWs3sh1CCT9iVMANrIbkTIF5Lam5kQMTv1BfQ2yT/wX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730807211; c=relaxed/simple;
	bh=EB6BVBEHwy4lNA8BRuQQ6n10LLY4CRUMYEHx38pj6V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GACVgI3+ASvqprlPg4b9VS22zhSy6gPG0r0ndMUBSqGE4nZd90cXwzHxWv+p1Z9eXxVyMCYSkevvwpZOUz+muImr8DlF8TmygAZ9QwdCq7HYiQDtRMy0zz6qBWWobAjSuWqrV3TkHyoIs9OeWFj9kQJq+VIPr00TFHR9RcWx6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so4662581276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730807208; x=1731412008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHC7oFJtvsZgG1ZL9aZqTXm+RYI7T1aIIkhsKRXH7Hw=;
        b=jOGBJx8HadUn8DJ4uAZGaL+fy1u6t0P8AxA6cvQqVsANkRtCxRS8o/V5lnjo9Cia4P
         M/mbpO03FpvsED43VQurbaYd7cYWY+o1ruevZ1n5lN+aUhADTOk23pD9aHsn1MjhfejH
         SR4hiaHFGe5tFj8RixDmaCNnQNfTyElpsvbjF63JBzPJODiLbfubkxRMOUrSzUmV7SmQ
         nIvO96u2fmNgOMIegAk+uaYxAMYo/irQil33f34Tz6VA9ZUrW4PT3RbrhEVytNt+G1X+
         7mGyYxO/uqJWEDLMalTcuoj6mHV/7Is2Wp2I9Jv36WR7zotgyRoVT6/JS2JY+vj32SVx
         Tn5w==
X-Gm-Message-State: AOJu0YyiC0YrYVANGIfxLgZRJ8fRdHJjY8JJ/Y2ozBL+PUqo9inVAQRK
	7MJD8O6gy+g5zkG3Uy+43x/SbilzT+6S8oLvlg+T/waB83n4DesHmja1PWSZ
X-Google-Smtp-Source: AGHT+IFkSS1Isdzvw6QjW898ILDl3DSs/DNiTGUtup7IFEVFVNudS/Lu4J4PKRCHjIqWycueaSLA5A==
X-Received: by 2002:a05:690c:4886:b0:6e3:3326:91e6 with SMTP id 00721157ae682-6e9d8ad527bmr397884347b3.44.1730807207914;
        Tue, 05 Nov 2024 03:46:47 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c92206sm21794137b3.128.2024.11.05.03.46.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:46:47 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38ebcc0abso60337587b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 03:46:47 -0800 (PST)
X-Received: by 2002:a05:690c:87:b0:6ea:3313:f98c with SMTP id
 00721157ae682-6ea3313fa4emr257739277b3.32.1730807206940; Tue, 05 Nov 2024
 03:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113133209.1367286-1-gerg@linux-m68k.org>
In-Reply-To: <20231113133209.1367286-1-gerg@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 12:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZh6-64hfx1jgOijBEG6cTftinqf+4fZvqjJtV1hO95g@mail.gmail.com>
Message-ID: <CAMuHMdVZh6-64hfx1jgOijBEG6cTftinqf+4fZvqjJtV1hO95g@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: use kernel's generic muldi3 libgcc function
To: Greg Ungerer <gerg@linux-m68k.org>, arnd@arndb.de
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Arnd,

On Mon, Nov 13, 2023 at 2:32=E2=80=AFPM Greg Ungerer <gerg@linux-m68k.org> =
wrote:
> Use the kernels own generic lib/muldi3.c implementation of muldi3 for
> 68K machines. Some 68K CPUs support 64bit multiplies so move the arch
> specific umul_ppmm() macro into a header file that is included by
> lib/muldi3.c. That way it can take advantage of the single instruction
> when available.
>
> There does not appear to be any existing mechanism for the generic
> lib/muldi3.c code to pick up an external arch definition of umul_ppmm().
> Create an arch specific libgcc.h that can optionally be included by
> the system include/linux/libgcc.h to allow for this.
>
> Somewhat oddly there is also a similar definition of umul_ppmm() in
> the non-architecture code in lib/crypto/mpi/longlong.h for a wide range
> or machines. Its presence ends up complicating the include setup and
> means not being able to use something like compiler.h instead. Actually
> there is a few other defines of umul_ppmm() macros spread around in
> various architectures, but not directly usable for the m68k case.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/Kconfig                   |  8 +++
>  arch/m68k/Kconfig              |  2 +
>  arch/m68k/include/asm/libgcc.h | 20 +++++++
>  arch/m68k/lib/Makefile         |  2 +-
>  arch/m68k/lib/muldi3.c         | 97 ----------------------------------
>  include/linux/libgcc.h         |  4 ++
>  6 files changed, 35 insertions(+), 98 deletions(-)
>  create mode 100644 arch/m68k/include/asm/libgcc.h
>  delete mode 100644 arch/m68k/lib/muldi3.c

I had this in my local tree for about a year.
Is it fine to queue this in the m68k tree, or does this need a broader
coverage?

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
