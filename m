From: Christoph Hellwig <hch@infradead.org>
Subject: converting the NCR5380 drivers away from scsi_register
Date: Mon, 16 Jun 2014 07:18:53 -0700
Message-ID: <20140616141853.GA32399@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38113 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098AbaFPOS5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jun 2014 10:18:57 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Sam Creasey <sammy@sammy.net>, Michael Schmitz <schmitz@debian.org>, linux-m68k@vger.kernel.org

Hi Finn,

now that you've officially taken over NCR5380 is there a chance to look
into converting the drivers away from scsi_register to the modern
scsi_host_alloc/scsi_add_host method?  The NCR5380 drivers are a large
armound of the remaining users of this interface, so converting them
over would be a great help in killing that 10 year old legacy off.
