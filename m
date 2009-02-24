From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] [PATCH/RFC 0/5] Generic RTC class driver
Date: Tue, 24 Feb 2009 23:11:54 +0100
Message-ID: <20090224231154.60ba18d6__285.868233959441$1235513642$gmane$org@i1501.lan.towertech.it>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<20090220170454.04382e9e@i1501.lan.towertech.it>
	<alpine.LRH.2.00.0902231319170.22762@vixen.sonytel.be>
	<1235511327.18632.73.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.towertech.it ([213.215.222.73]:44741 "HELO mx0.towertech.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1759202AbZBXWMC (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 24 Feb 2009 17:12:02 -0500
In-Reply-To: <1235511327.18632.73.camel@macbook.infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, rtc-linux@googlegroups.com, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, David@ozlabs.org, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Wed, 25 Feb 2009 06:35:27 +0900
David Woodhouse <dwmw2@infradead.org> wrote:

> > So you want us to kill the ppc_md.[gs]et_rtc_time() [ppc], mach_hwclk() [m68k],
> > mach_gettod() [m68knommu] (and probably a few other) abstractions, and move all
> > RTC code out of arch/ into seperate drivers under drivers/rtc/ instead?
> 
> That's the ideal... although did we get NTP sync working again yet?

 not yet. we're close but I've been very busy :(
 
-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

