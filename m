From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Sat, 7 May 2011 20:39:12 +1200
Message-ID: <BANLkTim06Pjxz0b-4Zp=NFq-=DAQkop+5Q@mail.gmail.com>
References: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
	<BANLkTimLx0PkUUhL+HY1vDoL=SB5QZPweQ@mail.gmail.com>
	<BANLkTikrv3HpX47sGbLH462-WKO0bTqMXg@mail.gmail.com>
	<BANLkTi=NcU7Z5qg-tZHkPaiYKTRXO-B-qg@mail.gmail.com>
	<alpine.OSX.2.00.1105062051380.193@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:33117 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923Ab1EGIjM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 May 2011 04:39:12 -0400
Received: by pxi16 with SMTP id 16so2710766pxi.4
        for <linux-m68k@vger.kernel.org>; Sat, 07 May 2011 01:39:12 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1105062051380.193@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

>> I'll have to put the actual input interface call in a tasklet perhaps,
>> to shorten the time spent in the mouse interrupt handler.
>
> The input interface overhead is cheap enough with ADB so I don't think
> that's the problem. The printk(KERN_DEBUG "Keyboard overrun\n") in the
> interrupt handler would be costly though. The comments in atakeyb.c could
> be taken to mean that overruns are expected from fast mouse movements...

That's always been the case but it's not been quite as bad in old kernels.

Moving input syncing  and even reporting of mouse movement into a
software interrupt does not appear to help much. Not generating the
keyboard overun message does help a bit but there's a lot of
'unhandled scancode 7d' messages still happening. These can be
suppressed in the atakbd.c driver.

I'll give the various options a bit more testing - not sure the added
complexity of using a work queue is worth the effort.

Cheers,

  Michael
