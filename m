Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40323C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Feb 2022 13:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbiB1Nt7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Feb 2022 08:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236740AbiB1Nt6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Feb 2022 08:49:58 -0500
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47924A3E4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Feb 2022 05:49:19 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a28so994221uaf.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Feb 2022 05:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZlhBssXvwBUH+DmkM+uVIB26RD/VtgYSa5UcFW0OSE=;
        b=qGIsyItDxsKxZ8U0n/MYw1pc/Ee3p/H2KO9tlEILX13fkN15B9TH+Iy/aNgAwCTDhi
         wchsFX/gXCqTeWzdnCy/Svoa4mcH5hnR2IX8tTLtShC97KOgLtCrJeo5kJa5Z44eXFdX
         oMdLVGiFigz8Ug9MDHKyfAxGEuvrMFIONuXWFc5Zb6bI3+PH5mqy7uk1wKruKgOe9TA0
         st2b9E6WtVV+IDOXU/o/DIEV6uOnymRB2FRP0T9YG1EUz04F+rHFfwI4RtiDUHFW++n7
         9TaoLZmpXCNLNbkUGMDXBLPx52TADZFIX5ZuqO7fuO8ZkrSHqCPCNlXVpdLdzLeuKo6U
         7NRQ==
X-Gm-Message-State: AOAM532qK3RYoS9+lcb7Cfycqk6w+PVc7qCVU6JrLeIEwTP30gBNL8TL
        P2MaDAEmc3cYN/LvVTOouzA7zb3Znv6TOg==
X-Google-Smtp-Source: ABdhPJx30RFWSaYtVNJUt+5A75NwHNprkmCoLOF5w57/knQrQj+8lrwVjen8/eJvr1HHTF5XiBygHw==
X-Received: by 2002:ab0:6514:0:b0:342:f89f:a889 with SMTP id w20-20020ab06514000000b00342f89fa889mr7692391uam.25.1646056158774;
        Mon, 28 Feb 2022 05:49:18 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id g21-20020a056102245500b0031b6426f679sm1314753vss.26.2022.02.28.05.49.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 05:49:18 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id e26so13017128vso.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Feb 2022 05:49:18 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr7516436vsl.68.1646056157983; Mon, 28 Feb
 2022 05:49:17 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com> <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Feb 2022 14:49:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
Message-ID: <CAMuHMdWve8XkqtMJCTB_BH9JRZ8C4f7ynF60D1fvx3hxaK4YzA@mail.gmail.com>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Russell,

On Mon, Feb 28, 2022 at 11:57 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
> > This defines and exports a platform specific custom vm_get_page_prot() via
> > subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> > macros can be dropped which are no longer needed.
>
> What I would really like to know is why having to run _code_ to work out
> what the page protections need to be is better than looking it up in a
> table.
>
> Not only is this more expensive in terms of CPU cycles, it also brings
> additional code size with it.
>
> I'm struggling to see what the benefit is.

I was wondering about that as well. But at least for code size on
m68k, this didn't have much impact.  Looking at the generated code,
the increase due to using code for the (few different) cases is offset
by a 16-bit jump table (which is to be credited to the compiler).

In terms of CPU cycles, it's indeed worse than before.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
