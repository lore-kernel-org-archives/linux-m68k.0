Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD2C433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BAE22065D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388770AbgJLNPt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:15:49 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:45060 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388785AbgJLNPt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:15:49 -0400
Received: by mail-oo1-f68.google.com with SMTP id x1so278931ooo.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IaAtROGTENgKEPOO1Q4DxIoQzzqOoFc9nfud5UvDGR0=;
        b=RTejX2zviEREkq/tPoeCiPX/rdSULLzYISC4kwCgNm6T1FF1kMTmbRn9J5l1moW9rh
         aExJM9m5+hUiHA6zrQ+5kYcVHgznmTK5kcKC0mWid+8MijiNSz1VrXnqLguKabMj0/um
         ebbrbWCPl6RMlki0DE1EsU9FnrjekNTKTHOHlGdTWV6MB6izmRmVILsTDD1HF/61ZnrK
         z9in5tuBKN4RHSZtrNTXq8QSKdqwYQdpWF83E8YPgvCLQizSAH5Zs+nN9JqUCRVQWptD
         nArDErSQIkUuMDITTHaI+FcnR/ofwtnHBSOzkWdPMnubhIEEsiLQHfE8N/daLpRxD7KM
         bZFg==
X-Gm-Message-State: AOAM530TtdHir4ReBVOjF8FGIfSNt2yFDJtleTbRajbT1qy2Xk3LIJNN
        +rnthTNz/pDRJe81jvLWamCjWWQPm9wl//hYydU=
X-Google-Smtp-Source: ABdhPJxchKns3slAZrfyy4YUUOoGaa31rGDaKwMNk0XJqkoWaiHnxGSNKIXlCj3XYAqY439edA8VMCwt9dsV88NjCGg=
X-Received: by 2002:a4a:dbd3:: with SMTP id t19mr18526635oou.40.1602508547896;
 Mon, 12 Oct 2020 06:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-10-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-10-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:15:36 +0200
Message-ID: <CAMuHMdXDRG5mOVPWiMAUuNuzKJnTjy3vQeUYhdzfsJ3_Vechwg@mail.gmail.com>
Subject: Re: [PATCH 09/13] m68k: change remaining timers to legacy_timer_tick
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

On Thu, Oct 8, 2020 at 5:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
> There are nine more machines that each have their own timer interrupt
> calling the m68k timer_interrupt() function through an indirect pointer.
>
> This function is now the same as legacy_timer_tick, so just call that
> directly and select the corresponding Kconfig symbol.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

And finally (for Amiga and Atari/ARAnyM):
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
