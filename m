From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Fri, 6 May 2011 21:13:09 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1105062051380.193@ibook.intranet>
References: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com> <BANLkTimLx0PkUUhL+HY1vDoL=SB5QZPweQ@mail.gmail.com> <BANLkTikrv3HpX47sGbLH462-WKO0bTqMXg@mail.gmail.com> <BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:58025 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646Ab1EFLMe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 May 2011 07:12:34 -0400
In-Reply-To: <BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 6 May 2011, Michael Schmitz wrote:

> Hi again,
> 
> > I've installed gpm but all I ever get when I move the mouse is 
> > keyboard overruns. Does that ring a bell, anyone?
> 
> Looks like I need to move the mouse real slow - it appears the patch is 
> still needed. Moving the mouse down moves the cursor up. The buttons are 
> reversed as well.
> 
> I'll have to put the actual input interface call in a tasklet perhaps, 
> to shorten the time spent in the mouse interrupt handler.

The input interface overhead is cheap enough with ADB so I don't think 
that's the problem. The printk(KERN_DEBUG "Keyboard overrun\n") in the 
interrupt handler would be costly though. The comments in atakeyb.c could 
be taken to mean that overruns are expected from fast mouse movements...

Finn

> 
> Cheers,
> 
>   Michael
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
