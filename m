From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove CONFIG_EARLY_PRINTK dependency on
 CONFIG_EMBEDDED, default to n
Date: Fri, 31 May 2013 11:17:21 +0200
Message-ID: <CAMuHMdVwcH6r3zCK8=R+fu-wL_ZtuJJyHFau42DKmEz9BnWijQ@mail.gmail.com>
References: <alpine.LNX.2.00.1305291630520.10197@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:54170 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754660Ab3EaJRW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 31 May 2013 05:17:22 -0400
Received: by mail-pb0-f41.google.com with SMTP id xb12so1900228pbc.0
        for <linux-m68k@vger.kernel.org>; Fri, 31 May 2013 02:17:22 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1305291630520.10197@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, May 29, 2013 at 8:53 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Allow CONFIG_EARLY_PRINTK without requiring both CONFIG_EMBEDDED and
> CONFIG_DEBUG. Default to disabled.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks, applied and queued for 3.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
