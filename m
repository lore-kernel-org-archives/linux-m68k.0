From: Stephen N Chivers <schivers@csc.com.au>
Subject: Re: [RFC 3/4] m68k/mvme16x: adopt common boot console
Date: Tue, 4 Mar 2014 07:07:42 +1000
Message-ID: <OFD1D2E71D.C5697807-ONCA257C90.0072F547-CA257C90.0074104D@csc.com>
References: <alpine.LNX.2.00.1403022341400.5357@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail1.bemta7.messagelabs.com ([216.82.254.111]:27802 "EHLO
	mail1.bemta7.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755001AbaCCVO3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Mar 2014 16:14:29 -0500
In-Reply-To: <alpine.LNX.2.00.1403022341400.5357@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@vger.kernel.org>

linux-m68k-owner@vger.kernel.org wrote on 03/03/2014 10:55:49 AM:

> From: Finn Thain <fthain@telegraphics.com.au>
> To: linux-m68k <linux-m68k@lists.linux-m68k.org>
> Date: 03/03/2014 10:56 AM
> Subject: [RFC 3/4] m68k/mvme16x: adopt common boot console
> Sent by: linux-m68k-owner@vger.kernel.org
> 
> In a multi-platform kernel binary we only need one early console 
instance. 
> The difficulty here is that the common early console gets started by 
> early_param(), whereas the MVME16x instance would be started later by 
> config_mvme16x(). That means some interrupt setup must be done earlier.
> 
> ---
> This patch is untested on MVME16x.
>
I have no comments on the content of the patch(es).
 
I have applied these patches to a kernel derived from
linux-m68k git tree at kernel.org (m68k-queue as at 02 Mar).

I have tested the patches with MVME167 board configured for
diskless operation. The configurations tried were:

        a.      earlyprintk set and not set on the kernel
                command line,
        b.      CONFIG_EARLY_PRINTK set and not set,
        c.      CONFIG_SERIAL_CONSOLE set and not set.


Stephen Chivers,
CSC Australia Pty. Ltd.
