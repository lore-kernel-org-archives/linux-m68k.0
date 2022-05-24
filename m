Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95898C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 15:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbiEXPDq convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 11:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236693AbiEXPDp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 11:03:45 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A178AE4C
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 08:03:44 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id dn11so3907686qvb.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvY3YRGz6Q5JdIA0GD3/2z1w0vgXjW2K3nWPGIL58cE=;
        b=bw1vrma7KnJsC79wivEARLC2xdcx2pFcKOj4L5ElHrgLwOq5Rg1EoLCj5K9tXZhdix
         W8NtaCFMl4bZHTVQ5n0GyDKCyicdBymgsjhTTWYe2z0XYWyQkZlmINGJ/9D349AjOy3I
         uxo4WYs4xnaUfX/mjFjx2vxeAyRecHu44F2d/UX1dAcLXb+mlZuvNJiZw1G54x2Fdo6m
         /60ZCvgnL5DwwdJAqza0VvIo76VVf4c0UJIy9mYWR6DZivdS2j3cEDf91cNiOi5s5meu
         ioo8/oj2IS9gKW7oTzwk5rEECh+eUhxIUQIl8U8BZBgSVDmpDZJII0l0seWst25DOQGP
         VIdw==
X-Gm-Message-State: AOAM532of0i54HgI8wml803OqAtRs4jcwrNZ/54DgMZ88FgewkMQ5suh
        coI+WhcCayAHV8pZ5U5k4s+ZfVDbP5rdYkv+
X-Google-Smtp-Source: ABdhPJz5HH/gixCnCm7qqPrrl2yz301X6wyQMbat1VHYbfi/UhN1Fx8bfCq4gRZsZ0D2qB4vw8yJvQ==
X-Received: by 2002:a05:6214:e67:b0:461:f65c:b0fc with SMTP id jz7-20020a0562140e6700b00461f65cb0fcmr21065454qvb.119.1653404622973;
        Tue, 24 May 2022 08:03:42 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a0a1300b0069fc13ce1dfsm6266294qka.16.2022.05.24.08.03.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 08:03:41 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id x2so31035340ybi.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 08:03:41 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr28501106ywh.384.1653404610585; Tue, 24
 May 2022 08:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
 <20220509233235.995021-8-dmitry.osipenko@collabora.com> <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
 <c4914e14-1882-55a1-bcbd-a905852b45a3@collabora.com>
In-Reply-To: <c4914e14-1882-55a1-bcbd-a905852b45a3@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 May 2022 17:03:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
Message-ID: <CAMuHMdWBWWVeegvLQQzT8CRL5z38AhXigaNjzw8p0NwQ1B4DPQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/27] kernel/reboot: Add kernel_can_power_off()
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
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
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dmitry,

On Tue, May 24, 2022 at 3:41 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> On 5/24/22 16:14, Geert Uytterhoeven wrote:
> > On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >> Add kernel_can_power_off() helper that replaces open-coded checks of
> >> the global pm_power_off variable. This is a necessary step towards
> >> supporting chained power-off handlers.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >
> > Thanks for your patch, which is now commit 0e2110d2e910e44c
> > ("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.
> >
> > This causes the "poweroff" command (Debian nfsroot) to no longer
> > cleanly halt the system on arm32 systems, but fail with a panic
> > instead:
> >
> > -reboot: System halted
> > +reboot: Power down
> > +Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> > +CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
> > 5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
> > +Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> > + unwind_backtrace from show_stack+0x10/0x14
> > + show_stack from dump_stack_lvl+0x40/0x4c
> > + dump_stack_lvl from panic+0xf4/0x330
> > + panic from do_exit+0x1c8/0x8e4
> > + do_exit from __do_sys_reboot+0x174/0x1fc
> > + __do_sys_reboot from ret_fast_syscall+0x0/0x54
> > +Exception stack(0xf0815fa8 to 0xf0815ff0)
> > +5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f0d94600
> > +5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 004e56f8
> > +5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
> > +---[ end Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x00000000 ]---
> >
> > On arm64, "poweroff" causes a clean "reboot: Power down" before/after.
> >
> > On both arm32 and arm64, the same handlers are registered:
> >   - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
> >   - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off
> >
> > On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
> > On both arm32 and arm64, legacy_pm_power_off() does not seem to
> > be called.
> >
> > On arm32, both pm_power_off_prepare and pm_power_off are NULL.
> > On arm64, pm_power_off_prepare is NULL, and
> > pm_power_off is psci_sys_poweroff.
> >
> > Do you have a clue?
> > Thanks!
>
> Thank you, Geert! I see the problem, the kernel_can_power_off() checks whether power-off handler is registered, but it's always registered because legacy_pm_power_off is registered unconditionally. So it causes trouble for platforms that don't have power-off handler installed at all. All platforms that I tested have a power-off handler, so now wonder that I didn't notice this before.
>
> This change should fix the problem, please give it a try:

Thank you, that fixes the problem for me!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
