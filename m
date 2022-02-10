Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817FCC433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Feb 2022 13:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242086AbiBJNTL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Feb 2022 08:19:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242063AbiBJNTK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Feb 2022 08:19:10 -0500
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D571F7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:19:11 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id n14so3026631vkk.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGlHeCPU57R/KCZiFIedYFp+cWh87MZTkzZO4VrO6nI=;
        b=H+oBXyytiln7aSD5xRlSTy7J4PbkRHvSSR+KLBH2fC2G2QCnaLnHAciQLspjV1tU6r
         GiO5dstNoHnES4KlASR6uwhOn0mtaaFOKEcPq3V8UpsEMaqValJl2+e5xDMH2DoEXoLO
         +pK486ikdPEweuenwZYy4XgPNia7d5e9ekZcCXnRwT6ZIgMBAzFmwOMX3591rd1XnhgA
         oentEA76eJQW/eHHvxwNMcrre3HmY/KGuD1/5avX+1lELpchYeyX2g4Djw94J8Kmawxj
         a1vY2ZleHV33gvLu0BuYkV8CoEyqcm9U3BNe20j9GqOXtfqMbt9I2IJqwcCKef1ZcDXh
         3YJg==
X-Gm-Message-State: AOAM531//A12NawSrxXinxehGBodREIYl2+1xVVVds7EZbs5Kj7x0S08
        dEoMw8d6qhkVmT+dqJb3iURW9+vMi8ll4w==
X-Google-Smtp-Source: ABdhPJx02lor1tmGdRh81u4rKzhfI2nToAZ5N9V+yaCqxHzWgjUNWxRmD80EYhcLGM21Jgydc2KhiA==
X-Received: by 2002:a1f:258f:: with SMTP id l137mr2595780vkl.6.1644499150374;
        Thu, 10 Feb 2022 05:19:10 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 187sm3655254vsi.12.2022.02.10.05.19.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 05:19:09 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id j5so3056173vsm.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:19:09 -0800 (PST)
X-Received: by 2002:a67:ec0c:: with SMTP id d12mr2031817vso.77.1644499149332;
 Thu, 10 Feb 2022 05:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20220130143333.552646-1-laurent@vivier.eu> <20220130143333.552646-6-laurent@vivier.eu>
In-Reply-To: <20220130143333.552646-6-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 14:18:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=HCyMn4N6OWLd3a5+GBP865rcdF5Yttmc_0+WzWxMfw@mail.gmail.com>
Message-ID: <CAMuHMdW=HCyMn4N6OWLd3a5+GBP865rcdF5Yttmc_0+WzWxMfw@mail.gmail.com>
Subject: Re: [PATCH v14 5/5] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 30, 2022 at 3:33 PM Laurent Vivier <laurent@vivier.eu> wrote:
> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>
> It is based on android goldfish devices.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

How to proceed?
This has a hard dependency on the goldfish patches 2-4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
