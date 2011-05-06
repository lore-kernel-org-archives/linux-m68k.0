From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Fri, 6 May 2011 20:42:40 +1200
Message-ID: <BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
References: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
	<BANLkTimLx0PkUUhL+HY1vDoL=SB5QZPweQ@mail.gmail.com>
	<BANLkTikrv3HpX47sGbLH462-WKO0bTqMXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:36020 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754216Ab1EFImk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 May 2011 04:42:40 -0400
Received: by pwi15 with SMTP id 15so1340776pwi.19
        for <linux-m68k@vger.kernel.org>; Fri, 06 May 2011 01:42:40 -0700 (PDT)
In-Reply-To: <BANLkTikrv3HpX47sGbLH462-WKO0bTqMXg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi again,

> I've installed gpm but all I ever get when I move the mouse is
> keyboard overruns. Does that ring a bell, anyone?

Looks like I need to move the mouse real slow - it appears the patch
is still needed. Moving the mouse down moves the cursor up. The
buttons are reversed as well.

I'll have to put the actual input interface call in a tasklet perhaps,
to shorten the time spent in the mouse interrupt handler.

Cheers,

  Michael
