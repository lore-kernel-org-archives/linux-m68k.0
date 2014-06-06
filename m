From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Fri, 6 Jun 2014 13:43:53 +0200
Message-ID: <CAMuHMdXhnaHEfF2VV+QiSGFrZxNvbMDSujM+eOwh4eQX3p7xRw@mail.gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:44424 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750921AbaFFLnz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jun 2014 07:43:55 -0400
Received: by mail-lb0-f182.google.com with SMTP id z11so1457733lbi.27
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jun 2014 04:43:53 -0700 (PDT)
In-Reply-To: <21393.43065.207399.530921@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Mikael,

On Fri, Jun 6, 2014 at 1:38 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
> Since updating my ARAnym VMs from 3.12.16 to 3.13.11 I see kswapd0
> and ksoftirqd/0 consume inordinate amounts of CPU.  kswapd0 often
> rises to about 30-50% CPU even though RAM shouldn't be anywhere near
> depleted (768GB, a gcc bootstrap running in a screen session).
> kswapd0 tends to stay this way until I drop caches, but doing that
> doesn't always fix it.  I also sometimes see ksoftirqd/0 consume
> 5-30% CPU.
>
> Reverting to 3.12.16 completely eliminates these problems.

Any chance to bisect it?

> I haven't tested 3.14 or 3.15-rc yet.

Would be good to know, though, as it may have been fixed.
However, as v3.13.11 is the most recent stable version of v3.13, this may be
an elsewhere unknown and thus unfixed issue.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
