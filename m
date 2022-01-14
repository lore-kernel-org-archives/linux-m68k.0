Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA564C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Jan 2022 11:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbiANLMR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 14 Jan 2022 06:12:17 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:38802 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbiANLMR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 14 Jan 2022 06:12:17 -0500
Received: by mail-ua1-f53.google.com with SMTP id h11so16328287uar.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Jan 2022 03:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NN2frd6kQv764ZSbGbhAVE/E8qM9eEb48i6osAL/H1U=;
        b=MByz62AdOratyNhFYMuc4xBDlgufXflZKdMudAjO3ICoZvA8+TQriHlt/jsR5qNEoV
         K+BtkGCCUSAbATlRKoIsJBc1I8nY1WJ+Ho8oJ6Q6HhK6KHzOkT9saAGFiCaSIhtYJZkD
         0Uv2VIDGggwZb9Hz0Uz8wjbanHtgIBPKiaRYWSLdrJckv51RDH3dwrEp1tckwkogMz9Z
         0tTFMyb5sKDddAJJDPWAywkLZM9wSMZ8YpORunhlnK6GlWjao7DYN6AirRHaazNRbCKo
         6L+P/3eFuTVjd52EU5s8dtriqqdwbOSMuPuHB4PlmIQx0cjN5oebEfNgZsEYrWaDjXJx
         eWsw==
X-Gm-Message-State: AOAM532/wh/jVs6i8TKbFhimJ8wu7wPPfToLUHVGzch02eaWsilWEQnU
        boDVqcTMByjZzeyUNO5ELT20nB209loP2Z6b
X-Google-Smtp-Source: ABdhPJwYWpWQk/uhOuUDEL93kdT4riaUoF7amAxuewO9KKoD6mcIAqeq7CocQLvxmnMIghynuh7fLQ==
X-Received: by 2002:a67:f746:: with SMTP id w6mr2170634vso.76.1642158736330;
        Fri, 14 Jan 2022 03:12:16 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id l8sm2317704vse.28.2022.01.14.03.12.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 03:12:15 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y4so16347939uad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Jan 2022 03:12:15 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr3835204vso.68.1642158734969;
 Fri, 14 Jan 2022 03:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20220113201920.3201760-1-laurent@vivier.eu> <20220113201920.3201760-4-laurent@vivier.eu>
 <CAK8P3a2QzMiga0FFVmTuefnq1OzsgyopiJN2he8043K0TRF1ng@mail.gmail.com> <a53e6d46-114f-7bb2-70b9-113c5f8a9c0e@vivier.eu>
In-Reply-To: <a53e6d46-114f-7bb2-70b9-113c5f8a9c0e@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Jan 2022 12:12:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXN=2tjizcjA4vZ1FOSXDBNBkKH355fkfspgO9bOhp6_w@mail.gmail.com>
Message-ID: <CAMuHMdXN=2tjizcjA4vZ1FOSXDBNBkKH355fkfspgO9bOhp6_w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clocksource/drivers: Add a goldfish-timer clocksource
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Fri, Jan 14, 2022 at 12:03 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 14/01/2022 à 11:46, Arnd Bergmann a écrit :
> > On Thu, Jan 13, 2022 at 9:19 PM Laurent Vivier <laurent@vivier.eu> wrote:
> >> +static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
> >> +{
> >> +       struct goldfish_timer *timerdrv = ced_to_gf(evt);
> >> +       void __iomem *base = timerdrv->base;
> >> +
> >> +       __raw_writel(0, base + TIMER_ALARM_HIGH);
> >> +       __raw_writel(0, base + TIMER_ALARM_LOW);
> >> +       __raw_writel(1, base + TIMER_IRQ_ENABLED);
> >
> > As mentioned elsewhere, the __raw_* accessors are not portable, please
> > use readl()/writel() here, or possibly ioread32_be()/iowrite32_be() for
> > the big-endian variant.
>
> We can't use readl()/writel() here because it's supposed to read from a little endian device, and
> goldfish endianness depends on the endianness of the machine.
>
> For goldfish, readl()/writel() works fine on little-endian machine but not on big-endian machine.
>
> On m68k, you have:
>
> #define readl(addr)      in_le32(addr)
> #define writel(val,addr) out_le32((addr),(val))
>
> and with goldfish it's wrong as the device is not little-endian, it is big-endian like the machine.
>
> same comment with ioread32_be()/iowrite32_be(): it will work on big-endian machine not on little-endian.
>
> We need an accessor that doesn't byteswap the value, that accesses it natively, and in all other
> parts of the kernel __raw_writel() and __raw_readl() are used.

Hence Arnd's suggestion to define custom accessors in the Goldfish
RTC driver, that map to {read,write}l() on little-endian, and to
io{read,write}32_be() on big-endian.

BTW, I'd go for io{read,write}32() on little endian instead, for
symmetry.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
