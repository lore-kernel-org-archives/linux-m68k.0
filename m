From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 4/13] pmac-zilog, mac68k: replace mac68k SCC code with
 platform device
Date: Tue, 17 Nov 2009 13:10:36 +1100
Message-ID: <1258423836.2140.560.camel@pasglop>
References: <alpine.OSX.2.00.0911031442360.483@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:47617 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754172AbZKQCKq (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 16 Nov 2009 21:10:46 -0500
In-Reply-To: <alpine.OSX.2.00.0911031442360.483@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Wed, 2009-11-04 at 00:40 +1100, Finn Thain wrote:
> Remove the old 68k Mac serial port code and a lot of related cruft. Add 
> platform driver support to the pmac-zilog driver, putting the powermac- 
> specific bits inside #ifdef CONFIG_PPC_PMAC. Add new platform devices to 
> mac68k.
> 
> Tested on a beige G3 PowerMac and a variety of 68k Macs.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Can you split that patch into one that adds the pmac_zilog bit, and a
separate one that then removes the old m68k stuff ?

Cheers,
Ben.
