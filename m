Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E483AC43467
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 20:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAE832074F
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 20:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3/o7m4+J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qK6+kw4f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgJLUok (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 16:44:40 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:47468 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgJLUoj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 16:44:39 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602535477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2D9ftb4BNlPgU4fGOVcc9hqHah5NjLimpJgfMw28f+o=;
        b=3/o7m4+JNTO8cP79WuCRiuRnkNMsIzvD57ZEvEm9wyGyPse3QVqeClMl/XBroA5Gw5sryY
        yt1B4FPqa8dQZVnOskzF4aK2RvAdaPtSNuvrq2kiHKwjtrI2O56Doey5MrVWZ1PmMtFe51
        nIgCRI/OA1S/wFNBCKjgyh2PPtOYor7ZlBPcXGGO9efhAqy/xfK5oMj09dFsWK+REE51vs
        QtnliaSEueOg5DKUKyvIr/bYO3yvxWZ6lOX7iWnhT5LL+Vf3dHfFjZNNjjcYZWGXKeWwU4
        VdlYT89JkZ+cBgIEAmwK1KJnZbO6NmNDuL/ib8buYfCUf/2RV6R9QHIynPbu9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602535477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2D9ftb4BNlPgU4fGOVcc9hqHah5NjLimpJgfMw28f+o=;
        b=qK6+kw4fzMu2UlI7byqtGAmPcI78XzzYUsSPXcvpiK8RQ/WaolXUVuLHhBgI49kAgKr+DQ
        n59ZXMNHRPEyWhCQ==
To:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
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
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-ia64\@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 11/13] timekeeping: remove xtime_update
In-Reply-To: <CAK8P3a2hY+Vc3S32KKBJj7gUaUFQb4=rKsRJwCwhAbYP7CakzA@mail.gmail.com>
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-12-arnd@arndb.de> <CAMuHMdU7bn7rzG-0xzr4St1uArGoOhw6dy7HCkrHRvYqM38Wxg@mail.gmail.com> <CAK8P3a2hY+Vc3S32KKBJj7gUaUFQb4=rKsRJwCwhAbYP7CakzA@mail.gmail.com>
Date:   Mon, 12 Oct 2020 22:44:36 +0200
Message-ID: <87pn5np423.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 12 2020 at 15:37, Arnd Bergmann wrote:
> On Mon, Oct 12, 2020 at 3:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Thu, Oct 8, 2020 at 5:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> The comment about xtime_update() in arch/ia64/kernel/time.c needs
>> an update.
>
> I think the correct action for ia64 would be to make it a
> proper clockevent driver with oneshot support, and remove
> the rest of this logic.

Correct action would be to remove all of arch/ia64 :)

> I could try to rewrite the comment, but I tried not to touch that
> part since I don't understand the logic behind it. Maybe the
> ia64 maintainers can comment here why it even tries to skip
> a timer tick. Is there a danger of ending up with the timer irq
> permanently disabled if the timer_interrupt() function returns
> with the itm register in the past, or is this simply about not having
> too many interrupts in a row?

There was a comment in the initial ia64 code:

                * There is a race condition here: to be on the "safe"
                * side, we process timer ticks until itm.next is
                * ahead of the itc by at least half the timer
                * interval.  This should give us enough time to set
                * the new itm value without losing a timer tick.

The ITM (Interval Timer Match) register is raising an interrupt when the
ITM value matches the ITC (Interval Timer Counter) register. If the new
counter is already past the match then the timer interrupt will happen
once ITC wrapped around and reaches the match value again. Might take
ages for a 64bit counter to do that. :)

IIRC, PXA had the same problem and HPET definitely has it as well. Seems
Intel patented the concept of broken timers, but at least they listened
when they proposed to implement the TSC deadline timer on x86 in the
exact same way.

See hpet_clkevt_set_next_event() for the gory details how to handle that
correctly.

Thanks,

        tglx
