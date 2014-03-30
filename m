From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] m68k/atari - atafb: convert allocation of fb ram to
 new interface
Date: Sun, 30 Mar 2014 21:11:39 +0200
Message-ID: <CAMuHMdUYgm315Dgrp=xK1bVk1fRF_yjTsHdiMXM1ffJXqp+VzQ@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<1396137686-32678-3-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:46541 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbaC3TLk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Mar 2014 15:11:40 -0400
Received: by mail-pb0-f50.google.com with SMTP id md12so7227459pbc.37
        for <linux-m68k@vger.kernel.org>; Sun, 30 Mar 2014 12:11:39 -0700 (PDT)
In-Reply-To: <1396137686-32678-3-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Sun, Mar 30, 2014 at 1:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> @@ -3166,13 +3167,13 @@ int __init atafb_init(void)
>                 memset(screen_base, 0, mem_req);
>                 pad = -(unsigned long)screen_base & (PAGE_SIZE - 1);
>                 screen_base += pad;
> -               real_screen_base = screen_base + ovsc_offset;
> +               real_screen_base = (void *) atari_stram_to_phys(screen_base + ovsc_offset);

I think real_screen_base should be renamed to e.g. "phys_screen_base",
and changed to "unsigned long", so you can drop the above cast (and a few
more while assigning it to fix->smem_start).

This will also expose that ATAFB_EXT is broken, and what needs to be
done to fix it (follow the chain of casts, phys addresses are unsigned long,
virt addresses are void *).

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
