From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] amiflop: get rid of sleep_on calls
Date: Tue, 16 Dec 2008 21:23:00 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812162119330.29433@anakin>
References: <1228755578-26069-1-git-send-email-aeb@debian.org>
 <20081209082608.GA10651@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:54788 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759634AbYLPUXD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 16 Dec 2008 15:23:03 -0500
In-Reply-To: <20081209082608.GA10651@Redstar.dorchain.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joerg Dorchain <joerg@dorchain.net>
Cc: Andreas Bombe <aeb@debian.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 9 Dec 2008, Joerg Dorchain wrote:
> On Mon, Dec 08, 2008 at 04:59:38PM +0000, Andreas Bombe wrote:
> > The replacement for the unconditional sleep_on() in fd_motor_on() is a
> > complete_all() together with a INIT_COMPLETION() before the mod_timer()
> > call.  It appears to me that fd_motor_on() might be called concurrently
> > and fd_select() does not guarantee mutual exclusivity in the case the
> > same drive gets selected again.
> 
> Selecting the same drive repeatly does not matter. The selected
> drive is the one the next command or transfer applies to.
> 
> It is possible to select one drive, start the motor, select the
> next one, start the motor, as long as as trasnfer is tried until
> the drive is up to speed (either by signal or the timeout)
> 
> At first glance, the patch looks ok.

Does that mean I can add your Acked-by?

Anyway, I've applied it to my git repository (to be pushed to kernel.org soon).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
