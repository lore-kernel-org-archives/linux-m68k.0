From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: converting the NCR5380 drivers away from scsi_register
Date: Tue, 17 Jun 2014 18:20:55 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1406171756040.17715@nippy.intranet>
References: <20140616141853.GA32399@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:43217 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755781AbaFQIVR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Jun 2014 04:21:17 -0400
In-Reply-To: <20140616141853.GA32399@infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Sam Creasey <sammy@sammy.net>, Michael Schmitz <schmitz@debian.org>, linux-m68k@vger.kernel.org


On Mon, 16 Jun 2014, Christoph Hellwig wrote:

> now that you've officially taken over NCR5380 is there a chance to look 
> into converting the drivers away from scsi_register to the modern 
> scsi_host_alloc/scsi_add_host method?

Have any other conversions taken place? I'm curious to see what was 
involved. Hopefully not a re-write, like esp_scsi (?)

I have not yet managed to get mac_scsi working as well as it should: PDMA 
is not working, either because I'm running it on the wrong (poorly 
documented) hardware or because the driver has bugs.

I still plan to set up a machine with a DMX3191D pci card for testing. It 
would be nice to have the driver working on that hardware (at least) 
before making (or just testing) any substantial changes.

This will take time...

-- 
