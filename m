Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B36C43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A7F1214DB
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfKKKbY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:31:24 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34135 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKKbY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:31:24 -0500
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M60HD-1iWZ0q0jUZ-007VbD for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:31:23 +0100
Received: by mail-qv1-f41.google.com with SMTP id s18so4642027qvr.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:31:23 -0800 (PST)
X-Gm-Message-State: APjAAAVUQJm3ovrBnTojj/ZHT84ps6VS1fb23F39f4TCYD873iAKFU0C
        jvU29FI1zEpSvlkoaW/6i722g4mPNlCL1c8We0k=
X-Google-Smtp-Source: APXvYqxD4F/fwy7LIVnyFzyiMun+f+kScDaMuxMbPMHFdHwTAmNy4Oax48ObAzH1ZmZyCVG2W0sxl5/9Apu79krhc7g=
X-Received: by 2002:a0c:a9cc:: with SMTP id c12mr4561842qvb.222.1573468282069;
 Mon, 11 Nov 2019 02:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-12-hch@lst.de> <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
 <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
In-Reply-To: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:31:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2a7jwmAKhh3WsowCmvdQpsde5A5nz+3NXRn7amhwUxQg@mail.gmail.com>
Message-ID: <CAK8P3a2a7jwmAKhh3WsowCmvdQpsde5A5nz+3NXRn7amhwUxQg@mail.gmail.com>
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Christoph Hellwig <hch@lst.de>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Vincent Chen <deanbo422@gmail.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Greentime Hu <green.hu@gmail.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
        "moderated list:NIOS2 ARCHITECTURE" 
        <nios2-dev@lists.rocketboards.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jSdk4hTuscuRiAx7PVeelwNOkG7jdDmRlEYaxT9QRg8FULcwDWQ
 SAvHM1T63ZCNivXH5OfinxHwlWJbJWaY0gQMOghISjeNYhNanZyFoBRsHG2Fv8dBLbZlkbe
 jwRK2Qp4EOj5v4Z8uktaWvP/L8MQAV9NHGpY2XS2VbIent9nSCeTZgPRUfn9+Ga6V1XLnO5
 nYfDN2RCilL/kHf5iRLZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jnYu9nJB8R0=:d8F8w2zEVqcJGSdjQf6vTC
 dYnMVbeGz8p9PmF5RTysJmyzW8l+t65kiiCPMgnlagewm7ITHb1hkZTcSfMfdhWyEI75CwEot
 CtezzV25XTKLW0JFF0WHg6Vz9eGnIKXgCdL3ap3xqeb9LhbTsPkoi5QKIpOjBfXyKqiaf0t4c
 LC26LkToR/OGQWGTdMgREbZvVdEiy64fPMloGPe5OsX3m2rhDBZm1HlgZvPjdCojhGNHRoPmF
 ouW7xBo0XY93O6QwATaT9dzNHMEKqu9N4/69tpnwMtzH1WW+ZV4e0ltOMK/nSxthHVSz/k8sp
 zeijra/uwP8qLFf4pdneyin2pJXfb7+0IfH2DGAK/xgQx7CXF6go7dlvf2S37OHaDNy9FQNTt
 JXxuh4XajDZvkOAKkIZ/mEcGifz8ad2yYsdyVqKccqNGv8LtU+LfPHX/yfftR1tCSqRyaB1Ex
 fQLnGJGiaal+nZvyNhW1MSDpt9NiUm5Z4+kyvyZ/6nxpuBPUX0mFqs0rCzhPgNM2YMScKS7ek
 iXJhosTtl28d9pezBaYG0B6wrPVk89MifjAHz9QQQllcCtFBpncw+Gc2jSF6BDoe+FzPdyPbw
 w9/0VlnWZf7dPVZZX3MqTcakWB4JtCnUp+jYpLthETKvv3Y8yZAuBBGrDQjBfoQmbSY2VHqr+
 EY/Zgn3M9GMkDEPSj2XUXoVp/qMViY20XsuQAVK59RPnnKk71bGx7LvZPGXZBmogNsYaWrrzb
 sJGLkJiZkFGSgsdzdskFfdqvDnHlPOxeloX0c9oNYqybh+UmI7wzBDP+nq2w5m8DzrUtvwiar
 5uqIvuOa8HklcI4VkZp8c+GBTdwfyn9Ypsx6XQ2mfAQ4HvlVNGypsnCJ3c+4OAnHT5ik1/w2h
 +xgQNIUW8QuRxA9jxHhg==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Nov 6, 2019 at 7:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Palmer,
>
> On Wed, Nov 6, 2019 at 7:11 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > It looks like the difference in prototype between the architectures is between
> >
> >     void __iomem *ioremap(resource_size_t, size_t)
> >     void __iomem *ioremap(phys_addr_t, size_t)
> >     void __iomem *ioremap(phys_addr_t, unsigned long)
> >     void __iomem *ioremap(unsigned long, unsigned long)
> >
> > shouldn't they all just be that first one?  In other words, wouldn't it be
> > better to always provide the generic ioremap prototype and unify the ports
> > instead?
>
> Agreed. But I'd go for the second one.

Right, phys_addr_t is the correct type here, resource_size_t is just a generic
type that is at least as long as any resource, and usually the same as
phys_addr_t, which is supposed to be used for physical addresses.

      Arnd
