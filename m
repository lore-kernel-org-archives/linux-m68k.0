Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05D2C4332F
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 07:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 715AA60FBF
	for <linux-m68k@archiver.kernel.org>; Fri, 12 Nov 2021 07:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbhKLHyQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 Nov 2021 02:54:16 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:33436 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbhKLHyP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 Nov 2021 02:54:15 -0500
Received: by mail-ua1-f48.google.com with SMTP id b17so17257451uas.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 23:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s8HBKR2e7f8USrVYae8TJzCMhd+TVP1tFNS5pXP6hgc=;
        b=Fw6Jk8dkuajW+zMFcGa90oiJxGGe/Dlyt6R4RUZcsmRH3psWz33xe3rwbvSD2X589S
         AjGnkeiKN63/yPwCpUCamDS+bwyV5DmSeaSI+PvRcQBClzKeBgQNOqovzktfMcft10zf
         KpZVJqDwOjfAWSsN2a3CYjt9/ImBTe9qA+FwCTokpLrpV2b+GTWkbrb9GjH57adKHsLq
         MGe2rab86nx6VuwyEu9BQjrwtyKFkt/koGoy4VwuGy98C8MoiZapHVjVoVuZdoYP2zG9
         JajJdHsZxyNmxNZ1zrIOfYvqkab3nCfPe1k87Cm4SKLcnHP9gaovpSlDYLuYtMEJdtqI
         nVoQ==
X-Gm-Message-State: AOAM530G/w2XhkzPb+RQa0u4lIT9orU2af1tq6U6IHfygoL8Rp3Yau4X
        0iUMAljyjslaXWtWWOqyodl9wpORKrK1Ow==
X-Google-Smtp-Source: ABdhPJwIEBNUZPFHTk7f03UypUeLIM3xVsQ85+nY76taKoVmFnwVd54z3Hvp+KducHE1sGQ6NvBIuw==
X-Received: by 2002:ab0:26c9:: with SMTP id b9mr20105220uap.10.1636703484641;
        Thu, 11 Nov 2021 23:51:24 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id f21sm3559023vke.39.2021.11.11.23.51.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 23:51:24 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id e2so17141510uax.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 Nov 2021 23:51:24 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr7356471vsj.50.1636703483815;
 Thu, 11 Nov 2021 23:51:23 -0800 (PST)
MIME-Version: 1.0
References: <461c4758-2675-1d11-ac8a-6f25ef01d781@kernel.dk>
 <YYQr3jl3avsuOUAJ@infradead.org> <3d29a5ce-aace-6198-3ea9-e6f603e74aa1@kernel.dk>
 <YYQuyt2/y1MgzRi0@infradead.org> <87ee0091-9c2f-50e8-c8f2-dcebebb9de48@kernel.dk>
 <alpine.DEB.2.22.394.2111111350150.2780761@ramsan.of.borg>
 <YY0eVnbjmHmPZ3M4@T590> <CAMuHMdWTiF3MpcwHc=jCGLoBtTngzXTLHsYSYKPyfLBFBn8B2g@mail.gmail.com>
 <YY01hzAuvmeMxO+0@T590> <17ce59ff-bc8c-e8c8-22e1-96605440629a@kernel.dk> <YY246bCP+wKw0Z2c@T590>
In-Reply-To: <YY246bCP+wKw0Z2c@T590>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 08:51:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV30yvjam8i0Z4Nsu=e1YhPaRb4E1bAtw7=268v6TnrJg@mail.gmail.com>
Message-ID: <CAMuHMdV30yvjam8i0Z4Nsu=e1YhPaRb4E1bAtw7=268v6TnrJg@mail.gmail.com>
Subject: Re: [PATCH 4/5] block: move queue enter logic into blk_mq_submit_bio()
To:     Ming Lei <ming.lei@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        linux-block@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ming,

