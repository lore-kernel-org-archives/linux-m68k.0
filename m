From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Debian kernel 2.6.38-5
Date: Mon, 9 May 2011 09:14:35 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol> <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org> <20110508200802.GB16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:37928 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173Ab1EHXNw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 19:13:52 -0400
In-Reply-To: <20110508200802.GB16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org


On Sun, 8 May 2011, Christian T. Steigies wrote:

> 
> PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I'll try to
> apply the patch you mentioned in your other message.

I sometimes test network cards with busybox. It can be built without 
linking in glibc and doesn't need TLS.


> [  130.870000] eth0: trigger_send() called with the transmitter busy.
> [  132.240000] ------------[ cut here ]------------
> [  132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watchdog+0x1ac/0x1cc()
> [  132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out

Looks a lot like this problem:

http://patchwork.ozlabs.org/patch/27774/

Finn
