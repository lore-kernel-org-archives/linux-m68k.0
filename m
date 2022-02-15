Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2892C4167B
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 22:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242254AbiBOWA7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 17:00:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243640AbiBOWAt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 17:00:49 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C876767A
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 14:00:37 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b9so205250lfv.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 14:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:cc:references:to:in-reply-to:content-transfer-encoding;
        bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
        b=eAbTUd8SWrkduWMDvYSL9PCIMvTyx1/PDNq+g34U5a6HTO/JfyDazuc/276Sm7ld7f
         RQAUjz9KnJpaex/eozKDcsnVqqRwA5Fj5CSlNJHiQfzBkJVLCc7y3vw02lxihPY3TExU
         lYcUYoYFkQWAG/XD2qnNsvTl5P4zqH6pcaasqRB1LojAt2IN4Q9BVX82FHrNStE8wYB4
         mmhCvKeDI7YjVSy4dXfgCBsx8WWHAoaLNoouUIXdBuim6buHAqSq3/5veKqw8hxrEwEf
         aYlaoKh86/GFDdT8ghhsvoX3tr735feUL8boUX68tZ9vbfpFMdKPrE/wFw8zC0NNEmPZ
         ssKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:cc:references:to:in-reply-to
         :content-transfer-encoding;
        bh=DVulEGE2JpmKCAwv+Z9nIfk2u5ZwvRtSEnvF0++tohE=;
        b=3xMNHTh6DdZFJAIKukvqsU6S7J9L6RoGGYF/YfxRTMhCWmJLZG/oaAlAmnK6+6bu5m
         eEK+T0gXOddtEVbhxMR4GI/jJoQic5gdUztF/KlyWbN1mNH0ul+urjv2evcRWUUfBcra
         ynfhlQhFZQDqeQAp4asCNiBr/POcx7R9QeLmWaNImt932E9jKpOBa/fk7cG3bYlNbNMA
         S1yf4pTINsHai8sdf/+TQciORsG0dnW6BAJTcOz1SYvYIFYLtNkkgsg7l2e3KQ8n0ppY
         wt3e0mUiYB3fUkmf9sicG6jDuSF2Jkb4xs8I7uPtYkk2bYQDR8P9AiFd8GNKyEPqf7g6
         QKeQ==
X-Gm-Message-State: AOAM530gy/nke7Gs/p9waXfuEdkRk38ZLCcQ5xKBV9Iikt/5DRQ+Tc99
        R2dc+/YLHbkr4yvWQHrISWc=
X-Google-Smtp-Source: ABdhPJyJtWqeT1e2wzvijosINOm/qc6wwzWUL/FDa9uqhHR32CJOoO1KF1UaVLhHtHEQQhQBEaQuLQ==
X-Received: by 2002:a05:6512:96d:: with SMTP id v13mr790998lft.343.1644962435902;
        Tue, 15 Feb 2022 14:00:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id k3sm66075lfo.10.2022.02.15.14.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 14:00:35 -0800 (PST)
Message-ID: <635e8121-fca4-580c-6af5-d9317a2eee1b@gmail.com>
Date:   Wed, 16 Feb 2022 01:00:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 00/21] Introduce power-off+restart call chain API
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
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
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
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
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220130233718.21544-1-digetx@gmail.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

31.01.2022 02:36, Dmitry Osipenko пишет:
> Problem
> -------
> 
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.
> 
> Solution
> --------
> 
> Introduce new API that provides both restart and power-off call chains.
> 
> Why combine restart with power-off? Because drivers often do both.
> More practical to have API that provides both under the same roof.
> 
> The new API is designed with simplicity and extensibility in mind.
> It's built upon the existing restart and reboot APIs. The simplicity
> is in new helper functions that are convenient for drivers. The
> extensibility is in the design that doesn't hardcode callback
> arguments, making easy to add new parameters and remove old.
> 
> This is a third attempt to introduce the new API. First was made by
> Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
> In fact the work didn't stop and recently arm_pm_restart() was removed
> from v5.14 kernel, which was a part of preparatory work started by
> Guenter Roeck. I took into account experience and ideas from the
> previous attempts, extended and polished them.


Rafael and all, do you see anything critical that needs to be improved
in this v6?

Will be great if you could take this patchset via the power tree if it
looks okay, or give an ack.
