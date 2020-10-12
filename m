Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A30AC433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 100402076E
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388743AbgJLNPd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:15:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34066 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388740AbgJLNPZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:15:25 -0400
Received: by mail-ot1-f68.google.com with SMTP id d28so15817380ote.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=32prFsUImi2et0wD1nInyNzJbwFsAz7pM2lg+OwfdA8=;
        b=dtK4ITeAbuexItDKr6B/ZxKS1WeiUPMC0NhQb8Ia61O60MGXpcNTiFG8zfwW94SPtN
         ExJCMcO8wujZqJ7D9gEIHExpufuAFy3wvXbDtV6vqcmKDWo5WrTN5q1J3A4yCh0bF7WP
         Zf/DaIgNdNOr56YOF+ITq3rNnP9x8rNc8dO+d2HeiElxgAaZ5wvohT7XnpWO/CYJzjzE
         VGzqchgHSSMIax8ywdO+nseWduuaZyg+UJ7/vocn4brirYqn9dUx79ue1CnlccIJ4S/+
         lmZaJu0AV/o+9WXFhC6DctUB2bvl/gu9zDGgdLk/dfDD7Ahd4QNkUUvL1YSIUXFfRZpx
         gQqA==
X-Gm-Message-State: AOAM53031WvaB1+jzwiTbF8b3CxKHH3TTNj2RqU8DkJmnAvLIcf3SEFm
        NbZHjPipz9Nny3B8IeY2gGm5mxrHKuiTHLOYMSQ=
X-Google-Smtp-Source: ABdhPJxtX+V6nlzREBpZnHfCCWLCLBZEkIJ6fKRmhts0E87Q/NkdkOCqC2URIeU4xfs9RBjZ1sZArftZVEwo7jtjoJU=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr18308270otc.145.1602508524639;
 Mon, 12 Oct 2020 06:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-11-arnd@arndb.de>
In-Reply-To: <20201008154651.1901126-11-arnd@arndb.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 15:15:13 +0200
Message-ID: <CAMuHMdUQMgE2ny-nuUeYjn-gcpvav2rp-11oTQp-GZ5TX9Z8Pw@mail.gmail.com>
Subject: Re: [PATCH 10/13] m68k: remove timer_interrupt() function
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

Hi Arnd,

On Thu, Oct 8, 2020 at 5:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
> This gets passed to a number of init functions, but is
> ignored everywhere, so remove the function and change the
> mach_sched_init callback to take no arguments.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

And finally (for Amiga and Atari/ARAnyM):
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/machdep.h
> +++ b/arch/m68k/include/asm/machdep.h
> @@ -33,8 +33,7 @@ extern void (*mach_l2_flush) (int);
>  extern void (*mach_beep) (unsigned int, unsigned int);
>
>  /* Hardware clock functions */
> -extern void hw_timer_init(irq_handler_t handler);
> -extern unsigned long hw_timer_offset(void);

Yeah, this never-used prototype, which entered through the nommu merge,
can go.  But that's not really related to this patch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
