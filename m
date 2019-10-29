Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E108CA9EC3
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B4B42087E
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfJ2JkT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 05:40:19 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:43634 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730671AbfJ2JkT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 29 Oct 2019 05:40:19 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPNz7-0006dF-GH
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 10:40:17 +0100
Received: from mail-wr1-f43.google.com ([209.85.221.43])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPNz7-0001bP-BY
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 10:40:17 +0100
Received: by mail-wr1-f43.google.com with SMTP id l10so12845485wrb.2
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 02:40:17 -0700 (PDT)
X-Gm-Message-State: APjAAAX0LHMDGfAAUC4ZkRL4xqcWHy5G+VzL/Ticd8FbdqEpui6hlR7h
        6AKK65pr6+zgnWfMcXDakpzLdbeoVyLd45v5DpE=
X-Google-Smtp-Source: APXvYqyTNSye8vusAbkMJZ5IO6nRXaAwBe1+x2aZkfCFrxvkY+OrvGnxeavbW52zB/fWJWggQF2RiDOvnb8mf9pF0Kw=
X-Received: by 2002:a5d:464f:: with SMTP id j15mr18894942wrs.366.1572342017127;
 Tue, 29 Oct 2019 02:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <CAMuHMdWdvHZ97Wh4PBfdO-Lz4QM3_ZoGah5p0SBJr8V-EcULGA@mail.gmail.com>
In-Reply-To: <CAMuHMdWdvHZ97Wh4PBfdO-Lz4QM3_ZoGah5p0SBJr8V-EcULGA@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Tue, 29 Oct 2019 10:40:06 +0100
X-Gmail-Original-Message-ID: <CACz-3rhJQ7JOpbfpR260RV0coRZui=yiyDFp7im1=QtPGgraMA@mail.gmail.com>
Message-ID: <CACz-3rhJQ7JOpbfpR260RV0coRZui=yiyDFp7im1=QtPGgraMA@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.43
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=cPSeTWWN c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=tBb2bbeoAAAA:8 a=xyZFSTbQTxqZS9-R6N0A:9 a=QEXdDO2ut3YA:10 a=Oj-tNtZlA1e06AYgeCfH:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert!

Op di 29 okt. 2019 om 10:00 schreef Geert Uytterhoeven <geert@linux-m68k.org>:
>
>  Hi Kars,
>
> On Mon, Oct 28, 2019 at 8:02 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> > I've dusted it off and powered it on this weekend. It still works (RTC
> > needs a new battery though), and the 2.6.18 kernel that I modified
> > many years ago still works fine with the pcnet_cs driver and my
> > Dynalink L10C card.
>
> You may want to have a close look at the electrolytic capacitors.
> A few months ago I had to repair some of the damage done by
> a leaking capacitor.  Fortunately I don't need the signals on the
> parallel port, but I do use the serial console, and thus had to fix
> the eaten RXD trace.

Hmm, good one. I'll check them out.

Thanks,

Kars.
