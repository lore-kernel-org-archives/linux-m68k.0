Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC24C43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5CA920856
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfKKKgl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:36:41 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52971 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKKgl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:36:41 -0500
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N1wdd-1hjnpO3MuP-012JBt for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:36:40 +0100
Received: by mail-qv1-f54.google.com with SMTP id x14so4663368qvu.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:36:39 -0800 (PST)
X-Gm-Message-State: APjAAAV9EZ536I13EMplKppg44NHBn6LCLyj/aTmjxnQwB8D8U6Y7WqK
        G5SGwBIWGh7QlrlwsIvO0tMGpYa5Xbz+LeKgkiY=
X-Google-Smtp-Source: APXvYqwG9UjDI7BT4/zArLXJROi41Jfl0ozvIqGD8Z6sQp9Psd5jWuuWMeGtnWBnULPRq767xF7AmE4x/PyrFGraS9U=
X-Received: by 2002:a0c:a9cc:: with SMTP id c12mr4580319qvb.222.1573468598676;
 Mon, 11 Nov 2019 02:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-4-hch@lst.de>
In-Reply-To: <20191029064834.23438-4-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:36:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3k2KRyhCy4OWJkToNBiw_mw0e_A=Ta6UANMMF3EXnhmA@mail.gmail.com>
Message-ID: <CAK8P3a3k2KRyhCy4OWJkToNBiw_mw0e_A=Ta6UANMMF3EXnhmA@mail.gmail.com>
Subject: Re: [PATCH 03/21] ia64: rename ioremap_nocache to ioremap_uc
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
X-Provags-ID: V03:K1:w1jGn7lHZkqiLgxhFnkWq+Jjl7ZmkYaHXTcmg5Rdnib/W0MyHf7
 KEwCcsyqqxZMox2GxPeWWcJhvFY9cAOt12VFnRmuQpjjq6bfBme9w87tFHPrSMD+8Tn7yZE
 AakZtegx8I5kSgUzjiD/ufKNaVIW3mLGtyTi8VtztKLlX+EyaQ5xePBmPXe3NR8y2YJX5L+
 /4x2s9TbSziNZFKorZBdA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w5djahVRi2s=:352epw0sn0X7T4lZoZpU83
 s4d7FGS7hOpznr+o0erkbQ1M6U+Fh2xziN2boGmurZboOKw2Td4T6Zt7FDKTZBGC6tykpeF8Q
 n+npsGxTEs+4nWDyvm/C3g2OYU6xh05bIl7WjT4gTob9JZVSATEDAz0XeO1Dyj5r2zqPs3KAh
 BMSLPP5jkqPd/klsiehmAPXLFFf99aB0iBkUFQw8qeC0qy4E2j4fpTRwOS36pWRnvA6Gl6SZ2
 rlMyv/t6rRlf0QfQlhyJOQL9D9zx+rnzqu3OjjANDhEVYf6yDdTJ8A2K95+FAM9R020ir/+//
 brBMyHsa325J3rZyzhgnNPvUB8Nu9yZ/iDMjAexIqG3l5/dgr9tqL+EEHWW0Fwtr4qBtTchXr
 5j79/Lvpg6CuYnm1rQwuyprXW16qK67wtMTpKb4aV9XH+qGx5DLO+2QdrEqIRUTwfOfszF5IL
 WZbHewRpEASYkSGpa8buIKU4oxSQY7GZLU9XrN3R2b9a4QuzaFxqau+chTNvj2+70ZSYzZFs9
 0W+yb997HyB8iDB4LX0znGL0l9nMYz8OYTP9oGGoQ2qp1sLzUAeq+znsAOadlqhKJfNh4dpWe
 hM58FOQY5nOuznOj8IvyoslliEkBM8ueUbkNuARbJxZURep8P1QmMaebj3IkCqHibELuUN1G4
 N57oXmgHCWJyng0QnEmoISK1aGBD7Vfqdi/iyr4ZXrfvUpVHsaThmEZ/4b2gXaIX2ilgoo/GU
 N3emVHO8J/u5Vo3sXTZpSzeGFAIfL348afJKDF9crP2yOVz6jRamS5Xe+GX81qTos3HpUrB44
 XqPhYWoOfybizN67nrt178DALTIS29pe25Ad1LdxiNWC89PTtDklBYz4thxG9FL/CEgG89+uh
 vTDAUmSkzYnb9Lpk8gpw==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On ia64 ioremap_nocache fails if attributes don't match.  Not other
> architectures does this, and we plan to get rid of ioremap_nocache.
> So get rid of the special semantics and define ioremap_nocache in
> terms of ioremap as no portable driver could rely on the behavior
> anyway.
>
> However x86 implements ioremap_uc in a similar way as the ia64
> version of ioremap_nocache, in that it ignores the firmware tables.
> Switch ia64 to override ioremap_uc instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Good idea,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
