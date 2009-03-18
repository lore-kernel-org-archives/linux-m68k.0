From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] RTC updates for Amiga
Date: Wed, 18 Mar 2009 15:29:20 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0903181521590.9249@anakin>
References: <1046634024.1620.22.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:54592 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755278AbZCRO3Y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Mar 2009 10:29:24 -0400
In-Reply-To: <1046634024.1620.22.camel@kars.perseus.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Linux/m68k mailing list <linux-m68k@vger.kernel.org>

	Hi Kars,

On Sun, 2 Mar 2003 (yeah, that's a long time ago), Kars de Jong wrote:
> I got tired of my Amiga locking up every time when hwclock got run (see
> http://lists.linux-m68k.org/pipermail/linux-m68k/2002-January/000730.html for details) even with CONFIG_GEN_RTC_X=y in my .config, so I decided to look at the OKI website for the datasheet of the MSM6242RS clock (the one used in A2000 / A1200).

While looking into creating separate rtc-msm6242 (`A2000 RTC') and rtc-rp5c01
(`A3000 RTC') drivers, as per current RTC policy, I browsed through the various
Amiga schematics to identify RTC chips.

Surprisingly, I discovered a Ricoh RP5C01 (not an Oki MSM6242) on the A1200
schematics:
http://www.symbolengine.com/index.php/2007/04/21/amiga-1200-schematics-in-pdf-format/
Hence does arch/m68k/amiga/config.c:amiga_identify() handle the A1200
incorrectly?

It also seems the CDTV has a builtin MSM6242, while the CD32 hasn't any RTC,
like A1000/A500/A600. So ideally, we have to probe for RTC presence. I guess
for the MSM6242 we can use the existing loop (timeout = no MSM6242). What about
the RP5C01?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
