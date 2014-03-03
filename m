From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 3/4] m68k/mvme16x: adopt common boot console
Date: Tue, 4 Mar 2014 10:54:45 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403040906360.9978@nippy.intranet>
References: <alpine.LNX.2.00.1403022341400.5357@nippy.intranet> <OFD1D2E71D.C5697807-ONCA257C90.0072F547-CA257C90.0074104D@csc.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41603 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755830AbaCCXzH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Mar 2014 18:55:07 -0500
In-Reply-To: <OFD1D2E71D.C5697807-ONCA257C90.0072F547-CA257C90.0074104D@csc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen N Chivers <schivers@csc.com.au>
Cc: linux-m68k <linux-m68k@vger.kernel.org>


On Tue, 4 Mar 2014, Stephen N Chivers wrote:

> I have applied these patches to a kernel derived from linux-m68k git 
> tree at kernel.org (m68k-queue as at 02 Mar).
> 
> I have tested the patches with MVME167 board configured for diskless 
> operation. The configurations tried were:
> 
>         a.      earlyprintk set and not set on the kernel
>                 command line,
>         b.      CONFIG_EARLY_PRINTK set and not set,
>         c.      CONFIG_SERIAL_CONSOLE set and not set.

Thanks for testing.

Finn

> 
> 
> Stephen Chivers,
> CSC Australia Pty. Ltd.
> 
