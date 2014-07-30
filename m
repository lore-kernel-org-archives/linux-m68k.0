From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Wed, 30 Jul 2014 18:32:24 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1407301726430.9554@nippy.intranet>
References: <20140616141853.GA32399@infradead.org> <alpine.LNX.2.00.1406171756040.17715@nippy.intranet> <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38843 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbaG3Ida (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jul 2014 04:33:30 -0400
In-Reply-To: <CAMuHMdUkMHoMahyppwttnm7qs6etoqMGtvk77HezUBj-GOeMKg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>, Michael Schmitz <schmitz@debian.org>
Cc: Sam Creasey <sammy@sammy.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 17 Jun 2014, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Tue, Jun 17, 2014 at 10:20 AM, Finn Thain wrote:
> >> now that you've officially taken over NCR5380 is there a chance to 
> >> look into converting the drivers away from scsi_register to the 
> >> modern scsi_host_alloc/scsi_add_host method?
> >
> > Have any other conversions taken place? I'm curious to see what was 
> > involved. Hopefully not a re-write, like esp_scsi (?)
> 
> I did a few of them in 2009:
> 
> commit c2a24a4ca1137473971842461612e56a654e7edb
> ("m68k: amiga - A3000 SCSI platform device conversion")
> commit c1d288a58936cd0654844d807e53a203f4838fb4
> ("m68k: amiga - GVP Series II SCSI zorro_driver conversion")
> commit c737e22cde37e4e2ad126316e4aab7349a491ab3
> ("m68k: amiga - A2091/A590 SCSI zorro_driver conversion")
> 
> All of them without access to the hardware. So far I haven't heard any
> complaints ;-)

Thanks Geert. You do make it look easy to avoid regressions!

sun3x_esp and mac_esp are platform devices so I guess I should convert 
sun3_scsi and mac_scsi to platform devices also. I'm not sure about 
atari_scsi, perhaps there's a different bus that can probe it. Michael?

I see that the PCI driver (dmx3191d) and the ARM drivers (oak and 
cumana_1) have already been converted. So the remaining NCR5380 drivers 
that still use scsi_register() are the ISA cards: g_NCR5380, dtc, 
pas16 and t128.

I don't have any ISA hardware. I certainly don't mind if those drivers 
ultimately get removed along with scsi_register() itself.

Those ISA drivers depend on functionality in the NCR5380.c core driver 
that was discarded by the other two core driver variants (atari_NCR5380.c 
and sun3_NCR5380.c) such as DONT_USE_INTR, UNSAFE, DMA_WORKS_RIGHT, 
AUTOPROBE_IRQ, USLEEP_POLL, NCR53C400.

If it were not for the ISA cards, we may not need three variations on the 
core driver.

-- 
