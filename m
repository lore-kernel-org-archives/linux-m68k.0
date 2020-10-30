Return-Path: <SRS0=oftE=EF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0C0C55178
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 10:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E50B420731
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 10:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgJ3Kt3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:49:29 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39376 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJ3KtY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 30 Oct 2020 06:49:24 -0400
Received: by mail-ot1-f68.google.com with SMTP id o14so5143671otj.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2020 03:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DxbIWzNpadhYFOHMUtiUrYp7aLL+EHToyZld4U4MCe0=;
        b=T6YL0qxkqU6MyVucBH+yYLLgPFTI8Edp7zh97/jUZLPl0OE22BcnGD048rkJro4AlK
         dAQD/61344uTjQk75W62bjFzTHQ1sf6jYptG2Xi28NPQ0uqs5R66aDSwdyBZAMaZqpOS
         Xq9HvLoc8Jjkyiq4CJu8ct24U9fF7TVvq8VF5QqWj1UFRPmB2F7ee7wXzcGgCCDHMUzS
         xX5/2ex5uFUJizzgHMJXdCqBc1YrTI680oP9Gi9LNSarnv8vkzVoiKeV3ySJtHaoUtgP
         JO8AxCMuzzkB0R4ramyU+/hbOP1bxWQ4D0emFTkWrbNqxSzcJPZevEQN5i/IQQ7toNew
         8LwQ==
X-Gm-Message-State: AOAM532kaWOjmbLyGP2oErMj6gxHXO4iMDQQnSMAn+qqL4oDrc8Ysne6
        Jj01804pWJCjtp1+mjyJBRhCNrz5XgyUBFljvZc=
X-Google-Smtp-Source: ABdhPJy9u74BmkVjZUFAuaURT/kEEdBGpSqzi3KJMiCa3ikzKpuqxbG/v/dEUk5lGOwft38huDOCIItC4IP+PfOAO30=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1064521oti.107.1604054962859;
 Fri, 30 Oct 2020 03:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201029145841.144173-1-hch@lst.de> <20201029145841.144173-3-hch@lst.de>
 <20201029192236.GA991240@kroah.com> <20201029193242.GA4799@lst.de> <20201030104033.GA2392682@kroah.com>
In-Reply-To: <20201030104033.GA2392682@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 11:49:11 +0100
Message-ID: <CAMuHMdXuzM0Z+yXXWqw8E2u-TNaC6C7NMRMH+X8oWQGaD=jckw@mail.gmail.com>
Subject: Re: [PATCH 02/18] block: open code kobj_map into in block/genhd.c
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        "David S. Miller" <davem@davemloft.net>,
        Song Liu <song@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
        Finn Thain <fthain@telegraphics.com.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-block@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-raid@vger.kernel.org,
        scsi <linux-scsi@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Fri, Oct 30, 2020 at 11:40 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Oct 29, 2020 at 08:32:42PM +0100, Christoph Hellwig wrote:
> > On Thu, Oct 29, 2020 at 08:22:36PM +0100, Greg Kroah-Hartman wrote:
> > > After this, you want me to get rid of kobj_map, right?  Or you don't
> > > care as block doesn't use it anymore?  :)
> >
> > I have a patch to kill it, but it causes odd regressions with the
> > tpm driver according to the kernel test.  As I have grand plans that
> > build on the block ѕide of this series for 5.11, I plan to defer the
> > chardev side and address it for 5.12.
>
> Ok, sounds good.
>
> Wow, I just looked at the tpm code, and it is, um, "interesting" in how
> it thinks device lifespans work.  Nothing like having 4 different
> structures with different lifespans embedded within a single structure.
> Good thing that no one can dynamically remove a TPM device during
> "normal" operation.

/sys/.../unbind?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
