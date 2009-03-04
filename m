From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Wed, 4 Mar 2009 13:47:05 +0100
Message-ID: <20090304134705.7d9bbe5c@i1501.lan.towertech.it>
References: <20090224231154.60ba18d6@i1501.lan.towertech.it>
	<1235514727.18632.93.camel@macbook.infradead.org>
	<alpine.LRH.2.00.0902251059110.4063@vixen.sonytel.be>
	<20090225111836.621412c1@i1501.lan.towertech.it>
	<20090227185514.GA1071@linux-m68k.org>
	<alpine.LRH.2.00.0903021051040.25117@vixen.sonytel.be>
	<20090302110310.35af50ea@i1501.lan.towertech.it>
	<alpine.LRH.2.00.0903021116450.25117@vixen.sonytel.be>
	<20090302120950.0d35e06c@i1501.lan.towertech.it>
	<alpine.LRH.2.00.0903031121280.31985@vixen.sonytel.be>
	<20090303190609.GB6907@linux-sh.org>
	<alpine.LRH.2.00.0903040920240.2416@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.towertech.it ([213.215.222.73]:33071 "HELO mx0.towertech.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752185AbZCDMrQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 4 Mar 2009 07:47:16 -0500
In-Reply-To: <alpine.LRH.2.00.0903040920240.2416@vixen.sonytel.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Geert.Uytterhoeven@sonycom.com, Paul Mundt <lethal@linux-sh.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Kyle McMartin <kyle@mcmartin.ca>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, David Woodhouse <dwmw2@infradead.org>

On Wed, 4 Mar 2009 09:26:29 +0100 (CET)
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:

> Thanks Paul, I wasn't aware of that thread!
> 
> Yes, this is almost the same. The only part I don't agree with is the move of
> the creation of the platform device from arch-specific code to rtc-firmware.c,
> as this makes autoloading the driver more difficult.

 and it's also against a proper implementation of the device/driver model.

> Seems like everybody but the RTC maintainer has an interest in having an RTC
> class driver on top of [gs]et_rtc_time()... ;-)

 That's because everyone is lazy :) 

 Seriously, if you want to handle it in the way we wrote
 in the previous emails, it's ok for me.

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

