Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BE4CA9EAF
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CC5620856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfJ3HWi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 03:22:38 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:58592 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbfJ3HWi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 30 Oct 2019 03:22:38 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPiJN-0002Cp-PE
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:22:33 +0100
Received: from mail-wm1-f46.google.com ([209.85.128.46])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPiJN-0000JE-LD
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:22:33 +0100
Received: by mail-wm1-f46.google.com with SMTP id w9so900571wmm.5
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 00:22:33 -0700 (PDT)
X-Gm-Message-State: APjAAAVE0yccBBR+tT8WvS7Hp+ISQO38Rzzb3aXqnT6IojcH7JZJNbYT
        y3X+bNqot/Sg2sHMfCipQzYyL1/jKHBdhW+VKqE=
X-Google-Smtp-Source: APXvYqyJXHyoHD1F/GAKICna0/IllOHRbnZjIsRE9mOFQ/kWxNaP/uNHBMepjg+kzc98pCQ3apbdu7HJdjOmuaz4xUo=
X-Received: by 2002:a7b:c211:: with SMTP id x17mr6985132wmi.60.1572420153349;
 Wed, 30 Oct 2019 00:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
In-Reply-To: <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Wed, 30 Oct 2019 08:22:22 +0100
X-Gmail-Original-Message-ID: <CACz-3rhp4qsY=JMdxrEqSxZj6VamSrvGH8Jr+FxHZN71-6Spkw@mail.gmail.com>
Message-ID: <CACz-3rhp4qsY=JMdxrEqSxZj6VamSrvGH8Jr+FxHZN71-6Spkw@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.128.46
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=cPSeTWWN c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=8981fWPbAAAA:8 a=cd-Bb5pzAAAA:8 a=jjQIIyHtLlzPvLKsq0sA:9 a=QEXdDO2ut3YA:10 a=o72u2rHnfW5qNJ_4I8LD:22 a=3tWItcrcYUpmIVy62yHE:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn!

Op wo 30 okt. 2019 om 01:31 schreef Finn Thain <fthain@telegraphics.com.au>:
> On Tue, 29 Oct 2019, Kars de Jong wrote:
> > diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
> > index bb88995a12c7..6b34a5764de5 100644
> > --- a/drivers/scsi/esp_scsi.c
> > +++ b/drivers/scsi/esp_scsi.c
> > @@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
> >                       esp->rev = FAS236;
> >               else if (family_code == 0x0a)
> >                       esp->rev = FASHME; /* Version is usually '5'. */
> > -             else
> > +             else if (family_code == 0x14) {
> > +                     esp->rev = FSC;
> > +                     /* Enable Active Negation */
> > +                     esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);
>
> There is a comment in esp_scsi.h which seems to contradict the above
> logic, "ESP config register 4 read-write, found only on am53c974 chips."
> I think the comment should be corrected now.

Nice catch! I'll change the comment.

> > diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
> > index 91b32f2a1a1b..b60ea3e5e0eb 100644
> > --- a/drivers/scsi/esp_scsi.h
> > +++ b/drivers/scsi/esp_scsi.h
> > @@ -211,6 +211,7 @@
> >  /* ESP unique ID register read-only, found on fas236+fas100a only */
> >  #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
> >  #define ESP_UID_F236          0x02     /* ESP FAS236   */
> > +#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
> >  #define ESP_UID_REV           0x07     /* ESP revision */
> >  #define ESP_UID_FAM           0xf8     /* ESP family   */
> >

> I think these should be in numerical order.

They're bit masks, but I'll add some white space to separate them and
rearrange it so the values come after the family bit mask.

> > @@ -262,10 +263,11 @@ enum esp_rev {
> >       ESP100A    = 0x01,  /* NCR53C90A */
> >       ESP236     = 0x02,
> >       FAS236     = 0x03,
> > -     FAS100A    = 0x04,
> > -     FAST       = 0x05,
> > -     FASHME     = 0x06,
> > -     PCSCSI     = 0x07,  /* AM53c974 */
> > +     FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> > +     FAS100A    = 0x05,
> > +     FAST       = 0x06,
> > +     FASHME     = 0x07,
> > +     PCSCSI     = 0x08,  /* AM53c974 */
>
> I'm guessing that you've placed it here because of the esp->rev >= FAS236
> tests that appear in a couple of places relating to sync transfer period.
> Might be worth mentioning that in the commit log.

That, and also the checks in the driver that check for esp->rev >=
FAS100A. I think I'll add a comment to the enum so that others don't
have the same issue that I first had.

Actually, I think the PCSCSI value is also at the wrong position in
the list, its CONFIG3 (called CNTLREG3 in the data manual
http://bitsavers.trailing-edge.com/components/amd/_dataSheets/1993_53c974_PCscsi.pdf)
has pretty much the same layout as the FAS236 and FSC, so it would
probably have the same issue as me at high synchronous speeds...

Kind regards,

Kars.
