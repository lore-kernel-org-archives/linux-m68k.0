Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A804B04B6
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956742; cv=none; b=AkmbU17Cu8OBmbaXUJmW5wh+KFpL1W9FtPGvRaAMoWitNqyIGNsGRvacz2kI5MvmQALpxaVHhzQkzpzTuwsykGlnTfg7vSvF8c2a4oUPnkVSQaSuNylq5CxbEanAQ56xf+smiT0/DSoL3Uoua8j3hcvpxaMxPidRvtTECtR1I7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956742; c=relaxed/simple;
	bh=BcHuOfcLD6771lQsjeCwYllckWcAZfdbrMwC937etMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHJbN2/XyclO7TRaMLsYQ8AI5ByBQlGKYKDbh32j36cI0G87XCXvaVgLfuBypCNTO2PFrzNhnJvSiUb9fBdm8Q6X7Ynxsfi1BBl6mF/EZ3FM978sfjw17qks90HXoJnsIfSKfa1PyorV699kZWDUKvUlJPAsBrzaW2HXZLFPbVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-746d77537f8so1615168137.0
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956740; x=1787561540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlAhBpDEmXXa5qEbv6Yj+sTzNqdVkRvMBBzeF+OGu9Y=;
        b=c+C8mY+So3MIfC4yG069XgdQ83IVAl0PnOug/Q6lLp3ZeQ2ytrKGulQZCouWzz1jjZ
         oIuRWK51Z1gGEN7dmeJHxrBAfAslYjPNymvN5il4EItYszYs14ArgxzMi6ymmRV9/mhx
         agvYKcJ+gk1C/tiowr/+1ORZOFF2sRRn0VQInH+WQfREGaCjEF5VYQz16FmJzij6orLr
         BHnD/7RCn8m8zxjQk13rRfJvrZ+Ey/Vs1J0IA5kq77L/FjTHP5ZqlhOKKzWn0r6Yr97O
         //Rd6uVehZkQy9b6PYykSz2HoZNsxAfOOArL+wQGMqj4HVna06SdZe1ZdRQ4n+i7TobA
         HmbQ==
X-Gm-Message-State: AOJu0YxnrhogIZueQuD9PE39uocKjvx/JzzLiFBWAJkcdkb1u2jdQpzo
	5+TaN00VH764yDu/z8fJzTPLIc1gA6SH2VGL2oxPY3xzgSgN8ipc3gkgDmb9myir
X-Gm-Gg: AR+sD13vQDnj4TmDhAYTtU0854CwJBhvTZworja2IVSgg8R/GXb5rVuIXpLrGIOwvg5
	ixlzT/TWyR6SFen/nF2S8BbK+rUzkIxvqGhnHPChyxgkko1TbTb/ur8lPd7LsO2GjfwHkI1ACJO
	mZUcKoF6yndF72L8O975f/2nGcUlUK1IxgqoIOc6rhCGsjb5vZGr9TKICu1dSO8E/JeS8utUyjs
	AHMcCYrYOnetYsh+erLo0SEh4hex3+vSOjySUtTtZnRvBdIzblJiwld6eTawLXNqRhEwYtGULSG
	OGnL9MkBR4+JYjDL5VCaKKdQJxkwR9MBoYktz7L+pSNVsapUrzhDS+Chq+4pd7VxTuWxAKvyEMQ
	++EmiK/ka3bSOjD3vYSLUThfv1Lomb9waT6+YRJ6bgBo8ny/VDrEL0uFhyk5sBBkIM8988CpvrM
	nPbnUkLYhIeWkPUJKQ2QCKA0N6GLEgDGGF00tahxrQREI7xCGA8pW+h8DBR3XchGjWY6OmMEDYG
	gNX/Q6ciGebHbS60uLPQgaMGg==
X-Received: by 2002:a05:6102:8096:b0:74c:11b2:a944 with SMTP id ada2fe7eead31-76f2cd68fcfmr4751320137.14.1786956739962;
        Mon, 17 Aug 2026 01:52:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c2cf0673sm450758137.3.2026.08.17.01.52.19
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:52:19 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-746d77537f8so1615164137.0
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:52:19 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:772:9979:cbc5 with SMTP id
 ada2fe7eead31-7729979fc53mr1311940137.2.1786956739503; Mon, 17 Aug 2026
 01:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-6-schmitzmic@gmail.com>
In-Reply-To: <20260816073752.16656-6-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 10:52:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPiizRPkT3ukiNoc-26dnqAKgkomsR8mYNxqSyh5bQ+g@mail.gmail.com>
X-Gm-Features: AcwNN1U-18MobXucNLAUafMCXQUVHfJylxjEUstlfi5NG0L1GYGMG6hLVADhkFQ
Message-ID: <CAMuHMdXPiizRPkT3ukiNoc-26dnqAKgkomsR8mYNxqSyh5bQ+g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> The SuperVidel FPGA contains an OpenCore ethernet package. Add
> platform device data and other necessary definitions to support
> this device on Atari.
>
> The ethoc module must be enabled separately by the user.
>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>
> ---
> Changes in v2:
>
> - fix svethlana platform register error handling (Geert)

Thanks for the update!

> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c

> @@ -892,6 +949,23 @@ static int __init atari_platform_init(void)
>         }
>  #endif
>
> +#ifdef CONFIG_ATARI_SVETHLANA
> +       {
> +               int error;
> +               void __iomem *sv_version;
> +
> +               sv_version =3D ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
> +               if (sv_version) {
> +                       if (hwreg_present(sv_version) &&
> +                           (__raw_readl(sv_version) & 0x3ff) >=3D 10)
> +                               error =3D platform_device_register(&sveth=
lana_device);
> +                               if (error && !rv)
> +                                       rv =3D error;

Missing curly braces:

    error: this =E2=80=98if=E2=80=99 clause does not guard... [-Werror=3Dmi=
sleading-indentation]:

> +                       iounmap(sv_version);
> +               }
> +       }
> +#endif
> +
>  #ifdef CONFIG_ATARI_ETHERNEC
>         {
>                 int error;

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
