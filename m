From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 2 Nov 2008 11:29:54 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811021103400.26989@loopy.telegraphics.com.au>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <20081101181013.GA25819@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:59540 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751881AbYKBA35 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 1 Nov 2008 20:29:57 -0400
In-Reply-To: <20081101181013.GA25819@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Laurent@lvivier.info, geert@linux-m68k.org, linux-m68k@vger.kernel.org



On Sat, 1 Nov 2008, Brad Boyer wrote:

> On Sat, Nov 01, 2008 at 10:43:11AM +0100, Laurent@lvivier.info wrote:
> > It allows to read data from a floppy, but not to write to, and to 
> > eject the floppy (useful on our Mac without eject button).
> > 
> > I have tested it on a Quadra 800, but it is supposed to work on:
> > 
> > II, IIci, IIsi, IIvx, IIx, IIcx, SE/30, PowerBook 100, PowerBook 140, 
> > PowerBook 145, PowerBook 160, PowerBook 165, PowerBook 165c, PowerBook 
> > 170, PowerBook 180, PowerBook 180c, PowerBook 190, PowerBook 190cs, 
> > PowerBook 500, Performa 460, Performa 550, LC II, LC III, LC 520, 
> > Color Classic, Color Classic II, ClassicII, Quadra 700, Quadra 800, 
> > Quadra 650, Quadra 605, Quadra 610, Centris 610, Quadra 630, Performa 
> > 580, LC 475, LC 575,
> 
> I just have one comment and one question. The model check looks like it 
> will end up printing out a warning message on the AV models. You should 
> add them explicitly to the unsupported list the way you did for the IIfx 
> and Q900/Q950. Also, I'm not sure this driver would work on a Mac II. 
> They didn't originally ship with a SWIM chip at all, but that was 
> available as an upgrade. From the factory they came with the old IWM 
> chip. It's not clear to me if the driver uses any of the SWIM features 
> other than the capability to detect and read high density media which 
> the old drives obviously don't do.

I think that unless we can probe for the SWIM chip, we should put this 
information in arch/m68k/mac/config.c. A floppy_type member could be added 
to struct mac_model to clean up the init code here. That init code could 
then simply test macintosh_config like all the other drivers that can't or 
don't probe.

To avoid confusion, I'd also prefer that we don't list the names of models 
in the comment at the start of this file since so many models go under a 
variety of different names. For example http://www.mac.linux-m68k.org/status/ 
shows that 10 models indistinguishable for our purposes were rebadged 
under about 30 different names for marketing purposes.

Finn

> Other than that, it's good to see someone working on this.
> 
> 	Brad Boyer
> 	flar@allandria.com
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
