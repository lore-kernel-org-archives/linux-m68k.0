Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA6C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 24 May 2022 13:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237129AbiEXNPV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 May 2022 09:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236045AbiEXNPT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 May 2022 09:15:19 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB1193445
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 06:15:17 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id r3-20020a9d5cc3000000b0060ae1789875so9883866oti.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/pNo5ypsj8sjqbjG1l1gWrym6AVA3NFtAtotZSuvpI=;
        b=nfmgJzNiu7FkwQJbPxaIsOcucyMDrmzxT0DwsYd1p3JsvYmDUExeCXGt5pFM93QuwX
         ypYiutD9vuuJW5wv6rh7/uxChN1BVfQxElrbG+fxxlePfTn1IYVDs/0ZsGrjdZMnQEcf
         5P1pVK3V13WoQW2dsjiLtw7KaETzzwUYg4qCw3ng0lpXDTJFJNQNoyHICIL+z+QcHa1Y
         NEH99baGdyoWBXWZg54rbDOMWoYCRP81I87sWOztTYtclLv9F/0ECFv5QZWt45jHPUda
         +ZDTxuirLpcNHM64JdSqzxtRhpcRRJaxGh5gyxNEQLd0VQpmI2W6fjc8rP9sgvbb/wBq
         N8Ng==
X-Gm-Message-State: AOAM530348OiLeuZ5alqzIoLEKnBnZ0xZY4X6Tmx5S8vf22n/YCC92lZ
        hR/ux8Yt81CEyZ1Fv4kFIurln6JIbuj5tzdZSyM=
X-Google-Smtp-Source: ABdhPJy9Wh0HkgHB2FVAXsNscum3rMdtZTVkISURH08N1cst8WENEwDissZlNIpHytDS398OSB+J/A==
X-Received: by 2002:a9d:7618:0:b0:605:a132:7d57 with SMTP id k24-20020a9d7618000000b00605a1327d57mr10468025otl.262.1653398115795;
        Tue, 24 May 2022 06:15:15 -0700 (PDT)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id l17-20020a9d7351000000b0060b02eda329sm3498524otk.14.2022.05.24.06.15.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 06:15:15 -0700 (PDT)
Received: by mail-oo1-f54.google.com with SMTP id i6-20020a4ab246000000b00362214ddc1cso3250737ooo.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 May 2022 06:15:14 -0700 (PDT)
X-Received: by 2002:a25:e7ce:0:b0:64d:6028:96b9 with SMTP id
 e197-20020a25e7ce000000b0064d602896b9mr25151338ybh.365.1653398104009; Tue, 24
 May 2022 06:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <20220509233235.995021-8-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-8-dmitry.osipenko@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 May 2022 15:14:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
Message-ID: <CAMuHMdVGjeFe=Z_1Kr9ZaNZ7HUVH1usvubEB31WUQf0fg8E1kA@mail.gmail.com>
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dmitry,

On Tue, May 10, 2022 at 1:33 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Add kernel_can_power_off() helper that replaces open-coded checks of
> the global pm_power_off variable. This is a necessary step towards
> supporting chained power-off handlers.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Thanks for your patch, which is now commit 0e2110d2e910e44c
("kernel/reboot: Add kernel_can_power_off()") in pm/linux-next.

This causes the "poweroff" command (Debian nfsroot) to no longer
cleanly halt the system on arm32 systems, but fail with a panic
instead:

-reboot: System halted
+reboot: Power down
+Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
+CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted
5.18.0-rc7-shmobile-00007-g0e2110d2e910 #1274
+Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
+ unwind_backtrace from show_stack+0x10/0x14
+ show_stack from dump_stack_lvl+0x40/0x4c
+ dump_stack_lvl from panic+0xf4/0x330
+ panic from do_exit+0x1c8/0x8e4
+ do_exit from __do_sys_reboot+0x174/0x1fc
+ __do_sys_reboot from ret_fast_syscall+0x0/0x54
+Exception stack(0xf0815fa8 to 0xf0815ff0)
+5fa0:                   004e6954 00000000 fee1dead 28121969 4321fedc f0d94600
+5fc0: 004e6954 00000000 00000000 00000058 befa0c78 00000000 befa0c10 004e56f8
+5fe0: 00000058 befa0b6c b6ec8d45 b6e4a746
+---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000000 ]---

On arm64, "poweroff" causes a clean "reboot: Power down" before/after.

On both arm32 and arm64, the same handlers are registered:
  - SYS_OFF_MODE_POWER_OFF_PREPARE: legacy_pm_power_off_prepare
  - SYS_OFF_MODE_POWER_OFF: legacy_pm_power_off

On both arm32 and arm64, legacy_pm_power_off_prepare() is called.
On both arm32 and arm64, legacy_pm_power_off() does not seem to
be called.

On arm32, both pm_power_off_prepare and pm_power_off are NULL.
On arm64, pm_power_off_prepare is NULL, and
pm_power_off is psci_sys_poweroff.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
