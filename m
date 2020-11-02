Return-Path: <SRS0=xmJ+=EI=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064F6C388F2
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Nov 2020 12:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B09F2222B9
	for <linux-m68k@archiver.kernel.org>; Mon,  2 Nov 2020 12:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgKBME3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:04:29 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40442 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgKBME3 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Nov 2020 07:04:29 -0500
Received: by mail-ot1-f66.google.com with SMTP id 79so4892984otc.7
        for <linux-m68k@vger.kernel.org>; Mon, 02 Nov 2020 04:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwavpG6Tq6VY3VFCToV8ACtmv3elVMgje7AZTjLsX4o=;
        b=DLv2UICRKKO7f4v0NbtUU8NT1q7eeHfzBfC6Mphh3MGXzNjSwAV79NalSzd3pLNXZa
         AbJU1QcGv0MYZN/dUdhmzwvwz7hVbknpIQ8ml/8Y6NItfZn0D8ixQuIrTW8P/o4hUb9w
         pK+9pcf5WiVojJXWRpcOvNpCnSPhoWtLuDkMBnpreB26DEcE7mKwzoGuh6M9g2VoPmZ/
         l/zFVwQXD6X1+eg3UtvVei4FxyMuP1mA5E6enN2wZPppLBxzU9yJTT8UoF/teG9IVNVp
         Vro4fytIBdR4TD3ImLi46wmpqnpLAY6m9DM7NBWYyhSiI/ICZ1xMvUkzOx1KPfmZAURE
         gdJw==
X-Gm-Message-State: AOAM533u4cyEWtw/zKBPdIue1VZvEJb9yY5DSSbXvELzOlYF2sjAyhFV
        5YfTGOSgFLMmf7IBSVR/Vt2SfI2eNR8DK9R2dJc=
X-Google-Smtp-Source: ABdhPJxw9hHR0dqR30Jnlz08hgr8KOOna/h7y/OQdnD5b6Y469JfuxmN1gNsP3UHfG2W3V9BwKbp1ix9+VUa17lzLoA=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr11653743otc.145.1604318668310;
 Mon, 02 Nov 2020 04:04:28 -0800 (PST)
MIME-Version: 1.0
References: <6d18ee09-00df-e2ff-7cb6-1e60a9cdcf99@debian.org>
 <0010e0b1-0010-3e1c-7d14-618b6cdc2203@altum.de> <20200908212544.GA25150@allandria.com>
 <a1a231d0-98b3-2c98-a47b-9189f5b98ae9@debian.org> <CAMuHMdWmdR_U8erBE5dmfS9abKB-aJFz15eZNp5dw8Znkpo8MQ@mail.gmail.com>
 <6ba3e308-1086-d718-c71a-1d9ca7c15cee@debian.org> <CAMuHMdXALTMbsFYV6U+W-z5AnpgTOJ3AsRjmHfnGogP9rLHB8g@mail.gmail.com>
 <6e10288f-9ec6-cdf7-53c2-5078e57952d9@debian.org> <366f0646-253d-bdab-daf7-a60a364f5ec7@gmail.com>
In-Reply-To: <366f0646-253d-bdab-daf7-a60a364f5ec7@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Nov 2020 13:04:17 +0100
Message-ID: <CAMuHMdXdbUV7eErc63VZ+0LxxgwqqUTZGiBY_cSSmb8QKAsDsA@mail.gmail.com>
Subject: Re: udev and friends not able to mount Atari GEMDOS partition
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Emmanuel Kasper <manu@debian.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Oct 26, 2020 at 10:19 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 27/10/20 6:13 AM, Emmanuel Kasper wrote:
> > A FAT 12 MS DOS floppy is also correctly mounted via mount without
> > specifying the fat type.
> >
> > IMHO the patch is not needed anymore, or is covering a use case I don't see.
>
> With what you've reported, I can't see what use case this patch would
> have enabled either. For all I care, we should drop the three FAT
> related commits at the head of m68k-queue.
>

Thanks. Dropped.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
