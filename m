Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C032BC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Dec 2021 18:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244835AbhLJSY6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Dec 2021 13:24:58 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34716 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241988AbhLJSY5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Dec 2021 13:24:57 -0500
Received: by mail-ot1-f51.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso10482251otj.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Dec 2021 10:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGnO4bxnTAqMK/uthYlBDN3+OwLPbg309qxpgobdKxI=;
        b=OhDNTiH5kMMDWN5oT9VBc5o94QD+/tb97vR2LzfLhzb2paKG1CW4dppI2cmaR6Xc7J
         GMJMZbn4bKemkdPvu0mViiIfK1tKS4RCXDQqhFNdZgKo8qKiqZBLqaCM3zV9luBRsNY4
         bmdvKnHG5gt5bCQflKWgKOxOgzbtf5cay4lhgR9T4aLWzhsu6VHsIRW/9m+x3arkPAq1
         z/W7TrQf0kEGc3ALvL92kyLduBGreSUKra/AvSnjRZ5kFVHIXPRoXIkVDWANOXGvW26+
         yq6c2v3VXNfKZn41UygVzbVZ7pKTK77IzGfu+GPDU8VWr640RiHKTIHDYocSmgl4nQ5i
         LdAA==
X-Gm-Message-State: AOAM531spWYdIZ8eIjP2bIT9mnf+CaCowBdiGhecmNKLW+pPucraPjLF
        x8HN5M+0OyC/2a8Dt25itMgM32D9Y33GLQH7/Q0=
X-Google-Smtp-Source: ABdhPJxyUbegeOKjvJ3CxiHL7dwpj9EzFVDPRUNdKiJGM3d307QrxgUO9bUGZj0EMwemLB2snxZHAeDirffJcqK0rDM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id e23mr12377743otj.16.1639160481982;
 Fri, 10 Dec 2021 10:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-5-digetx@gmail.com>
In-Reply-To: <20211126180101.27818-5-digetx@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 10 Dec 2021 19:21:11 +0100
Message-ID: <CAJZ5v0h_OfrQ92KqsUdiKAfUrXDT9dPXzq4S=b6zi4k_2cPAjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/25] reboot: Correct typo in a comment
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
        "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv@lists.infradead.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        xen-devel@lists.xenproject.org,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Correct s/implemenations/implementations/ in <reboot.h>.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

This patch clearly need not be part of this series.

> ---
>  include/linux/reboot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index af907a3d68d1..7c288013a3ca 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -63,7 +63,7 @@ struct pt_regs;
>  extern void machine_crash_shutdown(struct pt_regs *);
>
>  /*
> - * Architecture independent implemenations of sys_reboot commands.
> + * Architecture independent implementations of sys_reboot commands.
>   */
>
>  extern void kernel_restart_prepare(char *cmd);
> --
> 2.33.1
>
