From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: [PATCH] mac8390: fix regression caused during net_device_ops
	conversion
Date: Wed, 27 May 2009 10:49:18 +0200
Message-ID: <10f740e80905270149q2b906d53u8bf71b7d382a57a3@mail.gmail.com>
References: <Pine.LNX.4.64.0905260116120.18180@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f168.google.com ([209.85.220.168]:58876 "EHLO
	mail-fx0-f168.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755577AbZE0ItS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 May 2009 04:49:18 -0400
Received: by fxm12 with SMTP id 12so2656628fxm.37
        for <linux-m68k@vger.kernel.org>; Wed, 27 May 2009 01:49:19 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0905260116120.18180@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>, "David S. Miller" <davem@davemloft.net>

Hi Finn,

On Mon, May 25, 2009 at 17:36, Finn Thain <fthain@telegraphics.com.au> wrote:
> Changeset ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc broke mac8390 by adding
> 8390.o to the link. That meant that lib8390.c was included twice, once in
> mac8390.c and once in 8390.c, subject to different macros. This patch
> reverts that by avoiding the wrappers in 8390.c. They seem to be of no
> value since COMPAT_NET_DEV_OPS is going away soon.
>
> Tested with a Kinetics EtherPort card.

http://kisskb.ellerman.id.au/kisskb/buildresult/544582/
| drivers/built-in.o:(.rodata+0x1da6): undefined reference to `ei_poll'

Any chance this is related?

I cannot check it myself right now, as the power supply of my main
development machine blew up, taking down some vital motherboard components
with it.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
