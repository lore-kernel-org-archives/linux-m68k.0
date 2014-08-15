From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from scsi_register
Date: Fri, 15 Aug 2014 15:03:32 +1200
Message-ID: <CAOmrzk+xJaNvpj0LOaT2nMf0q35j7yqoLYPm2VFBoLeYmGWZmw@mail.gmail.com>
References: <53DB4C98.8020907@gmail.com>
	<alpine.LNX.2.00.1408021106030.28603@nippy.intranet>
	<53DCA6AE.5060801@gmail.com>
	<alpine.LNX.2.00.1408031314200.545@nippy.intranet>
	<53DDFBC0.4050906@gmail.com>
	<alpine.LNX.2.00.1408041146400.21367@nippy.intranet>
	<53E09EAE.70308@gmail.com>
	<alpine.LNX.2.00.1408051948330.16933@nippy.intranet>
	<20140806144252.GJ21346@anhedonia>
	<53E48E50.8010600@gmail.com>
	<20140811151045.GO21346@anhedonia>
	<alpine.LNX.2.00.1408131511150.12942@nippy.intranet>
	<53EB2C8C.3070608@gmail.com>
	<alpine.LNX.2.00.1408141114530.26526@nippy.intranet>
	<53EC7A0B.4080807@gmail.com>
	<alpine.LNX.2.00.1408151203210.10537@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:59794 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754732AbaHODDc (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Aug 2014 23:03:32 -0400
Received: by mail-ob0-f169.google.com with SMTP id nu7so1657037obb.28
        for <linux-m68k@vger.kernel.org>; Thu, 14 Aug 2014 20:03:32 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408151203210.10537@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,


On Fri, Aug 15, 2014 at 2:09 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Thu, 14 Aug 2014, Michael Schmitz wrote:
>
>>
>> The DMA setup early on may save time if the next phase is indeed DATAIN
>> or DATAOUT - if a command disconnects the DMA just won't be started. I
>> would have thought the DMA setup could just as easily be done inside
>> NCR5380_transfer_dma instead of splitting it in DMA setup and DMA start
>> - any particular reason for this, Sammy?
>
> Doing the DMA setup early on may not work for atari_NCR5380 given
> merge_contiguous_buffers() takes place prior to NCR5380_transfer_dma() and
> may alter the length of the tranfer. (sun3_NCR5380 doesn't have
> merge_contiguous_buffers()).

Not only that - the DMA setup (on Falcon) will be trashed by
subsequent accesses to the NCR5380 (registers are accessed through the
ST-DMA, the NCR5380 is not directly connected to the CPU bus).

We'd need to do all DMA setup in NCR5380_transfer_dma instead.

Cheers,

  Michael


>
> --
