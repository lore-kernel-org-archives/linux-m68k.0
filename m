From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RFC net-next] Amiga PCMCIA 100 MBit card support
Date: Mon, 17 Sep 2018 09:09:50 +1200
Message-ID: <b3e03100-6b56-7ae2-6a3a-bf3ed2e69716@gmail.com>
References: <20180915203338.GA39871@MacBook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180915203338.GA39871@MacBook.local>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: ALeX Kazik <alex@kazik.de>, netdev@vger.kernel.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Rolf Anders <rolf.anders@physik.uni-augsburg.de>
List-Id: linux-m68k@vger.kernel.org

Thanks for your patch!


On 16/09/18 08:40, ALeX Kazik wrote:
> This adds an option to change the (10 MBit only) "apne" driver to support
> the 10/100 Mbit cards (e.g. Netgear FA411, CNet Singlepoint) instead.
>
> A new configure option is added as a bool to the apne driver to change the
> behaviour to support some new cards instead.
> The option can be only enabled if no other 8390 driver is active because the
> 8390 library is modified when activated.
>
> The patch is initially from http://www.g-mb.de/pcmcia_e.html and adapted by
> me from the 2.6 version.
>
> The contained reset fix is required to use a pcmcia card after a reset/reboot,
> and is also only activated with new option. (Background, as far as I
> understood it: The pcmcia reset line is not connected and after a reset/reboot
> the pcmcia card is in an undefined state and needs a manual reset.)
> This reset patch is probably useful to all Amiga pcmcia drivers (network and
> other) but since I do not own any other card I can't verify that.
>
> Signed-off-by: ALeX Kazik <alex@kazik.de>
> Tested-by: ALeX Kazik <alex@kazik.de>
>
> diff -urp linux-4.18.7/drivers/net/ethernet/8390/8390.h linux-4.18.7-patched/drivers/net/ethernet/8390/8390.h
> --- linux-4.18.7/drivers/net/ethernet/8390/8390.h	2018-09-09 10:32:43.000000000 +0200
> +++ linux-4.18.7-patched/drivers/net/ethernet/8390/8390.h	2018-09-15 14:51:00.000000000 +0200
> @@ -222,4 +222,21 @@ struct ei_device {
>   #define ENTSR_CDH 0x40	/* The collision detect "heartbeat" signal was lost. */
>   #define ENTSR_OWC 0x80  /* There was an out-of-window collision. */
>   
> +/* Change the driver to support word access instead of byte access.
> + * Cards that work with byte access will not work with word access.
> + */
> +#ifdef CONFIG_APNE100MBIT
> +/* redefine inb to do word accesses */
> +#undef inb
> +#define inb(x) ((x) & 1 ? inw((x) - 1) & 0xff : inw(x) >> 8)
> +#undef inb_p
> +#define inb_p(x) inb(x)
> +
> +/* The following redefinition of outb isn't necessary, but may be faster on
> + * slow processors.
> + */
> +#undef outb
> +#define outb(x, y) raw_outb(x, (y) + GAYLE_IO + (((y) & 1) ? GAYLE_ODD : 0))
> +#endif
> +
>   #endif /* _8390_h */
> Only in linux-4.18.7-patched/drivers/net/ethernet/8390/: 8390.h.orig
> diff -urp linux-4.18.7/drivers/net/ethernet/8390/Kconfig linux-4.18.7-patched/drivers/net/ethernet/8390/Kconfig
> --- linux-4.18.7/drivers/net/ethernet/8390/Kconfig	2018-09-09 10:32:43.000000000 +0200
> +++ linux-4.18.7-patched/drivers/net/ethernet/8390/Kconfig	2018-09-15 14:34:18.000000000 +0200
> @@ -142,6 +142,22 @@ config APNE
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called apne.
>   
> +if APNE
> +config APNE100MBIT
> +	bool "PCMCIA NE2000 100MBit support"
> +	default n
> +	depends on ARM_ETHERH=n && AX88796=n && HYDRA=n && MAC8390=n
> +	depends on MCF8390=n && NE2000=n && NE2K_PCI=n && PCMCIA_AXNET=n
> +	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
> +	depends on XSURF100=n && ZORRO8390=n
ARM_ETHERH and MCF8390 can't be configured along with APNE, so these are 
safe to leave out here.

AX88796, HYDRA, MAC8390, XSURF100 and ZORRO8390 all use the lib8390.c 
core, and define ei_inb() to use MMIO type access macros such as 
read_8(). These won't be affected at all by your redefinition of inb(), 
and can also be left out of the above list.

I suspect NE2K_PCI can't be selected on m68k for lack of PCI support, 
might also be safe to drop.

The rest looks fine to me!

Cheers,

     Michael

> +	---help---
> +	  This changes the driver to support ONLY 10/100Mbit cards (e.g. Netgear
> +	  FA411, CNet Singlepoint).
> +	  Cards that worked with the original version won't with this version.
> +
> +	  Say N, unless you absolutely know what you are doing.
> +endif
> +
>   config PCMCIA_PCNET
>   	tristate "NE2000 compatible PCMCIA support"
>   	depends on PCMCIA
> diff -urp linux-4.18.7/drivers/net/ethernet/8390/apne.c linux-4.18.7-patched/drivers/net/ethernet/8390/apne.c
> --- linux-4.18.7/drivers/net/ethernet/8390/apne.c	2018-09-09 10:32:43.000000000 +0200
> +++ linux-4.18.7-patched/drivers/net/ethernet/8390/apne.c	2018-09-15 14:48:27.000000000 +0200
> @@ -590,6 +590,16 @@ static int init_pcmcia(void)
>   #endif
>   	u_long offset;
>   
> +#ifdef CONFIG_APNE100MBIT
> +	/* reset card (idea taken from CardReset by Artur Pogoda) */
> +	{
> +		u_char  tmp = gayle.intreq;
> +
> +		gayle.intreq = 0xff;    mdelay(1);
> +		gayle.intreq = tmp;     mdelay(300);
> +	}
> +#endif
> +
>   	pcmcia_reset();
>   	pcmcia_program_voltage(PCMCIA_0V);
>   	pcmcia_access_speed(PCMCIA_SPEED_250NS);
