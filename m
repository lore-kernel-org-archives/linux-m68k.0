Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354931C680
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35fe8a4b373so30564665ab.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 09:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704302863; x=1704907663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhhQFZaZR4+J27tLwPbBpD9wwAmji8BYJHqOMirIeI=;
        b=AgD5sobr0yN8ReVcWmLMv612NEN0dCT1YXoA1tH36uKRVe8OntcZr70qa+5tO0ddZD
         S8+YL+4x+/3F+WQT8CyXs3JGIa22xu8t6ij+Cch2V5g6j5vwiReFP7rRnhePX97sEit8
         OLAdaRa1f3PqWh4SFzQivh9Rj0gkhJZXVykNSNaQVobBHnxA4QmDoMw/XxJvoksRfN8r
         WF4EqQyEaHcRIY1HlZ2Eo2MK6SAKe+a2D1FVIV3ZZhJLacGFEABeq/gBP6bjxX1GFsyv
         bI74Oh25Z/VNcf/LHzwOweAYSCLKfVALq2xMC+HlPA2xEjTPzi0n+BTXeREF8X2ZmEF5
         IBSg==
X-Gm-Message-State: AOJu0YzVNXjcqDVHYqyeRZ5847YnQu/Dqe3TQGcXmlLR1pDWAhGKiojj
	jB2hOZ5bRpMzWwmSB78vUuQ6bzhRsXXti9Cy
X-Google-Smtp-Source: AGHT+IGejDk+IKs7dn357a4TxS5zHR7obk7VC2czinDXCjdwEI1fbSrMMGfesVJEDIp6uikFyUACLw==
X-Received: by 2002:a81:57c4:0:b0:5ec:ab18:ba7e with SMTP id l187-20020a8157c4000000b005ecab18ba7emr7483418ywb.3.1704275209336;
        Wed, 03 Jan 2024 01:46:49 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id p185-20020a0dffc2000000b005ccb2d17ba7sm12682248ywf.101.2024.01.03.01.46.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 01:46:48 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5edfcba97e3so56102837b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 01:46:47 -0800 (PST)
X-Received: by 2002:a81:80c1:0:b0:5e8:6aba:9d18 with SMTP id
 q184-20020a8180c1000000b005e86aba9d18mr14346275ywf.35.1704275207623; Wed, 03
 Jan 2024 01:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103015240.1065284-1-pvorel@suse.cz>
In-Reply-To: <20240103015240.1065284-1-pvorel@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2024 10:46:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Message-ID: <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>, 
	Andrea Cervesato <andrea.cervesato@suse.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christophe Lyon <christophe.lyon@linaro.org>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

CC other uClinux arch lists

On Wed, Jan 3, 2024 at 2:52=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
> UCLINUX is broken in LTP and nobody really cares. Actually I dare to
> say UCLINUX is dead. Therefore I prepared patchset to remove UCLINUX
> from LTP. We have been actively removing UCLINUX from LTP during rewrite
> tests to new LTP API. This removes the rest from the old tests (which
> will be sooner or later rewritten to new API).
>
> Because the patchset is quite big, I did not want to send it to mailing
> lists (but I can do it if you want).
>
> Can you please have look at my fork on gitlab, branch: remove-UCLINUX
> https://gitlab.com/pevik/ltp/-/commits/remove-UCLINUX?ref_type=3Dheads
>
> Build test:
> https://github.com/pevik/ltp/actions/runs/7392470215

Thanks for your series!

I see you only CCed linux-m68k, but AFAIK, uClinux is not restricted
to m68k/coldfire, but also available on arm32, riscv, sh, and xtensa.

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
