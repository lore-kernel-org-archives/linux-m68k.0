From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k, signals and single-stepping
Date: Sat, 2 Oct 2010 21:57:42 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1010022149050.289@localhost>
References: <20100930055823.GK19804@ZenIV.linux.org.uk> <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com> <m362xn63qc.fsf@hase.home> <20100930120504.GM19804@ZenIV.linux.org.uk> <m3lj6j4dh8.fsf@hase.home> <20100930165041.GN19804@ZenIV.linux.org.uk>
 <alpine.OSX.2.00.1010021325070.289@localhost> <m2iq1kj0sz.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:38166 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002Ab0JBL5r (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 2 Oct 2010 07:57:47 -0400
In-Reply-To: <m2iq1kj0sz.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sat, 2 Oct 2010, Andreas Schwab wrote:

> Finn Thain <fthain@telegraphics.com.au> writes:
> 
> > What are the userland pre-requisites for this kind of testing?
> 
> The best way to test it is to run the gdb testsuite and look for 
> regressions.

That sounds convenient enough. What test failures might one expect for 
recent kernel, tools and libc? (Other than failures due to race conditions 
Al mentioned.)

Finn

> 
> Andreas.
> 
> 
