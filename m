From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver, version 3
Date: Thu, 14 Jan 2010 14:38:39 +0100
Message-ID: <10f740e81001140538n67710bfr17d131a8f4b25137@mail.gmail.com>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>
	 <10f740e81001071312p451de3c0r93d8d9d2782abde8@mail.gmail.com>
	 <alpine.LNX.2.00.1001102340340.22574@nippy.intranet>
	 <alpine.OSX.2.00.1001110325430.620@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f209.google.com ([209.85.219.209]:43428 "EHLO
	mail-ew0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755420Ab0ANNiq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Jan 2010 08:38:46 -0500
Received: by ewy1 with SMTP id 1so38344ewy.28
        for <linux-m68k@vger.kernel.org>; Thu, 14 Jan 2010 05:38:42 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.1001110325430.620@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Sun, Jan 10, 2010 at 17:29, Finn Thain <fthain@telegraphics.com.au> wrote:
> Add platform driver support to the pmac-zilog driver, for m68k macs.
> Place the powermac-specific code inside #ifdef CONFIG_PPC_PMAC.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>
> This patch should be applied after "[PATCH 3/13] pmac-zilog: cleanup".
> It obsoletes "[PATCH 4/13] pmac-zilog, mac68k: replace mac68k SCC code
> with platform device" listed in the linux-ppc patchwork.
>
> Version 2 of this patch adopts Geert's suggestions: make better use of
> dev_{dbg,err,info} macros, change platform_driver_register() to
> platform_driver_probe(), and use __init and __exit attributes.
> Version 3 does not #include <macints.h>.

Thanks, applied.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
