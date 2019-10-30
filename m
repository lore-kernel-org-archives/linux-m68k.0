Return-Path: <SRS0=Ls/8=YX=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E05CA9EAF
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 08:45:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B467020856
	for <linux-m68k@archiver.kernel.org>; Wed, 30 Oct 2019 08:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJ3IpS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Oct 2019 04:45:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42238 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfJ3IpS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Oct 2019 04:45:18 -0400
Received: by mail-ot1-f65.google.com with SMTP id b16so1379516otk.9
        for <linux-m68k@vger.kernel.org>; Wed, 30 Oct 2019 01:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RJtYOz4F4CdCwLYC1kEiPF0gtQj4K+XNXp9WUpwVrxk=;
        b=gORavWY1G+ekOX9kwVcJhHHSql0k/+Xpx601jioiERPJMxXQO7/sxZ9c9YTA87U6t/
         aHLuw8oUlR2OKA3qz5iOYLyb2hRf5oSwwNoTHHDmQ80zbW1mPLxK94mLQPQ6A6oKLwc1
         hFCmO+f7CxZlHPci3k4TGu65+3nnCLDYlJ41LFWB5O9hv2oIJqe2M9Yf1HzonpZfldUk
         am7bo7TsLka3+2PvadOB4KN2lDNpXIpWF/lpcHZGcUYJPQ7a7jLfNmzLA/8zQd7+3FP/
         0xG79UKURbemHaYPAF+mGLNpYa7JgOXBSEn0BCHm96qJzqn10CMjFtqvHk55J7/YCx6L
         LH1g==
X-Gm-Message-State: APjAAAWB0rDE7FE20KhclFB91d9g4NgdWz/HwbqyPIAERbVDC3TU9tYt
        ekIV6uLgEtHcJkVgvaOC0JdLkHylIH60+UchrM9QTKkk
X-Google-Smtp-Source: APXvYqxHZOyNXIlFQcfPwAmHWua+S0lKG0Bn+iadVhQXbTbbcGJCe/Oj3xkE+VVpLvgwVEHdIsO+J1+EDPsWJLt6imE=
X-Received: by 2002:a05:6830:20d2:: with SMTP id z18mr5076555otq.297.1572425117243;
 Wed, 30 Oct 2019 01:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACz-3rh9ZCyU1825yU8xxty5BGrwFhpbjKNoWnn0mGiv_h2Kag@mail.gmail.com>
 <20191029220503.7553-1-jongk@linux-m68k.org> <alpine.LNX.2.21.1910301109060.8@nippy.intranet>
 <28fd507e-580d-97c3-1cb3-2124940f2cae@gmail.com> <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
In-Reply-To: <CACz-3rjP9ozpqb9ypGjJTr=c=ka252KF2xALWr8KHLCvGc1z-Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Oct 2019 09:45:05 +0100
Message-ID: <CAMuHMdWMzvrVbfYDOZQcUK14h2Nzd7EqUJkwe3C+N3YUHYvyrQ@mail.gmail.com>
Subject: Re: [PATCH] esp_scsi: Add support for FSC chip
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

Thanks for your patch!

Initially I wondere how the Apple MESH SCSI (also 53cf94 based) on
my CHRP Longtrail used to work with this, until I realized my Longtrail
died a few years before the new ESP SCSI driver was written ;-)

On Wed, Oct 30, 2019 at 8:26 AM Kars de Jong <jongk@linux-m68k.org> wrote:
> Op wo 30 okt. 2019 om 02:06 schreef Michael Schmitz <schmitzmic@gmail.com>:
> > >> @@ -262,10 +263,11 @@ enum esp_rev {
> > >>      ESP100A    = 0x01,  /* NCR53C90A */
> > >>      ESP236     = 0x02,
> > >>      FAS236     = 0x03,
> > >> -    FAS100A    = 0x04,
> > >> -    FAST       = 0x05,
> > >> -    FASHME     = 0x06,
> > >> -    PCSCSI     = 0x07,  /* AM53c974 */
> > >> +    FSC        = 0x04,  /* NCR/Symbios Logic FSC */
> > >> +    FAS100A    = 0x05,
> > >> +    FAST       = 0x06,
> > >> +    FASHME     = 0x07,
> > >> +    PCSCSI     = 0x08,  /* AM53c974 */

Is anything caring about the actual values?
Doesn't look like that, so you can just drop the values, and let standard C
enum handling assign the numbers. That way you don't have to renumber
when adding a new part.

> > > I'm guessing that you've placed it here because of the esp->rev >= FAS236
> > > tests that appear in a couple of places relating to sync transfer period.
> > > Might be worth mentioning that in the commit log.
> >
> > Good catch. I think these tests would need to be changed to esp->rev
> >  >=FSC to reflect the fact that the FSC has the same CONFIG3 settings as
> > the FAS236.
>
> Um, no, that would break the FAS236. FSC is defined after FAS236. It's
> import that its values is lower than FAS100A and greater or equal than
> FAS236. And as I wrote in reply to Finn, I think PCSCSI falls in the
> same category.

You definitely want to add a comment like "all below use the same CONFIG3
settings", to avoid nasty surprises for future additions (if any).
Using feature bits might be even better, but may not be worthwhile, since
there seems to be only a single "esp->rev > ..." check.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
