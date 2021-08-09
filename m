Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488D6C4320A
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C25E61077
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhHINkh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:40:37 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:39526 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbhHINkh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Aug 2021 09:40:37 -0400
Received: by mail-vs1-f50.google.com with SMTP id e9so2178340vst.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Aug 2021 06:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjHjg/Z7oYOXjhtSSz+wbVAse1L0K1SEAzZEovVP9hw=;
        b=N7j/HnyY1C/aEWdjDTjMh+6gfS9/o+OQjoY46yQNjK3MtOCQK+PvuTETpq69rWiM/h
         6hAzsy5hVBsonbKh9IwieAqzRyoUHG1xbuas172A7RujpsBn8MPEDTtpdI5gz+FQOcqN
         I5uCcYIctQevO31rz89iioIulaQJ187KBq0xQlwREsYh6xfZQc4Cwani472+0+DxmJYk
         yDJi1vYei2zKW7TLm5Rvc9/w5vL9G32AFQv1lVibm6yQ5oh7g88YCnkL0gc40wtMuN96
         jInV9owlLCBC586+HFDLbGvb0NlgknBX+YiPPm5MvJY+c+za1RIkR1cxKXreawukGczV
         Y9cg==
X-Gm-Message-State: AOAM5330f+QLJi/fsXN4PlPlMMTTpqjDe4qMShFApA7pGFvc5baFiS+U
        qyCgxKNNbJJbz91oQlry75mPwvRmMs2QYLH9ndg=
X-Google-Smtp-Source: ABdhPJxYts/o3g7GY6Nn1JTaFCfK/olzu02pgKgcaRpmtI81Tcz0qlR4g3KjlXZF+iOfB0+PkDYWIgmnT/hlOB9LvQo=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr8882309vsk.40.1628516415894;
 Mon, 09 Aug 2021 06:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAM43=SM4KFE8C1ekwiw_kBYZKSwycnTYcbBXfw5OhUn4h=r9YA@mail.gmail.com>
 <31298797-f791-4ac5-cfda-c95d7c7958a4@linux-m68k.org> <CAM43=SNV4016i2ByssN9tvXDN6ZyQiYM218_NkrebyPA=p6Rcg@mail.gmail.com>
 <380dd57-4b60-ac9c-508c-826d8ec1b0aa@linux-m68k.org> <CAM43=SO03vCzo4LiwSFJyNbWdVXu_wu1gdm5wzi2ArsWShCqqA@mail.gmail.com>
In-Reply-To: <CAM43=SO03vCzo4LiwSFJyNbWdVXu_wu1gdm5wzi2ArsWShCqqA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Aug 2021 15:40:04 +0200
Message-ID: <CAMuHMdUADRtNrVsJZFdymOoGe8LNEg=x2PtzRVJhh0rcyLpHoQ@mail.gmail.com>
Subject: Re: [BISECTED][REGRESSION] 5.10.56 longterm kernel breakage on m68k/aranym
To:     Mikael Pettersson <mikpelinux@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Linux Kernel list <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        stable <stable@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC Mike

On Mon, Aug 9, 2021 at 3:32 PM Mikael Pettersson <mikpelinux@gmail.com> wrote:
> On Mon, Aug 9, 2021 at 3:59 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > On Sun, 8 Aug 2021, Mikael Pettersson wrote:
> > > On Sun, Aug 8, 2021 at 1:20 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > > > On Sat, 7 Aug 2021, Mikael Pettersson wrote:
> > > > > I updated the 5.10 longterm kernel on one of my m68k/aranym VMs from
> > > > > 5.10.47 to 5.10.56, and the new kernel failed to boot:
> > > > >
> > > > > ARAnyM 1.1.0
> > > > > Using config file: 'aranym1.headless.config'
> > > > > Could not open joystick 0
> > > > > ARAnyM RTC Timer: /dev/rtc: Permission denied
> > > > > ARAnyM LILO: Error loading ramdisk 'root.bin'
> > > > > Blitter tried to read byte from register ff8a00 at 0077ee
> > > > >
> > > > > At this point it kept running, but produced no output to the console,
> > > > > and would never get to the point of starting user-space. Attaching gdb
> > > > > to aranym showed nothing interesting, i.e. it seemed to be executing
> > > > > normally.
> > > > >
> > > > > A git bisect identified the following commit between 5.10.52 and
> > > > > 5.10.53 as the culprit:
> > > > > # first bad commit: [9e1cf2d1ed37c934c9935f2c0b2f8b15d9355654]
> > > > > mm/userfaultfd: fix uffd-wp special cases for fork()
> > > > >
> > > >
> > > > That commit appeared in mainline between v5.13 and v5.14-rc1. Is mainline
> > > > also affected? e.g. v5.14-rc4.
> > >
> > > 5.14-rc4 boots fine. I suspect the commit has some dependency that
> > > hasn't been backported to 5.10 stable.
> > >
> >
> > On mainline, 9e1cf2d1ed3 is known as commit 8f34f1eac382 ("mm/userfaultfd:
> > fix uffd-wp special cases for fork()").
> >
> > There are differences between the two commits that may be relevant. I
> > don't know.
> >
> > If you checkout 8f34f1eac382 and if that works, it would indicate either
> > missing dependencies in -stable, or those differences are important.
> >
> > OTOH, if 8f34f1eac382 fails in the same way as linux-5.10.y, it would
> > indicate that -stable is missing a fix that's present in v5.14-rc4.
>
> My initial bisect was wrong. I tried reverting 8f34f1eac382 from
> 5.10.57 but that made no difference, so I re-ran the git bisect with
> all known good points pre-marked. This landed on:
> # first bad commit: [ce6ee46e0f39ed97e23ebf7b5a565e0266a8a1a3]
> mm/page_alloc: fix memory map initialization for descending nodes
>
> Reverting _that_ from 5.10.57 does unbreak that kernel.
>
> Sorry about the confusion.
