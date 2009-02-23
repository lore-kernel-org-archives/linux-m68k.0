From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Mon, 23 Feb 2009 16:05:06 +0100
Message-ID: <20090223160506.04e347c7__26505.6096054197$1236214416$gmane$org@i1501.lan.towertech.it>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<20090220170454.04382e9e@i1501.lan.towertech.it>
	<alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.towertech.it ([213.215.222.73]:51803 "HELO mx0.towertech.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754572AbZBWPFK (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 23 Feb 2009 10:05:10 -0500
In-Reply-To: <alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Geert.Uytterhoeven@sonycom.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Woodhouse <dwmw2@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Mon, 23 Feb 2009 13:34:49 +0100 (CET)
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:

> >  Hello,
> > 
> >    my opinion on this kind of stuff is that I want to avoid the layering
> >  of implementations under the rtc subsystem. I'd rather prefer that each
> >  rtc device had its own driver. 
> >  
> >   I've made error in the past, by accepting such kind of drivers, and
> >  would like to avoid that it happens again.
> 
> So you want us to kill the ppc_md.[gs]et_rtc_time() [ppc], mach_hwclk() [m68k],
> mach_gettod() [m68knommu] (and probably a few other) abstractions, and move all
> RTC code out of arch/ into seperate drivers under drivers/rtc/ instead?

 not all at once :) 

 I'd start writing a working driver and then see how we should eventually
 adapt the rtc subsystem to cope with your needs.
 
> What about ppc_md.get_boot_time() [ppc]?
> Please note that the functions above may also be used for very early clock
> setting (e.g. time_init()) and in read_persistent_clock().
> How should we handle these?

 read_persistent_clock is something that should be reconsidered
 as well along with all the ntp stuff.

> Even on x86 there seems to be way too much RTC logic in arch/x86/kernel/rtc.c

> (e.g. mach_get_cmos_time()), which is duplicated in drivers/rtc/rtc-cmos.c
> through the inline function __get_rtc_time() in include/asm-generic/rtc.h
> (clever, hardware-specific stuff in asm-generic ;-)

 yep, I know :( that hardcoded rtc stuff seems to be everywhere!


-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

