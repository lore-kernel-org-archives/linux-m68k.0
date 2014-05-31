From: Steven King <sfking@fdwdc.com>
Subject: Re: [uClinux-dev] [PATCH m68knommu] Add the m54xx fec driver
Date: Fri, 30 May 2014 19:09:34 -0700
Message-ID: <201405301909.34699.sfking__2990.73163555494$1401502588$gmane$org@fdwdc.com>
References: <1348473919-30257-1-git-send-email-phdm@macqel.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1348473919-30257-1-git-send-email-phdm@macqel.be>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: Philippe De Muyter <phdm@macqel.be>, stany.marcel@novasys-ingenierie.com, greg@uclinux.org, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Monday 24 September 2012 1:05:16 am Philippe De Muyter wrote:
> Hello,
>
> I have cleaned up and updated to 3.6-rc5 my previous port of the
> freescale-written driver for the fast Ethernet Controller of the M547x
> and M548x ColdFires.  It seems from comments found in Freescale sources
> that this uses a MultiChannel DMA controller marketed as MCD and available
> also in the NPC8220 also from Freescale.  Therefore, I have split the
> submission in three parts :
> 	A generic MCD dma driver
> 	The M54xx instantiation of the MCD driver
> 	The FEC driver for M54xx
>
> I know there are still lines above 80 characters, but I feel they must be
> left that way.  There are also parts of an unfinished netpoll interface.
>
> Feel free to test and comment.

So whatever happened with this?  Was there ever any feedback from the other 
maintainers?

For what it is worth, I was able to take the original patches and rebase them 
to v3.15-rc6 with just a couple of very minor changes and produce a working 
ethernet for my 5484 system.
