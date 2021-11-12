Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9C3C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 07:37:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2011E60FBF
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 07:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbhKLHkf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 02:40:35 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:35453 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLHke (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 Nov 2021 02:40:34 -0500
Received: by mail-ua1-f44.google.com with SMTP id l24so12809291uak.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 23:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQ4/iGHjO+D1nKbWZYqWqNeSX8H86sNRuRz8Q3iQKxQ=;
        b=w+FyjOCu+QbgvxXFZVhKtIhi8x5rdK1d+dTcBjwYuPhZLidZcG79komslx0o+VlzKc
         /FEXdRb5AEYo5Z5IGfuSBDcLkdh3N2BvBbNAFAbqqBHoFNtL7TAqWtqPKVv2qgwNVj9P
         +qq4IF+ZdkTlPqtTTcKevKlwSLVg84FVpy2JKZlM93Cj+NbamqZnx/Syw1q642u/EkTC
         DY30V1AWPzHXcEq/nJQzAi7LZpSdqhra+lNMnnc4Dsak38K2B3ivGo21h3Td+ERdA3jN
         zOCaO5oII0TuV9vbwVuLpyrRxRb6EwXox9/2l/yGC9F6hYHBzyX5iZ7MFJf2Nlpnsz63
         YWdQ==
X-Gm-Message-State: AOAM531rs0NWF9tyVIrQAQW1QLTmnvP5qVGwk3XZyJDx1m/qtsNObnCF
        rGaBSLsdTdYMhpoJlO3ZIJ9OGovUx72a6Q==
X-Google-Smtp-Source: ABdhPJy2yK2FnpDfJM0ZE/RBhVmVGV6Zs02xKlgY0ZOKElAzlw7FObvB4gvkn/BW0ZEdRbsg2pxtIw==
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr7232621vsp.53.1636702663750;
        Thu, 11 Nov 2021 23:37:43 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id l28sm3555143vkn.45.2021.11.11.23.37.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 23:37:43 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id e64so4655464vke.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 23:37:43 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr20558606vko.7.1636702662860;
 Thu, 11 Nov 2021 23:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20211104182201.83906-1-axboe@kernel.dk> <20211104182201.83906-5-axboe@kernel.dk>
 <YYQoLzMn7+s9hxpX@infradead.org> <2865c289-7014-2250-0f5b-a9ed8770d0ec@kernel.dk>
 <YYQo4ougXZvgv11X@infradead.org> <8c6163f4-0c0f-5254-5f79-9074f5a73cfe@kernel.dk>
 <461c4758-2675-1d11-ac8a-6f25ef01d781@kernel.dk> <YYQr3jl3avsuOUAJ@infradead.org>
 <3d29a5ce-aace-6198-3ea9-e6f603e74aa1@kernel.dk> <YYQuyt2/y1MgzRi0@infradead.org>
 <87ee0091-9c2f-50e8-c8f2-dcebebb9de48@kernel.dk> <alpine.DEB.2.22.394.2111111350150.2780761@ramsan.of.borg>
 <yq1sfw2g7xr.fsf@ca-mkp.ca.oracle.com> <CAMuHMdVdwwT5yQPpQ5Frr-Un5OMk9LX3sF_zocOejrouSjaO-w@mail.gmail.com>
 <fbe43b88-720f-6956-60ea-18e07d73244e@gmail.com>
In-Reply-To: <fbe43b88-720f-6956-60ea-18e07d73244e@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 08:37:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXe4bA-a968cUcdaCKesMtkMc+qs=4L8nF2QQ0rWvAVHw@mail.gmail.com>
Message-ID: <CAMuHMdXe4bA-a968cUcdaCKesMtkMc+qs=4L8nF2QQ0rWvAVHw@mail.gmail.com>
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

Hi Michael,

On Thu, Nov 11, 2021 at 10:35 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> how easy is that to reproduce?

Fairly easy: it happens either on mounting, or after a few seconds booting
into my old Debian userspace.

> sd_setup_read_write_cmnd() does not validate the request's FUA flag
> against sdkp->DPOFUA (not suggesting that it should ...). I'd like to
> try and trace when such a mismatch happens.

Thanks!

> On 12/11/21 03:48, Geert Uytterhoeven wrote:
> > On Thu, Nov 11, 2021 at 2:19 PM Martin K. Petersen
> > <martin.petersen@oracle.com> wrote:
> >>> sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
> >>> sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
> >>> sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid field in cdb
> >>> sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 08 00 00 00 01 00 00 08 00
> >>> critical target error, dev sda, sector 1 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
> >>> Buffer I/O error on dev sda1, logical block 0, lost sync page write
> >>
> >> Peculiar. That write command looks OK to me. I wonder if it's the FUA
> >> bit that trips it?
> >>
> >> What does:
> >>
> >> # dmesg | grep FUA
> >>
> >> say?
> >
> > sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't
> > support DPO or FUA

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
