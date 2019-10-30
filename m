Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C97CA9EAF
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64B1520663
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 07:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfJ3HL5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 03:11:57 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:52576 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbfJ3HL5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 30 Oct 2019 03:11:57 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPi94-0007Wq-Dh
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:11:54 +0100
Received: from mail-wr1-f53.google.com ([209.85.221.53])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iPi94-0003ic-9c
        for linux-m68k@vger.kernel.org; Wed, 30 Oct 2019 08:11:54 +0100
Received: by mail-wr1-f53.google.com with SMTP id v9so1009602wrq.5
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 00:11:54 -0700 (PDT)
X-Gm-Message-State: APjAAAU8QCXwz71eC0u7SuLvX+MMlUVHVXBviJFT5niUV9ZGLPnpS9eL
        YJdyCQHJNtT1HVT0pTftTzs61+X99+Bw289SZJ4=
X-Google-Smtp-Source: APXvYqwPBvmcjLl5iKWgvviB5rGW4tnVn6T+/cmY0Us0WTvEZP0YpTWvDV2iqjn/8WCMQ4I4grtZKIe7ZEz6LghuRsE=
X-Received: by 2002:adf:e64f:: with SMTP id b15mr21841508wrn.372.1572419513944;
 Wed, 30 Oct 2019 00:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <5b7c5a95-be2d-7857-95d5-7b9030d86795@gmail.com>
In-Reply-To: <5b7c5a95-be2d-7857-95d5-7b9030d86795@gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Wed, 30 Oct 2019 08:11:43 +0100
X-Gmail-Original-Message-ID: <CACz-3riOkeSyXTn17pUTGKMVJzrv55qDQMBv9SV49d1peYMzBA@mail.gmail.com>
Message-ID: <CACz-3riOkeSyXTn17pUTGKMVJzrv55qDQMBv9SV49d1peYMzBA@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.53
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=cPSeTWWN c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=kf8yhB22gy42SvIMXE8A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

Thanks for the review!

Op wo 30 okt. 2019 om 01:23 schreef Michael Schmitz <schmitzmic@gmail.com>:
>
> Hi Kars,
>
> thanks for your patch. Comments inline below. Note that in order to get
> this patch integrated into the next release, you should resend it to
> linux-scsi@vger.kernel.org. The SCSI maintainers won't pick it up here.

I know, I first wanted you guys to have a look at it before involving them.

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
> Please move that into the below section ...
>
> > +             } else
> >                       esp->rev = FAS100A;
> >               esp->min_period = ((4 * esp->ccycle) / 1000);
> >       } else {
> > @@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
> >
> >       case FAS236:
> >       case PCSCSI:
> > -             /* Fast 236, AM53c974 or HME */
> > +     case FSC:
> > +             /* Fast 236, AM53c974, FSC or HME */
> >               esp_write8(esp->config2, ESP_CFG2);
> >               if (esp->rev == FASHME) {
> >                       u8 cfg3 = esp->target[0].esp_config3;
>
> ... here, where chip-specific config bits are otherwise set. Just to
> keep with driver style.

Yes, I considered that, but the setting of CONFIG4 for the PCSCSI is
also done immediately after it is detected (lines 272-284). So in a
way, I kept to the driver style as well ;-).

> Also consider whether esp->radelay can be set shorter than the default
> 96 with active negation enabled (couldn't make sense of the data book on
> that point - may well be unrelated to active negation).

The old driver used 16 for all the FAST variants except FAS100A. I
also tried to get that from the data manual but there doesn't seem to
be any info about it. I never had any issues with having it set to 16.
16 means no delay for REQ/ACK de-assertion and 1/2 clock delay for
REQ/ACK assertion.
The new driver uses 96, which means 1/2 clock delay for REQ/ACK
de-assertion and 1 clock delay for REQ/ACK assertion (when using
FASTCLK in CONFIG3).
Why was 96 chosen for the new driver, do you know?

> > diff --git a/drivers/scsi/esp_scsi.h b/drivers/scsi/esp_scsi.h
> > index 91b32f2a1a1b..b60ea3e5e0eb 100644
> > --- a/drivers/scsi/esp_scsi.h
> > +++ b/drivers/scsi/esp_scsi.h
> > @@ -211,6 +211,7 @@
> >   /* ESP unique ID register read-only, found on fas236+fas100a only */
> >   #define ESP_UID_F100A         0x00     /* ESP FAS100A  */
> >   #define ESP_UID_F236          0x02     /* ESP FAS236   */
> > +#define ESP_UID_FSC           0x14     /* NCR/Symbios Logic FSC */
> >   #define ESP_UID_REV           0x07     /* ESP revision */
> >   #define ESP_UID_FAM           0xf8     /* ESP family   */
> Can't find these used anywhere in the code ... I suppose they could be
> removed, or the detection code above rewritten to make use of these macros.

Yes, I noticed that too... I prefer the latter.

Thanks,

Kars.
