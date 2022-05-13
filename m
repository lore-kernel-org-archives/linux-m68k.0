Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01E9C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 13 May 2022 07:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357555AbiEMHyU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 13 May 2022 03:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352992AbiEMHyU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 13 May 2022 03:54:20 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E0C15A3D3
        for <linux-m68k@vger.kernel.org>; Fri, 13 May 2022 00:54:18 -0700 (PDT)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8VkX-1nuLnd05OD-014TRP; Fri, 13 May 2022 09:49:12 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f7bb893309so81570147b3.12;
        Fri, 13 May 2022 00:49:11 -0700 (PDT)
X-Gm-Message-State: AOAM5316YKf+gP57DY3fAo5OEgITAsx+0IwWF02SZuKIGMIIjT8bqDqU
        NYer9JQ+OJO09tRRq1cbPmXRu1jv9452qZ/UMY0=
X-Google-Smtp-Source: ABdhPJxFlTtlbVt8Bapilb2mz1n3siKTHBGzN+uJGcJLbo3/z08lYLAGD7AIepRl493ydddcUOdI8OAt4TkJKfkDI/0=
X-Received: by 2002:a81:54e:0:b0:2fe:c027:1ca7 with SMTP id
 75-20020a81054e000000b002fec0271ca7mr118018ywf.249.1652428150734; Fri, 13 May
 2022 00:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220513064952.3610672-1-gerg@linux-m68k.org> <CAMuHMdVWRM7U9_SxbtDUE0a-sB5_PDiO2009Cu3QKMP3wNc=yw@mail.gmail.com>
In-Reply-To: <CAMuHMdVWRM7U9_SxbtDUE0a-sB5_PDiO2009Cu3QKMP3wNc=yw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 May 2022 09:48:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2HpzBEy8F5CyJp0EbKcEmZdPivjjBmHQgh+mOAq3YvpA@mail.gmail.com>
Message-ID: <CAK8P3a2HpzBEy8F5CyJp0EbKcEmZdPivjjBmHQgh+mOAq3YvpA@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: fix undefined reference to `mach_get_rtc_pll'
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wSTf2c8yDJ/USo5n23QI1JUIkHDbjZEBjCvnLQ+YpEbzdzjeIMU
 v1lOFjbxQXUdakvLzd/Pdm2aK7avDXmLQCFZFIzi31kpuxej02x984xF9AGSEy0GVP8PEmp
 WpFEkny1/+xIFNDtznAtok4wy173XsZi+Vrhc8fZOEHXJotAIk2UuSFmHU1+XAwTxo4QS06
 lAwhrCBoRUPO0nlmv/BGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qjHACBJoYx8=:qoWnuaLFrB8RBb3lc0vxM7
 VuKLf9oXCt3mwt+7xfhgJV1yhbnFPxJZFyVqXGu6HT5Idd3SpyEj/rblJ02ynqf7MCYBVbNC+
 iJnMOX9MoB5TzidZlVQVjKFexoDTNyGa6RkUQYWjddHHAm36n1QfSVd7SStCC0S4qiiB5poQP
 WufCBWWk0r3dpZmR+5etbD1ue1M48wqRmS0eAzVJBfaP1A4kmNITwz+UM7IQthY1om59ucIFO
 cRbznKaMvJR8zC+j8HNlCicgBSgIdDbu90GfAkoGT4FdgnbH0ucoXfvuOOHrus2Khi6Kniovm
 RneAKrCGe//m3HJcpGJllEYbhkn4wsfT2CHYZfsEdje0Hi+C7afH5KkW1GSGBRLar1Pyi1fur
 RRKdNhsylv4AHXbCSM9oOLr/cBwvGGcxJi57kERLV/0Ns/Eg8Zd30bAWs2cnNTzd7OexBx9Tn
 LO/6ZwzXvnHExdtAS9gimP6U6GLb7gkNpTyRCG3YgDCIuPm1UnDh5kaoA+WZt1fc00Ye7VPFx
 GOcctMXjauIUP01PsCXTH5pCUnL2yZ10sXwUFvnrcFhYvvL/SpCFe2BXS7vQrdzrI+eRZdbTi
 iMyPTWxtVZ8CQqARqD89LriJAkBBWSy93Nqyq2d9oAvE+9Ic14qS33z9UG9sAyzCNkfCfuOw3
 WDHv7Zi9DSTLeYLjWOGL0gmMugSMFCwlWsWi0Oh80MkwxWgxJ30Z2ncTddGsD7/gYfOQ=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 13, 2022 at 9:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > -#ifdef CONFIG_M68KCLASSIC
> > +#if defined(CONFIG_M68KCLASSIC) && defined(CONFIG_MMU)
> >  #if !IS_BUILTIN(CONFIG_RTC_DRV_GENERIC)
> >  void read_persistent_clock64(struct timespec64 *ts)
> >  {
>
> read_persistent_clock64() uses mach_hwclk(), which is provided by
> both setup_mm.c and setup_no.c, so it's always available?
> Albeit not populated by coldfire or nommu platform code, so I see
> the point in depending on MMU (no nommu Amiga support yet ;-).
>
> Perhaps rtc_ioctl() should depend on CONFIG_Q40?

I think the best cleanup would be to turn the q40 rtc support into a
standalone driver using rtc_register_device(), and completely
detaching it from the rtc_generic support in arch/m68k/kernel/time.c.

        Arnd
