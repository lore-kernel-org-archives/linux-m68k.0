From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: current 2.6 on Q950
Date: Tue, 12 May 2009 22:10:47 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0905121332190.8193@loopy.telegraphics.com.au>
References: <BE30877A-3E70-11DE-B44C-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:47918 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753070AbZELMRn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 May 2009 08:17:43 -0400
In-Reply-To: <BE30877A-3E70-11DE-B44C-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org



On Mon, 11 May 2009, Riccardo wrote:

> Hi all,
> 
> 
> after several weeks/months I grabbed a kernel from here
> 
> 
> http://people.debian.org/~smarenka/d-i/m68k/images/daily/kernels/
> 
> and slapped it on my quadra 950.
> 
> Some good news: it boots!
> 
> And it hasn't crashed the past 2 hours of moderate use.
> 
> Now what is new?

The patches that I sent were merged into that release (2.6.29). So X11 
works again, and mac_esp supports both SCSI busses on the quadras 9x0.

> Can I test that soemthign was added/fixed? I noticed that the clock is 
> still wrong

I haven't heard anything more since you raised it on this mailing list 
back in October. I never implemented the workaround that was discussed at 
the time because I have more pressing bugs on my todo list, and because 
I'd like to try and figure out how the hardware works before resorting to 
workarounds...

> and that hard disk performance is still bad.

If dmesg says that PDMA is in use on scsi0 and scsi1, then I'm afraid it 
probably isn't going to get any faster. But performance should be 
comparable with NetBSD if not MacOS (though I never benchmarked either).

> I read there was some activity on the floppy driver, does it work on the 
> Q950?
> 
> 
> I read:
> [42949381.240000] Driver 'sd' needs updating - please use bus_type methods
> [42949381.330000] sd 0:0:0:0: [sda] 2055035 512-byte hardware sectors: (1.05 GB/1003 MiB)
> [42949381.350000] sd 0:0:0:0: [sda] Write Protect is off
> [42949381.360000] sd 0:0:0:0: [sda] Mode Sense: a3 00 10 08
> [42949381.370000] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> [42949381.380000] sd 0:0:0:0: [sda] 2055035 512-byte hardware sectors: (1.05 GB/1003 MiB)
> [42949381.400000] sd 0:0:0:0: [sda] Write Protect is off
> [42949381.410000] sd 0:0:0:0: [sda] Mode Sense: a3 00 10 08
> [42949381.420000] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> [42949381.430000]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6
> 
> driver needs updating ?

The sd driver is universal, it is not m68k specific. The "needs updating" 
warning is inconsequential.

Finn

> 
> bye,
>   Riccardo
> 