On Fri, Nov 12, 2021 at 1:44 AM Ming Lei <ming.lei@redhat.com> wrote:
> On Thu, Nov 11, 2021 at 03:17:27PM -0700, Jens Axboe wrote:
> > On 11/11/21 8:23 AM, Ming Lei wrote:
> > > On Thu, Nov 11, 2021 at 03:51:28PM +0100, Geert Uytterhoeven wrote:
> > >> On Thu, Nov 11, 2021 at 2:45 PM Ming Lei <ming.lei@redhat.com> wrote:
> > >>> On Thu, Nov 11, 2021 at 01:58:38PM +0100, Geert Uytterhoeven wrote:
> > >>>> On Thu, 4 Nov 2021, Jens Axboe wrote:
> > >>>>> On 11/4/21 1:04 PM, Christoph Hellwig wrote:
> > >>>>>> On Thu, Nov 04, 2021 at 01:02:54PM -0600, Jens Axboe wrote:
> > >>>>>>> On 11/4/21 12:52 PM, Christoph Hellwig wrote:
> > >>>>>>>> Looks good:
> > >>>>>>>>
> > >>>>>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> > >>>>>>>
> > >>>>>>> So these two are now:
> > >>>>>>>
> > >>>>>>> https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.16/block&id=c98cb5bbdab10d187aff9b4e386210eb2332af96
> > >>>>>>>
> > >>>>>>> which is the one I sent here, and then the next one gets cleaned up to
> > >>>>>>> remove that queue enter helper:
> > >>>>>>>
> > >>>>>>> https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.16/block&id=7f930eb31eeb07f1b606b3316d8ad3ab6a92905b
> > >>>>>>>
> > >>>>>>> Can I add your reviewed-by to this last one as well? Only change is the
> > >>>>>>> removal of blk_mq_enter_queue() and the weird construct there, it's just
> > >>>>>>> bio_queue_enter() now.
> > >>>>>>
> > >>>>>> Sure.
> > >>>>>
> > >>>>> Thanks, prematurely already done, as you could tell :-)
> > >>>>
> > >>>> The updated version is now commit 900e080752025f00 ("block: move queue
> > >>>> enter logic into blk_mq_submit_bio()") in Linus' tree.
> > >>>>
> > >>>> I have bisected failures on m68k/atari (on ARAnyM, using nfhd as the
> > >>>> root device) to this commit, e.g.:
> > >>>>
> > >>>>     sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
> > >>>>     sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
> > >>>>     sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid field in cdb
> > >>>>     sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 08 00 00 00 01 00 00 08 00
> > >>>>     critical target error, dev sda, sector 1 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
> > >>>>     Buffer I/O error on dev sda1, logical block 0, lost sync page write
> > >>>>
> > >>>>     EXT4-fs (sda1): I/O error while writing superblock
> > >>>>     sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK cmd_age=0s
> > >>>>     sd 0:0:0:0: [sda] tag#0 Sense Key : Illegal Request [current]
> > >>>>     sd 0:0:0:0: [sda] tag#0 Add. Sense: Invalid field in cdb
> > >>>>     sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 08 00 00 00 01 00 00 08 00
> > >>>>     critical target error, dev sda, sector 1 op 0x1:(WRITE) flags 0x20800 phys_seg 1 prio class 0
> > >>>>     Buffer I/O error on dev sda1, logical block 0, lost sync page write
> > >>>>     EXT4-fs (sda1): I/O error while writing superblock
> > >>>>
> > >>>> This may happen either when mounting the root file system (leading to an
> > >>>> unable to mount root fs panic), or later (leading to a read-only
> > >>>> rootfs).
> > >>>
> > >>> BTW, today I just found that hang in blk_mq_freeze_queue_wait() is
> > >>> caused by commit 900e080752025f00, and the following patch can fix it:
> > >>>
> > >>> - blk-mq: don't grab ->q_usage_counter in blk_mq_sched_bio_merge
> > >>>
> > >>> https://lore.kernel.org/linux-block/20211111085650.GA476@lst.de/T/#m759b88fda094a65ebf29bc81b780967cdaf9cf28
> > >>>
> > >>> Maybe you can try the above patch.
> > >>
> > >> Thanks! I have applied both patches, but it doesn't make a difference.
> > >
> > > Thanks for your test!
> > >
> > > Can you try the following patch?

[...]

> > That's definitely a real fix, akin to the other pre-enter variants, this
> > one just post checks. Geert, can you give this a whirl?

With both of

    blk-mq: don't grab ->q_usage_counter in blk_mq_sched_bio_merge
    blk-mq: rename blk_attempt_bio_merge

applied, and the version above, I no longer saw the error, but the
boot sometimes hangs after:

    ext3 filesystem being remounted at / supports timestamps until
2038 (0x7fffffff)

I don't know how easy that is to trigger: it hung on my first try, but
the second and third tries it booted fully into old Debian userspace.

> > Ming, would you mind sending this as a real patch?
>
> The above patch may not be enough, since submit_bio_checks() is done in
> case of using cached request, so how about the following patch(un-tested)?

Worked fine in five subsequent boots. Thanks!
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
