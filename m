From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream and debian-kernel
Date: Wed, 27 Mar 2013 09:19:28 +0100
Message-ID: <CAMuHMdX1A_hc4UgeOyJBaGY-AFfH09wjtoQV-pKg5GLXidAJGA@mail.gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
	<Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
	<51515889.6040106@uter.be>
	<5152996E.50800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:36995 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757093Ab3C0IT3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Mar 2013 04:19:29 -0400
Received: by mail-ia0-f174.google.com with SMTP id b35so7024325iac.19
        for <linux-m68k@vger.kernel.org>; Wed, 27 Mar 2013 01:19:29 -0700 (PDT)
In-Reply-To: <5152996E.50800@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Wouter Verhelst <w@uter.be>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2012.bluespice.org>

On Wed, Mar 27, 2013 at 8:02 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> I've split the commit introducing the timer D handling to use
> handle_simple_irq in the first instance,
> and switch to handle_polled_irq in a separate commit. We can leave out that
> one (and the commit
> introducing handle_polled_irq) for upstream submission for now, and revisit
> the issue once we have
> feedback from linux-kernel and linux-netdev. I'd also leave out the USB

Good!

> patches for now - the changes
> to the ISP116x driver are far too intrusive for my taste.

OK. Do you want me to skip these as well?

> Geert: only patches touching code outside arch/m68k have to go to
> linux-netdev?

Indeed.

And the USB changes have to go to  linux-usb@vger.kernel.org instead ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
