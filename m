Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35405CA9EC5
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 18:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AA5820856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 18:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij2ysKMg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfJ3SmP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 14:42:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38842 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3SmP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Oct 2019 14:42:15 -0400
Received: by mail-pf1-f193.google.com with SMTP id c13so2186032pfp.5
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 11:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nPILG1DNFjzp/Hrg6hk3C+rCYeS/2gJgp9aSbxSCH+s=;
        b=Ij2ysKMgU2PHyOV/MxZt44i+09j9qY8+qRtJ7O7clSpp+nVpESWIeiuzOInjfZ1frS
         d0+FiMlmfNzhu8AUvrl7FbLuyELoYagI6247HG9C16cQPDb5nz72qAeTpTbi2U3dOtCA
         MlK96G68cpVLCACc/T1tmMbgM/xn+8gveXeM0c0/rr6sy3HvqDEPevmVP5dPR9Eknb3a
         sycrQ7v+gm2phoSfMN9I3TfNfl76iwAQlmC9SJDm4fLNvBYguBzQH6GsWrtaMLzVs1QE
         dX5XIvyZVBnrrlcunfMH5361eHsqvZKj4si9ZLMgwHaEInoBDmsovuKFkoRR2u5pg/Zs
         dJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPILG1DNFjzp/Hrg6hk3C+rCYeS/2gJgp9aSbxSCH+s=;
        b=r7U0tOVrNk/XvRFssfsVD3i6yZS0/04EWCJNAG0eUeQuaTkKQa+dGkoRJ/Ygw2ztqM
         Z4QOb8Z6lnpmXGFUiIR5h8RKJKXU4NqOB2YLV7dRNivwK5WNKxd8dRRGafbfOGJO8IrQ
         NMbH7b01ZFeSi+qthDeMXxqxlGaGFDreGpgSi/s53gOX6tGRTk1GEX/57VX1uOEXgD5F
         gFHzzBDvK7+bmIrmPcllNb5OjTDVvVriAT9RMoaERbB0X1M/Els13frHR4RWRtYGsGdi
         LKOBKDSGZ+fzMNe5PGhW+wQwZSZwkiPJBnEHdwU7GPoVS1lFoWm6aVQ6XLhrEcYJyalH
         oC9w==
X-Gm-Message-State: APjAAAVi7PLF2CBRklQ5uk1ANfX0Suh5OFQAna5OLq+jLtXFs65QoVyK
        2lMQ43Y+jO7S/kloCP83mil80QnHzaC8jymSar0=
X-Google-Smtp-Source: APXvYqzUR7mSIBKy/6+YctZ/JjvD7DKPP+2PiNUuZUO1WkitIQVHNc39e7ytH/pg+JqpCgLeo7+VXwPuSV2BibSgPNM=
X-Received: by 2002:a63:c045:: with SMTP id z5mr960482pgi.69.1572460934983;
 Wed, 30 Oct 2019 11:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <5b7c5a95-be2d-7857-95d5-7b9030d86795@gmail.com>
 <CACz-3riOkeSyXTn17pUTGKMVJzrv55qDQMBv9SV49d1peYMzBA@mail.gmail.com>
In-Reply-To: <CACz-3riOkeSyXTn17pUTGKMVJzrv55qDQMBv9SV49d1peYMzBA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Thu, 31 Oct 2019 07:42:03 +1300
Message-ID: <CAOmrzkJ8FfQ9pnDdq8Wi+a=6xaCceKEUOkrTZ0tesWjjR=X95Q@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On Wed, Oct 30, 2019 at 8:11 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> > > diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
> > > index bb88995a12c7..6b34a5764de5 100644
> > > --- a/drivers/scsi/esp_scsi.c
> > > +++ b/drivers/scsi/esp_scsi.c
> > > @@ -263,7 +263,11 @@ static void esp_reset_esp(struct esp *esp)
> > >                       esp->rev = FAS236;
> > >               else if (family_code == 0x0a)
> > >                       esp->rev = FASHME; /* Version is usually '5'. */
> > > -             else
> > > +             else if (family_code == 0x14) {
> > > +                     esp->rev = FSC;
> > > +                     /* Enable Active Negation */
> > > +                     esp_write8(ESP_CONFIG4_RADE, ESP_CFG4);
> >
> > Please move that into the below section ...
> >
> > > +             } else
> > >                       esp->rev = FAS100A;
> > >               esp->min_period = ((4 * esp->ccycle) / 1000);
> > >       } else {
> > > @@ -308,7 +312,8 @@ static void esp_reset_esp(struct esp *esp)
> > >
> > >       case FAS236:
> > >       case PCSCSI:
> > > -             /* Fast 236, AM53c974 or HME */
> > > +     case FSC:
> > > +             /* Fast 236, AM53c974, FSC or HME */
> > >               esp_write8(esp->config2, ESP_CFG2);
> > >               if (esp->rev == FASHME) {
> > >                       u8 cfg3 = esp->target[0].esp_config3;
> >
> > ... here, where chip-specific config bits are otherwise set. Just to
> > keep with driver style.
>
> Yes, I considered that, but the setting of CONFIG4 for the PCSCSI is
> also done immediately after it is detected (lines 272-284). So in a
> way, I kept to the driver style as well ;-).

Fair enough.

>
> > Also consider whether esp->radelay can be set shorter than the default
> > 96 with active negation enabled (couldn't make sense of the data book on
> > that point - may well be unrelated to active negation).
>
> The old driver used 16 for all the FAST variants except FAS100A. I
> also tried to get that from the data manual but there doesn't seem to
> be any info about it. I never had any issues with having it set to 16.
> 16 means no delay for REQ/ACK de-assertion and 1/2 clock delay for
> REQ/ACK assertion.
> The new driver uses 96, which means 1/2 clock delay for REQ/ACK
> de-assertion and 1 clock delay for REQ/ACK assertion (when using
> FASTCLK in CONFIG3).
> Why was 96 chosen for the new driver, do you know?

No, you'd have to ask DaveM. Maybe some users reported problems with
fast transfers...

Cheers,

    Michael
