From: Brad Boyer <flar@allandria.com>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Thu, 14 May 2009 14:09:12 -0700
Message-ID: <20090514210912.GA4292@cynthia.pants.nu>
References: <8EF8D4F2-40AD-11DE-9565-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:45281 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752047AbZENVJ1 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 14 May 2009 17:09:27 -0400
Content-Disposition: inline
In-Reply-To: <8EF8D4F2-40AD-11DE-9565-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org

On Thu, May 14, 2009 at 07:35:03PM +0200, Riccardo wrote:
> But any activity on the ethernet (remlote login or just a Ping) gives 
> me:
> 
> trigger_send() called  with the transmitter busy
> 
> and after a bit
> 
> eth0: mismatched read page pointers 45 vs  c.
> 
> booting into 2.6.26 I see the driver used is the mac8390. From dmesg of 
> 2.6.26
> 
> [42949395.010000] mac8390.c: v0.4 2001-05-15 David Huggins-Daines 
> <dhd@debian.org> and others
> [42949395.030000] eth0: Memory length resource for slot A not found, 
> probing
> [42949395.040000] eth0: EtherNet card in slot A (type apple)
> [42949395.050000] MAC 00:80:ad:13:7c:d0 IRQ 57, 32 KB shared memory at 
> 0xfaad0000,  32-bit access.

Did this ethernet card work in an older kernel? The card type detection
in mac8390.c is partially based on guesses and just trying different
cards, as I remember. It's possible that it's detecting the wrong type,
particularly since it isn't finding all the NuBus ROM resources it is
expecting to be present on this card type. I suspect that it's not
accessing the card correctly. Both the error messages are that the
card isn't in a sane state based on what the driver tried to do.

Incidentally, "apple" is the default type for any card the driver
thinks it can use but can't identify with 100% certainty.

	Brad Boyer
	flar@allandria.com

