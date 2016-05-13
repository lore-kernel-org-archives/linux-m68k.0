From: "George Spelvin" <linux@horizon.com>
Subject: Re: [RFC PATCH 1/2] arch/m68k/lib/mulsi3.S: Optimize]
Date: 12 May 2016 22:36:31 -0400
Message-ID: <20160513023631.15160.qmail@ns.horizon.com>
References: <573528E8.8070301@westnet.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:61147 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753103AbcEMCgd (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 12 May 2016 22:36:33 -0400
In-Reply-To: <573528E8.8070301@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gregungerer@westnet.com.au, linux-m68k@lists.linux-m68k.org, linux@horizon.com

> I have many test setups for ColdFire (qemu and real hardware) but
> none of them actually use the mulsi3 code. I don't have anything
> for testing classic m68000 builds.
> 
> So other than compiling it I don't have an easy way to currently
> test it.

You couldn't write a user-level test program which calls __mulsi3(x,y)
explicitly and compares the result to x*y?

I'll write it for you if you like.

Even if we can only test the ColdFire branch, that reduces the number
of untested lines considerably.
