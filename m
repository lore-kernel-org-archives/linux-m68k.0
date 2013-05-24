From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Fri, 24 May 2013 15:06:16 +0200
Message-ID: <CAMuHMdXheob0JJS4yWLRDU0rW56RT-rJ_G4vODW7xBWZghsr5Q@mail.gmail.com>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
	<alpine.LNX.2.00.1305241705020.3487@nippy.intranet>
	<CAMuHMdX5hqLUXqUZqhUqB7ErR5sR_-7FNxC2i6M__h0_L9M7Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:38827 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754732Ab3EXNGQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 May 2013 09:06:16 -0400
Received: by mail-pd0-f180.google.com with SMTP id 14so1705257pdc.39
        for <linux-m68k@vger.kernel.org>; Fri, 24 May 2013 06:06:16 -0700 (PDT)
In-Reply-To: <CAMuHMdX5hqLUXqUZqhUqB7ErR5sR_-7FNxC2i6M__h0_L9M7Wg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Fri, May 24, 2013 at 2:59 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> However, hp300 doesn't set mach_beep, so I'll disable it on hp300.

I meant INPUT_MISC, it doesn't set INPUT+M68K_BEEP.
However, the former is needed for HP_SDC_RTC.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
