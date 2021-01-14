Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B151CC433DB
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Jan 2021 09:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7360D239EB
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Jan 2021 09:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbhANJtL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 14 Jan 2021 04:49:11 -0500
Received: from mail-qv1-f48.google.com ([209.85.219.48]:40644 "EHLO
        mail-qv1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbhANJtK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 14 Jan 2021 04:49:10 -0500
Received: by mail-qv1-f48.google.com with SMTP id p5so2020424qvs.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Jan 2021 01:49:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1VU5mGfTfPsWxUw/MpLYqBYZfZeVJd63Xh/MRrsioFM=;
        b=fT9OAtOd+mseQ5A5xXPv/LKYJlx35tQLTp3pvFM9aawhV8x1gtmrHOR4r+/+TTRk/c
         MbVhLR+rQ295MuMHy7TOKxQpSoc072540p9hUIaLkuCZwCstm+Y77UqdA8y9mRVBGx6w
         bhwy5XLukSkIBkkk0zOJ0BJePvc1FH+gPw0xiVvORwv453xrqt7mAem73cLttHBfT7le
         i/DSoRrKuwsRBg8N4I5ClwsaLmO5BIjEUneuDQstg/2TM+BOl0O2i2mOZYG1hnCIVIKd
         SVubl4eT2DlQaGM9JaRx7+smFJVBSMGWyr7t7J7pCgeT9sdzVfwIId3KosrO8wohZLk3
         B0mQ==
X-Gm-Message-State: AOAM532hEJJNHCFgECTvSSwxKf4latW1DDsdSNsHcMgpKWqpZGg43kT4
        VEPaZw9dlBwdBu/4EUr1XxFQPfw+im2Gr6q9w34=
X-Google-Smtp-Source: ABdhPJwuB3BXN73SO8WK7VpK1UyVV3mPcPHBnWxGGbuScgDBka2cRdqqaT5NtFacV2XI7HsI+L5Z7JPzy5ZKfdWuQog=
X-Received: by 2002:a0c:da07:: with SMTP id x7mr6313360qvj.39.1610617718111;
 Thu, 14 Jan 2021 01:48:38 -0800 (PST)
MIME-Version: 1.0
References: <ef1dc21f-694b-2433-e1c6-aa121320173e@physik.fu-berlin.de>
 <f48bcf43-9dcc-e48b-d29d-f75f3814398b@gmx.net> <cb5a2e11-d423-96ec-3d43-3568a109e37f@physik.fu-berlin.de>
 <CACRpkda4E2NwNw29J7x5gehtqn_m3M_Z2dHpc7xRgvb0b-p22A@mail.gmail.com> <1be37673-db0e-f09d-68c8-f929be4019ab@physik.fu-berlin.de>
In-Reply-To: <1be37673-db0e-f09d-68c8-f929be4019ab@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Jan 2021 10:48:26 +0100
Message-ID: <CAMuHMdVmZyEz_NVjqtJUrrsjq=mCsa6on+O6hK3ztisNvxQkjw@mail.gmail.com>
Subject: Re: Old platforms: bring out your dead
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Gerhard Pircher <gerhard_pircher@gmx.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Sparc kernel list <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Thu, Jan 14, 2021 at 10:42 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Oh, and if anyone else is interested in helping with the SH port, I'm happy to send
> them a free LANDISK or NextVoD SuperH device - the latter has a 450 MHz ST-40
> CPU and 256 MB RAM.

Wasn't ST-40 support removed in 2007[1]?
However, that didn't stop people from submitting ST-40 fixes to the core
SH code three years later[2] ;-)

[1] f96691872439ab20 ("sh: Kill off the remaining ST40 cruft.")
[2] a086536858ad0eb5 ("sh: Ensure ST40-300 BogoMIPS value is consistent")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
