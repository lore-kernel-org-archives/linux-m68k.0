From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k-queue
Date: Sat, 18 May 2013 11:48:22 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305181106280.20776@nippy.intranet>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com> <5191FC4C.8010707@biophys.uni-duesseldorf.de> <alpine.LNX.2.00.1305151727470.10554@nippy.intranet> <CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
 <alpine.LNX.2.00.1305161226500.12344@nippy.intranet> <CAOmrzk+_RijrcSCYmAofwi5_0RgF_uUMbQqm_nz1NLq1UUq9Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37249 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751306Ab3ERBsb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 May 2013 21:48:31 -0400
In-Reply-To: <CAOmrzk+_RijrcSCYmAofwi5_0RgF_uUMbQqm_nz1NLq1UUq9Tw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 17 May 2013, Michael Schmitz wrote:

> 
> It appears there has been testing on recent kernels and continued 
> improvement of hardware support - what is the latest kernel version that 
> you or others tested?

The most recent kernel that I tested was 3.2, with the patches I was 
working on at the time. Those patches went into 3.3, but they aren't 
important for 68040 machines.

Hardware support for most Quadras was stable for a couple of years prior 
to 3.2. Please see http://mac.linux-m68k.org/status/

> 
> I've lost track - does the current unstable/experimental debian-ports 
> distribution boot and install on Macs?

I haven't tested Thorsten's current images. But if they work on '040 
Aranym, I can see no reason why they wouldn't work on '040 Macs. 
(Excepting those Macs with the buggy 68LC040 chip revision.)

I did boot Thorsten's work successfully on a PowerBook 540 a while back (I 
used ATAoE because of SCSI issues but SONIC ethernet DMA is faster than 
local disk controllers anyway). I forget whether it was a debootstrap or 
chroot.

The CD-ROM images at people.debian.org/~smarenka didn't work last time I 
tried.

> Shame there's no such thing as 060 accelerator for Macs, but with 040 
> models it might be feasible.

The DMA support in the SONIC ethernet driver and the PDMA support in the 
ESP SCSI driver help a lot. Given 256 MB of RAM, a Quadra 950 would be a 
good option.

Finn
