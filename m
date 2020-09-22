Return-Path: <SRS0=3fPC=C7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D7C4363D
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 17:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 630A52084C
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Sep 2020 17:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIVRYv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Sep 2020 13:24:51 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40796 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIVRYv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Sep 2020 13:24:51 -0400
Received: by mail-ot1-f66.google.com with SMTP id e23so16347930otk.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Sep 2020 10:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tywmbibghLp2+xpDwxbboMmI2T69TiixzTeNI61eqH4=;
        b=ji88Kfq4yKzTiof2/9yXqrHImHgLVyK3xoPmfFvyjk6Q7AgIalM0QG49QZ5FENkDpo
         Jls3MPRZMQoq5ouWp41BpLFPFgEq0O/wNwvb+HATAg97xOWJAmVJfzWs1G0Xpa/XkvR1
         KwrlAkfH0nv6eIqAZkAaOTcoMNt6gv0tRMVFLfQswiFajeCViG0Zhx1zKygKoRCXjB7m
         rhNmUWNE/bv2BskWPtjhhIXmXVdN7eA2dRGxI6rBcyAOxUJ4w+YrvuNXRa7ErZ8Wht09
         4ZQvV7vIjNEtvThGRuXXyvKpRKdBnh0OrOaVKocDslR9d0tZ8oNca7LeTbJri8bOaEle
         ErYw==
X-Gm-Message-State: AOAM533t32mXbWKPTQBpmQM92pDXhmW8vNzGoMEALVyIknZsE4WxBuZH
        1jjWqglyqf7Potb5czPyimRYpr6hEf+Ujq/aBoc=
X-Google-Smtp-Source: ABdhPJyQ7DxeeGtDB7mB7OfaX//x7aYOP4MVNAXBU4Mquo+u6fZ3TaHGGAGCOiPAYiW/mg8LNImMM/SkwJZkdiO7VqU=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3588206otb.250.1600795490036;
 Tue, 22 Sep 2020 10:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <9a777d01-d8c2-445d-f6ea-94cd315d3474@physik.fu-berlin.de>
 <875z86q73i.fsf@igel.home> <885e6765-d049-40a0-8399-bdb2d4f42e91@physik.fu-berlin.de>
 <f161ba86-7243-3f3f-5183-e010da3f29be@physik.fu-berlin.de> <2484c74b-5f7d-deeb-4cde-a640e84367b4@physik.fu-berlin.de>
In-Reply-To: <2484c74b-5f7d-deeb-4cde-a640e84367b4@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Sep 2020 19:24:38 +0200
Message-ID: <CAMuHMdWBiydMpxzchcSV7LmyKAQCNjh0zSPydVxwhOMVZ=DfoQ@mail.gmail.com>
Subject: Re: Quick test on real hardware requested to test qemu
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Sep 22, 2020 at 5:23 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 9/22/20 3:27 PM, John Paul Adrian Glaubitz wrote:
> >>> That a typical bad alignment check.  It should use __alignof__, not
> >>> sizeof.
> >>
> >> Aha, I was assuming something like that already but I wasn't sure since libatomic-ops wasn't
> >> updated for a while in Debian [1].
> >
> > What would be the correct check then in [1]?
> I was just re-reading the code and realized I'm dumb. Never mind.
>
> s/sizeof/__alignof__/ should help.

Are 32-bit accesses to an address of the form 4 * n + 2 atomic?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
