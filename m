From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k, gcc 4.2.4 internal compiler error: in find_reloads_address_1
Date: Mon, 3 Nov 2008 08:33:18 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811030832480.5437@anakin>
References: <621d098f0811021053t125f7231na46af9a59767927e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:54962 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754895AbYKCHdU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Nov 2008 02:33:20 -0500
In-Reply-To: <621d098f0811021053t125f7231na46af9a59767927e@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jan Dittmer <jdi@l4x.org>
Cc: linux-m68k@vger.kernel.org

On Sun, 2 Nov 2008, Jan Dittmer wrote:
> Also, with which
> version are you guys currently compiling?

I'm using a cross compiler built from Debian sources:

gcc version 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
