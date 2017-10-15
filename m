From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: coldfire uart question
Date: Mon, 16 Oct 2017 10:08:53 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710160943040.3@nippy.intranet>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:60114 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbdJOXIq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 15 Oct 2017 19:08:46 -0400
In-Reply-To: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 15 Oct 2017, Angelo Dureghello wrote:

> Hi all,
> 
> i was trying a file transfer with xmodem-1k and uClinux "rx" on the 
> mcf54415 stnmark2 board side.
> 
> This using a recent mainline kernel:
> / # cat /proc/version
> uClinux version 4.14.0-rc4stmark2-001-00118-g811fdbb62a9d
> / #
> 
> So, as per xmodem-1k, i send 3 bytes header, a 1024 bytes block, and 2 
> bytes crc16. But "rx" timeouts waiting the block.
> 

What is the fastest baud rate that will work? 

> Adding some traces to "rx", it timeouts since some bytes (5 to 10) 
> randomly positioned in the block are not received. Of course they have 
> been sent (scope checked).
> 
> The same 1024 bytes transfer in u-boot (y-modem) always succeed.
> 

Does u-boot need to do any retransmissions? (If it polls the UART, it 
could probably avoid any fifo overflow.)

You may also want to try lrzsz.

> Since mcf54415 has a 4 slots RX fifo UART,

Ouch. At 115200 baud, that FIFO overflows after about 347 microseconds. If 
the kernel takes one interrupt per 4 bytes, you're looking at thousands of 
interrupts per second. Add a little unexpected interrupt latency (say, 50 
microseconds) and the next byte gets lost.

-- 

> i was wondering if the mcf.c uart driver is not fast enough to read the 
> data, or, where the "linux" limitation could be.
> 
> Regards,
> Angelo Dureghello
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
