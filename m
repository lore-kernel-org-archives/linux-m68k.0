From: Brad Boyer <flar@allandria.com>
Subject: Re: sonic ethernet and powerbook 520
Date: Wed, 28 Oct 2009 19:50:06 -0700
Message-ID: <20091029025006.GA32242@cynthia.pants.nu>
References: <alpine.OSX.2.00.0910281848300.523@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:34246 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751601AbZJ2CuQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 28 Oct 2009 22:50:16 -0400
Content-Disposition: inline
In-Reply-To: <alpine.OSX.2.00.0910281848300.523@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

On Thu, Oct 29, 2009 at 03:22:21AM +1100, Finn Thain wrote:
> 
> I've just tested a new kernel on a powerbook 520, and it crashes while 
> reading the sonic's MAC address. The same kernel binary works fine with 
> Quadra comm-slot and on-board sonic NICs, which use the same code path.
> 
> The crash occurs while reading the MAC address during the driver probe. 
> Basically, nubus_readb(ONBOARD_SONIC_PROM_BASE) fails. Macsbug can't read 
> this address either.
> 
> Anyone want to take a guess at the real PROM base? If I had a rough idea I 
> could get Macsbug to search for the MAC address, but it's a bit difficult 
> when the memory map is full of holes. Is it worth trying to search 
> /dev/kmem?

I have no idea, but I don't think anyone else does either. The NetBSD
driver has a comment that implies pretty strongly that their driver
doesn't know where the PROM is on any PB with onboard sonic. They
read the address that is already programmed into the chip if the
PROM query fails. They also do a test probe of the address so it
doesn't die if the address doesn't go anywhere.

Does the driver work if you just skip that part and program in a
fixed value that you know is valid?

	Brad Boyer
	flar@allandria.com
