From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Sun3 SCSI DMA, was Re: converting the NCR5380 drivers away from scsi_register
Date: Fri, 15 Aug 2014 13:51:25 +1200
Message-ID: <CAOmrzk+1JAKOrSjQGRdeyooKdP+LHxyTt8uSOKV_N7A5qLZfxQ@mail.gmail.com>
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
	<alpine.LNX.2.00.1408151138260.28678@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:36653 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751608AbaHOBv0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Aug 2014 21:51:26 -0400
Received: by mail-oa0-f41.google.com with SMTP id j17so1637382oag.14
        for <linux-m68k@vger.kernel.org>; Thu, 14 Aug 2014 18:51:25 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1408151138260.28678@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Sam Creasey <sammy@sammy.net>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,


On Fri, Aug 15, 2014 at 1:46 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Thu, 14 Aug 2014, Michael Schmitz wrote:
>
>> >
>> > > > When cmd->device->borken, I assume sun3_NCR5380 inhibits PIO
>> > > > because PIO was itself expected to be problematic?
>> > > >
>>
>> The sun3 driver does set the borken flag but never uses it later - can't
>> see where it will inhibit PIO.
>
> It inhibited PIO when it forked the atari code and commented out the test
> for cmd->device->borken, to ensure that PIO would never be used here.

I see. I just tool that to mean the Sun3 driver never had trouble with
devices failing at that section, so no need to switch from DMA to PIO
(because DMA never fails).

> Hence my suggestion that PIO itself was expected was problematic. OTOH,
> PIO is used up to 128 bytes, and beyond 128 bytes if !REQ_TYPE_FS...

Up to 128 for DMA limitations - the other bit I don't understand either.

Cheers,

  Michael

> --
