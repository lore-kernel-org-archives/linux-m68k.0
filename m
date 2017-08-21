From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Don't hang waiting for Cuda power-down command
Date: Mon, 21 Aug 2017 11:58:22 +0200
Message-ID: <CAMuHMdUsNpUktdVihW-umrbFWLCtYT4QJ7BdeHdKvs9fO4kr6g@mail.gmail.com>
References: <alpine.LNX.2.00.1708121021180.1762@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:35213 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751894AbdHUJ6X (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2017 05:58:23 -0400
Received: by mail-pg0-f45.google.com with SMTP id u191so22791699pgc.2
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2017 02:58:23 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1708121021180.1762@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Aug 12, 2017 at 9:11 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Testing shows that the CUDA_POWERDOWN command never completes (for a
> Centris 660av or LC 475, at least). So, don't wait for command completion
> on those Cuda-based models that do not support soft power. Just proceed to
> log the usual message, "It is now safe to turn off your Macintosh."
>
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thank you, applied and queued for v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
