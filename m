From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC III
Date: Fri, 22 Nov 2013 13:46:31 +0100
Message-ID: <CAMuHMdUJq7mZOCx2S2dNgzQX3CB5LqJ4b4QuQ2_Vxps3L_ryeg@mail.gmail.com>
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
	<CAMuHMdVVsKFFz4YcDeae8aia2Fc5JkjqsNdE-a_+ssPEndEuaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:52880 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755246Ab3KVMqc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Nov 2013 07:46:32 -0500
Received: by mail-pd0-f169.google.com with SMTP id v10so1216303pde.28
        for <linux-m68k@vger.kernel.org>; Fri, 22 Nov 2013 04:46:31 -0800 (PST)
In-Reply-To: <CAMuHMdVVsKFFz4YcDeae8aia2Fc5JkjqsNdE-a_+ssPEndEuaw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Nov 22, 2013 at 10:13 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Nov 21, 2013 at 11:02 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>>> Surprise 2: Instead of a deadly non-Mac driver, I found a deadly Mac driver.
>>> When passing "debug=ser", it crashes with:
>>
>> The __pmz_startup() crash could be expected regardless of "debug=ser", no?
>
> Yes, that's why I asked Thorsten if the image worked on ARAnyM.

I can trigger it on ARAnyM too, using "debug=par console=ttyS0".

init_pmz() doesn't crash because it re-checks pmz_ports_count after calling
pmz_probe().

pmz_console_init() doesn't do that, so it still registered the console, and
caused a crash later.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
