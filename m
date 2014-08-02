From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Sat, 02 Aug 2014 20:51:58 +1200
Message-ID: <53DCA6AE.5060801@gmail.com>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com> <alpine.LNX.2.00.1408011307120.6796@nippy.intranet> <53DB4C98.8020907@gmail.com> <alpine.LNX.2.00.1408021106030.28603@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:58137 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbaHBIwH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 2 Aug 2014 04:52:07 -0400
Received: by mail-pd0-f176.google.com with SMTP id y10so6846919pdj.21
        for <linux-m68k@vger.kernel.org>; Sat, 02 Aug 2014 01:52:07 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408021106030.28603@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
>>
>> If you rather want to do this - either use the ATARIHW_PRESENT() macros 
>> to test for ST_SCSI (Falcon, interrupt no. IRQ_MFP_FSCSI) or TT_SCSI 
>> (TT, interrupt no. IRQ_TT_MFP_SCSI). Or else, replicate the logic from 
>> config_atari()
>>     
>
> Yes, that was my plan. A patch that replicates that logic is easier to 
> review and less likely to cause regressions (of course, I'd follow the 
> existing conventions in arch/m68k/atari/config.c).
>   

Sounds good to me.

> Converting three drivers at once is a win because the first conversion is 
> always the more difficult one. Therefore I'm planning to use the same 
> logic three times over and therefore I'm not intending to address the 
> peculiarities of different ports (that would be better done by you, me and 
> Sam separately).
>   

OK, I'll think some more about what could be done to merge the quirks 
into a shared core.

> However, I'll will need you and Sam to test some patches (if they meet 
> with approval once you and Sam get to review them, of course).
>
>   
>> - the SCSI chip directly mapped only in the TT integration, the Falcon 
>> needs to access SCSI registers through the ST-DMA chip, and needs the 
>> weird ST-DMA locking scheme plus a few other quirks.
>>
>> Looking at atari_scsi.c - the code is full of IS_A_TT() macros and other 
>> Atari specfic macros that could be replaced by testing bits in a feature 
>> map. One bit (TT or Falcon style SCSI integration) rather - that still 
>> leaves the register access functions for TT and Falcon to sort out.  Do 
>> you plan to do all that in one go?
>>     
>
> No, not in one go. That would be a separate patch, so that each patch has 
> a single well defined purpose.
>
> I'm not particularly concerned about atari_scsi.c. I am concerned about 
> the three forks of the core driver (not least because of the shared 
> header) that's why I've sent patches for sun3_NCR5380 and atari_NCR5380 in 
> the past.
>   

OK, forget about atari_scsi.c for now. From memory, the major difference 
between atari_NCR5380.c and the others is handling of the ST-DMA/shared 
interrupt locking. We need to preserve that pretty much as is, or risk 
serious regressions. I mean, more serious trouble than I already have 
with the current driver because of the tendency of my Falcon to muck up 
the SCSI chip's clock signal under heavy load. Also note that there is 
still one of my patches unmerged (under review since early this year) 
that is necessary to avoid 'scheduling in interrupt' style panic.

The rest of the differences were tweaks added by the Atari SCSI author 
to make the driver behave with borderline standards compliant hardware 
(long reset delay for some CD drives, tweaks to bus settle delays). 
Probably not that critical in the first instance.

>> Might need another platform device for the ST-DMA as well ...
>>     
>
> I don't think that relates to scsi_register() deprecation.
>   

Not at all - just to the platform device conversion. Not sure I fully 
understand what you have in mind, though.

Cheers,

    Michael
