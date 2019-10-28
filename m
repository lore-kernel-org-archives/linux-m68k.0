Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62D8CA9EC0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 18:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B3EC214B2
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 18:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLe01SDp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387407AbfJ1Sch (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 14:32:37 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:46258 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733300AbfJ1Sch (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Oct 2019 14:32:37 -0400
Received: by mail-pl1-f171.google.com with SMTP id q21so6012863plr.13
        for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2019 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+A5jKP4tTH99KK3K9UL7NIoklocsT911ADQ1uC9uARM=;
        b=fLe01SDpJKklDES13NniqHr8c2MI9iW8D3WPFv6op3PMdq2gOynPlsULOYc7POEOYs
         Q6DUNjJ+eBNoAjFUtgVacO2t0EYepzXbfyd6kQOUd6t6l9qUaDAvFCjKGaxCcDzxVkRX
         holLfqANDyQsCH0fZZWt8hCAMbLC+P6tBRnL5FJNxfxg1uG10Tt507114F7eTi+u/uGe
         1zY4UTEIibSkv5L/DyZ2QDB6bgUXuh7wwgnC/a7BpCiU/unrbyW1Fb7ohPToyfPiys4a
         fxyw+uG0+cwPwntrRcwTs2ptd/xIECbBlxwYr+6HCB+fjPx0jhd9cUlEejxHOF7OL89y
         5OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+A5jKP4tTH99KK3K9UL7NIoklocsT911ADQ1uC9uARM=;
        b=lsRxSQrgyuYrHviI2ZJc4v60dJVvG5wEXvMPITyCYA3BP5sCOzMWR5EIYNNJh+2OKp
         U0C946dqjg7dMkwc07w2adgUZAS9jtBUHfvZx78LCW5z+Fpq78/3KE/wcV1iRS9yjxVy
         xPCvFqcZi69H5dmzztBG1B/T2JVGwP2FVrOErjq/plmPMQr9H2MLXhIFiO+m6TM7j8Vt
         jbwHI5JJDBhJBaYqv831KdoyPqi+BA6/ouYav4+vqFyo+wZ6agxOoWLc323SdNht8uXN
         TPTKAUcpHF6GAOwOVPXgAlzbJVPCTd6LddtWuU/hhCcHvhBV8IKkVuDKrEZW0kyFkqgt
         z8qg==
X-Gm-Message-State: APjAAAUljbY1obJ5kLo92LiK9ttmdR6nPLx5wguKDQOamNdYzzjrtnaO
        NDfPfPMxfmS25yoWDoMghurMDhrZ6lkY6RKjgNcQJR9g
X-Google-Smtp-Source: APXvYqyCTNdUTopMMv/CCQwYdLJOmURGrK0pCtY4jj8TkmuJMMX390Mtuyina8ikSnLBwHrmmBXDcjQqkVQHXqm0jzQ=
X-Received: by 2002:a17:902:b787:: with SMTP id e7mr8779276pls.261.1572287556334;
 Mon, 28 Oct 2019 11:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
 <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de> <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
In-Reply-To: <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Tue, 29 Oct 2019 07:32:24 +1300
Message-ID: <CAOmrzk+SNfmS0-H6C29Lqbebm3Bkpm-kQO9rfdve_ojy2a6Kcw@mail.gmail.com>
Subject: Re: ESP SCSI driver (was: Amiga PCMCIA network card support)
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Kars,

Don't mess with CONFIG3 - we've tried all that, and in the end had to
use PIO to transfer message bytes. Problems with tagged queueing in
the ESP driver are usually all due to the DMA not transferring single
bytes on Amiga. The additional message byte required to see a reselect
for a tagged command complete remains stuck in the ESP fifo. Can't see
how this would be affected by the driver mis-identifying the chip as
FAS100A.

Regardig mis-detection of the chip revision - can you print the
'version' and 'family_code' variables in the esp->rev == FAST branch
of esp_reset_esp() please?

Can you also send the Zorro device ID data for your board, just so I
know which one of the Blizzard SCSI variants we are talking about
here?

Cheers,

    Michael


On Tue, Oct 29, 2019 at 4:39 AM Kars de Jong <jongk@linux-m68k.org> wrote:
>
> Op ma 28 okt. 2019 om 14:20 schreef John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de>:
> >
> > On 10/28/19 2:00 PM, Kars de Jong wrote:
> > >> The new zorro_esp has seen a lot of rewrite. So old bugs might have been
> > >> fixed now.
> > >
> > > Yes, for Mac support etc. Unfortunately it doesn't work for me. For
> > > starters. it does not identify my chip correctly, it says it's a
> > > FAS100A (it's actually a Symbios Logic 53CF94-2 which is more like a
> > > FAS236).
> > > But after I fixed that it still doesn't work.
> >
> > It works perfectly fine with my Amiga 4000 and the SCSI controller on the
> > Cyberstorm: http://amiga.resource.cx/exp/cyberstorm1.
> >
> > Michael actually tested everything on the Amiga 4000.
>
> It probably uses a different chip. The text and images show it's a
> QLogic FAS216 (which is the same as a FAS236, FAS236 is the
> differential variant). The type should more accurately be presented as
> "FAS2x6" since you can't tell which type it is in software.
>
> Some of the bits in CONFIG3 have completely different meanings between
> these chip variants, and because of the misdetection it is quite wrong
> for the 53CF9x-2 in my A1200.
>
> I will try out some things this evening, I naively added the FSC to
> the end of the enum, but the code does things like "if (esp->rev >=
> FAS100A)" which break horribly then.
>
> It looks like it might work if I add my chip type between FAS236 and
> FAS100A in the esp_rev enum.
>
> Kind regards,
>
> Kars.
