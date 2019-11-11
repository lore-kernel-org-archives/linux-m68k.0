Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3919DC43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15D21214E0
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfKKKLS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:11:18 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:59275 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKKKLS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:11:18 -0500
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MRVy9-1iHmqX48UH-00NNIW for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:11:17 +0100
Received: by mail-qv1-f41.google.com with SMTP id cg2so4617224qvb.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:11:16 -0800 (PST)
X-Gm-Message-State: APjAAAVBn93tKTgGcmwXzdzFam2FArwb6wPvBs0O51XkB5tE2GCDlGrR
        XGWRhq3/1AgQHn4AQIVdEoDJWuWr30NUhEoU80g=
X-Google-Smtp-Source: APXvYqyPlYZ0IqFyt+F/Kw+2cGPdhPemO7nTBHjMV2hNTSSGSuWp0EuM7jgO4bHxqVV9VdMKLREBG37EpIWZ8cUBhPs=
X-Received: by 2002:a05:6214:2c2:: with SMTP id g2mr4941532qvu.210.1573467075908;
 Mon, 11 Nov 2019 02:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-18-hch@lst.de>
In-Reply-To: <20191029064834.23438-18-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:10:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
Message-ID: <CAK8P3a0zfmup8DYQQnT3GNCkgcv9cWxejj2QAr+FmYWs46ZuHQ@mail.gmail.com>
Subject: Re: [PATCH 17/21] lib: provide a simple generic ioremap implementation
To:     Christoph Hellwig <hch@lst.de>
Cc:     Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        "moderated list:NIOS2 ARCHITECTURE" 
        <nios2-dev@lists.rocketboards.org>, openrisc@lists.librecores.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:nRUqi+80WCqH8NDP2/N+pwtYlUG375Hcv+VeMW4C792bI0G+gvm
 DsrR5Dl+dG49NE06UYb7q8ihnQpLGQtoWjyHldysMD4UAHQ0ZYlCsjQq4EUgnEqEVA5YuXD
 6x8GNInFeF6rLcsM68tb+QrPGWkZWZJFFmWpJi3sf6rH45SWXR/ubM9VCfYfnp/MLsvQL78
 WxPyCyM3afDtOF4zRVnnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9ZqAitA49jI=:0mLE+uRaXVEV+cYdsAODHF
 3jp2oj15OjpzlvPBDj/jIAJhr5VzRGpUWC0D5bYMlsE90IblzA3kmwzPtRAG47g0knjVRvYvP
 lqR1xD35f6XUgNVqnaSzpIHKhA8Ghba3P6l95ZvMnDz33RCUkIxR3yZfwGJu/ViZtxFG8d2g0
 SdQwfwnt+4IsagJHBk8XW5/H/ef489bSHLjow2nFbknquTKf68ma99k4p1NnKrxVBqpqf6XNn
 npJ8yQk5TyBhOWGaE0b1dDtIhXNidBxq3WToWGFpdCUfDJAocrMXvmsXgZm3xLc2wX9mcrGF9
 syhdsFxRK9GvGC0bDYzhU0JlazIM4BPJ3pPY/OO5humqpaw9NyyIn09TyLUt7KrQmZRAmkvGy
 9wX2myv+sHiXrXrIxUiW3jWnFU+HHQZ/pCw8+5V7BWYs8PdcGxJZ+HhmXlwAlALR/uyRrOvaY
 4XwsnDrfbFCDT9PV+1H65rkoxBSVkZysadAqA8fKWpedgqZ8wLNHhYonD3Pov3jjMPssKrmas
 UYqARHci3EzwRxsTe2U10bv0oYts02nudAak3C6qseaw0QnE3jtHZE/pkHJdP+zmOygIG40xl
 XzhYXLrkjZw6tGOA+Hu9xA4BJR1W8RaLtgFMhuSYoohAJqAbXEbwEdK8O09pFvBx/2HyBHn+/
 PwsV4WEb2r9ZX4ZEETvWXPyn6qHDjAwjLwys4E4tJ8jFdGYVB2+Z3UA70SG7tnhv4eiFpFFF1
 HGTI6Ch8SwyKwp+e99/OZaagi+W2+JPI9rjKd5eSgw5/O7bhBMghpN4ZRhI/mhSXxBNuJGgMf
 OBK0fvHGemxukF6PPQyETknoVlYMGItSledCEdxGo3RtoQgSzXjHNGzGsaiYNnzBwXzZyvvE+
 ZMW8qA5afoLqa7+XwCkA==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> A lot of architectures reuse the same simple ioremap implementation, so
> start lifting the most simple variant to lib/ioremap.c.  It provides
> ioremap_prot and iounmap, plus a default ioremap that uses prot_noncached,
> although that can be overridden by asm/io.h.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
