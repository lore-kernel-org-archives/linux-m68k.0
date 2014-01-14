From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Wed, 15 Jan 2014 08:15:41 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1401150731340.6166@nippy.intranet>
References: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet> <CAMuHMdXtAzA_UPJS_OaMSSxGE493uqGGCNVwy_RMrNoPBxxmDw@mail.gmail.com> <alpine.LNX.2.00.1401141907220.12677@nippy.intranet> <CAMuHMdWuGPjyU_7fQKzgFsjm2w5wH38rSi_8ct7OiskZkrz+ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47953 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbaANVRF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jan 2014 16:17:05 -0500
In-Reply-To: <CAMuHMdWuGPjyU_7fQKzgFsjm2w5wH38rSi_8ct7OiskZkrz+ng@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 14 Jan 2014, Geert Uytterhoeven wrote:

> 
> > I'm unsure about submitting this to -stable. I don't like the idea 
> > that the first debian user to boot a powerbook might see a crash 
> > (depending on bootloader etc). But not all stable trees carry df66834a 
> > which is a prerequisite. This patch is only applicable to 3.4.y and >= 
> > 3.9.y. Can you nominate particular stable trees?
> 
> Sure, just add it to the comment, cfr. 
> Documentation/stable_kernel_rules.txt:

Yes. I read the docs before I wrote.

> 
>  - If the patch requires other patches as prerequisites which can be 
>    cherry-picked than this can be specified in the following format in 
>    the sign-off area:
> 
>      Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
>      Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
>      Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
>      Cc: <stable@vger.kernel.org> # 3.3.x

I didn't want the commit to be cherry-picked as it's already there (under 
different commit IDs) in some stable trees.

The prerequisite commit is df66834a in mainline (merged in 3.10). It is 
known as f64747c9 in 3.9.y and 8cfd67a3 in 3.4.y.

I only checked the trees in linux-stable.git which is not exhaustive but 
there are some stable trees that don't have it at all.

Perhaps it would be best to request that the new patch only gets applied 
where the prerequisite patch was already in mainline, i.e. >= 3.10.

Finn

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
