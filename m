Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA7ACA9EC6
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 18:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 248E021924
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 18:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feK2ltoB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbfJ3Seo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 14:34:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39505 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbfJ3Sen (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Oct 2019 14:34:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id v4so2170145pff.6
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XnB8lNefrufIWWk8KH+Vbw0F66lsabahRwrjktnz2AA=;
        b=feK2ltoB+RwBV/634/lEfiraF4zQfy3npuaeGo3PF8jPiBgkSXUgSrS5QZLegt2ouK
         4k9m7ilufUZ4YJKnttJbvVtflH328ItXeIE69z/fqxDfe/dbqekYwCBumF5EMusSgyrE
         aQLQv2qfTwvILN+2gbgLs42Qd5lhGA/28ZvHiAzk9hPmClnTI2XxfCgERaGhBO60LUC9
         B60JdY6tsWRc6CKbQXygHHPTwUAb89fXmGbHb/NQfOFiFTTx2JFQMExa50GMC9Y1u349
         20GIf7wrBueUbaPNZBe5rRzb60KrhxqOFitp0kzlUiuTsL4+Ts++oadOP2Rgd0v+sEZ4
         3SSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XnB8lNefrufIWWk8KH+Vbw0F66lsabahRwrjktnz2AA=;
        b=toSthYaRMbyqJ+5vgvQzAn4f/9P2TQZbaZWjI8pPlRZB0rbGsnoqQCkoUTtD1QxvgJ
         eTYe22exi6J3geOW4t7II7aizYt1Yu0FOulKOmrG8J3iQ211jM4lsUoKNJ7qlRbwruKa
         +776kSz8j+TciXTD3bVroMPE4LmCssL90R8Ah/GB0Z41z7a4KFHgKUKJrp8roTtFEI3N
         cLkRk+RluaYDPeccBdCKfMp/0Dsvv4FnnZHMP0Vq9GljD8Z+tdc5gmeNK5mcQNOsX0z1
         PwVYYTLs987HnBC0RDyL6xrxYU+z0nIE5hVr6K+q7Ffh3r5a2FGTfpbl+YZvG0CKOUXr
         K3KA==
X-Gm-Message-State: APjAAAXttKAONz1Rk6Hl9SKQOy/nftRUQw6+PRzGihONEtNkoXbnFIlf
        cFOvHMhw0a3DAtqWc+z20yYWaRjP8OAaYeVZ738=
X-Google-Smtp-Source: APXvYqylXW1p0VW5b4bbPG+XYwK4/xy/FNWgxoY9UWv5NtvUNhB2Aaso8Ghv/ZzIHFaL7GpnmH99GWYUMQLxCE3dO1o=
X-Received: by 2002:a63:c045:: with SMTP id z5mr927985pgi.69.1572460482889;
 Wed, 30 Oct 2019 11:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
 <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com> <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
 <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com> <CACz-3rgtBF4hpqB-LTgDi2cMqd5MB4bormqgmLtn8i6hsZZNdA@mail.gmail.com>
In-Reply-To: <CACz-3rgtBF4hpqB-LTgDi2cMqd5MB4bormqgmLtn8i6hsZZNdA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Thu, 31 Oct 2019 07:34:31 +1300
Message-ID: <CAOmrzk+iWpjsknsSz+1_d-O7CnjS2yDKOGCXJ=RrBGA4g3dK7g@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On Wed, Oct 30, 2019 at 10:08 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> > > Um, no, that would break the FAS236. FSC is defined after FAS236. It's
> > > import that its values is lower than FAS100A and greater or equal than
> > > FAS236. And as I wrote in reply to Finn, I think PCSCSI falls in the
> > > same category.

You're right -

> > You definitely want to add a comment like "all below use the same CONFIG3
> > settings", to avoid nasty surprises for future additions (if any).
> > Using feature bits might be even better, but may not be worthwhile, since
> > there seems to be only a single "esp->rev > ..." check.
>
> No, there are several more actually:
>  * "esp->rev > ESP100A" which basically means "HAS_CONFIG3".
>  * "esp->rev < ESP236" which basically means "!HAS_FAST_CLOCK".
>  * "esp->rev >= FAS236" which basically means "HAS_FAST_CLOCK"
>  * "esp->rev >= FAS100A" which basically means "HAS_OLD_CONFIG3"
>
> So, perhaps having feature bits is not a bad idea at all...

We need a few more feature bits (at least HAS_CONFIG2 to differentiate
between ESP100 and ESP100A in esp_get_revision()). This might get hard
in terms of test coverage, but I'd raise that as alternative to adding
FSC to the list or enum in your RFC to linux-scsi.

Cheers,

    Michael
>
> Kind regards,
>
> Kars.
