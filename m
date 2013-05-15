From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k-queue
Date: Wed, 15 May 2013 08:53:15 +0200
Message-ID: <CAMuHMdX_Mhd1gnZic1sr0nyJJs=oPt54hx7jRfv7j=Dth46VPQ@mail.gmail.com>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
	<5191FC4C.8010707@biophys.uni-duesseldorf.de>
	<20130515054540.GA8137@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:34610 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995Ab3EOGxR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 May 2013 02:53:17 -0400
Received: by mail-ee0-f50.google.com with SMTP id c41so826810eek.37
        for <linux-m68k@vger.kernel.org>; Tue, 14 May 2013 23:53:16 -0700 (PDT)
In-Reply-To: <20130515054540.GA8137@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, May 15, 2013 at 7:45 AM, Brad Boyer <flar@allandria.com> wrote:
> On Tue, May 14, 2013 at 08:56:44PM +1200, schmitz wrote:
>> >  - mac: ADB raw packets
>> >    I guess this can be dropped?
>> I'd guess so - I struggle to recall what this was for. Perhaps to
>> talk to the clock chip on some Macs. Anyone?
>
> If you can give instructions on how to look at this one patch (or
> just send it in email), I'll take a look and hopefully I remember
> enough of the history to give some kind of explanation.

https://git.kernel.org/cgit/linux/kernel/git/geert/linux-m68k.git/log/?h=m68k-queue
and click on the commit you're interested in.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
