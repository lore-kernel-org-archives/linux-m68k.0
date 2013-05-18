From: Brad Boyer <flar@allandria.com>
Subject: Re: m68k-queue
Date: Sat, 18 May 2013 00:50:10 -0700
Message-ID: <20130518075010.GB26647@cynthia.pants.nu>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com>
 <5191FC4C.8010707@biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.1305151727470.10554@nippy.intranet>
 <CAOmrzkL89CrBL1O8EPyS6ivwn947KmgQzJ2mJH=7T5mzpM2ajw@mail.gmail.com>
 <alpine.LNX.2.00.1305161226500.12344@nippy.intranet>
 <CAOmrzk+_RijrcSCYmAofwi5_0RgF_uUMbQqm_nz1NLq1UUq9Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cynthia.allandria.com ([76.245.85.235]:40973 "EHLO
	cynthia.pants.nu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267Ab3ERHuR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 May 2013 03:50:17 -0400
Content-Disposition: inline
In-Reply-To: <CAOmrzk+_RijrcSCYmAofwi5_0RgF_uUMbQqm_nz1NLq1UUq9Tw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, May 17, 2013 at 10:40:17AM +1200, Michael Schmitz wrote:
> I've lost track - does the current unstable/experimental debian-ports
> distribution boot and install on Macs? Shame there's no such thing as
> 060 accelerator for Macs, but with 040 models it might be feasible.

At one point, I remember being told that someone had managed to build
an 060 upgrade for some 040 based Mac. However, it required patching the
ROM as well. The official Apple ROMs for the 040 models are incapable of
booting and running reliably on an 060. Most models have unique ROMs,
which makes such a project even harder. It might be easier to get it
working if only Linux needed to work, but it's still likely to be painful.

It's similar to making an 040 upgrade board for an 030 based Mac, which
I believe were available. Those sorts of things generally do the initial
boot on the original processor then patch the OS in RAM and switch.

We would probably get a better performance boost out of getting drivers
working for some more NuBus cards. There were SCSI cards with real DMA
(as well as better chipsets like the NCR 53c7xx series or the Qlogic
ISP1000) that would make a big difference. A BusMaster card could
offload data movement for a variety of uses. There were video cards with
extensive 2D acceleration as well. Some of the Radius video cards appear
to be programmable enough to be used similarly to the BusMaster.

I have a pretty good collection of these cards, but it's hard to find
time to work on this stuff due to my regular job. In particular, I have
an FWB JackHammer (53c720) and an ATTO Silicon Express IV (ISP1000).
These cards are both Ultra-Wide SCSI and have real DMA engines.

	Brad Boyer
	flar@allandria.com
