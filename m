From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 11 Jun 2014 10:20:05 +0200
Message-ID: <21400.4405.66016.755599@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<CAMuHMdXhnaHEfF2VV+QiSGFrZxNvbMDSujM+eOwh4eQX3p7xRw@mail.gmail.com>
	<21393.48632.521704.579850@gargle.gargle.HOWL>
	<21395.4655.114256.170707@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:60728 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003AbaFKIUJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jun 2014 04:20:09 -0400
Received: by mail-la0-f51.google.com with SMTP id gf5so4676591lab.10
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2014 01:20:08 -0700 (PDT)
In-Reply-To: <21395.4655.114256.170707@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Mikael Pettersson writes:
 > Mikael Pettersson writes:
 >  > Geert Uytterhoeven writes:
 >  >  > Hi Mikael,
 >  >  > 
 >  >  > On Fri, Jun 6, 2014 at 1:38 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 >  >  > > Since updating my ARAnym VMs from 3.12.16 to 3.13.11 I see kswapd0
 >  >  > > and ksoftirqd/0 consume inordinate amounts of CPU.  kswapd0 often
 >  >  > > rises to about 30-50% CPU even though RAM shouldn't be anywhere near
 >  >  > > depleted (768GB, a gcc bootstrap running in a screen session).
 >  >  > > kswapd0 tends to stay this way until I drop caches, but doing that
 >  >  > > doesn't always fix it.  I also sometimes see ksoftirqd/0 consume
 >  >  > > 5-30% CPU.
 >  >  > >
 >  >  > > Reverting to 3.12.16 completely eliminates these problems.
 >  >  > 
 >  >  > Any chance to bisect it?
 >  >  > 
 >  >  > > I haven't tested 3.14 or 3.15-rc yet.
 >  >  > 
 >  >  > Would be good to know, though, as it may have been fixed.
 >  >  > However, as v3.13.11 is the most recent stable version of v3.13, this may be
 >  >  > an elsewhere unknown and thus unfixed issue.
 >  > 
 >  > I've just started a gcc-4.8 bootstrap on 3.14.5, and then I'll try 3.15
 >  > if it isn't fixed in 3.14.
 > 
 > 3.14.5 is also affected by the bug.  Dropping caches fixed kswapd0, but
 > instead ksoftirqd/0 jumped to 20-40%, and it refuses to calm down.

3.15-rc8 is also affected.  It took a while before triggering, but I just
got a kswapd0 CPU hog there too.  Dropping page cache helped this time.

Another observation is that ksoftirqd/0 seem to consistently consume much
more CPU in 3.14/3.15 than in 3.12.  Usually not hugely so at specific time
points, but the accumulated CPU for it on a system that's been up a couple
of days with constant load is looking a bit scary.
