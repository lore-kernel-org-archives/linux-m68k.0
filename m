From: Riccardo <riccardo@kaffe.org>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Fri, 15 May 2009 10:32:46 +0200
Message-ID: <F7CDF992-412A-11DE-9D14-00050249ADE1@kaffe.org>
References: <20090514210912.GA4292@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out7.libero.it ([212.52.84.107]:40521 "EHLO
	cp-out7.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756234AbZEOIcw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 04:32:52 -0400
In-Reply-To: <20090514210912.GA4292@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: linux-m68k@vger.kernel.org

Hi Brad,

On Thursday, May 14, 2009, at 11:09  PM, Brad Boyer wrote:

>> booting into 2.6.26 I see the driver used is the mac8390. From dmesg 
>> of
>> 2.6.26
>>
>> [42949395.010000] mac8390.c: v0.4 2001-05-15 David Huggins-Daines
>> <dhd@debian.org> and others
>> [42949395.030000] eth0: Memory length resource for slot A not found,
>> probing
>> [42949395.040000] eth0: EtherNet card in slot A (type apple)
>> [42949395.050000] MAC 00:80:ad:13:7c:d0 IRQ 57, 32 KB shared memory at
>> 0xfaad0000,  32-bit access.
>
> Did this ethernet card work in an older kernel? The card type detection
> in mac8390.c is partially based on guesses and just trying different
> cards, as I remember. It's possible that it's detecting the wrong type,
> particularly since it isn't finding all the NuBus ROM resources it is
> expecting to be present on this card type. I suspect that it's not
> accessing the card correctly. Both the error messages are that the
> card isn't in a sane state based on what the driver tried to do.

maybe I did not express myself clearly: in 2.6.29 the card doesn't work 
and I typed the error message manually,

I then rebooted into 2.6.26, where the card still worked, and pasted 
its dmesg.

Riccardo

