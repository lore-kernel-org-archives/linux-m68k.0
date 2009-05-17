From: Brad Boyer <flar@allandria.com>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Sat, 16 May 2009 23:10:39 -0700
Message-ID: <20090517061039.GA3019@cynthia.pants.nu>
References: <F7CDF992-412A-11DE-9D14-00050249ADE1@kaffe.org> <Pine.LNX.4.64.0905152017240.3873@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:39911 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751816AbZEQGLS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 17 May 2009 02:11:18 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0905152017240.3873@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Riccardo <riccardo@kaffe.org>, linux-m68k@vger.kernel.org

On Fri, May 15, 2009 at 08:28:51PM +1000, Finn Thain wrote:
> This commit looks a bit suspect -- it was not CC'd to this list -- in 
> particular the Makefile change:
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc
> 
> So now mac8390.c and 8390.c both #include "lib8390.c"... might this 
> perhaps lead to the wrong ei_inb/outb etc in the final link?

It does seem like an odd change. It would be nice if this list got
copied on changes to any nubus drivers, but I suppose it's not anywhere
on the maintainers list. It might be something to bring up with David
for any future changes to nubus network cards.

I'll try to find some time to build a kernel and try it out. I have
several cards that use this driver.

	Brad Boyer
	flar@allandria.com

