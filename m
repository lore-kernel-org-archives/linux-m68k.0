Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E3CC433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB6BE61002
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238047AbhKHIiZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:38:25 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:35837 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbhKHIiY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Nov 2021 03:38:24 -0500
Received: by mail-ua1-f43.google.com with SMTP id q13so29962084uaq.2
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 00:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iee3ZOnCIVETm4NXdMxz0Mh7mJwHvjFrxby+ytKwTKA=;
        b=tHNsFsIhAqEimSvimCJMNyys4lJwFg0G6uCmWoS++BFZpQnzI+L+XHWNJAhRleCYbL
         FF3nigqKVTMXUtzolRK/tbs/gGEB9Wx42pHceZaoNuVO16aiKkMpwytQNNXbfmWHoHYx
         Pe0LPWS7ugj+Cmw5otYqLqW0/m6JYLvuxWhKh4obv+SGgL5GDFXh38lY5E8I0RAoN2bM
         RDmBz6cXBo2tPweE+hANP8h1749AgdzZT9hiDjE6gkjfWdQjgCR6Zs1bqrj7jUXC2EKQ
         Ewf0eXR1iBNAR2WiZXyCzJUDLJuytYpvze5RvqobIW+bkHeSqWFn/c0FVDXTTghX0AaJ
         4Ghw==
X-Gm-Message-State: AOAM533xp1J/MoYuSzZEMI6BMtwkhr6HdBTvZYkTxG06DxHqlbI7P5zW
        pSf60YvKHeKQ5CkLOW3jHq71WhRlSNpxuA==
X-Google-Smtp-Source: ABdhPJzoETWkTavNcG2Sb7GEJYwCtuGsaikHQUV6QFGQTR4bWMo29Yo4zG9uYJ7YifNPsR9zR/K99g==
X-Received: by 2002:ab0:164d:: with SMTP id l13mr16216013uae.34.1636360539716;
        Mon, 08 Nov 2021 00:35:39 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id p3sm53492vsr.3.2021.11.08.00.35.39
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:35:39 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id q13so29962033uaq.2
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 00:35:39 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr18043437vst.37.1636360539288;
 Mon, 08 Nov 2021 00:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20211104061102.30899-1-schmitzmic@gmail.com> <20211104061102.30899-2-schmitzmic@gmail.com>
In-Reply-To: <20211104061102.30899-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:35:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com>
Message-ID: <CAMuHMdVDAZpG=H210R_qeWmMPFm_62jGgsXv_ymYjDBC5-CcZQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Nov 4, 2021 at 7:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add the interface definitions for 16 bit card autoprobing (using
> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> by apne.c.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/amipcmcia.h
> +++ b/arch/m68k/include/asm/amipcmcia.h
> @@ -64,6 +64,7 @@ static inline void pcmcia_disable_irq(void)
>  #define PCMCIA_SPEED_250NS     250
>  #define PCMCIA_SPEED_720NS     720
>
> +#ifndef _LINUX_CISTPL_H

This #ifndef is here to prevent conflicts with <pcmcia/cistpl.h>?
Why can't the definitions below be removed, and <pcmcia/cistpl.h>
always included instead?

>  /* PCMCIA Tuple codes */
>
>  #define CISTPL_NULL            0x00
> @@ -106,5 +107,8 @@ static inline void pcmcia_disable_irq(void)
>  #define CISTPL_FUNCID_NETWORK  0x06
>  #define CISTPL_FUNCID_AIMS     0x07
>  #define CISTPL_FUNCID_SCSI     0x08
> +#else  /* defined _LINUX_CISTPL_H */
> +extern int pcmcia_parse_tuple(tuple_t *cftuple, cisparse_t *cfparse);

This can be unconditional?

> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
