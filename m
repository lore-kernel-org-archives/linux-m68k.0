From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Thu, 20 Mar 2014 09:35:32 +0100
Message-ID: <CAMuHMdXOwhE9WU1QK2mjHbwwA4iaS1vsROPNgLwR0ggz9ruW9Q@mail.gmail.com>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
	<CAMuHMdXksY0Sfq-AN-1hi42=-yHYqgRnH0RM5z0k2oR-hPcOtQ@mail.gmail.com>
	<532AA57E.70506@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:48495 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756244AbaCTIfd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 20 Mar 2014 04:35:33 -0400
Received: by mail-pd0-f169.google.com with SMTP id fp1so610297pdb.0
        for <linux-m68k@vger.kernel.org>; Thu, 20 Mar 2014 01:35:33 -0700 (PDT)
In-Reply-To: <532AA57E.70506@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

On Thu, Mar 20, 2014 at 9:23 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>> Instead of mucking around with ioremap (which appears to
>>> rely on the physical area being mappped by mem_init), use
>>>
>>
>>
>> That's not true. E.g. I/O memory is never mapped by mem_init().
>
> Why, then, does the ioremap() of ST-RAM fail? Because the physical address
> is lower than the lowest currently mapped physical address?

I don't know. How does it fail?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
