From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Fri, 4 Apr 2014 17:08:40 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1404041625040.29768@nippy.intranet>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org> <8761mvl3jb.fsf@igel.home> <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com> <87a9c63x1c.fsf@igel.home> <CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
 <87txae2dt4.fsf@igel.home> <20140331235216.GA2109@mail.biophys.uni-duesseldorf.de> <CAMuHMdUeMv1R69vSLv0HZpKEgVpRUG_iMs=61JWVubBsSN7VVA@mail.gmail.com> <alpine.LNX.2.00.1404012153360.16187@nippy.intranet> <533E2A4A.2040107@iamscott.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48152 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751144AbaDDGJH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Apr 2014 02:09:07 -0400
In-Reply-To: <533E2A4A.2040107@iamscott.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Scott Holder <scott@iamscott.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>


On Thu, 3 Apr 2014, Scott Holder wrote:

> On 4/1/2014 8:23 AM, Finn Thain wrote:
> 
> > It may be possible to boot Linux with MacOS running in 24-bit mode, 
> > and ISTR that this leads to a large number of memory chunks. The 
> > Penguin documentation says use 32-bit mode (which means installing 
> > Mode32 if you have old MacOS and old ROMs). The only Mac I have here 
> > is running MacOS 7.6 so I can't test 24-bit mode. You can see the 
> > debug output from Penguin below.
> 
> I happen to have my crazy PearPC/Mac OS X-booting LC475 still up and 
> running with a 7.5.5 system folder on it. I rebooted it into 24-bit mode 
> and loading Penguin does give a warning that 32-bit mode works better. 
> Attempting to boot generates:
> 
> *** Too many memory ranges!!!
> Error:
> *** setup_ram_mappings() failure - too many mappings

>From the Penguin source, MMU/MMU_V2.c, that means more than 32 chunks.

> 
> I have a 64mb simm in this LC475; I tried popping it out (leaving me 
> with 4mb) and it actually did attempt to unpack the kernel, but there's 
> too little memory to do it. I have a bagful of smaller 72-pin simms 
> kicking around somewhere; I'll have to dig it out of the closet and try 
> it again.

You should be able to get Penguin to list the mappings even when it 
doesn't have room to unpack a kernel.

But there's probably no need: it seems highly likely that you'd see  
no 16 MB chunk on a 16 MB machine in 24-bit mode.

Finn
