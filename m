From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/12] m68k/atari: USB - add platform devices for
 EtherNAT/NetUSBee ISP1160 HCD
Date: Mon, 26 Aug 2013 12:18:32 +0200
Message-ID: <CAMuHMdUK_bc1Kodws0gbHJnpXuxm6eCsE1HRteWYGD4Zto2rdg@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
	<1365208006-16227-12-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:61833 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732Ab3HZKSd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 26 Aug 2013 06:18:33 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so3288558pde.37
        for <linux-m68k@vger.kernel.org>; Mon, 26 Aug 2013 03:18:32 -0700 (PDT)
In-Reply-To: <1365208006-16227-12-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c

> +static struct resource isp1160_resources[] = {
> +       [0] = {
> +               .name   = "isp1160-data",
> +               .start  = ATARI_USB_PHYS_ADDR,
> +               .end    = ATARI_USB_PHYS_ADDR + 0x1,
> +               .flags  = IORESOURCE_MEM,

Shouldn't this be IORESOURCE_IO?

> +       },
> +       [1] = {
> +               .name   = "isp1160-regs",
> +               .start  = ATARI_USB_PHYS_ADDR + 0x4,
> +               .end    = ATARI_USB_PHYS_ADDR + 0x5,
> +               .flags  = IORESOURCE_MEM,

Ditto.

> +       },

I have in /proc/iomem:

00000340-00000341 : isp1160-data
00000360-00000361 : isp1160-regs
00684000-00783fff : ST-RAM Pool
  00684000-006cffff : atafb
  006d0000-006d3fff : ataflop
  006d4000-006d4fff : SCSI
fff00000-fff0003f : falconide

and in /proc/ioports:

00000300-0000031f : rtl8019-regs

Sorry for not noticing before.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
