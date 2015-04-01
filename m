From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 01 Apr 2015 16:08:51 +1300
Message-ID: <551B6143.4030805@gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>	<mvm1tuv6dhk.fsf@hawking.suse.de>	<21426.40682.197715.245775@gargle.gargle.HOWL>	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:33718 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbbDADJD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 31 Mar 2015 23:09:03 -0400
Received: by pacgg7 with SMTP id gg7so38593595pac.0
        for <linux-m68k@vger.kernel.org>; Tue, 31 Mar 2015 20:09:01 -0700 (PDT)
In-Reply-To: <21786.40688.53001.509365@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Mikael,
>  > has anyone found a solution to this one?
>  > 
>  > 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet.
>  > Unpacking a large tarball tends to trigger this for me.
>
> Alas, no.  I went back to the 3.10.xx kernels and they work Ok for me
> (they tend to hang during shutdown, but I can live with that).
>   

I've followed the vm stats while running gunzip -c on a large file. I 
get an 'invalid compressed data' error at the very end of the gunzip 
run, and the file md5sum does not match what I get when uncompressing 
that file on another system with no error

As long as that file will fit into available memory, all that happens is 
kswapd0 and/or kswapd1 running forever after gunzip has finished. kswapd 
running full tilt appears to coincide with the number of free pages 
hitting the min_free_kbytes limit. The number of dirty pages never grows 
very large (hovers around 1000, less than 1% of RAM size) and remains 
below the nr_dirty_threshold (10800) and nr_dirty_background_threshold 
(5400) limits at all time. (Both limits progressively shrink over time - 
is that normal?).

If I force the VM to only use part of the RAM (by setting 
min_free_kbytes to say 10% of RAM size), the system becomes unresponsive 
as soon as the limit is reached. The swap tasks start to eat substantial 
amounts of CPU once the number of free pages approaches  that limit , 
nr_dirty drops at that time, and nr_dirty_threshold as well as 
nr_dirty_background_threshold begin to rise again  - above the initial 
values, in fact.
> I should do a git bisect...
>   

Would be nice to be able to force this a lot quicker. I'll try with 
smaller files to uncompress, and larger min_free limit.

Cheers,

    Michael

> /Mikael
>
>  > 
>  > Cheers,
>  > 
>  >   Michael
>  > 
>  > 
>  > On Tue, Jul 1, 2014 at 11:43 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
>  > > Andreas Schwab writes:
>  > >  > Mikael Pettersson <mikpelinux@gmail.com> writes:
>  > >  >
>  > >  > > Reverting to 3.12.16 completely eliminates these problems.
>  > >  >
>  > >  > Even 3.11 has the kswapd0 cpu hog problem.
>  > >
>  > > Hmm, I just got the kswapd0 CPU hog on 3.12.16 too (while compiling
>  > > java code during a gcc package rebuild).
>  > >
>  > > So kernels >= 3.11 have the kswapd0 CPU hog bug, and kernels >= 3.13
>  > > also have the ksoftirdq/0 CPU hog bug.
>  > >
>  > > What's the last known-good kernel? 3.10?
>  > > --
>  > > To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>  > > the body of a message to majordomo@vger.kernel.org
>  > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
