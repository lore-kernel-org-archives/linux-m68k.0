From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: build warnings
Date: Sun, 30 Jan 2011 18:37:48 +1300
Message-ID: <4D44F92C.2050707@gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>	<alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>	<AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>	<AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>	<Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>	<AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>	<Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org> <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:49517 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704Ab1A3FiD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 00:38:03 -0500
Received: by pxi15 with SMTP id 15so670180pxi.19
        for <linux-m68k@vger.kernel.org>; Sat, 29 Jan 2011 21:38:02 -0800 (PST)
In-Reply-To: <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Thorsten,

>> I posted a link to the source package earlier. I cancelled the build
>> though due to this problem.
>>     
>
> Right you are, I'll work from that one then.
>
>   

I've seen a similar panic as the one you posted when I had quite a bit 
of memory pressure due to ext2fsck running. Otherwise, the kernel built 
with my old binutils boots fine and eventually crashes the emulator with:

terminate called after throwing an instance of 'm68k_exception'

after getting well into runlevel 2 and starting a few services.

Retesting your kernel - when I leave swap off I also get to runlevel 2, 
and it starts to throw panic messages as soon as inetd is started.
I've tried a few leads related to network stuff, but in the end 
replacing the  option CONFIG_SLUB=y by CONFIG_SLAB=y did fix it.

Whatever the reason - the SLUB allocator either is buggy outright for 
m68k, or we run into memory pressure a lot sooner than other 
architectures and the VM subsystem needs optimizing for SLUB.

I'd just replace the Debian default for the m68k kernels....

Cheers,

  Michael
