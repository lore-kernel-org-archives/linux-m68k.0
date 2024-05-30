Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7FD176AC2
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717054263; cv=none; b=CIpDW6VL40ut90Jr0zRb4k1+vln/a0/7TCR0jiCWhwN/3aMmNF+U7pL1T2oFqXa6lSMaZASJYPmxeqQdqbelKsOLnmFNPIQs/lAeadR+3zpAtrRLsh1R/uooHQcHaq1/NN6oaH6G8K5WNHmPF0jccLgjsUnJG83aqksw+SmZ/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717054263; c=relaxed/simple;
	bh=339BrGbqs8cs9VVKdYFjXD5jEkYgF9FQ0Eldj8d2lHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mppcQSVTs0Y5TwyI/RVZ2C3X0wRd9bgOURv2PDZwFVAu/0VGSHHJGTXpK2xf6COUR36kbgbmuEpBCttLc+5ylq4gHZ0vvw/Fe4Rqq5YFtCq4OiQDw9xlSB/K5gGLhV4FrykHxeI+w7bWVVk6bxSdSyLAeVKd3NkBtE2imGuYncE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62c6317d15cso4980497b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 00:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717054260; x=1717659060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VikEmrSDILtG4l+oEpOAt/vs52B/cfHV81DqBuRih6k=;
        b=p2WE5SYpGaBuNr6Xvv1Qy24BIJkl6KcJXZgNjx9Qug7BfSD5pnhjcOuZqX+ImhZCSW
         AsZ1YOSbZ7axQP2U1iPJDdsiN+i9mOXV5B4K14V6kNVas2Nem5xTaUZWCiRVIxlgMIbR
         nCDVfLIWXGFCXO3NRX2sySilk9aUAQftldssTlxqQV0Yw8x691fVRkl5yXi4S3CtZ+vQ
         6y1bN1X9KzEqgKeHIeTXH3rTs9VHtJJm825fXWfl8K9sn+6xVxLEfS5GPQgbs/nwa8QL
         fkdblEZQz7PbKLJucyXuyoT8COALyQ8N5fZ2+yN+C/8zyInrxRn/lealtbzLM2768qee
         0pog==
X-Gm-Message-State: AOJu0Yx4EIlTvBabOeamELtc8THWgysAHbp/1xQiF1lY0bvHowV6rPN2
	hKxDDeh/nDwmr6W1odmUPe8CxS7ofmRSjFkjexBcYyffr5EuyY2TOVwnTQei
X-Google-Smtp-Source: AGHT+IHWfMUBDwuokjUfjvfPO4wR1Lzi9C1TNppNZriB2vAS9JbH/uesJJqJ4zoUiMf5Zm99Y0WN2g==
X-Received: by 2002:a05:6902:c0d:b0:df7:978a:73de with SMTP id 3f1490d57ef6-dfa5a5ef696mr1804983276.19.1717054260302;
        Thu, 30 May 2024 00:31:00 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df774669e5bsm1710198276.10.2024.05.30.00.31.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 00:31:00 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa52560cb3so528297276.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 May 2024 00:31:00 -0700 (PDT)
X-Received: by 2002:a25:84c9:0:b0:df6:d068:76d7 with SMTP id
 3f1490d57ef6-dfa5a803226mr1545148276.57.1717054259826; Thu, 30 May 2024
 00:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529163118.867333-1-p.pisati@gmail.com> <20240529163118.867333-2-p.pisati@gmail.com>
In-Reply-To: <20240529163118.867333-2-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 09:30:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZM4yOgJJgKz3N+Xqk16Y4++7B4F5a7RN7U7Fd_38e3w@mail.gmail.com>
Message-ID: <CAMuHMdXZM4yOgJJgKz3N+Xqk16Y4++7B4F5a7RN7U7Fd_38e3w@mail.gmail.com>
Subject: Re: [PATCH 1/1] m68k: amiga: config: upon boot, turn off all incoming
 interrupts from the Warp1260
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Wed, May 29, 2024 at 6:39=E2=80=AFPM Paolo Pisati <p.pisati@gmail.com> w=
rote:
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for your patch!

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

Probably we want a pr_info() here, so we know the workaround is applied.
This also helps debugging if the workaround ever causes an issue.

> +
> +                               /* turn off all interrupts */
> +                               uint32_t *int_reg =3D (uint32_t *)(dev->b=
oardaddr + 0x1000);
> +                               *int_reg =3D 0x0FFF;

This can be combined:

    *(uint32_t *)(dev->boardaddr + 0x1000) =3D 0x0FFF;

> +                       }
>                 } else
>                         pr_warn("amiga_parse_bootinfo: too many AutoConfi=
g devices\n");
>  #endif /* CONFIG_ZORRO */
> diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_id=
s.h
> index 6e574d7b7d79..393f2ee9c042 100644
> --- a/include/uapi/linux/zorro_ids.h
> +++ b/include/uapi/linux/zorro_ids.h
> @@ -449,6 +449,9 @@
>  #define  ZORRO_PROD_VMC_ISDN_BLASTER_Z2                                Z=
ORRO_ID(VMC, 0x01, 0)
>  #define  ZORRO_PROD_VMC_HYPERCOM_4                             ZORRO_ID(=
VMC, 0x02, 0)
>
> +#define ZORRO_MANUF_CSLAB                                      0x1400
> +#define  ZORRO_PROD_CSLAB_WARP_1260                            ZORRO_ID(=
CSLAB, 0x65, 0)
> +
>  #define ZORRO_MANUF_INFORMATION                                        0=
x157C
>  #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I                  ZORRO_ID(=
INFORMATION, 0x64, 0)

This board does not seem to be in zorro.ids yet.

Adrian: Which repo is the official one?
    https://github.com/glaubitz/zorroutils
    https://github.com/glaubitz/zorroutils-debian

Looks like Debian no longer has a zorroutils package...

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
