Return-Path: <SRS0=gqU9=6E=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860E9C3815B
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Apr 2020 17:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F7B320CC7
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Apr 2020 17:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgDTRsv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Apr 2020 13:48:51 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:42416 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgDTRsv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Apr 2020 13:48:51 -0400
Received: by mail-oo1-f68.google.com with SMTP id e18so2321245oot.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Apr 2020 10:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XCJB0Hcl+PXqI/c7jgEyi3+z3z4H8KBBmC1/eU1sakE=;
        b=gXQT79Q2aewFnu9LTAMLXKXChfmEaWS1ip6TxKRD1XM4RwyLYM8t+QpIL4jBriTMCH
         4VvEsRzj0HkurO/5te2Vg9BJQMj//3JCdMtqQE7stDNpbYU9THTgbgErA7vqfKv2TppZ
         /Y+G/991GGXfQoBeh65G2Y/Xdl+aybYKw7Jlycp7oM7PHfPPBZn2kjYXcR/NYbyeDDVB
         2YGfPz+07a8empDvM86i52/yhwKGswwJ1q7GaBLbVXXR2JomqVFhPsJaQNUU11hdoHO8
         Kxnkqx4L2euftHCXe3fcfrswDx3E0bE8fBpUeafl6MCGLt7TBknMBU0J8qLevvKmw/R3
         5mMw==
X-Gm-Message-State: AGi0PuaWpNm3zT0rwXDkXEqYVsNzUPYM5LpORGvV0i/QAz1/0Cl9k6AM
        Md/UN4ai4UgX1SwFUNZ7582IByuWQB2T4XAlhwo=
X-Google-Smtp-Source: APiQypIRNWURXfy5vvGFTZuaLtS69iEfcbgyAP/4zA04W6udHPCGK71Ysn1XP96uFhfXFb0sXwJNcakqyUVajulCwgw=
X-Received: by 2002:a4a:a126:: with SMTP id i38mr14002027ool.11.1587404930639;
 Mon, 20 Apr 2020 10:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585264062.git.gustavo@embeddedor.com> <14ff577604d25243c8a897f851b436ba87ae87cb.1585264062.git.gustavo@embeddedor.com>
 <CAMuHMdW4f-sPPY9sOU-xdVJ-0zsix4wcMTxUz48GopqnWDVTAg@mail.gmail.com> <50f85dd2-8250-1ca8-e2dd-4bba93a62736@embeddedor.com>
In-Reply-To: <50f85dd2-8250-1ca8-e2dd-4bba93a62736@embeddedor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Apr 2020 19:48:39 +0200
Message-ID: <CAMuHMdVaAV+bfEivzEpJh8SysVr7jziyBPknCUc1=DtOwu7ZrA@mail.gmail.com>
Subject: Re: [PATCH 2/2][next] m68k: amiga: config: Mark expected switch fall-through
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Gustavo,

On Mon, Apr 20, 2020 at 6:03 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 4/20/20 02:17, Geert Uytterhoeven wrote:
> > On Fri, Mar 27, 2020 at 12:25 AM Gustavo A. R. Silva
> > <gustavo@embeddedor.com> wrote:
> >> Mark switch cases where we are expecting to fall through.
> >>
> >> This patch fixes the following warning (Building: allmodconfig m68k):
> >>
> >> arch/m68k/amiga/config.c: In function ‘amiga_identify’:
> >> ./arch/m68k/include/asm/amigahw.h:42:50: warning: this statement may fall through [-Wimplicit-fallthrough=]
> >>  #define AMIGAHW_SET(name) (amiga_hw_present.name = 1)
> >>                            ~~~~~~~~~~~~~~~~~~~~~~~^~~~
> >> arch/m68k/amiga/config.c:223:3: note: in expansion of macro ‘AMIGAHW_SET’
> >>    AMIGAHW_SET(PCMCIA);
> >>    ^~~~~~~~~~~
> >> arch/m68k/amiga/config.c:224:2: note: here
> >>   case AMI_500:
> >>   ^~~~
> >>
> >> Replace the existing /* fall through */ comments and fix the issue above
> >> by using the new pseudo-keyword fallthrough;
> >>
> >> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k for-v5.8 branch.
> >
>
> Geert,
>
> I wonder if you received the first patch of the series.

No I haven't, and lore also only has the cover latter and patch 2/2:
https://lore.kernel.org/linux-m68k/cover.1585264062.git.gustavo@embeddedor.com/

Can you please resend? Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
