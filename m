From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: What ISA hardware is integrated into m68k bridges
Date: Mon, 21 May 2012 11:35:21 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1205211126290.2484@nippy.intranet>
References: <20120520163105.GC21177@windriver.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:40058 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754700Ab2EUBf2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 21:35:28 -0400
In-Reply-To: <20120520163105.GC21177@windriver.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, Alan Cox <alan@linux.intel.com>


> [1] http://patchwork.ozlabs.org/patch/160144/
> 

That thread makes it pretty clear that you don't like the presence of a 
certain NIC driver, because you don't like limited hardware, and because 
you personally have no need of neither.

But, nowhere in that thread is there any reason given for piecemeal ISA 
removal: Alan asked "So, should we dump ISA?" after suggesting "Removing 
[the NIC driver] because nobody is running one even in a museum might be a 
good reason".

So, I wonder, how will you ascertain that there are no users of this code 
you've targetted?

Finn
