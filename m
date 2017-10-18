From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: coldfire uart question
Date: Wed, 18 Oct 2017 19:15:44 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1710181831220.3@nippy.intranet>
References: <1f18ad0d-d147-5c64-ad65-a4bc545d4bff@sysam.it> <alpine.LNX.2.00.1710160943040.3@nippy.intranet> <e4fff222-c8d0-9da0-32b4-222fbfad8044@sysam.it> <alpine.LNX.2.00.1710181016001.3@nippy.intranet> <CAMuHMdVRaZxcic+UezdrsrSWWJV6SDuuAdaeFQPBNgt0oXsN9g@mail.gmail.com>
 <c903087c-7997-8b8d-88fd-38028022dab4@sysam.it>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42454 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933751AbdJRIPq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Oct 2017 04:15:46 -0400
In-Reply-To: <c903087c-7997-8b8d-88fd-38028022dab4@sysam.it>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, 18 Oct 2017, Angelo Dureghello wrote:

> Ok will do some test, maybe also adding 1 stop bit

Adding a stop bit or two will marginally reduce the effective data rate 
but it could be that 115200 baud is unrealistic.

> or killing some processes may help ? I am already into initramfs, so the 
> write should not be that heavy.

I take it you mean storing into rootfs. So the latency is caused by some 
other interrupt source (not flash storage) with higher priority than the 
uart irq...

> Will try also zmodem in case.
> 

Keep in mind that a larger block size would mean a larger penalty for a 
single overrun, which can reduce throughput.

-- 

> Regards,
> Angelo
> 
