From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 7 Apr 2015 10:06:39 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1504070954300.20378@nippy.intranet>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL>
 <551B6143.4030805@gmail.com> <alpine.LNX.2.00.1504011533340.23336@nippy.intranet> <5522F9D5.3080107@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:36604 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751421AbbDGAGt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Apr 2015 20:06:49 -0400
In-Reply-To: <5522F9D5.3080107@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 7 Apr 2015, Michael Schmitz wrote:

> Hi Finn,
> 
> > On Wed, 1 Apr 2015, Michael Schmitz wrote:
> >
> >   
> > > I've followed the vm stats while running gunzip -c on a large file. 
> > > I get an 'invalid compressed data' error at the very end of the 
> > > gunzip run, and the file md5sum does not match what I get when 
> > > uncompressing that file on another system with no error
> > >     
> >
> > Was that an aranym virtual machine or a physical one? If physical, can 
> > the error be reproduced using a virtual one (given same RAM size, 
> > kernel etc)?
> >   
> 
> The gunzip error cannot be reproduced on any of my ARAnyM VMs. Might be 
> a RAM error or other hardware related problem. Same kernel but 
> configured slightly different (added 030 and 040 support, plus ARAnyM 
> support).

The configuration differences could be cancelled by booting your new 
aranym kernel on the physical hardware, and reproducing the fault that 
way. BTW, is this the same physical machine that has DMA issues, which we 
discussed off-list in the past?

> 
> The general behaviour (gunzip eats up all free RAM, then kswapd spins 
> doing nothing very apparent, with no dirty pages to be flushed and 
> cached pages never released) remains the same. Though I've seen the 
> gunzip complete without kicking off kswapd on occasion (had set 
> dirty_background_ratio and dirty_ratio half the default for that).
> 
> And yes, dropping cached pages as Andreas suggested, does free up 
> significant (i.e. most of all) RAM and shuts up kswapd.

This bug has been reported to Red Hat in the past (on x86_64). They closed 
the bugzilla entry in 2011, but the bug was still being reported by Fedora 
users in 2014. https://bugzilla.redhat.com/show_bug.cgi?id=712019

-- 
