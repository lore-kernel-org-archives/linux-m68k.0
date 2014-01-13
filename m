From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Mon, 13 Jan 2014 16:47:26 +0100
Message-ID: <CAMuHMdXtAzA_UPJS_OaMSSxGE493uqGGCNVwy_RMrNoPBxxmDw@mail.gmail.com>
References: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:39183 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874AbaAMPr1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jan 2014 10:47:27 -0500
Received: by mail-pd0-f172.google.com with SMTP id z10so2204868pdj.31
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jan 2014 07:47:26 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Sun, Jan 12, 2014 at 2:56 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> For SCC initialization we cannot assume that the control register is in
> the correct state to accept a register pointer. So first read from the
> control register in order to "sync" up.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thaks for your patch!

> ---
>
> This patch fixes a boot failure (presumably caused by unhandled SCC
> interrupt) on PowerBook 180 with CONFIG_EARLY_PRINTK and with the
> bootloader not configured to wake up the serial ports. AFAIK this happens
> only on PowerBooks. Even with this fix, Penguin still has to wake the
> serial ports or else they don't function on PowerBooks like this one.

IMHO the above should be part of the patch description (i.e. above the
three dashes), as it contains valuable information. Is that OK for you?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
