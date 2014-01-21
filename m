From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: v3.13 panic in init_bootmem_core
Date: Tue, 21 Jan 2014 11:27:36 +0100
Message-ID: <CAMuHMdUcGzFsnaxpLfvhEXyHc79c7e7Hd6RjmSFj1nk++zS00g@mail.gmail.com>
References: <87sishiqmg.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:39732 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754467AbaAUK1h (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Jan 2014 05:27:37 -0500
Received: by mail-pb0-f49.google.com with SMTP id up15so7675044pbc.36
        for <linux-m68k@vger.kernel.org>; Tue, 21 Jan 2014 02:27:36 -0800 (PST)
In-Reply-To: <87sishiqmg.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Tue, Jan 21, 2014 at 11:19 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> When trying to boot 3.13 with the attached .config in aranym I get a
> panic during init_bootmem_core once I try to set FastRAM to anything
> bigger than 256.  With 3.12 and pretty much the same config I could go
> up to 932 while still having enough room in ST-RAM for the frame buffer.
> The static kernel size only grew by about 45k.

Can you please post the panic message?

At first sight, I don't see a relevant difference with the .config I'm using.
Did the kernel size grow above 4 MiB? If not, can you please bisect?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
