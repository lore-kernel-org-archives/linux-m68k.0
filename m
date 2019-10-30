Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546A4CA9EAF
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 09:08:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2933B2083E
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 09:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbfJ3JIn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 05:08:43 -0400
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:49706 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbfJ3JIn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 30 Oct 2019 05:08:43 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPjy4-0005nS-W5
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 10:08:40 +0100
Received: from mail-wr1-f49.google.com ([209.85.221.49])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPjy4-0001om-Ri
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 10:08:40 +0100
Received: by mail-wr1-f49.google.com with SMTP id l10so1383726wrb.2
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 02:08:40 -0700 (PDT)
X-Gm-Message-State: APjAAAWWaDHdte6g5WdILRf5rksYwsfTC56pKo6/ANwV+Hhd+m/+y2zz
        yCsPjVoYKDvDoJBTjJJU1/HhGS8oliiLm6+36Hs=
X-Google-Smtp-Source: APXvYqxj0zIWeLprxxY3n9nkmnjV1Gs+Ca5/5HFMwAvZTz+8A0oqHJCXvq4LK49dWiTw4Y0N7BilLMJhYUTPlImCGa0=
X-Received: by 2002:a05:6000:14a:: with SMTP id r10mr6643283wrx.310.1572426520592;
 Wed, 30 Oct 2019 02:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
 <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com> <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
 <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Wed, 30 Oct 2019 10:08:29 +0100
X-Gmail-Original-Message-ID: <CACz-3rgtBF4hpqB-LTgDi2cMqd5MB4bormqgmLtn8i6hsZZNdA@mail.gmail.com>
Message-ID: <CACz-3rgtBF4hpqB-LTgDi2cMqd5MB4bormqgmLtn8i6hsZZNdA@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.49
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=cPSeTWWN c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=tBb2bbeoAAAA:8 a=pGLkceISAAAA:8 a=5aULjJDpQAmWt9qUnSEA:9 a=QEXdDO2ut3YA:10 a=Oj-tNtZlA1e06AYgeCfH:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert!

Op wo 30 okt. 2019 om 09:45 schreef Geert Uytterhoeven <geert@linux-m68k.org>:
>
> Hi Kars,
>
> Thanks for your patch!
>
> Initially I wondere how the Apple MESH SCSI (also 53cf94 based) on
> my CHRP Longtrail used to work with this, until I realized my Longtrail
> died a few years before the new ESP SCSI driver was written ;-)

Yes, it's been a while :-)

> On Wed, Oct 30, 2019 at 8:26 AM Kars de Jong <jongk@linux-m68k.org> wrote:
> > Op wo 30 okt. 2019 om 02:06 schreef Michael Schmitz <schmitzmic@gmail.com>:
> > > >> @@ -262,10 +263,11 @@ enum esp_rev {
> > > >>      ESP100A    = 0x01,  /* NCR53C90A */
> > > >>      ESP236     = 0x02,
> > > >>      FAS236     = 0x03,
> > > >> -    FAS100A    = 0x04,
> > > >> -    FAST       = 0x05,
> > > >> -    FASHME     = 0x06,
> > > >> -    PCSCSI     = 0x07,  /* AM53c974 */
> > > >> +    FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> > > >> +    FAS100A    = 0x05,
> > > >> +    FAST       = 0x06,
> > > >> +    FASHME     = 0x07,
> > > >> +    PCSCSI     = 0x08,  /* AM53c974 */
>
> Is anything caring about the actual values?
> Doesn't look like that, so you can just drop the values, and let standard C
> enum handling assign the numbers. That way you don't have to renumber
> when adding a new part.

Nice one. That's indeed even better.

> > Um, no, that would break the FAS236. FSC is defined after FAS236. It's
> > import that its values is lower than FAS100A and greater or equal than
> > FAS236. And as I wrote in reply to Finn, I think PCSCSI falls in the
> > same category.
>
> You definitely want to add a comment like "all below use the same CONFIG3
> settings", to avoid nasty surprises for future additions (if any).
> Using feature bits might be even better, but may not be worthwhile, since
> there seems to be only a single "esp->rev > ..." check.

No, there are several more actually:
 * "esp->rev > ESP100A" which basically means "HAS_CONFIG3".
 * "esp->rev < ESP236" which basically means "!HAS_FAST_CLOCK".
 * "esp->rev >= FAS236" which basically means "HAS_FAST_CLOCK"
 * "esp->rev >= FAS100A" which basically means "HAS_OLD_CONFIG3"

So, perhaps having feature bits is not a bad idea at all...

Kind regards,

Kars.
