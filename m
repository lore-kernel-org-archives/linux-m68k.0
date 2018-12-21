From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Thu, 20 Dec 2018 16:10:53 -0800 (PST)
Message-ID: <20181220.161053.1268735869147094096.davem@davemloft.net>
References: <20181219222427.GA78871@MacBook.fritz.box>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181219222427.GA78871@MacBook.fritz.box>
Sender: netdev-owner@vger.kernel.org
To: alex@kazik.de
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

From: ALeX Kazik <alex@kazik.de>
Date: Wed, 19 Dec 2018 23:24:32 +0100

> +	bool "PCMCIA NE2000 100MBit support"
> +	default n
> +	depends on ARM_ETHERH=n && AX88796=n && HYDRA=n && MAC8390=n
> +	depends on MCF8390=n && NE2000=n && NE2K_PCI=n && PCMCIA_AXNET=n
> +	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
> +	depends on XSURF100=n && ZORRO8390=n
> +	---help---

Generally I'm not too happy with these changes, they are all very hackish.

And in particular this huge complicated Kconfig construct is not
maintainable at all.

Sorry.
