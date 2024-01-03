Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4971BDF4
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Jan 2024 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4283ec43d54so22221cf.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 09:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704301664; x=1704906464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZdpDg9MgC1yCbq1bYlsWWXIuzgecTcvyQdn+DaFzA4=;
        b=PnJiPSjpl0pnIcftYVWWvsBVKUybQvSDL1LqWRXs9UFltatPxQL1koGthCQLFdXe3n
         MxWTBblfTMN1JVkgU7EAWMY58S9UihT7mWyr1T3dVDUAdPJGs6EhZnPef8R0vjVIouBj
         ikMgJgzuSuipAJPtxLgGJiYOtc/TlrA37zB19zAzAyl1jkS9nkSG8v3UBcz00R1QPh/X
         XATZ/xNFa0j2VmpLIjHCMJl8D75OXXuZY8ZV+dvF2AVUV8RzhPWxVYaebolE55iNawui
         kzdi03jcXtdjsj2me8NpiqofFNtV7DUui3dVsF2If9SdJ81OuvR/AwRINwR6DFyoSN1Q
         zt2w==
X-Gm-Message-State: AOJu0YwSpiHlfDiwCiC/MgRK0HtDp8lKuDYzvegQz1238WnEijkwGSSa
	1322APYxXpCQAJORtrkpzypkvgDgfIBOiRz9
X-Google-Smtp-Source: AGHT+IHS4WwSnGd93aZy8WSLMR1Vijtau4oJ4hl5EPmZGyGanNL977itltZeFDWMJzV34mSwA25ptQ==
X-Received: by 2002:a05:690c:2881:b0:5e7:706b:3038 with SMTP id ee1-20020a05690c288100b005e7706b3038mr9132630ywb.79.1704282862332;
        Wed, 03 Jan 2024 03:54:22 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id bz9-20020a05690c084900b005ecd8995666sm8602397ywb.59.2024.01.03.03.54.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 03:54:19 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5e7c1012a42so85157127b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Jan 2024 03:54:19 -0800 (PST)
X-Received: by 2002:a81:8742:0:b0:5e7:7964:c1ea with SMTP id
 x63-20020a818742000000b005e77964c1eamr12605669ywf.46.1704282859111; Wed, 03
 Jan 2024 03:54:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240103015240.1065284-1-pvorel@suse.cz> <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
In-Reply-To: <20240103114957.GD1073466@pevik>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jan 2024 12:54:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
Message-ID: <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
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

On Wed, Jan 3, 2024 at 12:50=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
> > On Wed, Jan 3, 2024 at 2:52=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrot=
e:
> > > UCLINUX is broken in LTP and nobody really cares. Actually I dare to
> > > say UCLINUX is dead. Therefore I prepared patchset to remove UCLINUX
> > > from LTP. We have been actively removing UCLINUX from LTP during rewr=
ite
> > > tests to new LTP API. This removes the rest from the old tests (which
> > > will be sooner or later rewritten to new API).
>
> > > Because the patchset is quite big, I did not want to send it to maili=
ng
> > > lists (but I can do it if you want).
>
> > > Can you please have look at my fork on gitlab, branch: remove-UCLINUX
> > > https://gitlab.com/pevik/ltp/-/commits/remove-UCLINUX?ref_type=3Dhead=
s
>
> > > Build test:
> > > https://github.com/pevik/ltp/actions/runs/7392470215
>
> > Thanks for your series!
>
> Thank you for your feedback.  May I add your Acked-by: tag to the series =
when we
> agree to merge?

I am not sure I agree with this series.
Removing support for UCLINUX from LTP is almost a guarantee for
not noticing when more breakage is introduced.

How exactly is UCLINUX broken in LTP?

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
