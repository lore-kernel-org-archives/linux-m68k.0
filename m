Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48E6132492
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696187; cv=none; b=VCmHzm/BPDINDYj0dR/+4Nr1hOhz38qsDVI0lE1j+H7LODF5seQJayEat0yRgAXaxNnQHKl+ZUpra/l2o6S2hUli3PGfPdPjtvy6V0Tq6TaJq32Nu1uM4HRkgpNhs8T3srHvFnO1np/DO6Qv13QFVu4hoKjzmuV02SWrmlcn/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696187; c=relaxed/simple;
	bh=l4qwCNd0eHbNyQN6OXtnKQBtjHNXZNH/GE/oi7U5ry0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nx6g2U3ZvEG3mpkPBwj3hKCsuDTxGhXSsaNFyzyJu2iIdaLCXGpfnS2zOvq2xfj2IzHUx6K7Qjqz73GF4QTxv5hw8G8+XjsnMQ6SP+sBvHiYgj8kEoypLsOlrGsqgkW4fsNut4G1wkCS7xKhiG/v5RX827QHzn3jdNDNJ5cZnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-63258caaa91so35085757b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 00:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696184; x=1719300984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXevbHTVVB5W4AkAG0SpByLTlEWY1oXg3P8wa0a9S0A=;
        b=ralJa6vzrr5lvGFSViJmyiUFPCYR2mlW+bW/J3yFyvM114kQsw9c8bPTdNgK+cM7is
         K8lfdVQMMrenPksZnmgxjPuy130RUTvl3NS2JIb3fIx4CTIJOL94XGdc8o6vmALHb1Ut
         QBUfRP5p2o7vGAzIfvJSo+a72wtTIxC57LcFaXBEUBidIjINFeYTroRSYwBglwCnpyUh
         E5woCSrDbog53W3gmloMbLk23ALRFlnH63RrIw/1ZSr0S5jj/6KnyZqx9YsopNf76G9P
         SUlILXJopVAy2z/XHK3nGpbDFKrDKlkcObX8hX61lxgSBsh9gXDzNLQN2WdClvWsw5f7
         Popw==
X-Gm-Message-State: AOJu0YwlrFJdVrGOF48+36FZhXfBM1tUlhhPUwB3tE4H07saw6XxIpl4
	PkRYYzt8OGBbdrXu7e0sY0WpIuOMiIrt3Amtf2Eay8AW1amdaBamIdA+zOEI
X-Google-Smtp-Source: AGHT+IE7gZ9EBGrq6bNaE3vPgYRb/TmPijjxbdLbpaLR35FOiom/ywKViVI92WLSk1Cw4p2Csqnw+Q==
X-Received: by 2002:a81:77c6:0:b0:62c:e537:3750 with SMTP id 00721157ae682-6322255913cmr108680227b3.10.1718696183551;
        Tue, 18 Jun 2024 00:36:23 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631189a7d28sm16994887b3.40.2024.06.18.00.36.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:36:23 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfa6e0add60so5649238276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Jun 2024 00:36:23 -0700 (PDT)
X-Received: by 2002:a25:8689:0:b0:e02:721b:756a with SMTP id
 3f1490d57ef6-e02721b80f5mr1035835276.47.1718696182911; Tue, 18 Jun 2024
 00:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-md-m68k-arch-m68k-v1-1-57d38beaeb13@quicinc.com>
In-Reply-To: <20240617-md-m68k-arch-m68k-v1-1-57d38beaeb13@quicinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 09:36:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD0Je3HZ+RJyfdxKxKcBp7nt6ooP_YUpiju77Zf1QzVw@mail.gmail.com>
Message-ID: <CAMuHMdWD0Je3HZ+RJyfdxKxKcBp7nt6ooP_YUpiju77Zf1QzVw@mail.gmail.com>
Subject: Re: [PATCH] m68k: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, Jun 18, 2024 at 1:47=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
> With ARCH=3Dm68k, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfblock.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/m68k/emu/nfcon.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks for your patch!

> --- a/arch/m68k/emu/nfblock.c
> +++ b/arch/m68k/emu/nfblock.c
> @@ -193,4 +193,5 @@ static void __exit nfhd_exit(void)
>  module_init(nfhd_init);
>  module_exit(nfhd_exit);
>
> +MODULE_DESCRIPTION("ARAnyM block device driver");

I think that should be s/ARAnyM/Atari NatFeat/, as I believe NatFeat
is also available on other Atari emulators. See also nfeth.c

>  MODULE_LICENSE("GPL");
> diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
> index 17b2987c2bf5..0ab2e4d08871 100644
> --- a/arch/m68k/emu/nfcon.c
> +++ b/arch/m68k/emu/nfcon.c
> @@ -173,4 +173,5 @@ static void __exit nfcon_exit(void)
>  module_init(nfcon_init);
>  module_exit(nfcon_exit);
>
> +MODULE_DESCRIPTION("ARAnyM console driver");

Likewise.

>  MODULE_LICENSE("GPL");

If you agree, I can make these changes while queuing in the m68k tree
for v6.11.

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
