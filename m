From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Sun, 18 Aug 2013 11:42:59 +0200
Message-ID: <CAMuHMdUZEX424oHtdTdeeG-4oa0pAjrxVUkD=g=5xu4YFmvhTQ@mail.gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
	<520D4AE3.6040801@aalto.fi>
	<520E76FC.9040803@aalto.fi>
	<11425cb5ec432e2fbb7b675052e8b33d@gmail.com>
	<520F5F81.7090409@aalto.fi>
	<52102BEC.7000006@gmail.com>
	<CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com>
	<52108CAF.1010700@gmail.com>
	<52109087.5070702@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33446 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751600Ab3HRJnA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Aug 2013 05:43:00 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so3551909pab.35
        for <linux-m68k@vger.kernel.org>; Sun, 18 Aug 2013 02:42:59 -0700 (PDT)
In-Reply-To: <52109087.5070702@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Aug 18, 2013 at 11:14 AM, Tuomas Vainikka
<tuomas.vainikka@aalto.fi> wrote:
> The original blz1230 / blz2060 drivers did PIO commands. I attached a log of
> modprobing first without interrupt messages and then with the interrupt
> messages, because, indeed, the zorro_esp_irq_pending function gets called a
> lot, and it takes forever to printk those messages. I have no idea about the

You can use WARN_RATELIMIT() instead to avoid flooding the screen
with the same values.
printk_ratelimit() is similar, but it uses a single instance of the
ratelimit state,
i.e. you cannot use it to limit two different value sets.

> correct iomappings for the registers, nor do I know about the correct sizes
> for them. I have no idea where to use physical addresses and where to use
> virtual addresses...

When the CPU accesses memory, you have to use virtual addresses.
When the DMA engine accesses memory, it has to use physical addresses.

Typically the DMA API is used to do the conversion
> What is the difference between ioremap() and ZTWO_VADDR() and which one
> should be used where?

ioremap() is the generic way to map hardware registers into the CPU's virtual
address space.

As the 16 MiB Zorro II address space is always mapped, you can use
ZTWO_VADDR() for Zorro II addresses instead. This macro converts from
physical Zorro II addresses to virtual kernel addresses.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
