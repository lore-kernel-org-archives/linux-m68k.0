Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176D8C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 31 May 2022 06:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244205AbiEaGUi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 May 2022 02:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237363AbiEaGUh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 May 2022 02:20:37 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175C78CCD1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 May 2022 23:20:35 -0700 (PDT)
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVMNF-1oLWzt0I4d-00SQEs for <linux-m68k@lists.linux-m68k.org>; Tue, 31
 May 2022 08:20:34 +0200
Received: by mail-yb1-f175.google.com with SMTP id e184so12754373ybf.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 May 2022 23:20:33 -0700 (PDT)
X-Gm-Message-State: AOAM532v9CJUTs7T9KQ2rkPp44Vpu2TmnqEc6FYltYLnnZD/ndmycCs7
        vZ9AqLKvCujfm1//tnLPo1+2Hbu8hEDzY8maZU8=
X-Google-Smtp-Source: ABdhPJyjJwXBPGiLFwJcPL8LpszFynK7r8RQeXSulMT/bC7rn948af4y1kE1ObqEbOMAyT3J0meiIKAhEtryxXOB8TY=
X-Received: by 2002:a25:db8a:0:b0:65c:b04a:f612 with SMTP id
 g132-20020a25db8a000000b0065cb04af612mr13375290ybf.106.1653978032886; Mon, 30
 May 2022 23:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220406201523.243733-1-laurent@vivier.eu> <20220406201523.243733-5-laurent@vivier.eu>
 <3b783435-e734-5391-e758-d709e0462839@infradead.org> <64ce78bf-b81b-1eec-74f3-650a72f2874b@vivier.eu>
In-Reply-To: <64ce78bf-b81b-1eec-74f3-650a72f2874b@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 31 May 2022 08:20:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3mF9CuWC2Tw3VvDVGFgpjAwtMHSjoNa49bny7gMEw8sQ@mail.gmail.com>
Message-ID: <CAK8P3a3mF9CuWC2Tw3VvDVGFgpjAwtMHSjoNa49bny7gMEw8sQ@mail.gmail.com>
Subject: Re: [PATCH v16 4/4] m68k: introduce a virtual m68k machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k@lists.linux-m68k.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:x4czhCsvZSOK1qbbDgyUZKMyyM/1uVDmecUnKJKTuhMMuy7F68m
 rAUcbVoDooHBF3mHb5mZp8NPxfr5guwOSTjn0neUoOyIPZsPD7vk/H8iNMZEndvVum0cNEz
 uq7WxX0VzQRZys3gbhtMMc8sT4/Ag1XGvBm6mdNH5rflnkeQseNMWSNbER8khxtT3fZIcWh
 kMhqhPI84OKrRj6BiI+qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9smM+AGziK4=:QaVU3ql9dAowwr+jjkJSxf
 0eMIsBzWlQdrQeAZtbtIIh19D9iuA68r9xcO6AMhNtdpoN4Ip11NOuj8y06sR4wpNkbdD6KyG
 2at4ZOug+KGjMf/VMv9TW1Qlla9+4k18XoBeLElsa8M/HTQByr0kXfhsEtM07srxVSJ4SFae5
 +D9+C0DgojSTgioJLlMGy7T6t2dfgkPIfA0PfOiSZP/N7gz2Dtern2ig6uYXZ8BrCxQp/nolb
 AJjJH0NSsN5ZzDb+1Xzq2DiBMjD6Y6jkbMq3lc37nwABIRH2rbo3q97r2Eh9JEjCubpFWWVKX
 LWHgIZG2Ilgfutuu85jmRpRyZXR+4767iUoMr1alh3HTbDRtLx36jVj/ej+aTHD/mBpp+QdDG
 rgAeu4XPztEstig3pzCm26Is6V1UVe4UftE7YLcfvd9OdiEFcoMs7nwDPvr2vrb5nW/RHAlfc
 WopRDL3msB4tzQw1RnnVf9z9OgWHZjPaDJ1i34oB4B4oBZB/V7MUUDkOGil1MKHOsmfoV0KoB
 Pj4fkY8WQatW9ub/hObbE5sWQ1vkIpPQk+MDPFdC69OAKMi/+pu9y0dBUwSPUEuxE+hKVCSDI
 sM+VzIOGhlagxX7eIJMF1o2W9M/jPmSI9rsO0jJhrWAKtBEcBJpw5RaK5G9lFp8A1J0BW+H9H
 G0qZpsY3j1YTngvuz1i4W2DTE73K3S+Se4yoSGagOuU6SbQdjnRcCldmOYXdw+doJvqFDC61U
 5DAyBeqFjT3ZODplzZsHRZwwbS6KbzN67TMPdwwA45nHpHhK6m4yVdrEuqTWJnN5AjsNiphub
 ei7NPlDJyQ5PmZwyVWBUqVAibtvWIrakoxBkLlsygnGvU8SZzLVnx1ReEEOzpHF6/Owo8rki8
 NNAKoZoapD/cMV1ko1tA==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 31, 2022 at 8:05 AM Laurent Vivier <laurent@vivier.eu> wrote:
> > This select VIRTIO_MMIO can cause a kconfig warning:
> >
> > WARNING: unmet direct dependencies detected for VIRTIO_MMIO
> >    Depends on [n]: VIRTIO_MENU [=n] && HAS_IOMEM [=y] && HAS_DMA [=y]
>
> In my repo, VIRTIO_MMIO has no dependency on VIRTIO_MENU:
>
> ./drivers/virtio/Kconfig
> config VIRTIO_MMIO
>          tristate "Platform bus driver for memory mapped virtio devices"
>          depends on HAS_IOMEM && HAS_DMA
>
> >    Selected by [y]:
> >    - VIRT [=y] && M68KCLASSIC [=y] && MMU [=y]
>

The dependency is expressed differently here, but this is the
same as writing 'depends on VIRTIO_MENU':

menuconfig VIRTIO_MENU
        bool "Virtio drivers"
        default y

if VIRTIO_MENU

config VIRTIO_MMIO
        tristate "Platform bus driver for memory mapped virtio devices"

endif


        Arnd
