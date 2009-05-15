From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: vmlinuz-2.6.29-1-11May on IIfx
Date: Fri, 15 May 2009 20:28:51 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0905152017240.3873@loopy.telegraphics.com.au>
References: <F7CDF992-412A-11DE-9D14-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:56162 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758330AbZEOK3A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 06:29:00 -0400
In-Reply-To: <F7CDF992-412A-11DE-9D14-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org



On Fri, 15 May 2009, Riccardo wrote:
> 
> ...in 2.6.29 the card doesn't work and I typed the error message 
> manually,
> 
> I then rebooted into 2.6.26, where the card still worked, and pasted its 
> dmesg.

This commit looks a bit suspect -- it was not CC'd to this list -- in 
particular the Makefile change:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc

So now mac8390.c and 8390.c both #include "lib8390.c"... might this 
perhaps lead to the wrong ei_inb/outb etc in the final link?

Finn
