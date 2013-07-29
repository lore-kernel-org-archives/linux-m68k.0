From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Mon, 29 Jul 2013 23:52:29 +0200
Message-ID: <CAMuHMdVF8HntVUiV7vBU7ZDwyjXbnpn=NiM05O60ewtz5S=KKw@mail.gmail.com>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:46816 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755318Ab3G2Vw3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Jul 2013 17:52:29 -0400
Received: by mail-pd0-f176.google.com with SMTP id q10so2758393pdj.7
        for <linux-m68k@vger.kernel.org>; Mon, 29 Jul 2013 14:52:29 -0700 (PDT)
In-Reply-To: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jul 24, 2013 at 12:51 AM, Thorsten Glaser <tg@debian.org> wrote:
> - nfeth: says "No such device" upon insmod

You're lucky. When insmodding nfeth.ko, my ARAnyM just terminates with:

Gotcha! Illegal memory access. Atari PC = $968c
If the Full History was enabled you would see the last 20 instructions here.

With my patch, insmod works again, and the network works, too.
AFAIK you cannot have two physical memory blocks with ARAnyM, so using
a copy on the stack should be safe.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus TorvaldsIf the Full History
was enabled you would see the last 20 instructions here.
