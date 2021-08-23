Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928B4C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6248B6103A
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbhHWVux (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 17:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhHWVuw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Aug 2021 17:50:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58CFC061575
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 14:50:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i28so40931737lfl.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 14:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F0PVnTs7ZJCDGCyDfNjc9qaqI5UUnDTLDnTbdr0Nqc8=;
        b=hH5Hy188c/sdwzOKozzRg5ueeq3wEUMmrriZxoo+s8od1usiWD1lTmrpB6T4D6zgVo
         r+PsLYzTJ4gxR/WurYfUYaq9ib8s7tTFfRfMNdP31KrH+J7VV6Y6Mk8wCjzQtGnGjb2o
         Y20L9vePvszzognGfjvGU766jJN3hBgqLMLBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F0PVnTs7ZJCDGCyDfNjc9qaqI5UUnDTLDnTbdr0Nqc8=;
        b=FbUniq+Le/b6noYGZ+dmxFlneyrvxrGhzX22Hofwent77h/kj1qzJOgo+TUhC9S8NQ
         /E7BGPTqiFk1kxVUGhSNOBfN31A/0hvh7z9mGmIpbaN/3Aiu0e/tUgoK03injeo7I0Xr
         8nFXwZKe6PmNNIndIjC/CvV1VA7FAZG0ncyOLy/dzxi25Qp9mVaVqlM13CqmRHNo5cjl
         /2LUKQgVFOFlqVcUtErBwDSSV91k6tB12z+l0tBhSOrR2BqVkOYjBO+0tyJMpaJfaZEj
         BjVZdy0esBQ/bmMGDOIlOMKsSmkdMhk3mZbaYo88d8FkywxsBdxwITsVMTclMYIrMtys
         UG5A==
X-Gm-Message-State: AOAM531PET3vELwgUMQ92A9DO8v4gc8gOZoueaHhsXJ/b5jrSk/mC5+Y
        j2NP2QBu/xGh/6oIZwlhZUr7nHQVJ7vqQ02n
X-Google-Smtp-Source: ABdhPJz89IvOhLexheXLmA1bh1dZtj7yW+07S/pmBt6dQJro0i+Q0LVo4p4k+JchFnTZIwCYCKn46A==
X-Received: by 2002:ac2:4c8f:: with SMTP id d15mr25800915lfl.562.1629755405856;
        Mon, 23 Aug 2021 14:50:05 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id f10sm1561247lfr.303.2021.08.23.14.50.04
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 14:50:04 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id i28so40931605lfl.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 14:50:04 -0700 (PDT)
X-Received: by 2002:a19:491b:: with SMTP id w27mr25628478lfa.421.1629755404328;
 Mon, 23 Aug 2021 14:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com> <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com> <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
In-Reply-To: <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Aug 2021 14:49:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
Message-ID: <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
Subject: Re: RFC: remove set_fs for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 23, 2021 at 2:31 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Hi Linus,
>
>
> On 24/08/21 05:59, Linus Torvalds wrote:
> > On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> Got this overnight:
> >>
> >>> [536154.200000] *** FORMAT ERROR ***   FORMAT=0
> >>> [536154.210000] Current process id is 4656
> >>> [536154.230000] BAD KERNEL TRAP: 00000000
> >>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
> >>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> >>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
> >>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
> >>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
> >>> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
> >>> [536154.330000] Frame format=0
> >>> [536154.340000] Stack from 00cc5fa4:
> >>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
> >>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
> >>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001
> > Strange. If I read that stack frame correctly, that seems to be an
> > exception frame of type 0xb ("Long Bus Cycle").
>
> Not sure where you get the 0xb from - the frame format I see is 0.

The "Frame format=0" is, afaik, the format of when the error happens.

But I'm looking at what the stack contents are at the time of the
exception, to see what actually *triggered* the error.

And if I read it right, the RTE that took the format error fault had this stack:

        02088004 3666b008 1c0eb209 ..

and that means that it tried to return with status register 0208
(which looks correct: supervisor bit clear), to PC 80043666 (which
might be right - it's a similar address to the ones in A0/A1).

And then the format/vector value is b008.

That is, if I read it right, format 0xb, which is that "Long Bus Cycle" thing.

NOTE! I may be misreading this entirely. My m68k knowledge is so
out-of-date that it's not even funny, and it actually predates all
this fancy format stuff. So I'm just pattern-matching with the manuals
I found online.

               Linus
