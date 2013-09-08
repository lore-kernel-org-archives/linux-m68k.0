From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [000/121] 3.2.51-rc1 review
Date: Sun, 8 Sep 2013 10:18:33 +0200
Message-ID: <CAMuHMdW6TGdfi+FH=hRWY_hhs5Cb5N9xV1OL0O9Dcs+PfXm2xA@mail.gmail.com>
References: <lsq.1378608720.401499712@decadent.org.uk>
	<522C22DB.9080008@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:63166 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab3IHISe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Sep 2013 04:18:34 -0400
In-Reply-To: <522C22DB.9080008@roeck-us.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Greg Ungerer <gerg@uclinux.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Sep 8, 2013 at 9:10 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> m68k-linux-ld: error: no memory region specified for loadable section
> `.note.gnu.build-id'

I can't seem to find an explicit fix for that since v3.2.
Perhaps the fix is a side effect of f84f52a5c15db7d14a534815f27253b001735183
("m68knommu: clean up linker script").

Greg, any idea?

> Details are at http://server.roeck-us.net:8010/builders.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
