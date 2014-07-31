From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Thu, 31 Jul 2014 17:31:30 +1200
Message-ID: <53D9D4B2.9080801@gmail.com>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com> <alpine.LNX.2.00.1407301726430.9554@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:55558 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752204AbaGaFcC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Jul 2014 01:32:02 -0400
Received: by mail-pa0-f52.google.com with SMTP id bj1so2925244pad.11
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jul 2014 22:32:01 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1407301726430.9554@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>, Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
> On Tue, 17 Jun 2014, Geert Uytterhoeven wrote:
>
>> Hi Finn,
>>
>> On Tue, Jun 17, 2014 at 10:20 AM, Finn Thain wrote:
>>>> now that you've officially taken over NCR5380 is there a chance to
>>>> look into converting the drivers away from scsi_register to the
>>>> modern scsi_host_alloc/scsi_add_host method?
>>> Have any other conversions taken place? I'm curious to see what was
>>> involved. Hopefully not a re-write, like esp_scsi (?)
>> I did a few of them in 2009:
>>
>> commit c2a24a4ca1137473971842461612e56a654e7edb
>> ("m68k: amiga - A3000 SCSI platform device conversion")
>> commit c1d288a58936cd0654844d807e53a203f4838fb4
>> ("m68k: amiga - GVP Series II SCSI zorro_driver conversion")
>> commit c737e22cde37e4e2ad126316e4aab7349a491ab3
>> ("m68k: amiga - A2091/A590 SCSI zorro_driver conversion")
>>
>> All of them without access to the hardware. So far I haven't heard any
>> complaints ;-)
> Thanks Geert. You do make it look easy to avoid regressions!
>
> sun3x_esp and mac_esp are platform devices so I guess I should convert
> sun3_scsi and mac_scsi to platform devices also. I'm not sure about
> atari_scsi, perhaps there's a different bus that can probe it. Michael?

atari_scsi is only used on TT and Falcon Atari variants. 'Testing' for 
hardware presence is just checking bits from a bitmap populated at 
arch_init time, that can easily be moved into a platform device setup, 
much like I already do for the network drivers. Does that answer your 
question?

Cheers,

     Michael


>
> I see that the PCI driver (dmx3191d) and the ARM drivers (oak and
> cumana_1) have already been converted. So the remaining NCR5380 drivers
> that still use scsi_register() are the ISA cards: g_NCR5380, dtc,
> pas16 and t128.
>
> I don't have any ISA hardware. I certainly don't mind if those drivers
> ultimately get removed along with scsi_register() itself.
>
> Those ISA drivers depend on functionality in the NCR5380.c core driver
> that was discarded by the other two core driver variants (atari_NCR5380.c
> and sun3_NCR5380.c) such as DONT_USE_INTR, UNSAFE, DMA_WORKS_RIGHT,
> AUTOPROBE_IRQ, USLEEP_POLL, NCR53C400.
>
> If it were not for the ISA cards, we may not need three variations on the
> core driver.
>
