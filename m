From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND 0/4] m68k: earlyprintk and debug console improvements
Date: Mon, 26 May 2014 22:55:43 +0200
Message-ID: <CAMuHMdXPuAWVYdpaCfRsdBMfgDXt13tz452TZdpL2d+_Mj00+g@mail.gmail.com>
References: <20140411053150.16F1E23CBB@kvm5.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:54365 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652AbaEZUzo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 May 2014 16:55:44 -0400
Received: by mail-ig0-f171.google.com with SMTP id c1so342122igq.16
        for <linux-m68k@vger.kernel.org>; Mon, 26 May 2014 13:55:44 -0700 (PDT)
In-Reply-To: <20140411053150.16F1E23CBB@kvm5.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Fri, Apr 11, 2014 at 7:27 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> I'm re-sending this series with signed-off-by and tested-by attribution.

Thanks!

I applied and queued for 3.16 the most recent versions:

[PATCH v2 1/4] m68k: toward platform agnostic framebuffer debug logging
[PATCH v3 2/4] m68k: multi-platform EARLY_PRINTK
[PATCH v2 3/4] m68k/mvme16x: adopt common boot console
[PATCH v2 4/4] m68k/atari: fix SCC initialization for debug

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
