Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B05CCA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4AEA2087E
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJ2Jhf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 05:37:35 -0400
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:42564 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfJ2Jhf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 29 Oct 2019 05:37:35 -0400
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPNwT-0004v4-DF
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 10:37:33 +0100
Received: from mail-wr1-f52.google.com ([209.85.221.52])
        by smtp6.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPNwT-0000Sa-9S
        for linux-m68k@vger.kernel.org; Tue, 29 Oct 2019 10:37:33 +0100
Received: by mail-wr1-f52.google.com with SMTP id v9so12824733wrq.5
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 02:37:33 -0700 (PDT)
X-Gm-Message-State: APjAAAXFAm92RyBpSUcJOVpNRdnTW0OLVn3FVs5sr1EpsY+GkkjBDIcp
        kgfzKTr45eUXZmrhi3jsYBdlqExz4p9OJcTgNhY=
X-Google-Smtp-Source: APXvYqz2D7rq8ZWKJqRnmlkCZZIQ8lLLhOgEbac9oSyYRiouYUdDZmo20+NshR6TPFTkLa45w2bKeeSkGzsqbzLfBDk=
X-Received: by 2002:adf:f306:: with SMTP id i6mr18243609wro.209.1572341852917;
 Tue, 29 Oct 2019 02:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
 <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
 <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com> <CAOmrzk+SNfmS0-H6C29Lqbebm3Bkpm-kQO9rfdve_ojy2a6Kcw@mail.gmail.com>
In-Reply-To: <CAOmrzk+SNfmS0-H6C29Lqbebm3Bkpm-kQO9rfdve_ojy2a6Kcw@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Tue, 29 Oct 2019 10:37:21 +0100
X-Gmail-Original-Message-ID: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
Message-ID: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
Subject: Re: ESP SCSI driver (was: Amiga PCMCIA network card support)
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.52
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=WMwBoUkR c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=pGLkceISAAAA:8 a=UxsAKQ9BAAAA:8 a=ibrXmV8Ri2roI8aXGEgA:9 a=QEXdDO2ut3YA:10 a=d_mXNDjUptLsIMHJEirF:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

Op ma 28 okt. 2019 om 19:32 schreef Michael Schmitz <schmitzmic@gmail.com>:
> Don't mess with CONFIG3 - we've tried all that, and in the end had to
> use PIO to transfer message bytes. Problems with tagged queueing in
> the ESP driver are usually all due to the DMA not transferring single
> bytes on Amiga. The additional message byte required to see a reselect
> for a tagged command complete remains stuck in the ESP fifo. Can't see
> how this would be affected by the driver mis-identifying the chip as
> FAS100A.

And yet that was exactly what caused the issue. It was setting bit 1
of CONFIG3 - ESP_CONFIG3_FAST (FAS100A) instead of bit 3 -
ESP_CONFIG3_FCLK (FAS236 and also FSC). Bit 1 means ESP_CONFIG3_ADMA
on the FSC, and having bit 0 cleared and bit 1 set is actually an
illegal combination on the FSC (marked "Reserved" in the data manual).

> Regardig mis-detection of the chip revision - can you print the
> 'version' and 'family_code' variables in the esp->rev == FAST branch
> of esp_reset_esp() please?

Family code 0x14, version 2. That's what was also used in the old driver.

> >
> > I will try out some things this evening, I naively added the FSC to
> > the end of the enum, but the code does things like "if (esp->rev >=
> > FAS100A)" which break horribly then.
> >
> > It looks like it might work if I add my chip type between FAS236 and
> > FAS100A in the esp_rev enum.

And that indeed fixed it. I ran "fsck -n" on both partitions on the
SCSI disk without issues.
I also want to enable Active Negation and perhaps also "Back-to-Back
Transfer Enable" in CONFIG4 for this chip (see also the data manual
http://www.bitsavers.org/components/ncr/scsi/53CF94_96-2_Fast_SCSI_Controller_Data_Manual_Apr1993.pdf
if you are interested, at home I have an even newer one for the
Symbios Logic version).

I will prepare a patch. Oh, I also noticed some issues in the comments
in the driver, I'll see if I can fix those too.

Kind regards,

Kars.
