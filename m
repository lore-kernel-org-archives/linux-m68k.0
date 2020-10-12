Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CBFC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65F3F2065D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730578AbgJLNOq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:14:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37039 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730555AbgJLNOm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:14:42 -0400
Received: by mail-ot1-f68.google.com with SMTP id m22so4362375ots.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbLIhCOPNSjWOQaghAyPRVWzbVrxqBRGdH57khM7u7E=;
        b=d0mT4WeWqduOj83iCqX4c6lXIAS/4N7i7hbh5O3s0UpPh+LPt2l8QlE9sa0eNUatpS
         XhgVYykQMcYjAUq0BPhI8AZEiz+ynaFIUa4DXoFJfGsi8DLtHeTvJMvEjryGh7iKjcMJ
         QOjHHyHHRVnzcolTDOCNLug9yXxGAiDpDbogqWtXg4HqvbfWNO9WJwaJ3T75FIoRVb4D
         xH1rq5WagAR4Bg/BBoCr83rzhYpLZEHCvVGTTTm/2pR9+yg/C6sxcpsTj322s+IYsh79
         6a4E58/cfl32gPm90hk2vkA6juRX6HeG/EYzHqtirAZJRmI2dY2dv8973rVcZEEmxUlF
         JcWg==
X-Gm-Message-State: AOAM5305V2xDGwcX8AVO+H0odeiyBSn+eHLD7wN8SBv4IZ7jOwT2f9kd
        dDDcmtI0hEVdmH+ibOgPtVMiY/wfT8XHuAx0O3s=
X-Google-Smtp-Source: ABdhPJxQ5OO/ggjyZpIV+Sqss7Q3IkWkzvdN60XWu45G9tXKXUPSGXGSLle8lOet30oUW8t+MfpiF57J8C2ncxOc0R4=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr18910378otb.250.1602508478612;
 Mon, 12 Oct 2020 06:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-2-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-2-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:14:27 +0200
Message-ID: <CAMuHMdW22uxMj3=Yfyz9uZoofT_aNxL2kV6UERgAYbRcw7yb2w@mail.gmail.com>
Subject: Re: [PATCH 01/13] timekeeping: add CONFIG_LEGACY_TIMER_TICK
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
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
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 8, 2020 at 5:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> All platforms that currently do not use generic clockevents roughly call
> the same set of functions in their timer interrupts: xtime_update(),
> update_process_times() and profile_tick(), sometimes in a different
> sequence.
>
> Add a helper function that performs all three of them, to make the
> callers more uniform and simplify the interface.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
