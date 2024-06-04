Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7525E4A0F
	for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Jun 2024 06:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717484337; cv=none; b=r8mJ7MdZAkeRccpVGpmAHCvso2TCz7uvT5bXNhy1nbeqtADvfIufYIH0JMW7fOjbemAjk6RyImQs3EStgaUUcr29pEZyRtwe9bCz/YoLZ2+w6ugQiROjeeMzF05JYoOVcSVDQSNufBrUmcUWJBUCvVXUPG12McgrG2hZKSPffRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717484337; c=relaxed/simple;
	bh=0IBaqIvXdGsNjTa9/1Um14JErmIPdUJlGZYBceTEtZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET3fCdd+ngPvX5SmMg6rJPHLE6KleaKQ6yDOI84w+5GSm6i/MTpsaHqWmki4DNhklIGvGf9v384PnTDzWbMuKa297p97B6Fq0LJ96R1TXdpVW2ae6hXK8lV36qvsAizA5rR6E3PJ6LMsr1ym+texfjMnPmioL8+BGo77DwEVUZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627eb38eb1bso42474667b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Jun 2024 23:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717484334; x=1718089134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTYOpzbFo1WSTv3NB0gk0vLCX4b3VKqZSgNzhfoVpOw=;
        b=FKTD87NYMgBYVDufTwIDmqwkM3qrY8TUGz8i2YPQXpQrW3dv4k9CJ/fg/pptdmnaGX
         SeddfGyvJW9/nKQFONNr/jjy3ybsXzkLWQqRsXCkILuk/AjC6WEorkbIXo/qhQoW5XCL
         dbACRJHDLIil9sDTzUwnjWZ3MNbycIarIoEyIQjiGYGOgGBhtf4XadwCc+XHCReJX3xP
         uF+duKalzLvYa0y14Lc+XMPEBUn5E2lDqytukvUeBm/oOHJCsASlN//V5+zdKxj26nks
         irsLaVdIY3Zq5Lp/ONyutt32XIJ6Uf9JQB3fsIkRBF+uIRX2pIijifkxp2ruqLsmKbBm
         Ki6Q==
X-Gm-Message-State: AOJu0Yxr2ZiwHo9ehPimMGGzMCH2IJ47xbhbGlRSyvRlEgF8yXnOmPKC
	JFQROmYbCHdzO9qHBfl+pyvGT93xrfIWAro16tn4o0JcueJx3wjK2XQpG5Wk
X-Google-Smtp-Source: AGHT+IHBUaT726ua7NRT/WxpXMMGDgpsltPoHmc0q+CNQ3v2yhqPCIMud4lvyUb7ky41xCRdW7OcBg==
X-Received: by 2002:a81:a0cb:0:b0:61e:a26:c1b2 with SMTP id 00721157ae682-62c796c28f5mr119962787b3.17.1717484334056;
        Mon, 03 Jun 2024 23:58:54 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766cfe17sm17382317b3.137.2024.06.03.23.58.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 23:58:53 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa8427f22dso3313657276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 03 Jun 2024 23:58:53 -0700 (PDT)
X-Received: by 2002:a5b:28e:0:b0:dfa:b247:401c with SMTP id
 3f1490d57ef6-dfab24741c8mr3045944276.14.1717484333278; Mon, 03 Jun 2024
 23:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601153254.186225-1-p.pisati@gmail.com>
In-Reply-To: <20240601153254.186225-1-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 08:58:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUO11XCfexOScnVFqEhxUa2eGAuzBhdZFs8-N9FymObfQ@mail.gmail.com>
Message-ID: <CAMuHMdUO11XCfexOScnVFqEhxUa2eGAuzBhdZFs8-N9FymObfQ@mail.gmail.com>
Subject: Re: [PATCH v4] m68k: amiga: turn off all incoming interrupts from the
 Warp1260 during boot
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Sat, Jun 1, 2024 at 5:33=E2=80=AFPM Paolo Pisati <p.pisati@gmail.com> wr=
ote:
> On an Amiga 1200 equipped with a Warp1260 accelerator, an interrupt storm=
 coming
> from the accelerator board causes the machine to crash in local_irq_enabl=
e() or
> auto_irq_enable(). Disabling interrupts for the Warp1260 in
> amiga_parse_bootinfo() fixes the problem.
>
> Link: https://lore.kernel.org/r/ZkjwzVwYeQtyAPrL@amaterasu.local
> Cc: stable <stable@kernel.org>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> ---
> Changes since v3:
> -simplify commit body and subject

Thanks for the update!

> --- a/arch/m68k/amiga/config.c
> +++ b/arch/m68k/amiga/config.c
> @@ -180,6 +180,15 @@ int __init amiga_parse_bootinfo(const struct bi_reco=
rd *record)
>                         dev->slotsize =3D be16_to_cpu(cd->cd_SlotSize);
>                         dev->boardaddr =3D be32_to_cpu(cd->cd_BoardAddr);
>                         dev->boardsize =3D be32_to_cpu(cd->cd_BoardSize);
> +
> +                       /* CS-LAB Warp 1260 workaround */
> +                       if (be16_to_cpu(dev->rom.er_Manufacturer) =3D=3D =
ZORRO_MANUF(ZORRO_PROD_CSLAB_WARP_1260) &&
> +                           dev->rom.er_Product =3D=3D ZORRO_PROD(ZORRO_P=
ROD_CSLAB_WARP_1260)) {
> +
> +                               /* turn off all interrupts */
> +                               pr_info("Warp 1260 card detected: applyin=
g interrupt storm workaround");

Missing "\n".

> +                               *(uint32_t *)(dev->boardaddr + 0x1000) =
=3D 0x0FFF;
> +                       }
>                 } else
>                         pr_warn("amiga_parse_bootinfo: too many AutoConfi=
g devices\n");
>  #endif /* CONFIG_ZORRO */

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.11, with the above fixed.
No need to resend.

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
