From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Thu, 25 Jul 2019 19:03:57 +0200
Message-ID: <01cfe282-6ce6-ff40-9e85-e23724f9d50f@samsung.com>
References: <20190725102211.8526-1-max@enpas.org>
        <CGME20190725170359eucas1p271187268f749869088f60bf961194169@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102211.8526-1-max@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org


Hi Max,

On 7/25/19 12:22 PM, Max Staudt wrote:
> Up until now, the pata_buddha driver would only check for cards on
> initcall time. Now, the kernel will call its probe function as soon
> as a compatible card is detected.
> 
> Device removal remains unimplemented. A WARN_ONCE() serves as a
> reminder.
> 
> v2: Rename 'zdev' to 'z' to make the patch easy to analyse with
>     git diff --ignore-space-change
> 
> Tested-by: Max Staudt <max@enpas.org>
> Signed-off-by: Max Staudt <max@enpas.org>
> ---
>  drivers/ata/pata_buddha.c | 240 ++++++++++++++++++++++++++++------------------
>  1 file changed, 146 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/ata/pata_buddha.c b/drivers/ata/pata_buddha.c
> index 11a8044ff..76804a4c1 100644
> --- a/drivers/ata/pata_buddha.c
> +++ b/drivers/ata/pata_buddha.c
> @@ -19,6 +19,7 @@
>  #include <linux/libata.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> +#include <linux/types.h>
>  #include <linux/zorro.h>
>  #include <scsi/scsi_cmnd.h>
>  #include <scsi/scsi_host.h>
> @@ -29,7 +30,7 @@
>  #include <asm/setup.h>
>  
>  #define DRV_NAME "pata_buddha"
> -#define DRV_VERSION "0.1.0"
> +#define DRV_VERSION "0.1.1"
>  
>  #define BUDDHA_BASE1	0x800
>  #define BUDDHA_BASE2	0xa00
> @@ -47,11 +48,11 @@ enum {
>  	BOARD_XSURF
>  };
>  
> -static unsigned int buddha_bases[3] __initdata = {
> +static unsigned int buddha_bases[3] = {
>  	BUDDHA_BASE1, BUDDHA_BASE2, BUDDHA_BASE3
>  };
>  
> -static unsigned int xsurf_bases[2] __initdata = {
> +static unsigned int xsurf_bases[2] = {
>  	XSURF_BASE1, XSURF_BASE2
>  };
>  
> @@ -145,111 +146,162 @@ static struct ata_port_operations pata_xsurf_ops = {
>  	.set_mode	= pata_buddha_set_mode,
>  };
>  
> -static int __init pata_buddha_init_one(void)
> +static int pata_buddha_probe(struct zorro_dev *z,
> +			     const struct zorro_device_id *ent)
>  {
> -	struct zorro_dev *z = NULL;
> -
> -	while ((z = zorro_find_device(ZORRO_WILDCARD, z))) {
> -		static const char *board_name[]
> -			= { "Buddha", "Catweasel", "X-Surf" };
> -		struct ata_host *host;
> -		void __iomem *buddha_board;
> -		unsigned long board;
> -		unsigned int type, nr_ports = 2;
> -		int i;
> -
> -		if (z->id == ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA) {
> -			type = BOARD_BUDDHA;
> -		} else if (z->id == ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL) {
> -			type = BOARD_CATWEASEL;
> -			nr_ports++;
> -		} else if (z->id == ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF) {
> -			type = BOARD_XSURF;
> -		} else
> -			continue;
> -
> -		dev_info(&z->dev, "%s IDE controller\n", board_name[type]);
> -
> -		board = z->resource.start;
> +	static const char * const board_name[]
> +		= { "Buddha", "Catweasel", "X-Surf" };
> +	struct ata_host *host;
> +	void __iomem *buddha_board;
> +	unsigned long board;
> +	unsigned int type, nr_ports = 2;
> +	int i;
> +
> +	switch (z->id) {
> +	case ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA:
> +	default:
> +		type = BOARD_BUDDHA;
> +		break;
> +	case ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL:
> +		type = BOARD_CATWEASEL;
> +		nr_ports++;
> +		break;
> +	case ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF:
> +		type = BOARD_XSURF;
> +		break;
> +	}
> +
> +	dev_info(&z->dev, "%s IDE controller\n", board_name[type]);
> +
> +	board = z->resource.start;
> +
> +	if (type != BOARD_XSURF) {
> +		if (!devm_request_mem_region(&z->dev,
> +					     board + BUDDHA_BASE1,
> +					     0x800, DRV_NAME))
> +			return -ENXIO;
> +	} else {
> +		if (!devm_request_mem_region(&z->dev,
> +					     board + XSURF_BASE1,
> +					     0x1000, DRV_NAME))
> +			return -ENXIO;
> +		if (!devm_request_mem_region(&z->dev,
> +					     board + XSURF_BASE2,
> +					     0x1000, DRV_NAME)) {
> +			devm_release_mem_region(&z->dev,
> +						board + XSURF_BASE1,
> +						0x1000);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	/* allocate host */
> +	host = ata_host_alloc(&z->dev, nr_ports);
> +	if (!host)
> +		goto err_ata_host_alloc;
> +
> +	buddha_board = ZTWO_VADDR(board);
> +
> +	/* enable the board IRQ on Buddha/Catweasel */
> +	if (type != BOARD_XSURF)
> +		z_writeb(0, buddha_board + BUDDHA_IRQ_MR);
> +
> +	for (i = 0; i < nr_ports; i++) {
> +		struct ata_port *ap = host->ports[i];
> +		void __iomem *base, *irqport;
> +		unsigned long ctl = 0;
>  
>  		if (type != BOARD_XSURF) {
> -			if (!devm_request_mem_region(&z->dev,
> -						     board + BUDDHA_BASE1,
> -						     0x800, DRV_NAME))
> -				continue;
> +			ap->ops = &pata_buddha_ops;
> +			base = buddha_board + buddha_bases[i];
> +			ctl = BUDDHA_CONTROL;
> +			irqport = buddha_board + BUDDHA_IRQ + i * 0x40;
>  		} else {
> -			if (!devm_request_mem_region(&z->dev,
> -						     board + XSURF_BASE1,
> -						     0x1000, DRV_NAME))
> -				continue;
> -			if (!devm_request_mem_region(&z->dev,
> -						     board + XSURF_BASE2,
> -						     0x1000, DRV_NAME))
> -				continue;
> +			ap->ops = &pata_xsurf_ops;
> +			base = buddha_board + xsurf_bases[i];
> +			/* X-Surf has no CS1* (Control/AltStat) */
> +			irqport = buddha_board + XSURF_IRQ;
>  		}
>  
> -		/* allocate host */
> -		host = ata_host_alloc(&z->dev, nr_ports);
> -		if (!host)
> -			continue;
> -
> -		buddha_board = ZTWO_VADDR(board);
> -
> -		/* enable the board IRQ on Buddha/Catweasel */
> -		if (type != BOARD_XSURF)
> -			z_writeb(0, buddha_board + BUDDHA_IRQ_MR);
> -
> -		for (i = 0; i < nr_ports; i++) {
> -			struct ata_port *ap = host->ports[i];
> -			void __iomem *base, *irqport;
> -			unsigned long ctl = 0;
> -
> -			if (type != BOARD_XSURF) {
> -				ap->ops = &pata_buddha_ops;
> -				base = buddha_board + buddha_bases[i];
> -				ctl = BUDDHA_CONTROL;
> -				irqport = buddha_board + BUDDHA_IRQ + i * 0x40;
> -			} else {
> -				ap->ops = &pata_xsurf_ops;
> -				base = buddha_board + xsurf_bases[i];
> -				/* X-Surf has no CS1* (Control/AltStat) */
> -				irqport = buddha_board + XSURF_IRQ;
> -			}
> -
> -			ap->pio_mask = ATA_PIO4;
> -			ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
> -
> -			ap->ioaddr.data_addr		= base;
> -			ap->ioaddr.error_addr		= base + 2 + 1 * 4;
> -			ap->ioaddr.feature_addr		= base + 2 + 1 * 4;
> -			ap->ioaddr.nsect_addr		= base + 2 + 2 * 4;
> -			ap->ioaddr.lbal_addr		= base + 2 + 3 * 4;
> -			ap->ioaddr.lbam_addr		= base + 2 + 4 * 4;
> -			ap->ioaddr.lbah_addr		= base + 2 + 5 * 4;
> -			ap->ioaddr.device_addr		= base + 2 + 6 * 4;
> -			ap->ioaddr.status_addr		= base + 2 + 7 * 4;
> -			ap->ioaddr.command_addr		= base + 2 + 7 * 4;
> -
> -			if (ctl) {
> -				ap->ioaddr.altstatus_addr = base + ctl;
> -				ap->ioaddr.ctl_addr	  = base + ctl;
> -			}
> -
> -			ap->private_data = (void *)irqport;
> -
> -			ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx", board,
> -				      ctl ? board + buddha_bases[i] + ctl : 0);
> +		ap->pio_mask = ATA_PIO4;
> +		ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
> +
> +		ap->ioaddr.data_addr		= base;
> +		ap->ioaddr.error_addr		= base + 2 + 1 * 4;
> +		ap->ioaddr.feature_addr		= base + 2 + 1 * 4;
> +		ap->ioaddr.nsect_addr		= base + 2 + 2 * 4;
> +		ap->ioaddr.lbal_addr		= base + 2 + 3 * 4;
> +		ap->ioaddr.lbam_addr		= base + 2 + 4 * 4;
> +		ap->ioaddr.lbah_addr		= base + 2 + 5 * 4;
> +		ap->ioaddr.device_addr		= base + 2 + 6 * 4;
> +		ap->ioaddr.status_addr		= base + 2 + 7 * 4;
> +		ap->ioaddr.command_addr		= base + 2 + 7 * 4;
> +
> +		if (ctl) {
> +			ap->ioaddr.altstatus_addr = base + ctl;
> +			ap->ioaddr.ctl_addr	  = base + ctl;
>  		}
>  
> -		ata_host_activate(host, IRQ_AMIGA_PORTS, ata_sff_interrupt,
> -				  IRQF_SHARED, &pata_buddha_sht);
> +		ap->private_data = (void *)irqport;
>  
> +		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx", board,
> +			      ctl ? board + buddha_bases[i] + ctl : 0);
>  	}
>  
> +	ata_host_activate(host, IRQ_AMIGA_PORTS, ata_sff_interrupt,
> +			  IRQF_SHARED, &pata_buddha_sht);
> +
> +
>  	return 0;
> +
> +err_ata_host_alloc:
> +	switch (type) {
> +	case BOARD_BUDDHA:
> +	case BOARD_CATWEASEL:
> +	default:
> +		devm_release_mem_region(&z->dev,
> +					board + BUDDHA_BASE1,
> +					0x800);

Could you please explain why this is needed now?

[ The whole idea of using devm_* helpers is to not have to release
  resources explicitly. ]

> +		break;
> +	case BOARD_XSURF:
> +		devm_release_mem_region(&z->dev,
> +					board + XSURF_BASE1,
> +					0x1000);
> +		devm_release_mem_region(&z->dev,
> +					board + XSURF_BASE2,
> +					0x1000);
> +		break;
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static void pata_buddha_remove(struct zorro_dev *zdev)
> +{
> +	/* NOT IMPLEMENTED */
> +
> +	WARN_ONCE(1, "pata_buddha: Attempted to remove driver. This is not implemented yet.\n");

Please try to implement it, should be as simple as:

static void pata_buddha_remove(struct zorro_dev *zdev)
{
	struct ata_host *host = dev_get_drvdata(&zdev->dev);

	ata_host_detach(host);
}

[ ata_host_alloc() in pata_buddha_probe() sets drvdata to host ]

The rest of the patch looks fine, thanks for working on this driver.

>  }
>  
> -module_init(pata_buddha_init_one);
> +static const struct zorro_device_id pata_buddha_zorro_tbl[] = {
> +	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_BUDDHA, },
> +	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_CATWEASEL, },
> +	{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, },
> +	{ 0 }
> +};
> +
> +MODULE_DEVICE_TABLE(zorro, pata_buddha_zorro_tbl);
> +
> +static struct zorro_driver pata_buddha_driver = {
> +	.name           = "pata_buddha",
> +	.id_table       = pata_buddha_zorro_tbl,
> +	.probe          = pata_buddha_probe,
> +	.remove         = pata_buddha_remove,
> +};
> +
> +module_driver(pata_buddha_driver,
> +	      zorro_register_driver,
> +	      zorro_unregister_driver);
>  
>  MODULE_AUTHOR("Bartlomiej Zolnierkiewicz");
>  MODULE_DESCRIPTION("low-level driver for Buddha/Catweasel/X-Surf PATA");

PS Next time please also use scripts/get_maintainer.pl script to get
   the list of people that should be added to Cc:, i.e.:

$ ./scripts/get_maintainer.pl -f drivers/ata/pata_buddha.c
Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> (maintainer:LIBATA PATA DRIVERS)
Jens Axboe <axboe@kernel.dk> (maintainer:LIBATA PATA DRIVERS)
linux-ide@vger.kernel.org (open list:LIBATA PATA DRIVERS)
linux-kernel@vger.kernel.org (open list)

[ I've also added John, Michael & Geert to Cc: (as they were all
  involved in the development of the initial driver version). ]

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
