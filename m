Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277F4C433E7
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 15:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3C0F2080D
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 15:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388824AbgJLPbI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 11:31:08 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58277 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388710AbgJLPbI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 11:31:08 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MDhth-1kaTpl1h27-00AkVI for <linux-m68k@lists.linux-m68k.org>; Mon, 12
 Oct 2020 17:31:06 +0200
Received: by mail-qk1-f179.google.com with SMTP id f21so5212992qko.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 08:31:06 -0700 (PDT)
X-Gm-Message-State: AOAM532HUFeFOOaymurekU4LzVTCncYY7KSXgcb/YhkvUOOw6125uB7F
        fNw2LKxPmoVeaZcYJTVl00S5JcmHntIiNXRajGI=
X-Google-Smtp-Source: ABdhPJwvsy1oYnuUy5ljPB75evT7Pa/tyuqSvAbw5I5mVYvqU4g4l8zWrAr5hU7svLQBi/0OorEm0EPGvxy5dZlnbs0=
X-Received: by 2002:a05:620a:2ee:: with SMTP id a14mr5630220qko.286.1602516665130;
 Mon, 12 Oct 2020 08:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-9-arnd@arndb.de>
 <CAMuHMdWtMZaJ8ETb4g+AfaLeSZ1vyi8-POEaRzmdwh3ha=jieA@mail.gmail.com>
In-Reply-To: <CAMuHMdWtMZaJ8ETb4g+AfaLeSZ1vyi8-POEaRzmdwh3ha=jieA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 12 Oct 2020 17:30:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1nDZYYwtuniUGxmy=H8LHbOEGSU=Pmi2=LMrLw09x8+w@mail.gmail.com>
Message-ID: <CAK8P3a1nDZYYwtuniUGxmy=H8LHbOEGSU=Pmi2=LMrLw09x8+w@mail.gmail.com>
Subject: Re: [PATCH 08/13] m68k: m68328: use legacy_timer_tick()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Provags-ID: V03:K1:CIdocZYs4z4DgIcAo2fVrYsVZ+LzgymMBwOad5hgv5f+nSwpBDp
 79Vsh6ycPbeNjVNw0VOG/IqD7xW2lEe+/N0K2jP77kEPIqhWsR3R2RO8NSsQYNK0QiUVpkR
 Ja4kY2sO3IRaTQOF4g8iIY+LnGBbuUm1SrtC8EtUHRresV3elmLvYgFuahDpgg0Ioiu7bji
 y2OHIk0b0m05fw+9aDQKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qe1QrpOXDz0=:8V8VqKrrcoTAl6VXDoEkdY
 d3yazVNOHxGWR3KTTV2iiKDIZyCuF7SwNSKB/6hHRvBH1s+34aWVUmAkLwdDjeAYEK/wChcqv
 g/MlXYUBxr0+kz6E3de3xOOlFtXd0YJdK3ea3faLz7vQ5nMHaGnYoXFPubqEilTHs1Jr9WGT5
 tfM9J0Locu4GVFtjb/loWqcI3otNEzQM1VNW/qEdo0BJTtJtZwmOfMOuj/6ALIIBuH3s81Wwf
 gHmcIt8Lh3ofZT3/OgWWWGQsyJgNXlkZsmXklqIdMHcUS3awHKm4gZGGLsrvMh5S2daJOv90r
 Tqu4BNfOGOIfO2uQ8IniAmOrwJVA+NiXJZP0PFofrSjZS1Irbh/Q9iMU9pEv3x1RiSh5Ovcx0
 vSdurIH5lFz4Vh6ieVVFuq/4KR/+9XuHWuPxM+B+RCXVGp+epssEULdN0zDg06SywaA/jYJ72
 jFq4YHQP1kfR830J+UytARAfdA2zPr9MpQKSL76StRAkdW12eq0f5b2JOVPDaSGSFalh6g/e+
 uoZcaHEEMcQUlzhnoeFzxibC3eUYfY6YHZIbU3JzJ7VATAKy8d6DZy4KaNYtwtGbxtdLwIQpr
 rypQBhPvm+up/N4gkRY8I9OPr4ElqqtOHpqcIDU7uMoWuYPx4s8WrgnU3fXtKV357uesNX8Rd
 3o22KuUc0XzCrIfipWYUOw/p/3ZC8S0zWXqO9CZEIWqIExr119Pvy0CMFRS4w/gZKD+BYj/Wt
 hKiiXU2j5BRfqLommust6nW3WXauvUA8Wj34tqLUo4YYBKA0HwceRbVCWBU/KpDgitxtMJKhP
 NmaTXPDtsPZECy8c/SM1KLYQues+t3XPu3DZvO51Z2N6soSFL2M4y16dmJBICsshC+VA0aJ
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 12, 2020 at 3:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Given this feature is SoC-specific, not platform-specific, perhaps
> it makes sense to move the selects to the M68{,EZ,VZ}328 symbols?
>
> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Ok, folded in the change blow, using one less line. I couldn't figure
out whether
it should just be part of the CONFIG_M68000 instead, which doesn't appear
to have any machine support by itself. The dragonball CPU configuration
looks really odd, because you have to build exactly one of M68{,EZ,VZ}328
into the kernel to get a successful compilation, while Kconfig allows
many other combinations.

     Arnd

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 322a35ef14c6..648054d4f860 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -104,6 +104,7 @@ config M68060
 config M68328
        bool "MC68328"
        depends on !MMU
+       select LEGACY_TIMER_TICK
        select M68000
        help
          Motorola 68328 processor support.
@@ -111,6 +112,7 @@ config M68328
 config M68EZ328
        bool "MC68EZ328"
        depends on !MMU
+       select LEGACY_TIMER_TICK
        select M68000
        help
          Motorola 68EX328 processor support.
@@ -118,6 +120,7 @@ config M68EZ328
 config M68VZ328
        bool "MC68VZ328"
        depends on !MMU
+       select LEGACY_TIMER_TICK
        select M68000
        help
          Motorola 68VZ328 processor support.
diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 0ff9338b958e..e3c835440d9a 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -146,7 +146,6 @@ config PILOT
 config PILOT3
        bool "Pilot 1000/5000, PalmPilot Personal/Pro, or PalmIII support"
        depends on M68328
-       select LEGACY_TIMER_TICK
        select PILOT
        help
          Support for the Palm Pilot 1000/5000, Personal/Pro and PalmIII.
@@ -160,21 +159,18 @@ config XCOPILOT_BUGS
 config UCSIMM
        bool "uCsimm module support"
        depends on M68EZ328
-       select LEGACY_TIMER_TICK
        help
          Support for the Arcturus Networks uCsimm module.

 config UCDIMM
        bool "uDsimm module support"
        depends on M68VZ328
-       select LEGACY_TIMER_TICK
        help
          Support for the Arcturus Networks uDsimm module.

 config DRAGEN2
        bool "DragenEngine II board support"
        depends on M68VZ328
-       select LEGACY_TIMER_TICK
        help
          Support for the DragenEngine II board.
