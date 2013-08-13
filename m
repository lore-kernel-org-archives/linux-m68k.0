From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Tue, 13 Aug 2013 10:58:25 +0200
Message-ID: <CAMuHMdXZb4RWKxxzLZpnzmYN02EaeqQJ9X0QHH6ty9sL_7P=bg@mail.gmail.com>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
	<Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
	<f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1308130810460.20692@herc.mirbsd.org>
	<8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:46208 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753895Ab3HMI60 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Aug 2013 04:58:26 -0400
Received: by mail-pa0-f43.google.com with SMTP id hz10so8608410pad.16
        for <linux-m68k@vger.kernel.org>; Tue, 13 Aug 2013 01:58:25 -0700 (PDT)
In-Reply-To: <8612ec946622122a048ec3805a30fef5@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Tue, Aug 13, 2013 at 10:31 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>> It really was Geert's work, I did not meaningfully contribute to th=
at.
>>
>> Hm okay. Let=E2=80=99s just hope Geert hurries up and accepts them i=
nto
>> his tree and pushes them to Linus, because that=E2=80=99s normally t=
he
>> requirement to get anything into the Debian kernel=E2=80=A6 not doin=
g so
>> seriously hinders my position.
>
> He's orders of magnitude faster than me. Not very difficult really :-=
)

He's just returned from holidays, working through the still-growing mai=
l backlog
while entertaining the kids and the household environment ;-)

>>> Having revived my Falcon, I should be in a position to test these.
>>
>> OK cool. The latter is only available now, having replaced the
>> former (but it WFM even on the buildd that uses btrfs).
>
> I can only test the interrupt patch part of it for now.

BTW, the interrupt patch only kills some messages at boot, right?
Or does (the lack of) it cause real errors later?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
