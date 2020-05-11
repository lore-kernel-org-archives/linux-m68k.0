Return-Path: <SRS0=1ZKR=6Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B1C47255
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 15:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61BDE206D5
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 15:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729771AbgEKPZ6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 May 2020 11:25:58 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33920 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgEKPZ5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 May 2020 11:25:57 -0400
Received: by mail-oi1-f196.google.com with SMTP id c12so14413559oic.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2020 08:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TzBIrOjeonGRZOL/Fq7k9DQ5ZvmwekoG5+JYmyzDCXE=;
        b=a8iryAVOJH6sp3A3KGv3CjFxd8f3pOTp5T+dVVfoRBFgylRqnSfilHQyagm7YXcE4O
         s7PLeya8Y7X8bvB5KEVqAMQOAXDL0NE9KFnENh9Qf0quWtDTQ6d+2nPdaUHN6GftnWMW
         2D1rSY/fNTeTE6suYx43VAg4fib9mMcIaZuLcw5y4pvkbMc6NfUPBj4XG0/Y58LA7eKM
         8dqiwEJfRXzqbiL1fluhojXKT6yb+/1/KkXTw5yXHGACE/dIgQZgqPFUHaEUf8UZ0kVx
         59/gp7UKbGDoOJyT0qxEl/XfzJb4lIowat6Fj+KkMjP6vASS/YXgt8tTnKeYLRRkuhG9
         +L4w==
X-Gm-Message-State: AGi0PuYLrUNqiQnMo+ptYSyzrQ4yJIAHnJgZhvgaQfd5mKtRi+IZP76x
        HwL7sf3aMp5XM/rw4zl2wsfXiiMbUILMVeQ+/7Y=
X-Google-Smtp-Source: APiQypLlj1mTr31cEwJB2xy6sDTZQtzFBc6S7Z09a7MvI75cUG4xFy+vj6rnOik7yeSDKBHlS8j7JE0DJYDjRznsD0s=
X-Received: by 2002:aca:895:: with SMTP id 143mr19322774oii.153.1589210756876;
 Mon, 11 May 2020 08:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de> <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
 <20200511151356.GB28634@lst.de>
In-Reply-To: <20200511151356.GB28634@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 17:25:45 +0200
Message-ID: <CAMuHMdU1xAmyWysi5xRoaRL7PFurPncvEL0CcEY0V_sUz3EJPw@mail.gmail.com>
Subject: Re: sort out the flush_icache_range mess
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Roman Zippel <zippel@linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Michal Simek <monstr@monstr.eu>,
        Jessica Yu <jeyu@kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-c6x-dev@linux-c6x.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        alpha <linux-alpha@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, May 11, 2020 at 5:14 PM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, May 11, 2020 at 09:46:17AM +0200, Geert Uytterhoeven wrote:
> > On Sun, May 10, 2020 at 9:55 AM Christoph Hellwig <hch@lst.de> wrote:
> > > none of which really are used by a typical MMU enabled kernel, as a.out can
> > > only be build for alpha and m68k to start with.
> >
> > Quoting myself:
> > "I think it's safe to assume no one still runs a.out binaries on m68k."
> > http://lore.kernel.org/r/CAMuHMdW+m0Q+j3rsQdMXnrEPm+XB5Y2AQrxW5sD1mZAKgmEqoA@mail.gmail.com
>
> Do you want to drop the:
>
>     select HAVE_AOUT if MMU
>
> for m68k then?

If that helps to reduce maintenance, it's fine for me.
That leaves alpha as the sole user?

> Note that we'll still need flush_icache_user_range for m68k with mmu,
> as it also allows binfmt_flat for mmu configs.

Understood.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
