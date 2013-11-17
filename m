From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH WIP] X-Surf-100 Ethernet driver
Date: Sun, 17 Nov 2013 11:19:30 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311171118440.17141@ayla.of.borg>
References: <alpine.DEB.2.02.1311171005410.19767@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1311171005410.19767@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

On Sun, 17 Nov 2013, Geert Uytterhoeven wrote:
> This is a preliminary driver for the Individual Computers XSurf100 Ethernet
> card, written by Michael Karcher. It currently works fine with the 3.2.0-4
> kernel in Debian.

> --- linux-3.2.0-4/drivers/net/ethernet/8390/ax88796.c.orig	2013-11-16 13:49:37.000000000 +0100
> +++ linux-3.2.0-4/drivers/net/ethernet/8390/ax88796.c	2013-09-14 13:52:35.000000000 +0200

This is not ready for inclusion as-is, as it just converts the existing
ax88796.c to support XSurf100 only. A separate driver needs to be created.

However, I'm wondering whether we can just use the original driver, with a
small shim providing a platform_device with a suitable ax_plat_data as
platform_data.

> @@ -10,6 +10,7 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +#define CONFIG_AX88796_93CX6

Should be open-coded below (or XS100 should select it in Kconfig if ax88796
is used).

> +static inline void fast_out32(char *out, const char *in, size_t len)
> +{
> +	while(len > 128)
> +	{
> +		memcpy(out, in, 128);
> +		in += 128;
> +		len -= 128;
> +	}
> +	memcpy(out, in, len & 0xFC);
> +	in += len & 0xFC;
> +	memcpy(out, in, len & 3);
> +}

No need to call memcpy() in this convoluted way. arch/m68k/lib/memcpy.c
should handle this fine.

However, as this is MMIO, memcpy_toio() would be more appropriate.

> +
>  static inline struct ax_device *to_ax_dev(struct net_device *dev)
>  {
>  	struct ei_device *ei_local = netdev_priv(dev);
> @@ -192,10 +209,10 @@ static void ax_get_8390_hdr(struct net_d
>  	ei_outb(E8390_RREAD+E8390_START, nic_base + NE_CMD);
>  
>  	if (ei_local->word16)
> -		readsw(nic_base + NE_DATAPORT, hdr,
> +		ioread16_rep(nic_base + NE_DATAPORT, hdr,
>  		       sizeof(struct e8390_pkt_hdr) >> 1);
>  	else
> -		readsb(nic_base + NE_DATAPORT, hdr,
> +		ioread8_rep(nic_base + NE_DATAPORT, hdr,
>  		       sizeof(struct e8390_pkt_hdr));
>  
>  	ei_outb(ENISR_RDC, nic_base + EN0_ISR);	/* Ack intr. */
> @@ -238,12 +255,12 @@ static void ax_block_input(struct net_de
>  	ei_outb(E8390_RREAD+E8390_START, nic_base + NE_CMD);
>  
>  	if (ei_local->word16) {
> -		readsw(nic_base + NE_DATAPORT, buf, count >> 1);
> +		ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
>  		if (count & 0x01)
>  			buf[count-1] = ei_inb(nic_base + NE_DATAPORT);
>  
>  	} else {
> -		readsb(nic_base + NE_DATAPORT, buf, count);
> +		ioread8_rep(nic_base + NE_DATAPORT, buf, count);

These changes are already in current ax88796.c, good.

>  	}
>  
>  	ei_local->dmaing &= ~1;
> @@ -286,10 +303,11 @@ static void ax_block_output(struct net_d
>  	ei_outb(start_page, nic_base + EN0_RSARHI);
>  
>  	ei_outb(E8390_RWRITE+E8390_START, nic_base + NE_CMD);
> -	if (ei_local->word16)
> -		writesw(nic_base + NE_DATAPORT, buf, count >> 1);
> +/*	if (ei_local->word16)
> +		iowrite16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
>  	else
> -		writesb(nic_base + NE_DATAPORT, buf, count);
> +		iowrite8_rep(nic_base + NE_DATAPORT, buf, count);*/
> +	fast_out32(nic_base + NE_DATAPORT, buf, count);

If we reuse ax88796.c, can this be done in a more generic way?
E.g. by adding a fifo flag to ax_plat_data.flags (accessible using
to_ax_dev()).

>  	dma_start = jiffies;
>  
> @@ -400,6 +418,10 @@ static int ax_open(struct net_device *de
>  
>  	netdev_dbg(dev, "open\n");
>  
> +	ret = ax_mii_init(dev);
> +	if (ret)
> +		goto failed_request_irq;

Why is this moved to here?

> +
>  	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
>  			  dev->name, dev);
>  	if (ret)
> @@ -446,6 +468,10 @@ static int ax_close(struct net_device *d
>  	phy_disconnect(ax->phy_dev);
>  
>  	free_irq(dev->irq, dev);
> +
> +	mdiobus_unregister(ax->mii_bus);
> +	kfree(ax->mii_bus->irq);
> +	free_mdio_bitbang(ax->mii_bus);

Related to the move of ax_mii_init()?

> @@ -692,10 +718,16 @@ static int ax_init_dev(struct net_device
>  	if (ax->plat->flags & AXFLG_HAS_EEPROM) {
>  		unsigned char SA_prom[32];
>  
> +		ei_outb(6, ioaddr + EN0_RCNTLO);
> +		ei_outb(0, ioaddr + EN0_RCNTHI);
> +		ei_outb(0, ioaddr + EN0_RSARLO);
> +		ei_outb(0, ioaddr + EN0_RSARHI);
> +		ei_outb(E8390_RREAD+E8390_START, ioaddr + NE_CMD);
>  		for (i = 0; i < sizeof(SA_prom); i += 2) {
>  			SA_prom[i] = ei_inb(ioaddr + NE_DATAPORT);
>  			SA_prom[i + 1] = ei_inb(ioaddr + NE_DATAPORT);
>  		}
> +		ei_outb(ENISR_RDC, ioaddr + EN0_ISR);	/* Ack intr. */

Why these changes?

As CONFIG_AX88796_93CX6 is set at the top, I'd expect the 93CX6 code
below to be used instead, ...

> +static const struct ax_plat_data xsurf100_plat_data = {
> +	.flags = AXFLG_HAS_EEPROM,

... and why AXFLG_HAS_EEPROM and not AXFLG_HAS_93CX6?

> +	.wordlength = 2,
> +	.dcr_val = 0x48,
> +	.rcr_val = 0x40,
> +};
> +
>  /*
>   * ax_probe
>   *

>  	/*
>  	 * setup the register offsets from either the platform data or
>  	 * by using the size of the resource provided
>  	 */
> -	if (ax->plat->reg_offsets)
> -		ei_local->reg_offset = ax->plat->reg_offsets;
> -	else {
> -		ei_local->reg_offset = ax->reg_offsets;
> -		for (ret = 0; ret < 0x18; ret++)
> -			ax->reg_offsets[ret] = (mem_size / 0x18) * ret;
> -	}
> +	ei_local->reg_offset = ax->reg_offsets;
> +	for (ret = 0; ret < 0x20; ret++)
> +		ax->reg_offsets[ret] = 4 * ret + 0x800;

When reusing ax88796.c, you can fill in ax_plat_data.reg_offsets[].

> +#define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)

This belongs in <linux/zorro_ids.h>.
Please also add an entry to drivers/zorro/zorro.ids.
(Note to myself: update zorroutils).

Forward porting to 3.2.12 should be simple. Just look at all changes that
have been made to ax88796.c recently.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
