From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: coldfire uart question
Date: Wed, 18 Oct 2017 11:06:10 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710181016001.3@nippy.intranet>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it> <alpine.LNX.2.00.1710160943040.3@nippy.intranet> <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:36698 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757240AbdJRAGM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Oct 2017 20:06:12 -0400
In-Reply-To: <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, 17 Oct 2017, Angelo Dureghello wrote:

> On 16/10/2017 01:08, Finn Thain wrote:
> > On Sun, 15 Oct 2017, Angelo Dureghello wrote:
> > 
> > > Hi all,
> > >
> > > i was trying a file transfer with xmodem-1k and uClinux "rx" on the 
> > > mcf54415 stnmark2 board side.
> > >
> > > This using a recent mainline kernel:
> > > / # cat /proc/version
> > > uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
> > > / #
> > >
> > > So, as per xmodem-1k, i send 3 bytes header, a 1024 bytes block, and 
> > > 2 bytes crc16. But "rx" timeouts waiting the block.
> > >
> > 
> > What is the fastest baud rate that will work?
> > 
> > > Adding some traces to "rx", it timeouts since some bytes (5 to 10) 
> > > randomly positioned in the block are not received. Of course they 
> > > have been sent (scope checked).
> > >
> > > The same 1024 bytes transfer in u-boot (y-modem) always succeed.
> > >
> > 
> > Does u-boot need to do any retransmissions? (If it polls the UART, it 
> > could probably avoid any fifo overflow.)
> > 
> > You may also want to try lrzsz.
> > 
> > > Since mcf54415 has a 4 slots RX fifo UART,
> > 
> > Ouch. At 115200 baud, that FIFO overflows after about 347 
> > microseconds. If the kernel takes one interrupt per 4 bytes, you're 
> > looking at thousands of interrupts per second. Add a little unexpected 
> > interrupt latency (say, 50 microseconds) and the next byte gets lost.
> > 
> 

I should have said "86 microseconds", to guarantee an overflow, but the 
margin is lower than that even on an idle system, because time is lost in 
interrupt dispatch. This margin is the same whether the interrupt happens 
after one byte or four bytes.

> thanks for explaining this.
> 
> Well, if i understand properly, this mcf54415 CPU has 2 interrupts flags 
> that can be checked: RXRDY, for one or more character received (current 
> mcf.c seems to use this flag) and FFULL, for all 4 fifo slots full.
> 
> So we probably have even more interrupts per second right now.
> 

Even if you can reach 4 bytes per interrupt, the payoff is probably a 
reduction in CPU overhead due to interrupt load rather than a reduction in 
FIFO overflows.

There seems to be too much interrupt latency to support the line rate. 
(Was that x-modem file transfer going to a storage device? Perhaps try 
sending it to tmpfs or /dev/null.) A line rate of 38400 or 57600 baud is 
probably more realistic.

> I am at 115200, will try to decrease, and also, will try zmodem in case.
> 

You could try transmitting a large number of bytes at full speed, counting 
them at the receiving end, and counting the number of interrupts from IRQ 
source 90 using /proc/interrupts. The bytes per interrupt ratio may 
already exceed 1, so the benefit from adopting the FFULL interrupt may not 
be what you expect.

-- 

> Regards,
> Angelo
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
