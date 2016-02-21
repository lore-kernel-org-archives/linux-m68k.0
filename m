From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Sun, 21 Feb 2016 18:06:35 +0100
Message-ID: <22217.61083.254294.356622@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36309 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbcBURhS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 21 Feb 2016 12:37:18 -0500
Received: by mail-lf0-f51.google.com with SMTP id 78so80859474lfy.3
        for <linux-m68k@vger.kernel.org>; Sun, 21 Feb 2016 09:37:16 -0800 (PST)
In-Reply-To: <21786.40688.53001.509365@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Mikael Pettersson writes:
 > Michael Schmitz writes:
 >  > Hi,
 >  > 
 >  > has anyone found a solution to this one?
 >  > 
 >  > 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet.
 >  > Unpacking a large tarball tends to trigger this for me.
 > 
 > Alas, no.  I went back to the 3.10.xx kernels and they work Ok for me
 > (they tend to hang during shutdown, but I can live with that).
 > 
 > I should do a git bisect...

I've done two git bisects on this.  The first one was inconclusive
(pointed to a harmless commit), but the second one ended up with:

# first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)

That's a big pile of VM changes, so I think it could be the culprit.

Are people still seeing the kswapd bug with current kernels?  I've
stayed with the 3.10 kernel series on my aranym VMs, except for the
one VM that did the bisection tests.

/Mikael
