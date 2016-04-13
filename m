From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 13 Apr 2016 20:57:08 +0200
Message-ID: <22286.38532.235484.509180@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
	<22217.61083.254294.356622@gargle.gargle.HOWL>
	<CAMuHMdU0=hvrnoR60dgvrYZC6_OrupAYeugsEsrwCS5HhGhMRg@mail.gmail.com>
	<22235.55934.43914.623042@gargle.gargle.HOWL>
	<CAMuHMdVsg_q=oe8=U531VFvi471FdeWm4mXRoAgfrAo-Y6PaOA@mail.gmail.com>
	<22235.63087.441832.558429@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33713 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932218AbcDMS5N (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Apr 2016 14:57:13 -0400
Received: by mail-lf0-f68.google.com with SMTP id p64so8821634lfg.0
        for <linux-m68k@vger.kernel.org>; Wed, 13 Apr 2016 11:57:12 -0700 (PDT)
In-Reply-To: <22235.63087.441832.558429@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Mikael Pettersson writes:
 > Geert Uytterhoeven writes:
 >  > Hi Mikael,
 >  > 
 >  > On Sun, Mar 6, 2016 at 8:21 AM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 >  > > Geert Uytterhoeven writes:
 >  > >  > On Sun, Feb 21, 2016 at 6:06 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
 >  > >  > > # first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)
 >  > >  > >
 >  > >  > > That's a big pile of VM changes, so I think it could be the culprit.
 >  > >  >
 >  > >  > So git bisect pointed to the merge commit itself, not to any of the commits in
 >  > >  > the akpm branch?
 >  > >  >
 >  > >  > I redid that merge myself, and the result is the same as ac4de9543aca5.
 >  > >  > There could still be a semantical merge conflict that cannot be detected by
 >  > >  > git, though.
 >  > >  >
 >  > >  > Could you try cherry-picking the 36 commits from the akpm branch and
 >  > >  > bisecting that?
 >  > >  > I.e.
 >  > >  >     git checkout 26935fb06ee88f11
 >  > >  >     git cherry-pick 26935fb06ee88f11..de32a8177f64bc62
 >  > >  >     git bisect start
 >  > >  >     git bisect bad
 >  > >  >     git bisect good 26935fb06ee88f11
 >  > >
 >  > > I ran these exact commands and restarted my bisection + test loop.
 >  > >
 >  > > However, git told me it had some 50000+ commits to go through in 16 steps,
 >  > > so it looks like it selected a much larger range than those 36 commits.
 >  > 
 >  > Are you sure you did exactly that?
 >  > 
 >  > $ git checkout 26935fb06ee8
 >  > [...]
 >  > $ git cherry-pick 26935fb06ee88f11..de32a8177f64bc62
 >  > [...]
 >  > $ git bisect start
 >  > $ git bisect bad
 >  > $ git bisect good 26935fb06ee88f11
 >  > Bisecting: 17 revisions left to test after this (roughly 4 steps)
 >  > [8969e7b3b3302ea668d300d0fa593108003b908b] mm: memcg: do not trap
 >  > chargers with full callstack on OOM
 >  > $
 > 
 > Yes, I copy-pasted those commands exactly.  However, git got confused
 > because I didn't 'git bisect reset' first.  Now it has the correct
 > range to bisect :-)

First bisection run completed:

5ee28828d1b5f8d036dc5793be5321dd6f26d344 is the first bad commit
commit 5ee28828d1b5f8d036dc5793be5321dd6f26d344
Author: Michal Hocko <mhocko@suse.cz>
Date:   Thu Sep 12 15:13:26 2013 -0700

    memcg: enhance memcg iterator to support predicates

    The caller of the iterator might know that some nodes or even subtrees
    should be skipped but there is no way to tell iterators about that so the
    only choice left is to let iterators to visit each node and do the
    selection outside of the iterating code.  This, however, doesn't scale
    well with hierarchies with many groups where only few groups are
    interesting.

    This patch adds mem_cgroup_iter_cond variant of the iterator with a
    callback which gets called for every visited node.  There are three
    possible ways how the callback can influence the walk.  Either the node is
    visited, it is skipped but the tree walk continues down the tree or the
    whole subtree of the current group is skipped.

    [hughd@google.com: fix memcg-less page reclaim]
    Signed-off-by: Michal Hocko <mhocko@suse.cz>
    Cc: Balbir Singh <bsingharora@gmail.com>
    Cc: Glauber Costa <glommer@openvz.org>
    Cc: Greg Thelen <gthelen@google.com>
    Cc: Johannes Weiner <hannes@cmpxchg.org>
    Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
    Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
    Cc: Michel Lespinasse <walken@google.com>
    Cc: Tejun Heo <tj@kernel.org>
    Cc: Ying Han <yinghan@google.com>
    Signed-off-by: Hugh Dickins <hughd@google.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

:040000 040000 46799adf458e8a2db998ef099dae907af03e1595 29638de8593a98add32f56fb9aea16cd8227f6a4 M      include
:040000 040000 27e4202d2f2a785e35454ef93e75919997219130 8c5973443d35e65eb88a0155b2c78bf90c650a21 M      mm

I'll reset and re-bisect with the known bad points pre-seeded.

/Mikael
