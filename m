Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28157C433DB
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Dec 2020 18:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E97A822AAE
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Dec 2020 18:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgLVSzk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Dec 2020 13:55:40 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36967 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgLVSzk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Dec 2020 13:55:40 -0500
Received: by mail-oi1-f174.google.com with SMTP id l207so15792932oib.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Dec 2020 10:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=la43jOzGT8cpDZH0lHbZ8yczIDIlNNAQ1oOndJF72r4=;
        b=HRZdcRVf51nnyv8ucob4Wy8Ww0f3YwHY52fn8UoF4eC+KJxq+MGnrK82e9hSittQOn
         8XMZZZf3LmewaEJTTOpT6u/J1rz3wd/euWVj8sYNw3WzcnGQiqBEK+Z+S9nrYbS5joct
         6CRDVrCwOEcIuNGGRlzdyurWBnry6wPKuNN4jDJtiCZ6/8bZSx2bL0wxH63gM89eEssm
         7CUyriZix/zGUI8dD+l4QQzrefAK8o4sosqr5eP+F4d+QYxc8oxqZL7OwPYAezswZy8/
         J44AVb47ELxrov2O4f2HLvv8s72C0UphzJcrgunCRTquslnnVVyAO8O/tLydB/Z59f3l
         pzVg==
X-Gm-Message-State: AOAM5309bgbjDD4TvnNpjhQ06kvl4tDGUMmxB7lZ3vGYmuKh6EPy4eao
        ls4+DHX/6KOE8ndRZOQkaNZR+1sZ5pBmGbm5KAw=
X-Google-Smtp-Source: ABdhPJy5EVY7T6HE7RxxJ9AoKr5usE9gCbUG5HZ1gWiHgPXdK9RZjFwARYSd7qSwoUdfSw0ANGyqV1mRCh80XLruDv8=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr14009921oia.54.1608663299046;
 Tue, 22 Dec 2020 10:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
In-Reply-To: <20201222184510.19415-1-info@metux.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 19:54:48 +0100
Message-ID: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Christian Brauner <christian@brauner.io>,
        alpha <linux-alpha@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org, linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Enrico,

On Tue, Dec 22, 2020 at 7:46 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
> Move the pm_power_off callback into one global place and also add an
> function for conditionally calling it (when not NULL), in order to remove
> code duplication in all individual archs.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Thanks for your patch!

> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -43,12 +43,6 @@
>  #include "proto.h"
>  #include "pci_impl.h"
>
> -/*
> - * Power off function, if any
> - */
> -void (*pm_power_off)(void) = machine_power_off;

Assignments like these are lost in the conversion.

> -EXPORT_SYMBOL(pm_power_off);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
