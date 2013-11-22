From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC III
Date: Fri, 22 Nov 2013 10:13:43 +0100
Message-ID: <CAMuHMdVVsKFFz4YcDeae8aia2Fc5JkjqsNdE-a_+ssPEndEuaw@mail.gmail.com>
References: <mcII9-2Ep-5@gated-at.bofh.it>
	<mdhPA-3Y1-15@gated-at.bofh.it>
	<52824A09.3060906@gmail.com>
	<CAMuHMdUJTx3pRzW8xewbhq+yow5CbXNKix2Za5kUqP5m7kv-Dg@mail.gmail.com>
	<Pine.BSM.4.64L.1311121708580.2989@herc.mirbsd.org>
	<5282DE78.2000109@iamscott.net>
	<alpine.LNX.2.00.1311170913380.6636@nippy.intranet>
	<5289723D.5090509@iamscott.net>
	<CAMuHMdUz=cJK7VTgvL3-4BWOqK-kP4ge5LD6v1snsRtkL3aNiw@mail.gmail.com>
	<1f16cd3b6538d850d32c3f8274fd8688@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1311192205430.3217@nippy.intranet>
	<89f415777a8134f27561668e8fb56d65@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1311212023220.17773@nippy.intranet>
	<CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
	<alpine.LNX.2.00.1311220823360.25790@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:64867 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638Ab3KVJNo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Nov 2013 04:13:44 -0500
Received: by mail-pb0-f54.google.com with SMTP id un15so1048368pbc.13
        for <linux-m68k@vger.kernel.org>; Fri, 22 Nov 2013 01:13:44 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1311220823360.25790@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Nov 21, 2013 at 11:02 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> Surprise 2: Instead of a deadly non-Mac driver, I found a deadly Mac driver.
>> When passing "debug=ser", it crashes with:
>
> The __pmz_startup() crash could be expected regardless of "debug=ser", no?

Yes, that's why I asked Thorsten if the image worked on ARAnyM.

> I wonder why no-one else reported it?

No one managed to boot those kernels far enough to notice? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
