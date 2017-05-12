From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] fix race in drivers/char/random.c:get_reg()
Date: Fri, 12 May 2017 09:16:20 +0200
Message-ID: <CAMuHMdVPJNVp-KpO+QBpx_JO3JyC76DMOSGLQ40dP8Yh0LgTfA@mail.gmail.com>
References: <1493538561-5075-1-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34265 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756087AbdELHQV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 12 May 2017 03:16:21 -0400
In-Reply-To: <1493538561-5075-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Theodore Tso <tytso@mit.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Apr 30, 2017 at 9:49 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> get_reg() can be reentered on architectures with prioritized interrupts
> (m68k in this case), causing f->reg_index to be incremented after the
> range check. Out of bounds memory access past the pt_regs struct results.
> This will go mostly undetected unless access is beyond end of memory.
>
> Prevent the race by disabling interrupts in get_reg().
>
> Tested on m68k (Atari Falcon, and ARAnyM emulator).
>
> Kudos to Geert Uytterhoeven for helping to trace this race.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

No comments from anyone?

Perhaps this wasn't clear, but (a) an access beyond end of memory crashes
the system, and (b) this is reproducible on Atari systems.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
