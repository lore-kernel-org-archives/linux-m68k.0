Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED8DC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 10:33:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A72E060C4A
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 10:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhKLKgP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 05:36:15 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:45580 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbhKLKgK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 12 Nov 2021 05:36:10 -0500
Received: by mail-ua1-f53.google.com with SMTP id ay21so17778115uab.12
        for <linux-m68k@vger.kernel.org>; Fri, 12 Nov 2021 02:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vK2x6JFHN4dkNwGqtUQbeziQcHNFscdvaRq4c7kpmg4=;
        b=uVkvW+Xno1TwXR1Kmki5Iw3xHrs1pu7wquq0BB1rnQy/6Wv55LVcOP94YHve12A7aN
         R68zus+NjBWLS+IZgO/Ng+98UaDjuj+7AUZ1mjNj7GLH1fgi5frajvK4FWAvmVTFZ6af
         iuN54qbFJqTv0IfjuiEkmPpw1UeLkjiAz3PTPkpnAoQ4lA6uW37zgg2z4NyjG25Ilj8Z
         PcYMQgZXsuqYI7zbj5EQIXoDJhXStVBYnmuho/yORM4lVV7SGR3cXkdJfdHxVxkaJWC1
         o7DG0/g0KgzX3YeUkeshNIrhfn1qo6u56sL1Whx9FxgwaYKOvj2SZlVGab2i+hKF/EJi
         Toqw==
X-Gm-Message-State: AOAM5307DiEQI3FBP7nZcv2ZhEd7rnOe/brzyoNtyIvVLsCPHvfaakqN
        I/9ehMQleWzWNBHND+egllsMInAWzwMdIA==
X-Google-Smtp-Source: ABdhPJyySQcUb3EfX9DTztlJU7EJqtlKK4uMA4LcOS278Qjy6VNAm/8AKSuTtzgoGNK9Vym5xjytCw==
X-Received: by 2002:a67:dc86:: with SMTP id g6mr8723794vsk.8.1636713199632;
        Fri, 12 Nov 2021 02:33:19 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id y7sm3944006uac.3.2021.11.12.02.33.19
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:33:19 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id p2so17770872uad.11
        for <linux-m68k@vger.kernel.org>; Fri, 12 Nov 2021 02:33:19 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr8368110vst.37.1636713198994;
 Fri, 12 Nov 2021 02:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20211111025554.26768-1-schmitzmic@gmail.com> <20211111025554.26768-2-schmitzmic@gmail.com>
In-Reply-To: <20211111025554.26768-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 11:33:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqUO5xBp+sbOJrAGRPA+4YqZNuXjypdHi8R3fkQ9Ufxw@mail.gmail.com>
Message-ID: <CAMuHMdWqUO5xBp+sbOJrAGRPA+4YqZNuXjypdHi8R3fkQ9Ufxw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Nov 11, 2021 at 3:56 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add the interface definition for 16 bit card autoprobing (using
> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> by apne.c. Include necessary cftable definitions from cistpl.h,
> remove locally duplicate definitions from amipcmcia.h.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

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
> +/* CIS tuple parser for 16 bit IO detection */
> +
> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);

Seems like you can just #include <pcmcia/ds.h> instead, no ill
effects on .i and .s output?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
