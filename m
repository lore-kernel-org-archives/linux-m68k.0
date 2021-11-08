Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D73C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 07:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25832610F8
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 07:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbhKHHuS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 02:50:18 -0500
Received: from mail-pj1-f47.google.com ([209.85.216.47]:34510 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236496AbhKHHuQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 Nov 2021 02:50:16 -0500
Received: by mail-pj1-f47.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so6056563pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 23:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niQCVpji9nu8a8Mfie3ofua8MkF1HzpLuS22ys5pvwg=;
        b=fOZWSRthk1ItGCBR7vNDTTci5r/dc8f3SAgIPaPlwv65RWuDSBzZPlF8a2IoLtCZYP
         S5OsoPPOvBFjc81a15VGVPmjAoh79VP2YfqdOLAfBqgCPv3N0nB267zBW6ChKxD8OCDz
         YH8B7PboNqCbe52Jo3L2+SDYWIUUP6/UTW0OnHix+fYJ1B1hbI2J34wxeAbqfI8WlcLT
         48aHnvFxrw9zNa6NLRLjf+ajFiHw3Z2IPMOEncic5BBeqROf/6f1HaPixY3WlZsMxm+4
         atQZcsBTQ/j0xQycpZ8HcLWaX4wKkTlVReBI8Ia1SbZxsXBjtgifSGOh2oOMbTznG/J2
         7g6Q==
X-Gm-Message-State: AOAM531fNS226+2qGzUTwZ3fYa+egcZJbfGHRsIloVwkqLHjzV1iaSO+
        lLv7tpCrNlLA02Fk91F/CJ+HfofhVctBMg==
X-Google-Smtp-Source: ABdhPJwpDTO4iOX528/+3yxhijUT4iXhF9cEAXYSgVQx0tG1WoPmJ5r5Vaj/QRe0qzHjdvg7mRsiJg==
X-Received: by 2002:a17:902:da8e:b0:142:1142:b794 with SMTP id j14-20020a170902da8e00b001421142b794mr39122371plx.82.1636357652073;
        Sun, 07 Nov 2021 23:47:32 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id i10sm5252244pjd.3.2021.11.07.23.47.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 23:47:31 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso8145397pjb.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Nov 2021 23:47:31 -0800 (PST)
X-Received: by 2002:a05:6102:3a07:: with SMTP id b7mr71214037vsu.35.1636357641114;
 Sun, 07 Nov 2021 23:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20211108004524.29465-1-digetx@gmail.com> <20211108004524.29465-22-digetx@gmail.com>
In-Reply-To: <20211108004524.29465-22-digetx@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 08:47:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Message-ID: <CAMuHMdXpW0389_uJR2xg+HCstXanutPxrcRdvgu8kxH1J9T++w@mail.gmail.com>
Subject: Re: [PATCH v3 21/25] m68k: Switch to new sys-off handler API
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Nov 8, 2021 at 1:48 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> Kernel now supports chained power-off handlers. Use
> register_power_off_handler() that registers power-off handlers and
> do_kernel_power_off() that invokes chained power-off handlers. Legacy
> pm_power_off() will be removed once all drivers will be converted to
> the new power-off API.
>
> Normally arch code should adopt only the do_kernel_power_off() at first,
> but m68k is a special case because it uses pm_power_off() "inside out",
> i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
> while it's machine_power_off() that should invoke the pm_power_off(), and
> thus, we can't convert platforms to the new API separately. There are only
> two platforms changed here, so it's not a big deal.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
