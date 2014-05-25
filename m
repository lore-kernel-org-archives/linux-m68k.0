From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/4] m68k: multi-platform EARLY_PRINTK
Date: Sun, 25 May 2014 14:14:06 +0200
Message-ID: <CAMuHMdWHnRngBybAJBDK9FTYZq000AvwF-2N3spH-z=J4_mMjw@mail.gmail.com>
References: <alpine.LNX.2.00.1404122341280.8333@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:39591 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbaEYMOH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 08:14:07 -0400
Received: by mail-ie0-f181.google.com with SMTP id rp18so5180800iec.12
        for <linux-m68k@vger.kernel.org>; Sun, 25 May 2014 05:14:06 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1404122341280.8333@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Apr 12, 2014 at 3:48 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> - drop __init attributes for both console struct and debug_cons_write() so
>   that MVME16x no longer needs special treatment. Unfortunately, this causes
>   WARNING: modpost: Found 1 section mismatch(es).
>   because debug_cons_write() is in .init.text.

We know that code is correct, so I'll fix that up by tagging
debug_cons_write() with __ref.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
