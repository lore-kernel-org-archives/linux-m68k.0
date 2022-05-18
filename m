Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70141C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 18 May 2022 12:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbiERMf5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 18 May 2022 08:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237332AbiERMfY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 18 May 2022 08:35:24 -0400
X-Greylist: delayed 388 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 18 May 2022 05:31:20 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29512E08B
        for <linux-m68k@vger.kernel.org>; Wed, 18 May 2022 05:31:18 -0700 (PDT)
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqK2d-1nVyQT2pzn-00nUHC; Wed, 18 May 2022 14:26:10 +0200
Received: by mail-yb1-f176.google.com with SMTP id i11so3333506ybq.9;
        Wed, 18 May 2022 05:26:10 -0700 (PDT)
X-Gm-Message-State: AOAM532zG8E9QxeoYTjizOUDigvxGU9HqUSHGI1jRTih85ajn3BHMHGI
        rQaScaRoTZF6W4B1Tmy1TWo6QeP0dssL3tGArYY=
X-Google-Smtp-Source: ABdhPJzmVlopyCfoOGgm87Os5G3QW/G9c0usDcCbEYvhYj8aqb9XG0oZHtflqu+F8nKb6UZfd6bLOqHBJIobSYwhMHY=
X-Received: by 2002:a25:5e09:0:b0:64d:8543:627d with SMTP id
 s9-20020a255e09000000b0064d8543627dmr16981158ybb.394.1652876769340; Wed, 18
 May 2022 05:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220518065639.2432213-1-gerg@linux-m68k.org> <20220518065639.2432213-2-gerg@linux-m68k.org>
In-Reply-To: <20220518065639.2432213-2-gerg@linux-m68k.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 18 May 2022 13:26:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1gd6ggDgKu66bQ-qQ-K4g60uLo5VOuO5gOKsO99Bi0dw@mail.gmail.com>
Message-ID: <CAK8P3a1gd6ggDgKu66bQ-qQ-K4g60uLo5VOuO5gOKsO99Bi0dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68knommu: fix undefined reference to `mach_get_rtc_pll'
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YNRhJGh9ToQapzUXgx/DrsuWRXMLxTSWN594wMBabhiJEIaIoeS
 JbVnnNCMNLEfckiqGecFNadSlbPCCyil7i90xj/Ayg/wvjd9DnNZByNqkwqcF+78UZvfp+A
 hLt0dPABrkdEMHvsT8NuRiJSbCPhdJqFhjA9MbCFzDpc2muSQeDdkYL0K9ECfL0FwRh9zu5
 +NHv+1iNt7lKbOGCSTyeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ci0rRkbjs6o=:fYL0wJypo6x1MRG6sf3Ez/
 UCzT091XTNjV3zYHVRqDKjUA/y5QtiVGd5tCfCn3urcUTD3xEdWHPviZXlxpmwfK5ObZH8cni
 +brz+ar902JBA8g4DkSm+aT+F32Gf/55I+QRfvBn4yZ3xhNC/Efw6j9jxIjB3lQHHRp15dpQ0
 wGh0ONogux1UqOyK6cFETDWBe5+SjfZ9Humqml7nOqK4BEZhTVFZ+W87OFJkrWpRT6MYEhhFN
 W3nRdAgEDTVy9RTyqpoJq4csyz57PuQkPwSTgmJK8p/6EL8Ct4y1X1yeO0vtplMa2eTgLeg3M
 4NLIxl8TmLuqmT3YXqpW2GBvyz5Hy/bpb4/bnXjIC8IChSgbNOnBgXzuoVL3ZsvfnwfefIPW9
 GM0lkgXbAreiC41lqxDXKGOPaBvpH/5EyA0Z0tcfJmAh4eaMMWivCa/qoNwDoq0/pl/JAxCWS
 eDkIMzjXRe7HkxpAs99Z6NDNTO9XQx0ej0N0sMktMigm7DkHUck0nlP6T6t6lJbQ1VLwvPkxT
 TdR0wxNr3uWRr5gPU0rdEHF/dr7xqsWJWBl4dY5hC9p2lxf+NC958fKC6F/l6o1dp8owsmKN0
 NTIHT8GD9W7VgJgTJbds07N+R2/zNGdUSBluZzmg7K/HVUJp5YM1TobX6Yr4wobmQy0C13IgS
 B96S6BFnaqbigGl3XcrqvILtNsq5zs6qJGqezh6vYMRg1BNnJuFJ4w3WjRt6jASEpyTYGvyHp
 qWirYM/6mYttHRl7Ajh9Daqz+f2DYWq0zEk0tNBbGpN0CxXcN2T4EJLl7K/hw5O+UXum94piU
 FoyuFIqxJLRz0ICqanjMpj6521mR1BxJXo2DZ5AD9qFAN1AEs5HVib4ZKssIy7+AqZ8t7dmy/
 SCGf2i6lVK7YK0pF7h8S6zD7hfzRwNojbbtAbysCc=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 18, 2022 at 7:56 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Configuring for a nommu classic m68k target and enabling the generic rtc
> driver (CONFIG_RTC_DRV_GENERIC) will result in the following compile
> error:
>
>    m68k-linux-ld: arch/m68k/kernel/time.o: in function `rtc_ioctl':
>    time.c:(.text+0x82): undefined reference to `mach_get_rtc_pll'
>    m68k-linux-ld: time.c:(.text+0xbc): undefined reference to `mach_set_rtc_pll'
>    m68k-linux-ld: time.c:(.text+0xf4): undefined reference to `mach_set_rtc_pll'
>
> There is no definitions of "mach_set_rtc_pll" and "mach_get_rtc_pll" in the
> nommu code paths. Move these definitions and the associated "mach_hwclk",
> so that they are around their use case in time.c. This means they will
> always be defined on the builds that require them, and not on those that
> cannot use them - such as ColdFire (both with and without MMU enabled).
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Right, this seems to be the best solution

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
