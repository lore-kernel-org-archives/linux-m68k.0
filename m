Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBAFC433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 28 Nov 2021 21:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359001AbhK1VKN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 28 Nov 2021 16:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359020AbhK1VIK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 28 Nov 2021 16:08:10 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C96C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Nov 2021 13:04:54 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id i63so30602082lji.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Nov 2021 13:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
        b=Tdth5Mz95ILIP2wZ5DYmwGwqL/g2a8NQfIdIuxgXXVVg6RH3yDMvHbIjMPlUPQ+Kfi
         e7TNCwLl7gW+gWhWCzY5kWF31Q6d3MXbcfyHlK5mTJBCO9B0yoazspZoQ9QauZAg4VOZ
         GU1Du/NMRetIl1HCPpoZ/wmPwFcTZx09G+/z/T3SmJwaMw6FiTLYrkBEti6ebPBTNx4P
         ztESfCaJHpZ8ANbOeJv7E8GcPhKYp2JvSlX4AwC23x/kyRaPVi2WsI1lt1XYwZg48qKe
         Ljtqv2XVdBLjgOpaFjZQzH+Idsti2zOEBowM2JGqBDzv5KQCJSPSnTBTLx3XoGX8clP3
         1rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+c+fNjlqpkODMNA/7ywsu2Xpxn181Yex3QT1BC7YkM=;
        b=XSsZP9SdOksvkCNBwblrmx9+CUTamgd230SMj6ZS4BtHpoQR9MJYjCsuwR7cHtr5Z1
         4K6lXsjkRtL6Gg8Z9TypZHCkSt22lQjXUSFM2Fl5IxrdexfsFAZlrX0uKt93/H16NGI9
         YLE8k/FZp66e2R3AVZwZYFPyx+3ooqweXegD9nJHximUBL6PCw5dePQGMP2keEnLZfBI
         0WThhfkYlmV7xQpylRAitLSL5tpqCwcc/kB4W/nZomenl2Uu2nU3CkuieG3g4Ujxq6d5
         VPtlJ942yd7lOy3JX1Tx7tY2PfcvXez0yRJf28QndmIwzW3J8w4AkXF18TCOmUY+w/ve
         x48Q==
X-Gm-Message-State: AOAM533hX/YFxjlyvo7MVBgosVCVP8wbJHKoqwCPGY48mKgD+yjYYjMF
        jC+R2GXRpIVnohw4UeVs/NI=
X-Google-Smtp-Source: ABdhPJyuVlGCEG84pwfg6BbsVNdI4G/2tvLYelnsvUn7CQTQlf25Ym3pMWyWhlfLoQNWZ9AePptWxg==
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr45829799ljj.324.1638133492517;
        Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id d30sm1105908lfv.58.2021.11.28.13.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 13:04:52 -0800 (PST)
Subject: Re: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-23-digetx@gmail.com> <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <98c5c3d3-1635-3a06-b57f-8facd409796a@gmail.com>
Date:   Mon, 29 Nov 2021 00:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaLaH3Yt2M/Gko//@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

28.11.2021 04:23, Michał Mirosław пишет:
> On Fri, Nov 26, 2021 at 09:00:58PM +0300, Dmitry Osipenko wrote:
>> Replace legacy pm_power_off with kernel_can_power_off() helper that
>> is aware about chained power-off handlers.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/emif.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
>> index 762d0c0f0716..cab10d5274a0 100644
>> --- a/drivers/memory/emif.c
>> +++ b/drivers/memory/emif.c
>> @@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
>>  		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
>>  
>>  		/* If we have Power OFF ability, use it, else try restarting */
>> -		if (pm_power_off) {
>> +		if (kernel_can_power_off()) {
>>  			kernel_power_off();
>>  		} else {
>>  			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
> 
> BTW, this part of the code seems to be better moved to generic code that
> could replace POWER_OFF request with REBOOT like it is done for reboot()
> syscall.

Not sure that it can be done. Somebody will have to verify that it won't
break all those platform power-off handlers. Better to keep this code
as-is in the context of this patchset.
