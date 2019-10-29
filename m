Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192CFCA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 11:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E900721D56
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 11:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfJ2LxG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 07:53:06 -0400
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:55278 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727082AbfJ2LxG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 29 Oct 2019 07:53:06 -0400
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPQ3c-0006UW-KK
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 12:53:04 +0100
Received: from mail-wm1-f42.google.com ([209.85.128.42])
        by smtp6.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPQ3c-0003x2-GR
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 12:53:04 +0100
Received: by mail-wm1-f42.google.com with SMTP id 22so2079173wms.3
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 04:53:04 -0700 (PDT)
X-Gm-Message-State: APjAAAUELmLcxiKfN+OmkSudkPfcZy7FiHAHwVzRziekuk2WoB2WMYRb
        9DXw2550IJWYUauVeRumlthxPKvPEI6mDs4jb/c=
X-Google-Smtp-Source: APXvYqylhu1cRtidIiAc1E44LhZWEp5czreg/AIGzRJ2r/TNt/t4TQwnKoVou12ebfV3zgfQl4CiG9CxY0XffmVa7YI=
X-Received: by 2002:a05:600c:2904:: with SMTP id i4mr3458499wmd.158.1572349984233;
 Tue, 29 Oct 2019 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
 <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
 <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com> <alpine.LNX.2.21.1910291030480.49@nippy.intranet>
In-Reply-To: <alpine.LNX.2.21.1910291030480.49@nippy.intranet>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Tue, 29 Oct 2019 12:52:53 +0100
X-Gmail-Original-Message-ID: <CACz-3riDMqySQ-uMjpfn-GeQyD0CjyeAMk2ZpcpAqAekGn7UTA@mail.gmail.com>
Message-ID: <CACz-3riDMqySQ-uMjpfn-GeQyD0CjyeAMk2ZpcpAqAekGn7UTA@mail.gmail.com>
Subject: Re: ESP SCSI driver (was: Amiga PCMCIA network card support)
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.128.42
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=WMwBoUkR c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=8981fWPbAAAA:8 a=0QL0Jp4a32wzVmI3TXIA:9 a=QEXdDO2ut3YA:10 a=o72u2rHnfW5qNJ_4I8LD:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Op di 29 okt. 2019 om 00:38 schreef Finn Thain <fthain@telegraphics.com.au>:
> On Mon, 28 Oct 2019, Kars de Jong wrote:
> > It probably uses a different chip. The text and images show it's a
> > QLogic FAS216 (which is the same as a FAS236, FAS236 is the differential
> > variant). The type should more accurately be presented as "FAS2x6" since
> > you can't tell which type it is in software.
> >
>
> FWIW, the old driver, removed in commit a2c6ef71364e ("[SCSI] NCR53C9x:
> remove driver", has this:
>
> -               if(family_code == 0x02) {
> -                       if ((version & 7) == 2)
> -                               esp->erev = fas216;
> -                        else
> -                               esp->erev = fas236;

The fas236 type was from the original Sun-only esp driver (I guess the
only Suns with a FAS2x6 had differential variants hence the name). I
got a confirmation for the detection of the FAS216 from someone with a
Cyberstorm board, so that one was added then (including the specific
match on version). Since the NCR53C9x driver was never used on a Sun,
this was never confirmed for the FAS236.

Kind regards,

Kars.
