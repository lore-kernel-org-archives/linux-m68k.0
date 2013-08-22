From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Thu, 22 Aug 2013 19:27:12 +0200
Message-ID: <CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
	<Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
	<f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:40849 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753016Ab3HVR1N convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Aug 2013 13:27:13 -0400
Received: by mail-pd0-f175.google.com with SMTP id q10so2137664pdj.20
        for <linux-m68k@vger.kernel.org>; Thu, 22 Aug 2013 10:27:12 -0700 (PDT)
In-Reply-To: <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Tue, Aug 13, 2013 at 9:57 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> =E2=80=A2 this interrupt patch
>
> Having revived my Falcon, I should be in a position to test these.

Anyone who has tried this on real iron? I haven't (on Amiga).

The merge window may open this weekend (but I wouldn't be surprised
if there was one more rc).

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
