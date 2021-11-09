Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8231C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 08:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B683611BD
	for <linux-m68k@archiver.kernel.org>; Tue,  9 Nov 2021 08:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241714AbhKIIRV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:17:21 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:33533 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbhKIIRV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Nov 2021 03:17:21 -0500
Received: by mail-ua1-f42.google.com with SMTP id b17so36992346uas.0
        for <linux-m68k@vger.kernel.org>; Tue, 09 Nov 2021 00:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhd3ezy8myzp/ikE3sazwWI83nlclz2J63YyVOY6B+c=;
        b=hWrREqjF7bc6d7MEG8kroOXT3G21onz4FSXMbjNgMiEw0iDFc2RkkxAvF5K5NOz09H
         xVC7ahPp71HGZf92qI+ND2QrdyiLxCXdRfBbFMrEtsJzlxpwLaHjTP7a0I/QQiMgD8hC
         kA7RNsCSSBU+SCS4PpLedCgD7NWkUneWpqsBnaBortktFKyQ+51dH8z82wspniEjdG/f
         COeVCuGdkT4dDQZLKHB+smp+wp4LknoTFsp/wdmMygefZdHAKz4ojgjbJJFxP/KGgjZR
         1+o1z+Pe/VD4jKOwdtIpn9FZsMqjZYSL8W0wL0EB+Iyu1cj6ieO78olmNLfoNwqV5G7O
         Ag/w==
X-Gm-Message-State: AOAM530V7sHOJhJ39X2mbgbrVc/beUsfOCFv/FJNZ5hnWZs+MYPwK4wo
        Si4NM9qookKtny8/fG3SHShn2v9S78otW7Z9
X-Google-Smtp-Source: ABdhPJyYNy+yltv7KBrOACJoC9CdmPg+TICbzr/R/O7gVdrQLoe/BDbIB5qrQIRvisD1ewbfdeulZg==
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr48502224vsb.9.1636445674621;
        Tue, 09 Nov 2021 00:14:34 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id k185sm3584936vsc.21.2021.11.09.00.14.34
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:14:34 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id t13so21605595uad.9
        for <linux-m68k@vger.kernel.org>; Tue, 09 Nov 2021 00:14:34 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr38346902vsl.41.1636445674121;
 Tue, 09 Nov 2021 00:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20211109040242.11615-1-schmitzmic@gmail.com> <20211109040242.11615-2-schmitzmic@gmail.com>
In-Reply-To: <20211109040242.11615-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:14:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnn5Nzkj=CF-sSUhbJ+uC_UL1Rw==xtwMbvc3h5e2YKA@mail.gmail.com>
Message-ID: <CAMuHMdUnn5Nzkj=CF-sSUhbJ+uC_UL1Rw==xtwMbvc3h5e2YKA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Nov 9, 2021 at 5:03 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add the interface definition for 16 bit card autoprobing (using
> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> by apne.c. Include necessary cftable definitions from cistpl.h,
> remove locally duplicate definitions from amipcmcia.h.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> --
>
> Changes from v8:
>
> Geert Uytterhoeven:
>
> - just include pcmcia/cistpl.h; declare pcmcia_parse_tuple()
>   only if core PCMCIA code is included

Thanks for the update!

> --- a/arch/m68k/include/asm/amipcmcia.h
> +++ b/arch/m68k/include/asm/amipcmcia.h
> @@ -13,6 +13,7 @@
>  #ifndef __AMIGA_PCMCIA_H__
>  #define __AMIGA_PCMCIA_H__
>
> +#include <pcmcia/cistpl.h>
>  #include <asm/amigayle.h>
>
>  /* prototypes */
> @@ -64,47 +65,8 @@ static inline void pcmcia_disable_irq(void)
>  #define PCMCIA_SPEED_250NS     250
>  #define PCMCIA_SPEED_720NS     720
>
> -/* PCMCIA Tuple codes */
> -
> -#define CISTPL_NULL            0x00
> -#define CISTPL_DEVICE          0x01
> -#define CISTPL_LONGLINK_CB     0x02
> -#define CISTPL_CONFIG_CB       0x04
> -#define CISTPL_CFTABLE_ENTRY_CB        0x05
> -#define CISTPL_LONGLINK_MFC    0x06
> -#define CISTPL_BAR             0x07
> -#define CISTPL_CHECKSUM                0x10
> -#define CISTPL_LONGLINK_A      0x11
> -#define CISTPL_LONGLINK_C      0x12
> -#define CISTPL_LINKTARGET      0x13
> -#define CISTPL_NO_LINK         0x14
> -#define CISTPL_VERS_1          0x15
> -#define CISTPL_ALTSTR          0x16
> -#define CISTPL_DEVICE_A                0x17
> -#define CISTPL_JEDEC_C         0x18
> -#define CISTPL_JEDEC_A         0x19
> -#define CISTPL_CONFIG          0x1a
> -#define CISTPL_CFTABLE_ENTRY   0x1b
> -#define CISTPL_DEVICE_OC       0x1c
> -#define CISTPL_DEVICE_OA       0x1d
> -#define CISTPL_DEVICE_GEO      0x1e
> -#define CISTPL_DEVICE_GEO_A    0x1f
> -#define CISTPL_MANFID          0x20
> -#define CISTPL_FUNCID          0x21
> -#define CISTPL_FUNCE           0x22
> -#define CISTPL_SWIL            0x23
> -#define CISTPL_END             0xff
> -
> -/* FUNCID */
> -
> -#define CISTPL_FUNCID_MULTI    0x00
> -#define CISTPL_FUNCID_MEMORY   0x01
> -#define CISTPL_FUNCID_SERIAL   0x02
> -#define CISTPL_FUNCID_PARALLEL 0x03
> -#define CISTPL_FUNCID_FIXED    0x04
> -#define CISTPL_FUNCID_VIDEO    0x05
> -#define CISTPL_FUNCID_NETWORK  0x06
> -#define CISTPL_FUNCID_AIMS     0x07
> -#define CISTPL_FUNCID_SCSI     0x08
> +#if IS_ENABLED(CONFIG_PCMCIA)
> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);
> +#endif

Why the #ifdef? Can't it be defined unconditionally?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
