Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A12C433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 11 Feb 2022 12:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349897AbiBKMN6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 11 Feb 2022 07:13:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236946AbiBKMN6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 11 Feb 2022 07:13:58 -0500
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B9C1E9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 04:13:57 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id v5so4594763uam.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 04:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ulYLaVXldSoI4tDDRxPqxlHj4drX158bChWih8XppYk=;
        b=D9PFabHB7gV8PU1CPzQH4PmWGq0r/ZePeOxfabrYSzOF29iYxRJznE8GxSzQaYpLz0
         nUKOSRQY89XObfNbXsNQlG5Rx27hSJHqPzCuqN+vckfoPorbKA/+Cd4UCmvdbc5DaNIz
         Fsgf1JCSXtY15fN0vbwQ8f5qUNxTzP1bbQQ9mCbu7if51V08Szd9rNSGg91YYDkUe+uk
         SfItgXOYNJC3DHv4y0xoGRzg+4uVFAd++aL1iFGGB69BJQechB1XdrZg0y++KoXqSc4Z
         6Wi0i+3R35QcTbPGMMb1XNmYpVToBHFsWW615xsQ/iiHK2XtNs78gAHG+ywtBQVN2U3f
         xPwA==
X-Gm-Message-State: AOAM5331GecZV0ATcaqMaJvCvYp8GrcHZ5TZ8oH4L24kAPPV+15PiiY9
        rCYCc1YVC9cTRPWsvgvxWyCvfTic12yn0g==
X-Google-Smtp-Source: ABdhPJwb87+rSZC7VT1oafJ/Bgg8kARG0MQOg5bRPzlB6ZU/YAAwkYjse5b9RJjKNQEiO7HC15NOEg==
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr412169uaq.111.1644581635830;
        Fri, 11 Feb 2022 04:13:55 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id q22sm4106223vsj.23.2022.02.11.04.13.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 04:13:55 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id u134so5188466vsu.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 11 Feb 2022 04:13:54 -0800 (PST)
X-Received: by 2002:a05:6102:34d9:: with SMTP id a25mr377312vst.68.1644581634672;
 Fri, 11 Feb 2022 04:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20220129184225.407100-1-laurent@vivier.eu> <20220129184225.407100-2-laurent@vivier.eu>
 <CAMuHMdVmCV4v=LhGRB3d3hbyL4Etv_Wbb2VPhK5G9a2xB1Pm2A@mail.gmail.com> <0b488b58-3d13-e987-37c7-16bac7a313e0@physik.fu-berlin.de>
In-Reply-To: <0b488b58-3d13-e987-37c7-16bac7a313e0@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Feb 2022 13:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX53by9-5L5UWnjtpsUOX7LJMG+ySbFqO+QtsSST_iXKA@mail.gmail.com>
Message-ID: <CAMuHMdX53by9-5L5UWnjtpsUOX7LJMG+ySbFqO+QtsSST_iXKA@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] m68k: add asm/config.h
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Fri, Feb 11, 2022 at 9:36 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/29/22 20:05, Geert Uytterhoeven wrote:
> > On Sat, Jan 29, 2022 at 7:42 PM Laurent Vivier <laurent@vivier.eu> wrote:
> >> To avoid 'warning: no previous prototype for' error, declare all
> >> the parse_bootinfo and config functions prototypes into asm/config.h
> >> and include it in arch/m68k/kernel/setup_mm.c and arch/m68k/*/config.c
> >>
> >> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > I have already queued v12.
>
> I assume you're talking about this particular patch only and not the whole
> series, correct?

Exactly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
