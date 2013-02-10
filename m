From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/17] [m68k] Atari: declare original EtherNEC driver obsolete
Date: Sun, 10 Feb 2013 19:54:43 +0100
Message-ID: <CAMuHMdUkc4T=FqdDRCrsdf1KHds1LUKR2ugDYxYRjfhwfXDHZw@mail.gmail.com>
References: <20130131001454.07088360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f179.google.com ([209.85.210.179]:34764 "EHLO
	mail-ia0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756303Ab3BJSyo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 13:54:44 -0500
Received: by mail-ia0-f179.google.com with SMTP id x24so5778513iak.24
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 10:54:43 -0800 (PST)
In-Reply-To: <20130131001454.07088360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

Hi Michael,

Sorry, it took a bit longer than expected.
Sometimes FOSDEM is not good for the progress of free software ;-)

On Thu, Jan 31, 2013 at 1:14 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> This rather lengthy list of patches updates Atari EtherNAT and EtherNEC
> network support, plus adds USB driver support for the ISP1160 chip found on
> EtherNAT and NetUSBee adapters.
>
> Network stuff:
>  1  declare original EtherNEC driver obsolete
>  2  declare original EtherNAT driver obsolete
>  3  use CONFIG_ATARI in smc91x.h
>  4  change number of interrupt sources to include EtherNAT interrupts
>  5  fix EtherNAT interrupt number, conditionalize platform device register
>  6  add platform support for EtherNEC
>  7  EtherNAT ethernet support using new driver - smc91x.c
>  8  EtherNEC ethernet support using new driver - ne.c
>  9  IRQ: add handle_polled_irq for timer based software interrupts
> 10  use dedicated irq_chip for timer D interrupts
> 11  add interrupt chip definition for EtherNAT
> 12  remove unnecessary cruft from Atari interrupt setup
>
> USB related:
> 13  implement 16 bit access macros for ROM port ISA adapters
> 14  Implement ndelay based on the existing udelay code
> 15  add platform device definitions for ISP1160 drivers
> 16  Add ISP1160 USB host controller support for EtherNAT/NetUSBee
> 17  NetUSBee tweaks for ISP1160 USB HCD driver

Here are my general comments for this series:
  - Please run scripts/checkpatch.pl on your patches. 12 out of 17 have style
    problems. Some of them you do want to fix for your next submission.
  - You can use the --compose option of "git send-email" to write a separate
    introductory email (i.e. the "[PATCH 0/17]" one).
  - I don't know what went wrong with "git send-email", but the actual subjects
    of the emails ended up in the bodies, too.
  - For upstream submission, several of the patches should be folded into
    older commits. As you based your series on m68k-queue, you can run

        git rebase -i v3.8-rc5 [top]

    to strip out the unrelated commits and fold/reorder/fix/clean up the rest.
      - As you sent your patches on Jan 31, I assume m68k-queue was based on
        v3.8-rc5 at the time you created the patches
      - If your commits are on the current branch, the "top" is optional.
        Else it would be your queue branch (e.g. for me that's "m68k-queue",
        "for-linus", "for-next", or a more specific "for-vX.Y").

> You may well decide to leave out #9 - use of EtherNEC and NetUSBee is then possible
> only with the 'noirqdebug' kernel option.

Yeah, this is something that should be sorted out with Thomas Gleixner
on lkml (CC added
for path 09/17).

> With the present code, the timer D interrupt frequency is approximately 100 Hz. On fast
> hardware, it should probably be doubled (change the timer D counter value fron 254 to 123
> to achieve that. I had the timer rate adjustable via kernel options in an earlier
> incarnation pf the ethernet drivers - whoever feels like it can revive that bit please).

Perhaps you can derive it from CPU frequency, i.e. loops_per_jiffy?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
