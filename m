Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA13FC433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Dec 2021 18:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241915AbhLJSTj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Dec 2021 13:19:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236861AbhLJSTg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Dec 2021 13:19:36 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB61C0617A1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Dec 2021 10:16:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b1so19447715lfs.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Dec 2021 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
        b=G0qTQ3KGFrwps8qADsCL0qK6agYLp7ivalOB/mF7ukTMqKqODRUNPClBA+tjj958iZ
         zDP5ALcBXKrVg0xx9H2ws3hyb3r6CIVdqsbS/GVCsvrWbnNO0HGlLBE864udH5VLQpzA
         E4ZCGQvWrQ3sm3YxkToWB7AGuZSE/qHZ86M8KsEpcZTMCU4IFoRlulk9U2f7fjt0DgcE
         dievaYp3/3GIUU6nMVScS6FhLqdlOsaTCJ8+eRNM/gp2aIGsGid35kag1Oq9XwyLJEZe
         Lsdj6NoONSIfbrp21Zrfz1ZI08pSDTMKtV8ZG3ySXOqe/j3lBC+KMsiD//GTJ5tyuvfx
         eTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bcvtGiLbR5hJWeiVCch89vaOnPBEjfgkGhnDVgGToIE=;
        b=sTFeEv9YPemBNVsuX9M+2GhX6xs52EQFDGxzzf4AVLwwKTalWH+ro0LA9bDdClK90h
         MuWYiF1h1xJPThjNF5ow09+IQIBaMPZ11785KsTO+J4p8zeYVLAD4SMMd3AbYm3tT30H
         +d+aau4VmiYGzoxHcwttkXaUZuEJkJ7/6ubxwdHRqQaSrlMAaPT9DlKf46GuNHf9733j
         JpSx43v4UEjEE7A9/xOAeLeYC18yJoLDsXPEjp6YbJnkK59YLRO5fWq6Sq9M7p83VN2X
         vymRxB8rxAbdUa9ormlPcuY0qagiCAqpgc8tAEmlLpArSahU6o2MMwQjfgMuv+XoWJ/j
         vJiA==
X-Gm-Message-State: AOAM533frlDB2CaOmJb8dk1lx+C/T/5PQMmPt9mcvexkbZqm/CIQMaKD
        h8S6NcSsQB58nytGyEHIRks=
X-Google-Smtp-Source: ABdhPJwR/4XeF0n78EyaU8daj5gqPU1YI5WhyixXiCZ/1XxnYO6fYoSxPShwkvEp5UZp5BYd303wDQ==
X-Received: by 2002:a05:6512:40b:: with SMTP id u11mr13847699lfk.377.1639160159550;
        Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id q15sm379095lfp.32.2021.12.10.10.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 10:15:59 -0800 (PST)
Subject: Re: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
To:     "Rafael J. Wysocki" <rafael@kernel.org>
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
        the arch/x86 maintainers <x86@kernel.org>,
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
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-8-digetx@gmail.com>
 <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acf8289e-6ab8-6eda-ec06-e9044ddd9a92@gmail.com>
Date:   Fri, 10 Dec 2021 21:15:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0i=zgubEtF5-Wnaqa5FMnfVUdSnEmD11-LAuYCH8ZCwrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

10.12.2021 21:09, Rafael J. Wysocki пишет:
> On Fri, Nov 26, 2021 at 7:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> There is no need to annotate function prototypes with 'extern', it makes
>> code less readable. Remove unnecessary annotations from <reboot.h>.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> I'm not sure that this is really useful.
> 
> Personally, I tend to respect the existing conventions like this.
> 
> Surely, this change is not required for the rest of the series to work.

Problem that such things start to spread all over the kernel with a
copy-paste approach if there is nobody to clean up the code.

This is not a common convention and sometimes it's getting corrected [1].

[1] https://git.kernel.org/linus/6d7434931
