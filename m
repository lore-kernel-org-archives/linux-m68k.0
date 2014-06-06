From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Fri, 6 Jun 2014 15:11:20 +0200
Message-ID: <21393.48632.521704.579850@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<CAMuHMdXhnaHEfF2VV+QiSGFrZxNvbMDSujM+eOwh4eQX3p7xRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:50129 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791AbaFFNLZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jun 2014 09:11:25 -0400
Received: by mail-la0-f54.google.com with SMTP id pv20so1533742lab.13
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jun 2014 06:11:23 -0700 (PDT)
In-Reply-To: <CAMuHMdXhnaHEfF2VV+QiSGFrZxNvbMDSujM+eOwh4eQX3p7xRw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven writes:
 > Hi Mikael,
 > 
 > On Fri, Jun 6, 2014 at 1:38 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 > > Since updating my ARAnym VMs from 3.12.16 to 3.13.11 I see kswapd0
 > > and ksoftirqd/0 consume inordinate amounts of CPU.  kswapd0 often
 > > rises to about 30-50% CPU even though RAM shouldn't be anywhere near
 > > depleted (768GB, a gcc bootstrap running in a screen session).
 > > kswapd0 tends to stay this way until I drop caches, but doing that
 > > doesn't always fix it.  I also sometimes see ksoftirqd/0 consume
 > > 5-30% CPU.
 > >
 > > Reverting to 3.12.16 completely eliminates these problems.
 > 
 > Any chance to bisect it?
 > 
 > > I haven't tested 3.14 or 3.15-rc yet.
 > 
 > Would be good to know, though, as it may have been fixed.
 > However, as v3.13.11 is the most recent stable version of v3.13, this may be
 > an elsewhere unknown and thus unfixed issue.

I've just started a gcc-4.8 bootstrap on 3.14.5, and then I'll try 3.15
if it isn't fixed in 3.14.  If 3.15 too is broken, I'll do the bisect,
but it will be a slow process since it takes anywhere from a few hours
to a couple of days for the bug to appear.

BTW, the presence of some unknown bug causing kswapd0 to hog the CPU has
been mentioned on the Debian m68k list earlier this year.

/Mikael
