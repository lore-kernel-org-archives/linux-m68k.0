Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C45C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Dec 2022 13:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiLSNmY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Dec 2022 08:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiLSNmW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Dec 2022 08:42:22 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B31F03C
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 05:42:22 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id a16so8155293qtw.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 05:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQi8PIyb2I8nPBmDxYj+1fnkdp36Nk0KuloQrvExGIk=;
        b=zzm30bvnsn2f7bPREOR1889PNle99hAjeJKUM/62eoi2O5gS+0VmgRcs6OKp4lnwBA
         sLe53iNkZfsDWcv+nD0sr11ynB1D1RM7RxbquD03vylT9hveKxBoKZy7mZ+qspq0cXx2
         zDVg2y4ZGY1LM/Frw37feuYgok6L5SpogdoKqxQzBW0qmN5H06M3OAEwTXvWmHr9sDzR
         T86YHP6NwYU71PhCbTLyIkrTSz/bZv3EbbRgTHGCXsYGYv9QPp6+RNmgp4167rpQd6em
         bLM4BiYIuLX3T6/hjwvpvFp1iJuseViWQBFmwn0vHhmW2BChMFbiqTDh8V1W8ED/EL+D
         XDQA==
X-Gm-Message-State: AFqh2kqc4d8upK+04U5G15k0+G5UQsYRGaABTuc94+G6I+U1yvX3j9me
        D10nOK6YD2eArBugo/jGgVKqlE8Ip6nRmw==
X-Google-Smtp-Source: AMrXdXuPrIMaWR/Je+zztm5Z2TDFwB4SqAZEFYsdAaafupSuiEWMfqbGMCgqUS3MkApShfLp6m1IkQ==
X-Received: by 2002:a05:622a:4205:b0:3a7:f599:220e with SMTP id cp5-20020a05622a420500b003a7f599220emr12226171qtb.55.1671457340886;
        Mon, 19 Dec 2022 05:42:20 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id t26-20020a05620a035a00b006b949afa980sm6824710qkm.56.2022.12.19.05.42.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:42:20 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3b5d9050e48so127237917b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 05:42:20 -0800 (PST)
X-Received: by 2002:a81:a8a:0:b0:37e:6806:a5f9 with SMTP id
 132-20020a810a8a000000b0037e6806a5f9mr14592225ywk.47.1671457340239; Mon, 19
 Dec 2022 05:42:20 -0800 (PST)
MIME-Version: 1.0
References: <8e823d669284abb9b5174f25a4abfc4cd35b1652.1670919535.git.geert@linux-m68k.org>
 <4c17e3cb-43a2-f3a7-d713-71093367eac5@linux-m68k.org>
In-Reply-To: <4c17e3cb-43a2-f3a7-d713-71093367eac5@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Dec 2022 14:42:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+EDZJ4doZeJMrBNghV7G_gDCDP6z5odhdTU26H8oqWg@mail.gmail.com>
Message-ID: <CAMuHMdW+EDZJ4doZeJMrBNghV7G_gDCDP6z5odhdTU26H8oqWg@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: Fix misspellings of "DragonEngine"
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Dec 19, 2022 at 1:33 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 13/12/22 18:19, Geert Uytterhoeven wrote:
> > Exys produced the "DragonEngine II" board.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> At least the misspelling was used consistently ;-)
> See arch/m68k/68000/dragen2.c!

No it was not: that file has a different misspelling.
Sending v2...

> Do you want me to push through the m68knommu git tree?

Yes please (same for the other patch).
Thanks!

> > ---
> > The printed message:
> >
> >      arch/m68k/kernel/setup_no.c:    pr_info("DragonEngine II board support by Georges Menie\n");
> >
> > matches Georges' website:
> >
> >      https://www.menie.org/georges/DragonEngine/
> > ---
> >   arch/m68k/Kconfig.machine | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> > index b7a70297fbc1a5a6..e2f961208f18bec5 100644
> > --- a/arch/m68k/Kconfig.machine
> > +++ b/arch/m68k/Kconfig.machine
> > @@ -199,11 +199,11 @@ config UCDIMM
> >         Support for the Arcturus Networks uCdimm module.
> >
> >   config DRAGEN2
> > -     bool "DragenEngine II board support"
> > +     bool "DragonEngine II board support"
> >       depends on !MMU
> >       select M68VZ328
> >       help
> > -       Support for the DragenEngine II board.
> > +       Support for the DragonEngine II board.
> >
> >   config DIRECT_IO_ACCESS
> >       bool "Allow user to access IO directly"


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
