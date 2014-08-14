From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from
 scsi_register
Date: Thu, 14 Aug 2014 20:57:47 +1200
Message-ID: <53EC7A0B.4080807@gmail.com>
References: <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet> <53DCA6AE.5060801@gmail.com> <alpine.LNX.2.00.1408031314200.545@nippy.intranet> <53DDFBC0.4050906@gmail.com> <alpine.LNX.2.00.1408041146400.21367@nippy.intranet> <53E09EAE.70308@gmail.com> <alpine.LNX.2.00.1408051948330.16933@nippy.intranet> <20140806144252.GJ21346@anhedonia> <53E48E50.8010600@gmail.com> <20140811151045.GO21346@anhedonia> <alpine.LNX.2.00.1408131511150.12942@nippy.intranet> <53EB2C8C.3070608@gmail.com> <alpine.LNX.2.00.1408141114530.26526@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:48552 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754904AbaHNI5v (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Aug 2014 04:57:51 -0400
Received: by mail-pa0-f50.google.com with SMTP id et14so1286283pad.9
        for <linux-m68k@vger.kernel.org>; Thu, 14 Aug 2014 01:57:50 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408141114530.26526@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
>>> However, atari never uses DMA here if cmd->device->borken.
>>>   
>>>       
>> Different semantics of borken, I presume. On Atari, this means a DMA 
>> transfer has failed earlier.
>>     
>
> Right. I suppose the question of using PIO in this situation on sun3 would 
> have to be put to the test.
>   

Yep - let's see whether Sam has a working test configuration with 
current kernels.

>   
>>> When cmd->device->borken, I assume sun3_NCR5380 inhibits PIO because 
>>> PIO was itself expected to be problematic?
>>>       

The sun3 driver does set the borken flag but never uses it later - can't 
see where it will inhibit PIO.

>>> OTOH, if PIO works up to 128 bytes in all cases, why not larger 
>>> transfers?
>>>   
>>>       
>> Performance, perhaps.
>>     
>
> Well, sun3_scsi has this:
>
> static inline unsigned long sun3scsi_dma_xfer_len(unsigned long wanted,
>                                                   struct scsi_cmnd *cmd,
>                                                   int write_flag)
> {
>         if (cmd->request->cmd_type == REQ_TYPE_FS)
>                 return wanted;
>         else
>                 return 0;
> }
>
> This does suggest that PIO does work beyond 128 bytes, even if it is 
> avoided for filesystem requests. Which suggests that the atari reselect 
> code might work on sun3.
>
> (As for performance, I don't know why the REQ_TYPE_FS is significant: why 
> not just raise the DMA size limit to 512 instead?)
>   

No idea really - the sun3 DMA allows to read the correct residual so it 
probably is not necessary to strictly avoid DMA on anything not 
guaranteed to transfer the requested size.  Not sure what commands will 
transfer between 128 and 512 bytes ...

>   
>> PIO would work, but hog the CPU. In fact, PIO for everything _does_ 
>> work, on Falcon as well as Mac (I tried the PIO only mode on the Falcon 
>> before trying on Mac). Did I eve mention how reallly incredibly 
>> painfully slow that is?
>>
>>     
>>> Does the sun3_scsi driver still work after removing #define REAL_DMA?
>>>
>>> For NCR5380_information_transfer() and PHASE_CMDOUT, the sun3 version 
>>> applies the same size limit but only does DMA setup if cmd type is 
>>> REQ_TYPE_FS (i.e. filesystem request). This command is then sent by 
>>> PIO, so the DMA setup here seems to assume that the next phase will 
>>> always be PHASE_DATAIN...
>>>   
>>>       
>> Might be a similar limitation to certain transfer sizes here. Block mode 
>> vs. char mode.
>>     

Commands need to be sent by PIO always because of the DMA size limit. 
The DMA setup early on may save time if the next phase is indeed DATAIN 
or DATAOUT - if a command disconnects the DMA just won't be started. I 
would have thought the DMA setup could just as easily be done inside 
NCR5380_transfer_dma instead of splitting it in DMA setup and DMA start 
- any particular reason for this, Sammy?

> That suggests that the test for REQ_TYPE_FS in 
> NCR5380_information_transfer() in sun3_NCR5380 could be improved upon by 
> using NCR5380_dma_xfer_len() when checking the size limit. That way it 
> would work on atari as well, without #ifdefs.
>   

The test for REQ_TYPE_FS could be done in the specific dma_xfer_len() 
function which would need to be used whenever DMA setup is going to be 
used. As it is, the separation of DMA setup from NCR5380_transfer_dma is 
a bit mysterious and makes it hard to merge the drivers without lots of 
ifdefs or runtime tests (think multiplatform kernels) anyway.

Cheers,

    Michael
