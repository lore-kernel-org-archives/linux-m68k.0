Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51354EE57D5
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Sep 2023 06:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236263AbjIHGwB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Sep 2023 02:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjIHGwA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Sep 2023 02:52:00 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1656E10CF
        for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Sep 2023 23:51:53 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5925e580e87so16902447b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Sep 2023 23:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155912; x=1694760712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA3Qqh4mhsiPoQBLV2r7oediryAOFsUbH13RohOWuFA=;
        b=vehMZOsKHsesejJ2jEfQDMK8UlcA4awSoUGcEU4KqL7DQjvkoNaPxclVTzI5TYIeFw
         eCeqjllMDD5madC1hIe/sbveiWo8/cF31KVwmzjupjdn1NeYp1F3IJuN7JyO/xkWOQXT
         v7AOinw1osO83rhPWWKuevu985qu0yp0+RkdIbgtBktirryBCcue4cDwFYlsnU/pYkEZ
         g3LoRBKV17YciHFAYm5Ojf9kXcEHSNYPipFQSPhtLK9+eBNb1IkN96bAq+bJcKBK4Ehg
         vczyV4tqPRV2zb2iNNy8hplbzEOqk9Hv/o1fZ8MjjzdsNnhatVnBd7ZxJagOzDEPIFpZ
         OKUA==
X-Gm-Message-State: AOJu0YxUKAogfLhfGM7vh19iYnkkUsy5Wp2tEaRmQsSvliR/MmJzbaTT
        S0op94eEO8EsCzTAulRmSfoe3vXZMETgVg==
X-Google-Smtp-Source: AGHT+IGFefFuNivm3eAUxcu4aeGMm0/pXbw0bw1UvgigclTuAxi8xwuILONIdlZU4RHKHJ2DzFYfcg==
X-Received: by 2002:a81:52c7:0:b0:58d:71c0:34d1 with SMTP id g190-20020a8152c7000000b0058d71c034d1mr1812199ywb.6.1694155911989;
        Thu, 07 Sep 2023 23:51:51 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id e184-20020a8169c1000000b0059a34cfa2a5sm287798ywc.67.2023.09.07.23.51.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 23:51:51 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso1659659276.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 07 Sep 2023 23:51:50 -0700 (PDT)
X-Received: by 2002:a25:e64d:0:b0:d4a:5fc2:dbcd with SMTP id
 d74-20020a25e64d000000b00d4a5fc2dbcdmr1365104ybh.28.1694155910756; Thu, 07
 Sep 2023 23:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694093327.git.geert@linux-m68k.org> <5406d0829d8204841c8cb8d265ca91a52cd22d2d.1694093327.git.geert@linux-m68k.org>
 <6e46156f-5a81-d245-63cd-8091605deee1@linux-m68k.org>
In-Reply-To: <6e46156f-5a81-d245-63cd-8091605deee1@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Sep 2023 08:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8HMSgxAPFUSoCnKDs=y8T9w+5K+sTMUzmi37=ynH5FQ@mail.gmail.com>
Message-ID: <CAMuHMdU8HMSgxAPFUSoCnKDs=y8T9w+5K+sTMUzmi37=ynH5FQ@mail.gmail.com>
Subject: Re: [PATCH 25/52] m68k: apollo: Replace set but not used variable by READ_ONCE()
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Philip Blundell <philb@gnu.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        Laurent Vivier <laurent@vivier.eu>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Sep 8, 2023 at 1:37 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Thu, 7 Sep 2023, Geert Uytterhoeven wrote:
> > --- a/arch/m68k/apollo/config.c
> > +++ b/arch/m68k/apollo/config.c
> > @@ -146,13 +146,11 @@ void __init config_apollo(void)
> >
> >  irqreturn_t dn_timer_int(int irq, void *dev_id)
> >  {
> > -     volatile unsigned char x;
> > -
> >       legacy_timer_tick(1);
> >       timer_heartbeat();
> >
> > -     x = *(volatile unsigned char *)(apollo_timer + 3);
> > -     x = *(volatile unsigned char *)(apollo_timer + 5);
> > +     READ_ONCE(*(volatile unsigned char *)(apollo_timer + 3));
> > +     READ_ONCE(*(volatile unsigned char *)(apollo_timer + 5));
> >
> >       return IRQ_HANDLED;
> >  }
> >
>
> I believe the volatile cast is redundant here, as READ_ONCE does that.

Yes it does.  I didn't drop the volatile out of fear of introducing
some higher W-level warning about casting away volatility, but upon
closer look, the apollo_timer definition itself does not use volatile.

> Perhaps the remaining cast could be deduplicated like so:
>
> -       volatile unsigned char x;
> +       unsigned char *at = (unsigned char *)apollo_timer;
>
>         legacy_timer_tick(1);
>         timer_heartbeat();
>
> -       x = *(volatile unsigned char *)(apollo_timer + 3);
> -       x = *(volatile unsigned char *)(apollo_timer + 5);
> +       READ_ONCE(*(at + 3));
> +       READ_ONCE(*(at + 5));

Thanks for the suggestion!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
