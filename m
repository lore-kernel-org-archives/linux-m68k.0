Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34774C48BE5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 07:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1496A60E09
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Jun 2021 07:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFOHxu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:53:50 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:38678 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOHxu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Jun 2021 03:53:50 -0400
Received: by mail-vs1-f52.google.com with SMTP id x8so9287984vso.5
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 00:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6NJRsNV1ZgADqeOVV8FNEFMvYzIydzfaJckyMOidgm8=;
        b=ftw1FjT0JFXP5vEifhPzokft3BltUgdRHl5YYj8CCI4yQHZ361tbKR/PHJC3RxKKqg
         taYdOE76wqCbhxM1MtzF2ZLK+aHFLTf0TxDJ2ZfVCfeiJ8Pn5OLZvWPhS8qYNF8REHOQ
         E9IS3xS6UUIPKNnGmsoFUBp/KsuKuJdhluCPUptP7OHwWKI6a9krdaL9iLjxMZLoOZZt
         FCu6aAqaxy1nGCgO4dA8vzYKHFaVo6MPLybhITgp9J4DmVa9A2K+eRrg/7wC0Gwki33L
         lrdl9M8fDBTEgWvm1iQjfudF4in3ap6oB3/nbO9wVyYvBWhT/9O41n47fnmJT2mRQ3zL
         vpNw==
X-Gm-Message-State: AOAM533N3Iw42PW21zxXJ6qGCgDLQTc3UcTesypYttFihHTcFTUfJnv4
        jFUpO9sI1F7Q5kFaWqF9j6Wgxy1eJCAEr1HQfwgXIHq/w2M=
X-Google-Smtp-Source: ABdhPJzG40SAUBoX4jvxfMX/koyccrDpQ941zyVtFcPb+9o09wDgYqJFbDbyjpawGAoHiZvegxRSoL6Lu4tqsxg1+hA=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr3450635vss.18.1623743505958;
 Tue, 15 Jun 2021 00:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com> <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com> <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
 <76e2f396-ec94-2615-4fea-0f33f6564f19@gmail.com> <67009443-6963-c66d-9c3d-0a4d79664b71@physik.fu-berlin.de>
 <2dd5ced6-ed01-c029-be5c-4dbfee2d9d05@gmail.com>
In-Reply-To: <2dd5ced6-ed01-c029-be5c-4dbfee2d9d05@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Jun 2021 09:51:34 +0200
Message-ID: <CAMuHMdXU3gNS69p_C8gSx6s6M2R18QazYFxC8n11OL_Vny76aQ@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Jun 15, 2021 at 1:14 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 15/06/21 11:04 am, John Paul Adrian Glaubitz wrote:
> > On 6/15/21 12:11 AM, Michael Schmitz wrote:
> >> working on entry.S recently, I was reminded of this one. It's never been applied, and I can't find a trace of it in my tree.
> >>
> >> Not sure how far Adrian got with seccomp support testing, so I'm uncertain this is still of interest ...
> > I still have a fork of libseccomp with m68k support and my SH support patch
> > was merged upstream.
> >
> > So, if you guys can get the kernel bits in place, I can take care of libseccomp.
>
> Thanks - what (aside from my old patch) is still missing on the kernel
> side?

IIRC, it wasn't working well yet.  Reading the archives, due to some incorrect
return value somewhere?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
