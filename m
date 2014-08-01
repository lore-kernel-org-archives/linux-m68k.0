From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Fri, 01 Aug 2014 20:15:20 +1200
Message-ID: <53DB4C98.8020907@gmail.com>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet> <53D9D4B2.9080801@gmail.com> <alpine.LNX.2.00.1408011307120.6796@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:63890 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754601AbaHAIPd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Aug 2014 04:15:33 -0400
Received: by mail-pa0-f41.google.com with SMTP id rd3so5355738pab.0
        for <linux-m68k@vger.kernel.org>; Fri, 01 Aug 2014 01:15:33 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408011307120.6796@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
>> atari_scsi is only used on TT and Falcon Atari variants. 'Testing' for 
>> hardware presence is just checking bits from a bitmap populated at 
>> arch_init time, that can easily be moved into a platform device setup, 
>> much like I already do for the network drivers. Does that answer your 
>> question?
>>     
>
> Yes. I'll convert {atari,mac,sun3}_scsi to platform devices and 
> scsi_host_alloc/scsi_add_host.
>   

Thanks, much appreciated. I can supply the platform device setup in 
arch/m68k/atari/config.c once you have decided what kind of resources or 
platform data will be needed.

If you rather want to do this - either use the ATARIHW_PRESENT() macros 
to test for  ST_SCSI (Falcon, interrupt no. IRQ_MFP_FSCSI) or TT_SCSI 
(TT, interrupt no. IRQ_TT_MFP_SCSI). Or else, replicate the logic from 
config_atari() - the SCSI chip directly mapped only in the TT integration,
the Falcon needs to access SCSI registers through the ST-DMA chip, and 
needs the weird ST-DMA locking scheme plus a few other quirks.

Looking at atari_scsi.c - the code is full of IS_A_TT() macros and other 
Atari specfic macros that could be replaced by testing bits in a feature 
map. One bit (TT or Falcon style SCSI integration) rather - that still 
leaves the register access functions for TT and Falcon to sort out.  Do 
you plan to do all that in one go? Might need another platform device 
for the ST-DMA as well ...

Cheers,

    Michael
