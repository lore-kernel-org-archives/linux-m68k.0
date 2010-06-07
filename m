From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 0/11] m68k: Atari EtherNAT Updates
Date: Mon, 07 Jun 2010 07:10:50 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006070703040.17584@zirkon.biophys.uni-duesseldorf.de>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
 <alpine.DEB.2.00.1006060547550.1329@zirkon.biophys.uni-duesseldorf.de>
 <AANLkTinusfjUBq9fjzLuqv5ZXjdTO1ZC3Qu-eZ8Hsg1z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:55565 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751619Ab0FGFKx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Jun 2010 01:10:53 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0L3M00D00P23IZ00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Mon, 07 Jun 2010 07:10:51 +0200 (MEST)
In-reply-to: <AANLkTinusfjUBq9fjzLuqv5ZXjdTO1ZC3Qu-eZ8Hsg1z@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> > Was my backwards compatibility patch to the kernel ld script ever applied?
> 
> No, at that time I didn't have time to look into it, and later you
> said the (one) computer with that
> toolchain had died (so you were going to use a newer one?).

I tried to build a newer one but got stuck (crosstool seems no longer 
maintained, that's what I used last time). Then the disk with all the m68k stuff 
on it died. I've found some info on Ubuntus bug pages on getting 4.4 to build as 
cross compiler, I'll try again using that for starters. 

> > Lots of patches - much appreciated!
> 
> Eventually, the EtherNAT support should be merged with the standard
> driver anyway,,,

But for the polled interrupt kludge I agree. Last time I checked the interrupt 
to use for the EtherNAT is beyond what we currently reserve in the Atari 
interrupt map, so I'd have to change the max number of interrupts - what are the 
repercussions for doing this? 

	Michael
