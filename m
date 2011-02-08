From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Early crash (was: Re: module: show version information for built-in modules in sysfs)
Date: Tue, 08 Feb 2011 22:31:56 +0100
Message-ID: <m2tygedxgz.fsf@igel.home>
References: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
	<20110201210944.GA12348@dtor-ws.eng.vmware.com>
	<AANLkTimv=KqtuR36dMNa+=OMi0mgd8JK4qsb_SpmKmhs@mail.gmail.com>
	<20110201222637.GA17521@dtor-ws.eng.vmware.com>
	<AANLkTikWVt8NEyHN+=yD4EWSXUQt0gt5nLJtKQDw397M@mail.gmail.com>
	<20110202194227.GA13794@dtor-ws.eng.vmware.com>
	<m2ipx2dp7v.fsf@igel.home>
	<20110202235948.GA8676@dtor-ws.eng.vmware.com>
	<m2bp2udllv.fsf@igel.home>
	<20110203002459.GA26729@dtor-ws.eng.vmware.com>
	<m2mxmdm323.fsf@igel.home>
	<Pine.BSM.4.64L.1102052346060.22476@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:58828 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752121Ab1BHVcA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Feb 2011 16:32:00 -0500
In-Reply-To: <Pine.BSM.4.64L.1102052346060.22476@herc.mirbsd.org> (Thorsten
	Glaser's message of "Sat, 5 Feb 2011 23:47:09 +0000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Thorsten Glaser <tg@mirbsd.de> writes:

> Andreas Schwab dixit:
>
>>On m68k, every object by default is at most aligned to a 2 byte
>>boundary.  That's a heritage of the original Sun m68000 compiler, which
>>served as the template for the gcc configuration for Linux/m68k when the
>>porting started.
>
> Ah, from there. I think it might violate the SYSV ABI, funnily
> enough (which I've peeked into in order to port elfutils when
> bored again). Oh the history ;)

I looked into fixing that when I ported m68k from a.out to ELF.
Unfortunately, that would have broken a big part of the syscall/ioctl
ABI, so I had to scratch that.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
