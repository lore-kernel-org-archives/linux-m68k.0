From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Wed, 1 Apr 2015 15:45:41 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1504011533340.23336@nippy.intranet>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL>
 <551B6143.4030805@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:39619 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbDAEqM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Apr 2015 00:46:12 -0400
In-Reply-To: <551B6143.4030805@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Wed, 1 Apr 2015, Michael Schmitz wrote:

> Hi Mikael,
> > > has anyone found a solution to this one?
> > > 
> > > 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet. 
> > > Unpacking a large tarball tends to trigger this for me.
> >
> > Alas, no.  I went back to the 3.10.xx kernels and they work Ok for me 
> > (they tend to hang during shutdown, but I can live with that).
> >   
> 
> I've followed the vm stats while running gunzip -c on a large file. I 
> get an 'invalid compressed data' error at the very end of the gunzip 
> run, and the file md5sum does not match what I get when uncompressing 
> that file on another system with no error

Was that an aranym virtual machine or a physical one? If physical, can the 
error be reproduced using a virtual one (given same RAM size, kernel etc)?

-- 
