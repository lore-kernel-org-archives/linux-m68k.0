From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Sun, 6 Mar 2016 10:20:47 +0100
Message-ID: <22235.63087.441832.558429@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
	<22217.61083.254294.356622@gargle.gargle.HOWL>
	<CAMuHMdU0=hvrnoR60dgvrYZC6_OrupAYeugsEsrwCS5HhGhMRg@mail.gmail.com>
	<22235.55934.43914.623042@gargle.gargle.HOWL>
	<CAMuHMdVsg_q=oe8=U531VFvi471FdeWm4mXRoAgfrAo-Y6PaOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:36044 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145AbcCFJUv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Mar 2016 04:20:51 -0500
Received: by mail-lb0-f173.google.com with SMTP id x1so101879713lbj.3
        for <linux-m68k@vger.kernel.org>; Sun, 06 Mar 2016 01:20:50 -0800 (PST)
In-Reply-To: <CAMuHMdVsg_q=oe8=U531VFvi471FdeWm4mXRoAgfrAo-Y6PaOA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven writes:
 > Hi Mikael,
 > 
 > On Sun, Mar 6, 2016 at 8:21 AM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 > > Geert Uytterhoeven writes:
 > >  > On Sun, Feb 21, 2016 at 6:06 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 > >  > > # first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)
 > >  > >
 > >  > > That's a big pile of VM changes, so I think it could be the culprit.
 > >  >
 > >  > So git bisect pointed to the merge commit itself, not to any of the commits in
 > >  > the akpm branch?
 > >  >
 > >  > I redid that merge myself, and the result is the same as ac4de9543aca5.
 > >  > There could still be a semantical merge conflict that cannot be detected by
 > >  > git, though.
 > >  >
 > >  > Could you try cherry-picking the 36 commits from the akpm branch and
 > >  > bisecting that?
 > >  > I.e.
 > >  >     git checkout 26935fb06ee88f11
 > >  >     git cherry-pick 26935fb06ee88f11..de32a8177f64bc62
 > >  >     git bisect start
 > >  >     git bisect bad
 > >  >     git bisect good 26935fb06ee88f11
 > >
 > > I ran these exact commands and restarted my bisection + test loop.
 > >
 > > However, git told me it had some 50000+ commits to go through in 16 steps,
 > > so it looks like it selected a much larger range than those 36 commits.
 > 
 > Are you sure you did exactly that?
 > 
 > $ git checkout 26935fb06ee8
 > [...]
 > $ git cherry-pick 26935fb06ee88f11..de32a8177f64bc62
 > [...]
 > $ git bisect start
 > $ git bisect bad
 > $ git bisect good 26935fb06ee88f11
 > Bisecting: 17 revisions left to test after this (roughly 4 steps)
 > [8969e7b3b3302ea668d300d0fa593108003b908b] mm: memcg: do not trap
 > chargers with full callstack on OOM
 > $

Yes, I copy-pasted those commands exactly.  However, git got confused
because I didn't 'git bisect reset' first.  Now it has the correct
range to bisect :-)

/Mikael
