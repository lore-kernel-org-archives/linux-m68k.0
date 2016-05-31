From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 31 May 2016 14:52:11 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1605311429500.12286@nippy.intranet>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL>
 <22217.61083.254294.356622@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41281 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbcEaExR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 31 May 2016 00:53:17 -0400
In-Reply-To: <22217.61083.254294.356622@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sun, 21 Feb 2016, Mikael Pettersson wrote:

> I've done two git bisects on this.  The first one was inconclusive 
> (pointed to a harmless commit), but the second one ended up with:
> 
> # first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)
> 
> That's a big pile of VM changes, so I think it could be the culprit.

I think this issue may date back to v2.6.38 or earlier.

The redhat.com bug report was closed in 2012 but Fedora users were still 
seeing the problem after it was supposedly fixed.
  https://bugzilla.redhat.com/show_bug.cgi?id=712019

That page also has a link to the bug report for Ubuntu:
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/484045

BTW, I came across this recently: "Rik van Riel pointed out that [the 
kswapd thread] tends to be slow for [the purpose of compaction], and it 
can get stuck in a shrinker somewhere waiting for a lock."
  http://lwn.net/Articles/684611/

Perhaps a stack trace would help to ascertain whether this is the same 
known bug or not (?)

-- 
