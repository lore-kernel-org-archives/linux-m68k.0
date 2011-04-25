From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Debian kernel v2.6.38
Date: Mon, 25 Apr 2011 13:53:05 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1104251301580.196@ibook.intranet>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org> <alpine.OSX.2.00.1104250119030.307@ibook.intranet> <4DB4E109.3090809@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:37303 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757062Ab1DYDwn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 23:52:43 -0400
In-Reply-To: <4DB4E109.3090809@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


On Mon, 25 Apr 2011, Michael Schmitz wrote:

> Finn Thain wrote:
> > On Sat, 23 Apr 2011, Thorsten Glaser wrote:
> > 
> >   
> > > No idea about the required status of the other patches, e.g. Mac. 
> > > Finn?
> > >     
> > 
> > Most of the relevant mac patches were merged into the mainline prior 
> > to the 2.6.34 release and by 2.6.37 all of them were merged.
> > 
> > I do have some unfinished patches based on 2.6.37 but I'm pretty sure 
> > they don't relate to the mac hardware used by the Debian/68k 
> > developers.
> >   
> Incidentially - did you work on the Mac 5380 SCSI code recently? Does it 
> work with full error handling capability in its current state?

I got as far as confirming the reports of working mac_scsi on the IIfx. It 
fails on every other model. I didn't really investigate error handling.

The explanation was that PDMA isn't relevant to the IIfx so the driver 
runs in PIO mode (should be DMA but that has not yet been implemented 
successfully).

> 
> I begin to feel the only way to make the Falcon SCSI code work again is 
> a clean restart ...

That was also my feeling when we discussed this some years ago*.

I'm told that mac_scsi PDMA worked for either mac68k or mainline 2.2 
kernels and so I tend to think that a rewrite would likely suffer from the 
same PDMA bug. I really need to investigate that bug.

There are still good reasons for a rewrite but I don't have the necessary 
understanding of the SCSI subsystem nor the time to tackle those issues.

But if someone else were to rewrite the core 5380 driver as was done with 
esp_scsi.c then I would be willing to tackle the mac portion (the 
equivalent of mac_esp.c)...

Finn

* http://thread.gmane.org/gmane.linux.scsi/44873


> 
> Cheers,
> 
>  Michael
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
