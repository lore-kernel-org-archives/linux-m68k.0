From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Sun, 25 Aug 2013 20:49:22 +0200
Message-ID: <CAMuHMdUMAfYbj=Bh6WnFC2qZH1O-9UDSRCGAKDpO=v0aPV9C_A@mail.gmail.com>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org>
	<Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
	<f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
	<CAMuHMdWNHyTUYrcn9M2wn5-1+KYi+momBKHE2t9y4zXAEvygrw@mail.gmail.com>
	<Pine.BSM.4.64L.1308221903570.2722@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:46457 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755645Ab3HYStX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Aug 2013 14:49:23 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so2581704pbc.31
        for <linux-m68k@vger.kernel.org>; Sun, 25 Aug 2013 11:49:22 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1308221903570.2722@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Thu, Aug 22, 2013 at 9:07 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
>>Anyone who has tried this on real iron? I haven't (on Amiga).
>
> FWIW, that patch was in Debian linux-image-3.10-2-m68k
> so everyone who successfully booted that counts.
>
> Scott Holder booted it on his Macintosh AFAIR.

Applied and queued for 3.12


-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
