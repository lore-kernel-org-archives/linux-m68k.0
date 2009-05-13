From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ata: libata depends on HAS_DMA
Date: Wed, 13 May 2009 12:39:00 +0200
Message-ID: <200905131239.01677.arnd__13852.3010224619$1242211229$gmane$org@arndb.de>
References: <20090511222702.352192505@arndb.de> <200905121123.21436.arnd@arndb.de> <20090513033027.GA13193@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090513033027.GA13193@cynthia.pants.nu>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, linux-ide@vger.kernel.org, takata@linux-m32r.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, ysato@users.sourceforge.jp

On Wednesday 13 May 2009, Brad Boyer wrote:
> If I'm reading the m68k code correctly, SUN3 is the one that doesn't have
> DMA. It is implemented on any m68k with a standard Motorola MMU. It might
> be possible to get the DMA code working on a sun3, but I doubt they ever
> have IDE hardware.

Yes, that's right, I misread the Kconfig logic.

In m68nommu, there are also Dragonball and MC68360 that are supported
but don't support the DMA API right now. Is that a real limitation, or
could those potentially have ATA ports?

	Arnd <><
