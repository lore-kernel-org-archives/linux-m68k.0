From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC v3 02/24] m68k/atari: Move Atari-specific code out of drivers/char/nvram.c
Date: Mon, 29 Jun 2015 09:26:56 +0200
Message-ID: <CAMuHMdUY2pM4N3Uddo2TecNo2BL4t-7VVDY=2wrgsqomVnCXFg@mail.gmail.com>
References: <20150628014159.732792697@telegraphics.com.au>
	<20150628014200.233057221@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35160 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824AbbF2H04 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Jun 2015 03:26:56 -0400
In-Reply-To: <20150628014200.233057221@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi Finn,

On Sun, Jun 28, 2015 at 3:42 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Change the vmode calculation from logical OR to bitwise OR, since it is
> obviously wrong.

Ideally, that should be a separate patch we can put on the fast track.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
