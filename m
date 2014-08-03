From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Sun, 03 Aug 2014 21:07:12 +1200
Message-ID: <53DDFBC0.4050906@gmail.com>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com> <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:46903 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbaHCJHW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Aug 2014 05:07:22 -0400
Received: by mail-pa0-f45.google.com with SMTP id eu11so8268074pac.32
        for <linux-m68k@vger.kernel.org>; Sun, 03 Aug 2014 02:07:21 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408031314200.545@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
>> OK, forget about atari_scsi.c for now. From memory, the major difference 
>> between atari_NCR5380.c and the others is handling of the ST-DMA/shared 
>> interrupt locking.
>>     
>
> Yes, sun3_NCR5380.c and NCR5380.c lack support for the ST-DMA chip.
>   

As should be.

> And both NCR5380.c and sun3_NCR5380.c dropped the code to support ISA 
> cards, as I mentioned.
>
> Both NCR5380.c and sun3_NCR5380.c lack merge_contiguous_buffers().
>   

I'm sure that was a tweak added by Roman Hodek to improve performance. 
Should not hurt to merge this one.

> NCR5380.c lacks support for tagged queueing, while sun3_NCR5380.c and 
> atari_NCR5380.c have divergent implementations of this.
>   

Might be equivalent for all I've seen - just array vs. bitmap to store 
tags..

> sun3_NCR5380.c and atari_NCR5380.c have divergent implementations of 
> NCR5380_transfer_dma().
>   

This is due to different DMA hardware in the three cases covered, so 
expected. There's quite a bit of additional DMA mumble in 
NCR5380_information_transfer and NCR5380_reselect.

> sun3_NCR5380.c and atari_NCR5380.c share the same implementation of the 
> NCR5380_main() co-routine, but it differs significantly from the algorithm 
> in NCR5380.c.
>   

atari_NCR5380.c was forked from NCR5380.c as early as 1994, and the 
changes to the NCR5380.c coroutine will be a later addition. NCR5380.c 
has seen development for a few years that we've never picked up.

> Each of sun3_NCR5380.c, atari_NCR5380.c and NCR5380.c have had some clean 
> up and modernization work that does not appear in any of the others.
>
> Despite all of that, I have a patch series that attempts to unify 
> atari_NCR5380.c and sun3_NCR5380.c. This seems like a sensible idea (in 
> theory) given that probably only the ISA cards actually need NCR5380.c.
>   

The diff between the two was amazingly clean and easy to parse (aside 
from the above mentioned DMA setup related stuff). Merging the two seems 
quite possible indeed.

Changes to NCR5380. are rather major though. I need to carefully go 
through the diff again. ISTR trying to run the coroutine as delayed 
workqueue instead of immediate but dropped that again for some reason.

> At some point I'll send some patches for comment, so that we might discuss 
> the issues with everyone on the same page. Until then, I'd prefer to focus 
> on the scsi_register() conversion.
>   

OK, do that first so scsi_register can go away.

>> We need to preserve that pretty much as is, or risk serious regressions. 
>> I mean, more serious trouble than I already have with the current driver 
>> because of the tendency of my Falcon to muck up the SCSI chip's clock 
>> signal under heavy load. Also note that there is still one of my patches 
>> unmerged (under review since early this year) that is necessary to avoid 
>> 'scheduling in interrupt' style panic.
>>     
>
> Can you re-send it please?
>   

I'll do that.

Cheers,

    Michael
