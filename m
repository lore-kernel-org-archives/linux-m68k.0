From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: network interface on amcore board
Date: Mon, 31 Oct 2016 09:01:11 +0100
Message-ID: <CAMuHMdUOWZRffrytiP-6sB4SB1gcA=Vv9pc9u4PFzdMrMF16Ow@mail.gmail.com>
References: <1e301293-ea8d-5cf3-9561-336b634659ea@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35121 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761932AbcJaIBN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2016 04:01:13 -0400
Received: by mail-oi0-f67.google.com with SMTP id v84so4270088oie.2
        for <linux-m68k@vger.kernel.org>; Mon, 31 Oct 2016 01:01:12 -0700 (PDT)
In-Reply-To: <1e301293-ea8d-5cf3-9561-336b634659ea@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On Mon, Oct 31, 2016 at 8:26 AM, Angelo Dureghello <angelo@sysam.it> wrote:
> i have still a last issue open on mcf5307-based "amcore"
> board i would like to fix, and need a suggestion:
>
> at design time, i wired the 32bit parallel data bus from cpu to
> the ethernet chip as "straight" (D0 to D0, ... D32 to D32).
>
> dm9000 driver btw works for little-endian cpu only. To have it
> working, i actually keep a byte "swap" patch in the driver.
>
> Since i guess i cannot pretend any driver patch for this case,
> i am planning a new pcb version with 32bit data bus bytes swapped
> in hardware.
>
> What do you think ?

BenH has written some excellent background information about this:
Big and Little Endian inside / out
https://www.linuxplumbersconf.org/2012/wp-content/uploads/2012/09/2012-lpc-ref-big-little-endian-herrenschmidt.odp
https://www.youtube.com/watch?v=oBSuXP-1Tc0

Happy reading!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
