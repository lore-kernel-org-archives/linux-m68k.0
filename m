From: Mikael Pettersson <mikpelinux@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 31 May 2016 12:06:34 +0200
Message-ID: <22349.25130.697316.272584@gargle.gargle.HOWL>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
	<22217.61083.254294.356622@gargle.gargle.HOWL>
	<alpine.LNX.2.00.1605311429500.12286@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35436 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbcEaKGj (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 31 May 2016 06:06:39 -0400
Received: by mail-lf0-f67.google.com with SMTP id q63so6788792lfi.2
        for <linux-m68k@vger.kernel.org>; Tue, 31 May 2016 03:06:38 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1605311429500.12286@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Finn Thain writes:
 > 
 > On Sun, 21 Feb 2016, Mikael Pettersson wrote:
 > 
 > > I've done two git bisects on this.  The first one was inconclusive 
 > > (pointed to a harmless commit), but the second one ended up with:
 > > 
 > > # first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)
 > > 
 > > That's a big pile of VM changes, so I think it could be the culprit.
 > 
 > I think this issue may date back to v2.6.38 or earlier.
 > 
 > The redhat.com bug report was closed in 2012 but Fedora users were still 
 > seeing the problem after it was supposedly fixed.
 >   https://bugzilla.redhat.com/show_bug.cgi?id=712019
 > 
 > That page also has a link to the bug report for Ubuntu:
 >   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/484045
 > 
 > BTW, I came across this recently: "Rik van Riel pointed out that [the 
 > kswapd thread] tends to be slow for [the purpose of compaction], and it 
 > can get stuck in a shrinker somewhere waiting for a lock."
 >   http://lwn.net/Articles/684611/
 > 
 > Perhaps a stack trace would help to ascertain whether this is the same 
 > known bug or not (?)
 > 
 > -- 

FWIW, my latest round(s) of bisects identified the following:

fdbadebec27cc92358ed4f593e8763cf10b82687 is the first bad commit
commit fdbadebec27cc92358ed4f593e8763cf10b82687
Author: Li Zefan <lizefan@huawei.com>
Date:   Thu Sep 12 15:13:19 2013 -0700

    memcg: remove redundant code in mem_cgroup_force_empty_write()

    vfs guarantees the cgroup won't be destroyed, so it's redundant to get a
    css reference.

    Signed-off-by: Li Zefan <lizefan@huawei.com>
    Acked-by: Michal Hocko <mhocko@suse.cz>
    Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
    Cc: Johannes Weiner <hannes@cmpxchg.org>
    Cc: Tejun Heo <tj@kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

:040000 040000 1f6b5b056995067c7c60e6f87e9cd1f181e8fbeb ea29d63e70ce2320e144fac7b157a146d41360bf M      mm

This appears to be the first commit in the merge (git bisect refuses to
bisect before it), so either it's it or the problem predates the merge.
