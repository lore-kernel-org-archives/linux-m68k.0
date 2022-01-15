Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D93C433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 15 Jan 2022 19:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiAOTlq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 15 Jan 2022 14:41:46 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:40592 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiAOTlp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 15 Jan 2022 14:41:45 -0500
Received: by mail-ua1-f54.google.com with SMTP id w21so13613389uan.7
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Jan 2022 11:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7Z/KJMX0LABLzo0oa4ju7aJO8/H79numgHrSYFIz3E=;
        b=K8pV+e1HEMhDp0gfBHFWutHPBnWiLhiShBH+ho7KigGScjMNmPREqatXHNl77+CTYQ
         lNKcElD3xKeiRynpJbc8Yh+UYL8jJpVNOEQavH0wLMFlEQdd1HioxWt13Sfy49x0Sbim
         I2b7X6xCPzTK1CZ7jl/xP+a0ZRpn9aMNPUzyQWVpOhsZyGtAI/OX8zs9QGrS0fuj+Sep
         TP6mcCc5UEWLJunBo2sFiKrEzglgIaHPTs7vWQza2menl6irItvLGFa2UDIMXAjaHdkA
         RdgM1Z8y9bJNdl7xJ3uqPVgtSPpguPbIf/AfG71JhlO0qTJf/xloD0MI5/lAvaCKY17w
         OQPA==
X-Gm-Message-State: AOAM5335fa2LeTL0tcA5LSe+hDhRdXH7dgj9jFZI4OjLXgAlLSSBfTqH
        b6DykWmyFk/jb7NZqnrO7QxcHcbVm6nnUA==
X-Google-Smtp-Source: ABdhPJwixqsCi9QJgkX1SM6mr7xX6wZORmzLZHHkqDMncF87RK+g+zu6j6kaKqrh7z4wRsAi3WJLiQ==
X-Received: by 2002:a67:b003:: with SMTP id z3mr3274377vse.64.1642275703998;
        Sat, 15 Jan 2022 11:41:43 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id c14sm2814356vsl.21.2022.01.15.11.41.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 11:41:43 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id n9so6908959vkq.8
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Jan 2022 11:41:42 -0800 (PST)
X-Received: by 2002:a1f:5702:: with SMTP id l2mr5701617vkb.33.1642275702507;
 Sat, 15 Jan 2022 11:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20220115193245.3777833-1-laurent@vivier.eu> <20220115193245.3777833-5-laurent@vivier.eu>
In-Reply-To: <20220115193245.3777833-5-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 15 Jan 2022 20:41:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBrPM5Zw+wtM3gi6k5n-i_OoWs_eZff27458hqepZV7A@mail.gmail.com>
Message-ID: <CAMuHMdXBrPM5Zw+wtM3gi6k5n-i_OoWs_eZff27458hqepZV7A@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Sat, Jan 15, 2022 at 8:33 PM Laurent Vivier <laurent@vivier.eu> wrote:
> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>
> It is based on android goldfish devices.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks for your patch (the new versions keep on coming quickly).

> --- /dev/null
> +++ b/arch/m68k/virt/platform.c

> +static int __init virt_platform_init(void)
> +{
> +       const struct resource goldfish_tty_res[] = {
> +               DEFINE_RES_MEM(virt_bi_data.tty.mmio, 1),
> +               DEFINE_RES_IRQ(virt_bi_data.tty.irq),
> +       };
> +       /* this is the second gf-rtc, the first one is used by the scheduler */
> +       const struct resource goldfish_rtc_res[] = {
> +               DEFINE_RES_MEM(virt_bi_data.rtc.mmio + 0x1000, 0x1000),
> +               DEFINE_RES_IRQ(virt_bi_data.rtc.irq + 1),
> +       };
> +       extern unsigned long min_low_pfn;

checkpatch keeps on complaining.
#include <linux/memblock.h> instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
