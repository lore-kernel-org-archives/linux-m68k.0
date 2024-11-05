Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A51D6DDC
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815415; cv=none; b=ity3iqJRZh7t+QY3lHT/FKDvO/maAfo511Rf3LPdIqNnGsNYsYx4LECeMt+nCiRiv3bmRl+b6YYPx84QEsywWw69CIIgWoVozlZhVtjcBRKKQabK+H7lGEygrka7n7JdCouVhYTMuiD1wXc3MfnNrx+jw90KZU8LzcEce0Kw68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815415; c=relaxed/simple;
	bh=sFwrPmsss5hpN9ZFw1O/B/a548zydPbn3UKb6dMBOZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXex/XvHDTfLel9NDayqccb3udT53L4A0d/dshUX9X84MO6xb0EP3G06X/kJb3G6dQmhIWMGluIPaeuTXMl323qXuEDOGR+zldpXWLKTaechrYZDmbxnAXJXmDY4nSg+phOai+5EYgIphsMK7UCesSvgOl/wNGf59XKU5jyPB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3161869276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815411; x=1731420211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lngjfys+B2JzssED4s3MaYSB3SB4j6D4iWEuTRe5Sew=;
        b=Qs6G8qmQyBiVOIqjqRkXrsiyOYP8K6JpeAOLcSp0Wxzz2BMoz0X6m3cRMxd+xhwcNF
         FdAsdD/vQVz7zGd2dWud3yh1CdVYJe765WuZPgQKfTk9v5ZO2k0felZ86JJCgCOtXoUz
         TXQWZ9zixceiG50cTZ5Dtcn3yncJiiusoGCDUpBBCHUy+CGIjBOHlSzQMDBv2gaeOJfh
         AyH+ngS+nctQWdPA5h5fqFnUTp7+vkyfvvL64Rf5KulsDy8G0AEH/s3U60xkorPFqy/K
         J/+uKj7WPtP0MN3rZmGWE0YnIGihFe/4COjy5c0ynOlfglxfFkHroEf2CkAnMV/cvl03
         o66Q==
X-Gm-Message-State: AOJu0Yy0mmaf0nPNcvLezPCeVIpqM6OCcUTJBP04mvDevQniE/dhGVjj
	kVmYFR7m++gVFmQw7manvlkn5+BINUXQ+Fejt0rqMSqarlux/kK9MmiG9zFF
X-Google-Smtp-Source: AGHT+IGq/BTJI5VUZa8whp46vzc4i5jK9QkeX/1go8+ik3PbHHHVv1HqwdIxeyc+ixhw7PiITPzjUQ==
X-Received: by 2002:a05:6902:2b0c:b0:e30:e252:b6c0 with SMTP id 3f1490d57ef6-e30e252c4d2mr19853065276.22.1730815411413;
        Tue, 05 Nov 2024 06:03:31 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8a9a269sm2402370276.37.2024.11.05.06.03.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:03:30 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3161848276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:03:30 -0800 (PST)
X-Received: by 2002:a05:690c:5:b0:6de:c0e:20ef with SMTP id
 00721157ae682-6e9d88ecdc1mr349956627b3.7.1730815410638; Tue, 05 Nov 2024
 06:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-fix-jump-label-v1-1-eb74c5f68405@yoseli.org>
In-Reply-To: <20241016-fix-jump-label-v1-1-eb74c5f68405@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 15:03:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULfk-_VGXBsnD+Gc7h4c5PRAYDdgx1zEeW=4+1fA0N_Q@mail.gmail.com>
Message-ID: <CAMuHMdULfk-_VGXBsnD+Gc7h4c5PRAYDdgx1zEeW=4+1fA0N_Q@mail.gmail.com>
Subject: Re: [PATCH] m68k: Initialize jump labels early during setup_arch()
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

On Wed, Oct 16, 2024 at 6:18=E2=80=AFPM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> The jump_label_init() should be called from setup_arch() very
> early for proper functioning of jump label support.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -249,7 +249,11 @@ void __init setup_arch(char **cmdline_p)
>         process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
>         *cmdline_p =3D m68k_command_line;
>         memcpy(boot_command_line, *cmdline_p, CL_SIZE);
> -
> +       /*
> +        * Initialise the static keys early as they may be enabled by the
> +        * cpufeature code and early parameters.
> +        */
> +       jump_label_init();
>         parse_early_param();
>
>         switch (m68k_machtype) {

This is indeed what some (but not all) other architectures are doing, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

I assume you saw some "static key used before call to jump_label_init()"
warning[1]? Since I never saw such a message, can you please elaborate
and explain your use case, so I can add that to the patch description
when applying?

Thanks!

[1] https://elixir.bootlin.com/linux/v6.11.6/source/include/linux/jump_labe=
l.h#L81

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
