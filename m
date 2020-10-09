Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620ECC433E7
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 13:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1745B22276
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 13:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbgJINYT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 09:24:19 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40359 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgJINYT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 09:24:19 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5wTr-1kYKVP3NWN-007WY1 for <linux-m68k@lists.linux-m68k.org>; Fri, 09
 Oct 2020 15:24:17 +0200
Received: by mail-qt1-f178.google.com with SMTP id t9so7065204qtp.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Oct 2020 06:24:16 -0700 (PDT)
X-Gm-Message-State: AOAM533D3E3MVqdAaS4drecEUdPjVQ1Z8a9FjiIFLgxwhn34krA7fjaB
        JW6KoFQr93ejVeq2aH6NWaMub7aRf3dxfRFD0ww=
X-Google-Smtp-Source: ABdhPJwGWpnh6YXeCGHXzt9gF5qvqtLcAd925kccJGJ5ZmJZWEn/UPjGcEgDedqfjgtQvXwD6o8XYMv1z/4WvobnVTM=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr11806879qtv.7.1602249855606;
 Fri, 09 Oct 2020 06:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-6-arnd@arndb.de>
 <0bf8d0e5-5792-a2dd-884a-c82693b64b19@linux-m68k.org>
In-Reply-To: <0bf8d0e5-5792-a2dd-884a-c82693b64b19@linux-m68k.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Oct 2020 15:23:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3E1x_T29Az_d-A+wTpqCWj6Z40TaOjcsX-kc+xfpBrRA@mail.gmail.com>
Message-ID: <CAK8P3a3E1x_T29Az_d-A+wTpqCWj6Z40TaOjcsX-kc+xfpBrRA@mail.gmail.com>
Subject: Re: [PATCH 05/13] m68k: coldfire: use legacy_timer_tick()
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ia64@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mWYCQL5QOYwuGelGH0CcnFgQACC2yEO6OM2j2ekXWcztqNEvIoG
 I44JZS4lJKm7PZU/QAqgu3XvBjpjhuKvaehp9js3RdyHuG64hPCyen/VQ74+0FgXa7EanyA
 /Ckqn42WwwZXmqWtYpea44XbQknznprcSVvEuSm2rkRiFv8nVxxgORlFZVKEZ3dDocWIlRE
 G0Bl6oNeXSKDEbPFrZsLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3yxUGX4t6PQ=:Z0QlKLrMEB3HRXmQmWefcR
 P7w4HFQntWpOjyELjUipFxPL+egI/bIp7Ecp7/DcIUppiZFlJZoJDfViIrgaSxKw+yVRvtOcZ
 aKP+zdcQZliNerdQdbquYl94TD/1u68wbL6QeUMHrkhmbm3HBbqSUKdJI0rXXgkg1iTWHIulT
 zajvYaG3ZjUJyAd9aTeO3ULvEbFPRGz/lz/RqViznNLEZfrdXfruYKCOKkZrqkwnJ28tR0KA9
 uSc5lmhe5xNkkcN5zeS/0eUJcLn1DOzaqZACNYoNbXvhwIMxhZnDaq4Le20Q+EVNmrbGx7qya
 mmb9cA6KB4ZgvpXQimsrR9tIt15tXo3Z+TbxSD6XnKmoBuuw1PEF1Q197Y2H4QZlbbPXwp3fG
 Pbq2X4+xpxLzbw2/1U/tmGFc8hdLTZLaD6cZMrL8h4aWCZYO0eBqW7juDIxjG5YgF1lFLz7Bn
 SYCU92vkHq/tLMdk9t3sC7pj5EoIDeBJ/26nWF3xreJhJev1ZFHYOfIAjEkVyoTLakw2IDkbX
 tERqXBda0mh5lyqGdaGPQhOiAUtz6ij5ad9WaFe5Pt+8MBxEamwfiwx/hyUtPRSi5j+VOppxC
 5Cu4icLHgJRXQAjRmilVWowRUbTj/zlauX4lUBJzG0hqjrpZSIL99usg793pPle6KVzY8uwx7
 wn/TA4NjLB7wHrh6ikuj3z3Wlrfemn71Tzga6P3/VS8u1HUlJVyJJdAN/6ftOfRzeoZPyHEWC
 ZLnFE/fkhSxqUaWV0dE0/KT6WgfbE9bFlOdr76VETwER1KTO+sZ2Ddsmxzte5KEMO0dCa8Jcy
 XBhmEUHWOYLO2LjGjVMsoVB9IzkhoQua5xlWvhtAr8uQ6aPy1dW7ma+ubORrDlAw+AvrFJXnt
 HhNAJfQeSpdsdUIUjj1+Y7s9wWIrqMqmrmXXRGYfW8OY1V5qz9Z4nUG9YGcVTzrvM0MLAxxuf
 l6fIWcTN6QU3/yFV/80ZGtJHfNFaTuV530xGKPASlXQJw6w0+tHEj
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 9, 2020 at 2:53 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> Hi Arnd,
>
> On 9/10/20 1:46 am, Arnd Bergmann wrote:
> > Replace the indirect function calls in the timer code
> > with direct calls to the newly added legacy_timer_tick()
> > helper for those that have not yet been converted to
> > generic clockevents.
> >
> > This makes the timer code a little more self-contained.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I tested this series on a couple of different ColdFire parts
> (5208 and 5475) and under QEMU emulating the 5208. All checked
> out good, all worked as expected. So for the ColdFire changes:
>
> Tested-by: Greg Ungerer <gerg@linux-m68k.org>

Awesome, thanks for testing!

        Arnd
