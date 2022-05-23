Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2932C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 23 May 2022 18:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243262AbiEWS1k (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 May 2022 14:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245492AbiEWS1I (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 May 2022 14:27:08 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67983BA990
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 May 2022 11:02:38 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id v66so18735823oib.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 May 2022 11:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4rBBcobCQCpRnDX0N4E6NWTW64w3K1pdJQpMj8qNhc=;
        b=EjzG3vFjiXCfkXnvqBqWcI/hizi/0/wlFgX2Q+i+Z1lBoIt87foxqsRT03A1e/JAP1
         VRDLvKN8tHwejeXWOhecTB52rfapV5g9eLKLM8Bzls01w6KgvNRexdq2lGawX5P6WDD7
         rPW328LT2zs4ooIdc2lX9xwAh+irXX5oX8RIPCFyOWSfues+afFHZqrReskBorECsTpV
         q0jh6riHVViXTl7dhZ5pugOwe3vw8HsV2UXq7PGKttqsv89x7AabIfbfHmlGY305vzMB
         60mdsecsg0MBKOELh4UmKcawOAuj0X2WSHqh5xa3LRGZOp5CyuWigpduNodbmzXoJnTJ
         dAFw==
X-Gm-Message-State: AOAM532jZ/4k9MshHqLJuDQfuDsEaw17DuthlerQzyh5qKDh7lSsounx
        J/Ovh6VuVA5jH1SYnqpISZn1MHMbAUNk9q55vgs=
X-Google-Smtp-Source: ABdhPJwcSQ2TLsPfOrq8jXVoOOz7MENTLH2mT3+wcVxVdvy0dqZbd1o+cvmZObnkJHhGWHuJdCoMHw==
X-Received: by 2002:a05:6808:1310:b0:32b:c31:5ab1 with SMTP id y16-20020a056808131000b0032b0c315ab1mr120861oiv.195.1653328872539;
        Mon, 23 May 2022 11:01:12 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 7-20020a9d0e87000000b00606a6c09a0csm4217352otj.12.2022.05.23.11.01.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 11:01:12 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id r3-20020a9d5cc3000000b0060ae1789875so8390934oti.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 May 2022 11:01:12 -0700 (PDT)
X-Received: by 2002:a81:ad11:0:b0:2fe:fb00:a759 with SMTP id
 l17-20020a81ad11000000b002fefb00a759mr24887559ywh.283.1653328860919; Mon, 23
 May 2022 11:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jhWs-8ChHddebTZcaH6kA05sLEMsXM9Op7kHWAQDxeYA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 May 2022 20:00:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Message-ID: <CAMuHMdVbWpgubaA0V_tau3O=czAb3RQV9AwJsoQ+LWjf-wjMkA@mail.gmail.com>
Subject: Re: [PATCH v8 00/27] Introduce power-off+restart call chain API
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        xen-devel@lists.xenproject.org,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Rafael,

On Wed, May 18, 2022 at 4:46 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:

> >   m68k: Switch to new sys-off handler API

Sorry, I didn't realize this was going to interact with the new m68k
virtual machine support, which is included in the m68k pull request
for v5.19.

> However, I'm going to send a pull request with it in the second half
> of the merge window, after the majority of the other changes in the
> subsystems touched by it have been integrated.

And presumably you will have to merge in v5.19-rc1, too?

I've sent a fix.  It should appear at
https://lore.kernel.org/r/20220523175520.949681-1-geert@linux-m68k.org
soon.

Can you please include that in your PR?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
