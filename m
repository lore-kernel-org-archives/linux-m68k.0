Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE73CC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 15:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F3460F38
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 15:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhGYOlr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 10:41:47 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42403 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhGYOlh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 10:41:37 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MysmQ-1lCynN2qfa-00vugB for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul
 2021 17:21:43 +0200
Received: by mail-wr1-f52.google.com with SMTP id b9so7059762wrx.12
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 08:21:43 -0700 (PDT)
X-Gm-Message-State: AOAM530kLiXbsSBzQf2qDRDBKZu0kfEDwSbkBt3tpO7xZGzdRX8FhfoV
        sDNwYndleKEm1AR4M0PlRAiyhSjWlK7aSSQBZys=
X-Google-Smtp-Source: ABdhPJy4pI0h4luhm+4JXMhENt6D2TnA8PlTq5W9CZjdcuAQGV0u44bA1tlmL1oLHEq6hqwVp90WdcdSjk0/o/sW8Ro=
X-Received: by 2002:adf:f446:: with SMTP id f6mr1909349wrp.361.1627226503350;
 Sun, 25 Jul 2021 08:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210725104413.318932-1-geert@linux-m68k.org>
In-Reply-To: <20210725104413.318932-1-geert@linux-m68k.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 25 Jul 2021 17:21:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0aa-F6HbakzFRPv1JewLVHmrv-=DNnTfukdY-g4g0Txg@mail.gmail.com>
Message-ID: <CAK8P3a0aa-F6HbakzFRPv1JewLVHmrv-=DNnTfukdY-g4g0Txg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix invalid RMW_INSNS on CPUs that lack CAS
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@uclinux.org>, kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:BOrANnEhCvpcqnpZ+BSJe5anui1jsGjs80iokyYvdr8O3QvuyN9
 NYZpIHkkWB4cMwUp4SLQXLVz06qt+UMLFKGzPdPGsDzCd64MiiM6WdHiHBruTHoW3MEnVe8
 PBKVmWA256PeUMch8qO2azEAX5Fo0VfKkbj+JhNOtJNj6VDBJwXAHUX0JVLoLqtLoxBOSJt
 U1llUCXk+bX9yLWo1ef4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3hnr3g/T+T8=:jXP8f/Ew6IWzXlz303Apm4
 HnMBWIt/NS3iYPUPqAt3mcNI5HP7Y3sRIsyK6Sg7xIoRzBdECzY4wK+2yMoxtmCW4Aj/rNJ+J
 x16Q0He/A5BlOsmBQU9DeTzNUm9XinlPnUOHJmpsWOrgaxMZcFSClvOeT0gVM9s6LzKBWpj3a
 e+cimttk6FhCwIMlxuEt4kuVw/BMmgM7ZA8OIpxAy6levDZ2cQxzgnYS/+0UsiynQc6WGE8Az
 /m+SohMz2v8GKY0mkgu1foEyT7XJU7c/YCWcWHODgt0LnhzTpgVgxoC3ZhZD26rEiAIIShD1c
 OJnqLumxuR8RDgSPR3sADmcUWUr2bdlQCPq5yKdMVbCwh88kR1U+SvgXVkg0zQuBNQ17u2SHn
 2Hw5l3PqbCutHlSK7KfP6uOkJjiKGQY1WCoxBHO/FdaYDFvDi8CGhhb1KT6PK0qswdnnEXkn5
 v1r48Xkbne2SAFomaDhodf4hL9xr5/4v5v583XyokIbkZvZJtr1xY9DsoDUqu5WXkMSR67DeJ
 orkM2TB/w/e6ZDEM/hbH1GJnh/gtzfMDVPL7tWX9Ow6YBOXjHaLMnV1K3CU1SJ73GTscp9tJJ
 hOQHFru7C3zipGcIhUevkwt8mPKlw0zQ6bxz8AhRz/cqaZJ4WMg+FDM2CvRi7Za0h911cpLNU
 s3ECoQJG+ZiGIVZbI7yIE4o8OEzITG2qHdjW/P5u4S+INiwwR4S2JPAAo1805EEXtgvh7PqpJ
 zkg2T+SX1ncDLSucCc6lVpgOHPJNM5W2vfs1Dcg83ePcn1NJBWd4rA6Fdc4jBcYzyPlBuqO78
 N1PQCxaExxu+IUn2e7jhIAStXFKRh8kIcZ7D0fLRfcQaq3FWfwurQNL318za5V1xUABBK6b
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 25, 2021 at 3:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> When enabling CONFIG_RMW_INSNS in e.g. a Coldfire build:
>
>     {standard input}:3068: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `casl %d4,%d0,(%a6)' ignored
>
> Fix this by (a) adding a new config symbol to track if support for any
> CPU that lacks the CAS instruction is enabled, and (b) making
> CONFIG_RMW_INSNS depend on the new symbol not being set.
>
> Fixes: 0e152d80507b75c0 ("m68k: reorganize Kconfig options to improve mmu/non-mmu selections")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> @@ -54,6 +56,7 @@ config M68000
>  config MCPU32
>         bool
>         select CPU_HAS_NO_BITFIELDS
> +       select CPU_HAS_NO_CAS
>         select CPU_HAS_NO_UNALIGNED
>         select CPU_NO_EFFICIENT_FFS
>         help

As far as I can see, there are no users for CONFIG_MCPU32
after M68360 was removed in linux-4.6, but as long as the
option is there, it makes sense to keep it correct.

     Arnd
