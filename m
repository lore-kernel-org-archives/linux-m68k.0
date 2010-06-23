From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] rtc: rp5c01 - Add NVRAM support
Date: Wed, 23 Jun 2010 21:55:27 +0200
Message-ID: <AANLkTikdDZf1zvgtu3DjuMoabHBo43zY6H_AUKn0Q5Qz@mail.gmail.com>
References: <alpine.DEB.2.00.1006131208470.18415@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:46702 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736Ab0FWTza (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2010 15:55:30 -0400
In-Reply-To: <alpine.DEB.2.00.1006131208470.18415@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Arno Griffioen <arno.griffioen@ieee.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, rtc-linux@googlegroups.com, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Jun 13, 2010 at 12:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The Ricoh RP5C01 RTC contains 26 x 4 bits of NVRAM.
> Provide access to it via a sysfs "nvram" attribute file.

I also created a small tool to correct NVRAM checksums, interprete the
contents, and
modify individual NVRAM fields on Amiga 3000/4000.
You can find it at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/amiga-nvram.git.

BTW, does anyone (Arno?) know the meaning of the AMIX-specific bits (32-63)?
battmembitsamix.h just says "See Amix documentation for these bit definitions".
I also couldn't find anything about it at http://www.amigaunix.com/.

Thx!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
