Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE13BC47082
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4E7261164
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhFGItY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:49:24 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:43814 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGItX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Jun 2021 04:49:23 -0400
Received: by mail-ed1-f47.google.com with SMTP id s6so19325386edu.10
        for <linux-m68k@vger.kernel.org>; Mon, 07 Jun 2021 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kazik.de; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbCJZ424Xbt1MnOfGZf2sF9LS+q4Pp70klcOnStjO08=;
        b=rVqM/N7ix6+OFOAqkzmX/3xR+VlPj49ipm/MCahSj2TeHef+NFYDEi6YmLyp/zvLo1
         yJOMfqUsR9VaRoZirf2O9halVqRXr9wqnGlav1+bXjIDu4/scqA7V4E+aIPH5RPdpj9s
         ak2db+be33WvInAZeRfH0cXVt1OmFxsJ8Uxnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbCJZ424Xbt1MnOfGZf2sF9LS+q4Pp70klcOnStjO08=;
        b=n4ArYvaJh6sK9YyQw7gtIh8kacEM9HkGaxNyKc1pGNPno2oA/7CfQpmJJ1vlbKR5U4
         JlVfOtEyGwex/pajPvfwYH2vMxOM2j5zwOM+kGZ97gml8kJJlQ6NRHBvRC3jW+CD35Db
         4CReg99Z8Gf4TwTwz1kN0phA8QrFmyLl3wskpZwhOQFbGgwqCZNUYXygVbfjJQpKmfdt
         1sh3W1zC3ax5CvADp532izYJUGInjoEkc3rsESzBUwW372yzrXJCa2pe8x6o0Oz80eip
         5iTy/lythLns/BK+3Ok2nIC28ItHcfga/Q3pn86UZjCuK2UsfKkwLGI4QCB+llyQeQJw
         cmcg==
X-Gm-Message-State: AOAM533O8RAj8DntsdCxGZ39hjhzeBvvkoqxXGXGOlxQBSJufjBmA2I+
        W9uaN3GYBlHxlTLm9ZCzFyVfB8Nfl0PGhrDjHNc6ig==
X-Google-Smtp-Source: ABdhPJyxVmF5qq2RnWEx36JlhrjEE//8AmCKLcPsyhdNc3vg9ieNuhslYCmsW8jAruky+WQ86nfRnSGCmnXvx/owm8Q=
X-Received: by 2002:a05:6402:5256:: with SMTP id t22mr5796547edd.54.1623055579647;
 Mon, 07 Jun 2021 01:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210605060447.GA18461@allandria.com> <1622958877-2026-1-git-send-email-schmitzmic@gmail.com>
 <1622958877-2026-3-git-send-email-schmitzmic@gmail.com> <CAMuHMdXEs874y3nBjVNt8TQP-AMLTRMFgh+1wMt2xyJP3W_+Dg@mail.gmail.com>
 <d6268e39-295d-f9a4-862c-738803168f03@gmail.com>
In-Reply-To: <d6268e39-295d-f9a4-862c-738803168f03@gmail.com>
From:   ALeX Kazik <alex@kazik.de>
Date:   Mon, 7 Jun 2021 10:46:09 +0200
Message-ID: <CAFFuhJp5iu-2o4wYf3XSsCF3VV_T-q8gp08bkPpGBs8Ra_OnKw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] net/8390: apne.c - add 100 Mbit support to apne.c driver
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        linux-ide@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

> It's been quite a while - can you still try and build/test this change, Alex?

I'm happy to test it again (assuming my Amiga still works, not used
for a while).
But I'm waiting until you guys have perfected the patch.

> >> +
> >>         pr_info("Looking for PCMCIA ethernet card : ");
> >>
> >>         /* check if a card is inserted */
> >> @@ -590,6 +597,16 @@ static int init_pcmcia(void)
> >>  #endif
> >>         u_long offset;
> >>
> >> +#ifdef CONFIG_APNE100MBIT
> >> +       /* reset card (idea taken from CardReset by Artur Pogoda) */
> >> +       {
> >> +               u_char  tmp = gayle.intreq;
> >> +
> >> +               gayle.intreq = 0xff;    mdelay(1);
> >> +               gayle.intreq = tmp;     mdelay(300);
> >> +       }
> >
> > Is this safe for all cards?
>
> I _think_ so, but this really is a question for Alex and others involved
> in developing the original patch. (The original patch had that
> conditionalized as well so I might be wrong ...)

My code is based on the patches here: http://www.g-mb.de/pcmcia_e.html

I'm not deep into it, just adapted the patch. And that's why I can't
tell if the other drivers will work with it always enabled, sorry.

Bye,
Alex.
