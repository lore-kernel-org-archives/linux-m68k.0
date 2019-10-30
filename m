Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69177CA9EAF
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 457E820856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfJ3HZ1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 03:25:27 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:60160 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725855AbfJ3HZ1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 30 Oct 2019 03:25:27 -0400
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPiM9-0002zy-QD
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:25:25 +0100
Received: from mail-wm1-f53.google.com ([209.85.128.53])
        by smtp6.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPiM9-0005oi-MP
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:25:25 +0100
Received: by mail-wm1-f53.google.com with SMTP id q70so912277wme.1
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 00:25:25 -0700 (PDT)
X-Gm-Message-State: APjAAAUkXoZguCbZk2W7KRnx9Z+S17nPuwcZmR8BGppeQQ70+Ps6eRMz
        4DiqG8EgKk/og5T/wYCPUaYyAbSqpMP0Zve3/P8=
X-Google-Smtp-Source: APXvYqw/OyKR7bz9nR6Te0H8aooMHJArvHmRehscuXMF16OsP7q+I+OAmWxrEjr9m6wrTTcM1cfyjoX0YwwvI2dD6sg=
X-Received: by 2002:a1c:2155:: with SMTP id h82mr5371281wmh.94.1572420325445;
 Wed, 30 Oct 2019 00:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
 <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com>
In-Reply-To: <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Wed, 30 Oct 2019 08:25:14 +0100
X-Gmail-Original-Message-ID: <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
Message-ID: <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.128.53
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=WMwBoUkR c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=pGLkceISAAAA:8 a=8tsiK1Aade0-b602XGkA:9 a=QEXdDO2ut3YA:10
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael!

Op wo 30 okt. 2019 om 02:06 schreef Michael Schmitz <schmitzmic@gmail.com>:
> >> @@ -262,10 +263,11 @@ enum esp_rev {
> >>      ESP100A    = 0x01,  /* NCR53C90A */
> >>      ESP236     = 0x02,
> >>      FAS236     = 0x03,
> >> -    FAS100A    = 0x04,
> >> -    FAST       = 0x05,
> >> -    FASHME     = 0x06,
> >> -    PCSCSI     = 0x07,  /* AM53c974 */
> >> +    FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> >> +    FAS100A    = 0x05,
> >> +    FAST       = 0x06,
> >> +    FASHME     = 0x07,
> >> +    PCSCSI     = 0x08,  /* AM53c974 */
> > I'm guessing that you've placed it here because of the esp->rev >= FAS236
> > tests that appear in a couple of places relating to sync transfer period.
> > Might be worth mentioning that in the commit log.
>
> Good catch. I think these tests would need to be changed to esp->rev
>  >=FSC to reflect the fact that the FSC has the same CONFIG3 settings as
> the FAS236.

Um, no, that would break the FAS236. FSC is defined after FAS236. It's
import that its values is lower than FAS100A and greater or equal than
FAS236. And as I wrote in reply to Finn, I think PCSCSI falls in the
same category.

Kind regards,

Kars.
