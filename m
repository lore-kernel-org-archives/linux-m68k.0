From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mac68k: another mac_defconfig update
Date: Fri, 4 Jun 2010 07:52:12 +0200
Message-ID: <AANLkTilswEeKMZSvos3mM5kxN7rpMwKxtpGxYeOV8GBd@mail.gmail.com>
References: <alpine.OSX.2.00.1006041506550.278@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:37597 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751815Ab0FDFwO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Jun 2010 01:52:14 -0400
Received: by wyi11 with SMTP id 11so585658wyi.19
        for <linux-m68k@vger.kernel.org>; Thu, 03 Jun 2010 22:52:12 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1006041506550.278@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Fri, Jun 4, 2010 at 07:11, Finn Thain <fthain@telegraphics.com.au> wrote:
> Another update for mac_defconfig (tested more thoroughly now): enable SWIM
> driver, enable generic RTC, and disable more of the obscure and
> experimental stuff.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>
> Geert, if you would prefer I will fold this into the previous defconfig
> patch and resubmit.

No problem, I can fold it myself.

Thx, I will apply this and your other recent patches!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
