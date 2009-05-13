From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] ata: libata depends on HAS_DMA
Date: Wed, 13 May 2009 09:51:27 +0100
Message-ID: <20090513095127.308b00e7@lxorguk.ukuu.org.uk>
References: <20090511222702.352192505@arndb.de>
	<200905112238.55404.arnd@arndb.de>
	<20090512090602.65722342@lxorguk.ukuu.org.uk>
	<200905121123.21436.arnd@arndb.de>
	<20090513033027.GA13193@cynthia.pants.nu>
	<alpine.DEB.1.00.0905130610240.18305@zirkon.biophys.uni-duesseldorf.de>
	<20090513043409.GA13577@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:40982 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758279AbZEMIwT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 May 2009 04:52:19 -0400
In-Reply-To: <20090513043409.GA13577@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, linux-ide@vger.kernel.org, takata@linux-m32r.org, geert@linux-m68k.org, linux-m68k@vger.kernel.org, ysato@users.sourceforge.jp

> > If it doesn't interfere with plain PIO mode, fine. 
> 
> I agree. There definitely needs to still be support for IDE ports that
> don't have DMA capability.

There is - it's just if the platform doesn't implement the dma_* APIs you
get a problem.

Alan
