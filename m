From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Mon, 19 Aug 2013 14:01:45 +0200
Message-ID: <CAMuHMdXrs5mc5xSWZPfvfNzp3dHDARYN2nWMAMH7Q4jvgRUUqg@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
	<52108CAF.1010700@gmail.com>
	<CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com>
	<5211DBD8.5090801@gmail.com>
	<521205C3.1060807@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:63287 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751694Ab3HSMBp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Aug 2013 08:01:45 -0400
Received: by mail-pd0-f173.google.com with SMTP id p10so5100878pdj.18
        for <linux-m68k@vger.kernel.org>; Mon, 19 Aug 2013 05:01:45 -0700 (PDT)
In-Reply-To: <521205C3.1060807@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Aug 19, 2013 at 1:47 PM, Tuomas Vainikka
<tuomas.vainikka@aalto.fi> wrote:
> Is it possible that the problem is with memory alignment?

Not here:

[ 2549.540000] zorro_esp: esp_count = 2,  dma_count = 2, addr =
0x7fbe1000. Writing.
[ 2549.540000] esp: esp0: Reconnect IRQ2 timeout

addr = 0x7fbe1000, which is even PAGE_SIZE aligned.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
