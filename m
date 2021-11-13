Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A291EC433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 10:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CD3861057
	for <linux-m68k@archiver.kernel.org>; Sat, 13 Nov 2021 10:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhKMKJW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 13 Nov 2021 05:09:22 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:35548 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhKMKJV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 13 Nov 2021 05:09:21 -0500
Received: by mail-ua1-f54.google.com with SMTP id l24so19692740uak.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Nov 2021 02:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X00Pd8fqIvQGEqncqexu+Dg9JOnHKHW+HxxEt2IqH/4=;
        b=ofd4piY6aqvhj/Irbsx0evBkYOyXL+qJm1ZoLl55/QFzFIEbzvsbis9zV6u8AZacAz
         +VxcNUX44SDKGEo0iqd9i+vnjOGCnKholLSAyiSE86lPKbkTKSEOx85wljb76JeVaIzK
         dIoc+jC/kl8e3v5K30kKNHGo3A2UHbdCNfZvX9IokKsu05acee1ApqqrXQbZcboXHKfY
         D5bgZ5VorSd7fr+MUxpait8lQ+EC3TFVRsnDLp0zOPkeoaaG+HiHpYJ5MWSJOG9Fv/hQ
         D3OtWeGprGu4I368txLbVAlE4708Uoln75cVvVZYs7gM7E2X+ZI80A4vk2zSR+PQOeTp
         Uycg==
X-Gm-Message-State: AOAM530K20AfhEonFbQFmlP3L18Ck1ST0nCDKIegMuFAeTD9yPK3cIsU
        JYyyhNkP2OmDjGeXnR5nWjkXTaXOQhlmQQ==
X-Google-Smtp-Source: ABdhPJzpwSR56nkYRfjFRv4cr23B94K+ksl5dqTBWIarJrtP/QAvKEZsJG0DS8cODC8ZwMAbdMk17Q==
X-Received: by 2002:a05:6102:497:: with SMTP id n23mr19354641vsa.36.1636797986507;
        Sat, 13 Nov 2021 02:06:26 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id c21sm4024225vso.21.2021.11.13.02.06.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Nov 2021 02:06:26 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id p2so23914048uad.11
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Nov 2021 02:06:25 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr18906386vst.37.1636797985518;
 Sat, 13 Nov 2021 02:06:25 -0800 (PST)
MIME-Version: 1.0
References: <20211104182201.83906-1-axboe@kernel.dk> <20211104182201.83906-5-axboe@kernel.dk>
 <YYQoLzMn7+s9hxpX@infradead.org> <2865c289-7014-2250-0f5b-a9ed8770d0ec@kernel.dk>
 <YYQo4ougXZvgv11X@infradead.org> <8c6163f4-0c0f-5254-5f79-9074f5a73cfe@kernel.dk>
 <461c4758-2675-1d11-ac8a-6f25ef01d781@kernel.dk> <YYQr3jl3avsuOUAJ@infradead.org>
 <3d29a5ce-aace-6198-3ea9-e6f603e74aa1@kernel.dk> <YYQuyt2/y1MgzRi0@infradead.org>
 <87ee0091-9c2f-50e8-c8f2-dcebebb9de48@kernel.dk> <alpine.DEB.2.22.394.2111111350150.2780761@ramsan.of.borg>
 <yq1sfw2g7xr.fsf@ca-mkp.ca.oracle.com> <CAMuHMdVdwwT5yQPpQ5Frr-Un5OMk9LX3sF_zocOejrouSjaO-w@mail.gmail.com>
 <fbe43b88-720f-6956-60ea-18e07d73244e@gmail.com> <CAMuHMdXe4bA-a968cUcdaCKesMtkMc+qs=4L8nF2QQ0rWvAVHw@mail.gmail.com>
 <39bfc824-61d8-02a8-30fe-e9ea0efae100@gmail.com>
In-Reply-To: <39bfc824-61d8-02a8-30fe-e9ea0efae100@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 13 Nov 2021 11:06:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUztUeJfQj9a3v7P48_eDg1smv6OKNAE3baF6rSt4uouQ@mail.gmail.com>
Message-ID: <CAMuHMdUztUeJfQj9a3v7P48_eDg1smv6OKNAE3baF6rSt4uouQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] block: move queue enter logic into blk_mq_submit_bio()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-block@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 12, 2021 at 11:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 12/11/21 20:37, Geert Uytterhoeven wrote:
> > On Thu, Nov 11, 2021 at 10:35 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> how easy is that to reproduce?
> >
> > Fairly easy: it happens either on mounting, or after a few seconds booting
> > into my old Debian userspace.
>
> I must be too thick for this:
>
> EXT4-fs (sda1): Cannot load crc32c driver.
> VFS: Cannot open root device "sda1" or unknown-block(8,1): error -80

I know ;-) (or  :-(
Please cherry-pick commit beaaaa37c664e9af ("crypto: api - Fix boot-up
crash when crypto manager is disabled"), which is now upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
