From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Sun, 19 Jan 2014 11:56:07 +0100
Message-ID: <CAMuHMdXFPO61ds2sN_ZjTgxFchH5gJX2rNP-6KYWq-nvaDCdkw@mail.gmail.com>
References: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:48045 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbaASK4I (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Jan 2014 05:56:08 -0500
Received: by mail-pa0-f48.google.com with SMTP id kx10so4319871pab.21
        for <linux-m68k@vger.kernel.org>; Sun, 19 Jan 2014 02:56:07 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jan 12, 2014 at 2:56 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> For SCC initialization we cannot assume that the control register is in
> the correct state to accept a register pointer. So first read from the
> control register in order to "sync" up.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks, applied and queued for 3.14.

We can decide about the stableness after it has been merged into
upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
