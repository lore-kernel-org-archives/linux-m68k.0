From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Any plans to move over to arch/m68k/include?
Date: Tue, 25 Nov 2008 21:36:37 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811252134180.1823@anakin>
References: <20081125201135.GB7128@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:33682 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752007AbYKYUgj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Nov 2008 15:36:39 -0500
In-Reply-To: <20081125201135.GB7128@uranus.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org, uClinux list <uclinux-dev@uclinux.org>

On Tue, 25 Nov 2008, Sam Ravnborg wrote:
> Almost all other architectures has moved over to arch/$ARCH/include
> 
> Are you planning to do so for m68k for next merge window?

So far _I_ don't have those plans.

> Remaining ones: frv, h8300, m32r, m68k and mn10300
> The other are done or have patches queued for next merge window to do so.
> 
> Can I be of any help?

However, m68k keeps working fine after `mv include/asm-m68k
arch/m68k/include/asm'. The problem is m68knommu, which includes header files
from m68k. The m68k and m68knommu headers have to be merged first, cfr. Arnd
Bergmann's comments and suggestions on linux-arch a while ago.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
