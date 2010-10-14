From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: eglibc sysroot
Date: Thu, 14 Oct 2010 23:11:55 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010142255020.276@localhost>
References: <alpine.LNX.2.00.1009221445130.7495@nippy.intranet> <alpine.OSX.2.00.1010122347280.278@localhost> <Pine.BSM.4.64L.1010121755580.28735@herc.mirbsd.org> <alpine.OSX.2.00.1010131102470.285@localhost> <Pine.BSM.4.64L.1010131656010.19763@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010141131490.16747@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:50641 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752342Ab0JNMLy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Oct 2010 08:11:54 -0400
In-Reply-To: <Pine.BSM.4.64L.1010141131490.16747@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org


On Thu, 14 Oct 2010, Thorsten Glaser wrote:

> 
> Is there a simple TLS test programme I can run before extracting the
> eglibc sysroot and building gcc, to see whether the Linux kernel is
> working as expected?

I don't know of any. Under the NPTL sysroot, you should see this:

$ /lib/libc.so.6
...
Available extensions:
...
	Native POSIX Threads Library by Ulrich Drepper et al

[snip]
> extract sysroot
> install updated linux-headers-*.deb and friends over that

You might want to remove the linux-2.6_2.6.32-23 kernel headers already in 
the sysroot first. (They are courtesy of make headers_install and worked 
fine for my purposes but I don't know how they differ from the 
linux-headers deb.)

Or you could just use the existing headers instead of the linux-headers 
deb until you get the eglibc packages built, at which point you can ditch 
the sysroot and debootstrap.

Finn
