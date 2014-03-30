From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/4] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Sun, 30 Mar 2014 21:11:19 +0200
Message-ID: <CAMuHMdXBHrh8ZP5mU2VaRkbsssf0_NHKWdh_e27gMGJZtWj5WQ@mail.gmail.com>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<1396137686-32678-2-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57183 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbaC3TLU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Mar 2014 15:11:20 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so7241506pbb.33
        for <linux-m68k@vger.kernel.org>; Sun, 30 Mar 2014 12:11:19 -0700 (PDT)
In-Reply-To: <1396137686-32678-2-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Sun, Mar 30, 2014 at 1:01 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> +               pr_debug("atari_stram pool: size = %lu bytes, resource = %pR\n",
> +                       pool_size, &stram_pool);
> +               pr_debug("atari_stram pool: start = %p, end = %p\n",
> +                       (void *) stram_pool.start, (void *) stram_pool.end);

Please drop this line, as it prints more or less the same as the %pR in the
line above. Also in the other block.

> +               pr_debug("atari_stram pool: stram_virt_offset = %p\n",
> +                       (void *) stram_virt_offset);

Please use "%lx", and drop the cast to "void *". Also in the other block.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
