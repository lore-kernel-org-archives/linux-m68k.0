From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND 4/4] m68k/atari: fix SCC initialization for debug console
Date: Mon, 26 May 2014 11:28:24 +0200
Message-ID: <CAMuHMdXHWrusZSpfNkT03Q_vgSraoO535Un-Cazxmy6JQxzn6Q@mail.gmail.com>
References: <20140411052757.888960081@telegraphics.com.au>
	<20140411052759.169790206@telegraphics.com.au>
	<538301BA.1070605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:34720 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751957AbaEZJ2Z (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 05:28:25 -0400
Received: by mail-ie0-f178.google.com with SMTP id rl12so7450837iec.37
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 02:28:24 -0700 (PDT)
In-Reply-To: <538301BA.1070605@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, May 26, 2014 at 10:56 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> +       /* Wait for 5 PCLK cycles, which is about 63 CPU cycles */
>> +       /* 5 / 7.9872 MHz = approx. 0.63 us = 63 / 100 MHz */
>
> The original Falcon and TT had a 16 MHz CPU clock IIRC.

This loop is meant to introduce a minimum delay, right? So assuming
a 100 MHz CPU will only prolong the delay on slower CPUs, which is safe.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
