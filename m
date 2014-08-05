From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Tue, 05 Aug 2014 21:06:54 +1200
Message-ID: <53E09EAE.70308@gmail.com>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com> <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:32942 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932775AbaHEJHF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Aug 2014 05:07:05 -0400
Received: by mail-pd0-f182.google.com with SMTP id fp1so1004813pdb.13
        for <linux-m68k@vger.kernel.org>; Tue, 05 Aug 2014 02:07:04 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
> On Sun, 3 Aug 2014, Michael Schmitz wrote:
>
>   
>>> NCR5380.c lacks support for tagged queueing, while sun3_NCR5380.c and 
>>> atari_NCR5380.c have divergent implementations of this.
>>>   
>>>       
>> Might be equivalent for all I've seen - just array vs. bitmap to store 
>> tags..
>>     
>
> It is messier than that. setup_use_tagged_queuing is disabled by default 
> on atari, and enabled by default on sun3. If we don't disable it by 
>   

It's configured but disabled by default on Atari because command_per_lun 
is set to 1 by default. Can't remember why that was exactly - my best 
guess would be that queueing up more commands in the lowlevel driver did 
use to exacerbate timeout problems. But that was over a decade ago. On 
Sun3, the code is not even configured from what I've seen (SUPPORT_TAGS 
not defined).

> default everywhere then we need to resolve a change to the algorithm: the 
> following code appears at the beginning of NCR5380_reselect() in 
> atari_NCR5380.c but appears at the end of that routine in sun3_NCR5380.c. 
>   

That's what I meant to say before - sun3_NCR5380.c does peek at the 
message byte without invoking NCR5380_transfer_pio() (needs to manually 
set/clear ACK for that resason, finds the disconnected command at issue, 
does some DMA setup stuff for that command, and then goes ahead to fetch 
the tag message bytes if the phase is still at message in. No idea where 
the variable 'phase' gets set in that routine so it might never get to 
read tag messages.

atari_NCR5390.c does things a bit different - instead of peeking at the 
message byte, NCR5380_transfer_pio() is used for the first message byte 
(ACK set there, cleared manually later). NCR5380_transfer_pio() sets the 
current phase, so the subsequent transfer of the tag message may work 
there (again ACK raised in NCR5380_transfer_pio(), cleared manually later).
> I still have to try to figure out the implications of this change.
>   

 From what I've checked both should work, but the sun3 code never sets 
'phase' so it should never actually have worked. It should not even 
compile.
> #ifdef SUPPORT_TAGS
>     /* If the phase is still MSGIN, the target wants to send some more
>      * messages. In case it supports tagged queuing, this is probably a
>      * SIMPLE_QUEUE_TAG for the I_T_L_Q nexus.
>      */
>     tag = TAG_NONE;
>     if (phase == PHASE_MSGIN && setup_use_tagged_queuing) {
>         /* Accept previous IDENTIFY message by clearing ACK */
>         NCR5380_write( INITIATOR_COMMAND_REG, ICR_BASE );
>         len = 2;
>         data = msg+1;
>         if (!NCR5380_transfer_pio(instance, &phase, &len, &data) &&
>             msg[1] == SIMPLE_QUEUE_TAG)
>             tag = msg[2];
>         dprintk(NDEBUG_TAGS, "scsi%d: target mask %02x, lun %d sent tag %d at "
>                              "reselection\n", HOSTNO, target_mask, lun, tag);
>     }
> #endif
>
>   
>> Changes to NCR5380. are rather major though. I need to carefully go 
>> through the diff again. ISTR trying to run the coroutine as delayed 
>> workqueue instead of immediate but dropped that again for some reason.
>>     
>
> I don't think it makes sense to unify NCR5380.c and atari_NCR5380.c at 
> this stage. The ISA cards' requirements together are more peculiar than, 
> say, ST-DMA, and are mostly irrelevant to the M68k, ARM and PCI devices.
>   

OK, not for today then.

> As an aside, forking NCR5380.c into atari_NCR5380.c, sun3_NCR5380.c and 
> mac_NCR5380.c (deleted in v2.6.3) was clearly misguided as it never 
> actually produced a good alternative to NCR5380.c.
>   

atari_NCR5380.c was forked at a time when the m68k port was developed 
entirely independent from the main Linux development (which was i386 
only at that stage). Linus did not want to deal with other 
architectures, and merging m68k code into Linus' code was not something 
the m68k authors envisaged at that stage. The fork was not meant to 
produce a good alternative to the main driver, just something that 
worked. At least that is as I recall it - I had little to do with Linux 
kernel development at that stage.
Merging ongoing development on NCR5380.c into the Atari driver was 
always something of an afterthought (Geert probably took care of most of 
that). The sun3 and Mac drivers were then forked off the Atari one. I'm 
guilty in part of the initial Mac one, but that was done mainly in order 
to stop Alan Cox from whinging about the lack of a disk driver. (Don't 
think he liked SCSI in PIO mode much.)

What I mean to say - in hindsight, it was misguided, but at the time we 
did not have the benefit of a crystal ball (or git, or even fast cross 
compilers).

> Forking just multiplied the maintenance demands, and diminishing man-power 
> of course lead to neglect and breakage. So I can sympathise with 
> Christoph's comment in NCR5380.c:
>
>  * (Note from hch:  unfortunately it was not enough for the different
>  * m68k folks and instead of improving this driver they copied it
>  * and hacked it up for their needs.  As a consequence they lost
>  * most updates to this driver.  Maybe someone will fix all these
>  * drivers to use a common core one day..)
>   

Yep, I can now sympathise with that. When m68k began to merge with 
Linus, we had already lost much of the initial man-power and expertise. 
I'm sure we'd do things different now, but these lessons had to be 
learned along the way.

Cheers,

    Michael
