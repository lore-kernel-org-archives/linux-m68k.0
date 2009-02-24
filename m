From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [rtc-linux] [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 25 Feb 2009 06:35:27 +0900
Message-ID: <1235511327.18632.73.camel@macbook.infradead.org>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	 <20090220170454.04382e9e@i1501.lan.towertech.it>
	 <alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Alessandro Zummo <alessandro.zummo@towertech.it>, rtc-linux@googlegroups.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Mon, 2009-02-23 at 13:34 +0100, Geert Uytterhoeven wrote:
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

That's the ideal... although did we get NTP sync working again yet?

The rtc-ppc driver was intended as a short-term workaround so that we
can enable the generic RTC class (which was required for PA Semi
Electra, iirc), and still have stuff work on other platforms.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

