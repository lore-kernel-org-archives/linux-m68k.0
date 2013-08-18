From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 11:10:13 +0200
Message-ID: <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
	<52108CAF.1010700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:33366 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753397Ab3HRJKN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 05:10:13 -0400
Received: by mail-pb0-f52.google.com with SMTP id wz12so3683713pbc.25
        for <linux-m68k@vger.kernel.org>; Sun, 18 Aug 2013 02:10:13 -0700 (PDT)
In-Reply-To: <52108CAF.1010700@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Aug 18, 2013 at 10:58 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> I'll also need to check the command_block and command_block_dma addresses -
> does the DMA require virtual or physical addresses?

Physical, of course.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
