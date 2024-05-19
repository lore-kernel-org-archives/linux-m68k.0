Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C083C125
	for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716110245; cv=none; b=u79wkdHF7L3U4W6+lE5oSiJuSifjYdKr1h5d9MSKzNskd7jDsawPHCBS7yOznOFfhFu/DVxCuWeBp1o88AhsIAMi5Llf2tawoJUhqVnMfOyAhif3VGJm5yVExYEjtf9QKFtoCvHwVDeX05neYklnuB6YyCeuVK0Mx+lZR3/Oil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716110245; c=relaxed/simple;
	bh=eIUFqfa3kuMdR5xM85dK0mgrX9p4CROEjMYh2Av5nag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6PEcBKglSyjv7bjQs1JGZ88EtgOwoBTKWkp7HkzAfStvu/6KRpMNQswC1BQTdCI5ba+/6makqifruGHnv428l2jfoqcV5feyHd3d6NHQlz3iOSGfn07OZw7u82GGlRYbZ4aU/w53zkrBGTEH61tTZbvvN6Cc1pi0x4UYz8iqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de59daab3f3so1358128276.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 02:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716110242; x=1716715042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7VPb5AirpmC4R6qUMffA+shLPSsSVeYD0/5kgbUcIQ=;
        b=WnBGGIZyaN7ZhDgyM7pGPJT8FuIiSgCB+8IC43603nZTsksBMNVsWni+23x21xrDjh
         c7hZv16KsWl4BqoNSRDWcMJYRu8MLd0SrVLEb9EIJT6Hld9ja+ECII/gWjQy7qCtPvLX
         rx2wTPJ5ERB4/QilYI/HDbWKYdHRHA4MUEJi4WIorMNJ7jssDpPRvf+wsEEOLluT6DWi
         PVkfWkVMG0mWjU8B184R7vWtAKPS5TmIRh91g4OMruO8uNc3m5pmRRzAXnZnFq5hPeu/
         xRE0PxZcDTpgjUPTDvQkb3/oob1y8ccg4cmkzUZvHq+ONOmz1OvnKj2++qsPvAfQkvGn
         H1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV40Yk7mOjmElf+7ETcTH+tsDhS9jlkYIyjUDNBLCtlJ9MOlWe5PU6JG6JO56N5iENZJXcVjeH+P9NznVgBgbWlYTVvmjA9MGHD6HtsQMoC
X-Gm-Message-State: AOJu0YyCb6ESKw2vCoJtIU5tVGX2Vmkyrlc93IOuBJ/e2CLnqlVMu4SX
	pjf2fgwxp3tuN24ATw3eZjwZLavcSgTQwVSWiHrkh1uBGLAucwWNPFg0M6Im
X-Google-Smtp-Source: AGHT+IF6IkX2iuFqOo/WzGnTf5V+U2d8bXXINQ5ojMiDXCn+ERUvDu9gxiPCaxTScbvRdPvwO4Imrg==
X-Received: by 2002:a25:b201:0:b0:dc6:aeba:5aaf with SMTP id 3f1490d57ef6-dee4f343e45mr27196696276.19.1716110242090;
        Sun, 19 May 2024 02:17:22 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-debd382c0f8sm4551183276.43.2024.05.19.02.17.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 02:17:21 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de607ab52f4so1513318276.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 19 May 2024 02:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6tQ9PYZ+UVNZmMdGINzJaMr6RvgwQGKiBWJ+PHLepiJCFodSDXgwNGoavolmQSIUGUr+JB93w87DeLvMT8T/hKC+sc948WfOXc/FD+PpM
X-Received: by 2002:a25:84d1:0:b0:dc7:acb7:af14 with SMTP id
 3f1490d57ef6-dee4f324b61mr24718552276.5.1716110241271; Sun, 19 May 2024
 02:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZkjwzVwYeQtyAPrL@amaterasu.local> <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
In-Reply-To: <e9d97c04-73c2-e6dd-6d51-b9a4e3ef73b2@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 May 2024 11:17:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com>
Message-ID: <CAMuHMdWL2S1OMS5ikKgQj2uohoiL6_a5FLwdCphUEBVtMOSFcA@mail.gmail.com>
Subject: Re: Amiga, serial and SYSRQ
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, May 19, 2024 at 9:37=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On a serial console, SysRq is BREAK:

s/serial console/virtual console/

Amiga keyboards do not have a SysRq key.  We used to implement it
using SHIFT+ALTGR+HELP in the old drivers/char/amikeyb.c, but that
feature was lost with the transition to drivers/input/keyboard/amikbd.c.

For enabling it, you can s/KEY_HELP/KEY_SYRQ/ in
drivers/input/keyboard/amikbd.c.

> On the serial console (PC style standard serial ports only)

drivers/tty/amiserial.c does support break, so that should work, too.

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
