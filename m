Return-Path: <SRS0=tTa3=DR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7971C433E7
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Oct 2020 23:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81D922075E
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Oct 2020 23:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730391AbgJJW4o (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 10 Oct 2020 18:56:44 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60841 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730542AbgJJUcT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 10 Oct 2020 16:32:19 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Ma1HG-1kxKo23oma-00VyQ2 for <linux-m68k@lists.linux-m68k.org>; Sat, 10
 Oct 2020 22:31:31 +0200
Received: by mail-qt1-f178.google.com with SMTP id r8so10762725qtp.13
        for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Oct 2020 13:31:30 -0700 (PDT)
X-Gm-Message-State: AOAM5320PseXsvuhqOS4VJ+Cei0c8/grQ68aqmOleSDEYt1lLTVCP4j0
        QnTRH8PpRIjB0S1tFOFyQOTadjzi1b0Z7LfKZzg=
X-Google-Smtp-Source: ABdhPJzxmcGED0Ih/YBu2mHf0R3P6/nMSvbjeQBBLgW8fw7gYjKUZesdCzOPFtlYkIUUYLLkZBj1PG5Q6+okNjhwAiM=
X-Received: by 2002:ac8:4808:: with SMTP id g8mr3749519qtq.18.1602361889612;
 Sat, 10 Oct 2020 13:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-2-arnd@arndb.de>
 <alpine.LNX.2.23.453.2010100820110.12@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2010100820110.12@nippy.intranet>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 10 Oct 2020 22:31:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ZBHJag7MUDNL+hrZQLiJfc8JyZzOtAuarOVwo_GcmmA@mail.gmail.com>
Message-ID: <CAK8P3a3ZBHJag7MUDNL+hrZQLiJfc8JyZzOtAuarOVwo_GcmmA@mail.gmail.com>
Subject: Re: [PATCH 01/13] timekeeping: add CONFIG_LEGACY_TIMER_TICK
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
X-Provags-ID: V03:K1:RyG2IrIavu1i9QSaUor9NucPUk2gxlhDk5oDniMcc83B4cUWP7J
 AJ89RNHPdcXIXpOxMzxEy7icYXlffozIgVx4SNFQbCXjarPUlROo4n6t7Y6hSnMs+rEOfjs
 tLTsaLf8CbjXnQCnyOKSHxqiB56Yd+gkk3icgo/Be727UKHIAAgj4YmDJLdZZ++mfLwaZZm
 ynVrxhE9liDQGvVwMxeLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:di4Uk2TYJdk=:4O/xxSWzOsnkZF/zE2FRWG
 r2QMz1HL+nT/1M0PNY2cKQZB7BZU99piQ49APxfsHuxR6jnc48Rf4DUPiIyFRxn2CtyXN8ryy
 3+iPqrB8z50OQqd/Cv/EyKD32fhVzxwyyH2maiJV3NK0frIXo8RxXXSaJfZgZVQd0We6wUki7
 o0GG/k7EiPG8GZiUkoA6qlNNA7/PQKKu5DNo6Iif+azKqxfZKvMqWo8SJh+1mRFwrWUHkfxRm
 saaEhk5jyh8+ueE2oTczywMSfh6Af3AAuM1C/h5WEZvxLu/RVpgnTNTeVoGYeCqloyEQ7moGw
 L+rTL2ovqJSOob+MC5wK2rQu0C578TQYby6uCh8bn7rHkyEAXPOIhnNvW1lxDJL8s/SlY33BP
 5ie+cwLAOlUjYncJTsW7n2dV4i3tXHeAGMe8UalPb0rUqPAV+xEX/C646J/vPGyafLAZY1MoO
 wKvA+TCCVzSQwgLUOkF0A85VDtWbZSSjtcCgZbuA9GBRiiiM4qVpSviAtRjpdkSJN5FKg5/kV
 bwcFHZOJuFiVZMNJ+t45YcckhVVq4m7BgX4EVn2/bmbnoOI0ibxWjslhfqznoVtNEWQ09qlgk
 Cw4ObVzEcedcSpY3DCMUjlGE1YAWf5g9VaheBF9fqzVTBV2sQaVsMOV/Gi3WURcaLtxNquyfY
 yvTdJtWozj/Yq/vSf0VNc9ldVpUqrAFPzpDnfv7D3YG87iQZAEkzc5HfiIy3iJ9lrZfeRQvs2
 rEXloBRBAq0d4VrdQ6hETWqwCeaFQolT7jKUkMSkGHWQEMJjK91k3BrjsOoDNEhhnFPjfYEXR
 vCIwBsfaToUmukt+r4GNAC2QVazRCVmaT9Enz6GHDpuy8dtt7To82sHep9Cg7g2Muil3eNjRO
 h7zvObA86ueDHfDSU1FjIyPvJXsZZutELm8nEnZ1mmZOqtuCLWlmRqrV6yIEeTFUdWXJ1U9kp
 +jyDZstFGN4JaTTEHEPBX92rHTRulnB3mFdltYaMv3vrhwbTAV2PH
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Oct 10, 2020 at 12:18 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> On Thu, 8 Oct 2020, Arnd Bergmann wrote:
>
> It's good to see this code refactored in this way because, as well as
> de-duplication, it reveals the logic that's common to the relevant
> platforms and may shed some light on the need for that logic.
>
> Yet it's not clear to me that the clockevents framework is able to replace
> that logic on all of the affected hardware. I suppose it remains to be
> seen.

I suspect that the change I did for one platform in patch 13/13 could be
duplicated for all 16 platforms, adding lots of trivial clockevent drivers that
only support periodic ticks, but any platform that can instead support
oneshot timers should probably do that, or it won't provide any better
behavior.

What do others think we should do here?

> As a corollary, cutting edge ("non-legacy") code is often kept out of open
> source projects by the owners of the intellectual property rights.

I'm happy to change the name in any way if you have a suggestion
that the clock event maintainers (Daniel and Thomas) like.

      Arnd
