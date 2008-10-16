From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] reinstate mac rtc
Date: Thu, 16 Oct 2008 12:02:59 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810161144240.6252@loopy.telegraphics.com.au>
References: <F86D8C33-9B01-11DD-B097-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:42504 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752483AbYJPBDB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Oct 2008 21:03:01 -0400
In-Reply-To: <F86D8C33-9B01-11DD-B097-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


Hi Riccardo,

On Wed, 15 Oct 2008, Riccardo wrote:

> Finn, Geert,
> 
> so there is hope of not having a screwed clock time on my IIfx / QUadra 
> 950? the 2.2 series kernel had the clock, but no later kernel ever had 
> it.

I don't know what is wrong with the clock on the Q950. Mine uses ntp. Are 
you sure it works with 2.2?

I haven't tested on a IIfx, but SCSI is almost certainly broken on the 
IIfx anyway.

> 
> Generally, do you have a kernel to use on the above machines? I sitll 
> have 2.2 but I can't upgrade libc due to that and this is breaking my 
> upgrades and made my box a mess...

Try Stephen Marenka's build: 
http://people.debian.org/~smarenka/d-i/m68k/images/daily/kernels/

Make sure you have sshd running, in case of ADB problems (can still happen 
occasionally on my Q950).

Finn

> 
> 
> 
> Riccardo
