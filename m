Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D29C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 11 Nov 2021 14:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D1A461215
	for <linux-m68k@archiver.kernel.org>; Thu, 11 Nov 2021 14:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbhKKOvj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 Nov 2021 09:51:39 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:41571 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233316AbhKKOvj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 Nov 2021 09:51:39 -0500
Received: by mail-ua1-f51.google.com with SMTP id p37so10650774uae.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 06:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOdkRMonvPRtvh+RCUFAypHkHVRkuDa2ETyMKRHbHyA=;
        b=qBtZD+wS0TOeAlmyTOAnMBf6hbmzCGmxfxq3DEC202t/bB5SPvP6r64oNcbREbBoLB
         d0MatAiKKQXy+SvjPV0CHlIx6+1NahjyXNA6D5Bb6JZG9VlsIVpUfey772xU61mJAzTw
         imCHOu+pIrhCr5FY2YnroE3g3ASb8+oRUGqVIjfYfnUgeQER7vQixR/YkFAeBwRN0eo1
         s5p1qwWAA8Vp5MX3XURCj/r9D2a5e86C9Zx6K+S45v8xuiXqD+0eXw11P5446tCVbgbQ
         4qjHVCGwSuOXjRIQExaiiONPOfhQcd5+bctZi7d9MVNYTw/ncb3RVW1+yJxoRy4wpDh4
         qfKg==
X-Gm-Message-State: AOAM533bYEH+HYBPQOsZrjEKKnR8ViLZmsQHQ0d1KOfwQZaFAOwnwA11
        OBxdjIslvFx4CwhpoPxHDyPiuZuwo9tkQg==
X-Google-Smtp-Source: ABdhPJyMYjxC8lg6Cx2kxV5VJay9g1mPy+CqnOfJgTTJVerw8f7SIta5FAQwqvrhEsvv1w6gkOiSFQ==
X-Received: by 2002:a67:bb11:: with SMTP id m17mr12203587vsn.5.1636642128966;
        Thu, 11 Nov 2021 06:48:48 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id y2sm2192969vke.43.2021.11.11.06.48.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 06:48:48 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id a129so3370007vkb.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 06:48:48 -0800 (PST)
X-Received: by 2002:a05:6122:20a7:: with SMTP id i39mr11374370vkd.15.1636642128577;
 Thu, 11 Nov 2021 06:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20211104182201.83906-1-axboe@kernel.dk> <20211104182201.83906-5-axboe@kernel.dk>
 <YYQoLzMn7+s9hxpX@infradead.org> <2865c289-7014-2250-0f5b-a9ed8770d0ec@kernel.dk>
 <YYQo4ougXZvgv11X@infradead.org> <8c6163f4-0c0f-5254-5f79-9074f5a73cfe@kernel.dk>
 <461c4758-2675-1d11-ac8a-6f25ef01d781@kernel.dk> <YYQr3jl3avsuOUAJ@infradead.org>
 <3d29a5ce-aace-6198-3ea9-e6f603e74aa1@kernel.dk> <YYQuyt2/y1MgzRi0@infradead.org>
 <87ee0091-9c2f-50e8-c8f2-dcebebb9de48@kernel.dk> <alpine.DEB.2.22.394.2111111350150.2780761@ramsan.of.borg>
 <yq1sfw2g7xr.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1sfw2g7xr.fsf@ca-mkp.ca.oracle.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 Nov 2021 15:48:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdwwT5yQPpQ5Frr-Un5OMk9LX3sF_zocOejrouSjaO-w@mail.gmail.com>
Message-ID: <CAMuHMdVdwwT5yQPpQ5Frr-Un5OMk9LX3sF_zocOejrouSjaO-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] block: move queue enter logic into blk_mq_submit_bio()
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-block@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Martin,

On Thu, Nov 11, 2021 at 2:19 PM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
> > sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
> > sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
> > sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid field in cdb
> > sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 08 00 00 00 01 00 00 08 00
> > critical target error, dev sda, sector 1 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
> > Buffer I/O error on dev sda1, logical block 0, lost sync page write
>
> Peculiar. That write command looks OK to me. I wonder if it's the FUA
> bit that trips it?
>
> What does:
>
> # dmesg | grep FUA
>
> say?

sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
support DPO or FUA

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
