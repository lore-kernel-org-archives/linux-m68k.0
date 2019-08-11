From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v4] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Sun, 11 Aug 2019 21:28:33 +0200
Message-ID: <d9fa8aca-62a4-5d4a-b63f-bdd628e6b304@enpas.org>
References: <20190811153643.12029-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811153643.12029-1-max@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: b.zolnierkie@samsung.com, axboe@kernel.dk
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

Replying to my own patch with two more questions:


On 08/11/2019 05:36 PM, Max Staudt wrote:
> -		/* allocate host */
> -		host = ata_host_alloc(&z->dev, nr_ports);

Actually, this is an issue even the existing pata_buddha has: ata_host_alloc() will dev_set_drvdata(dev, host) which is fine on Buddha and Catweasel, but conflicts with zorro8390's own dev_set_drvdata() on an X-Surf board. Thus, if both pata_buddha and zorro8390 are active, only one can be unloaded. The original ide/buddha driver does not have this problem as far as I can see.

This should be resolved once we get around to MFD support, as Geert suggested.

Shall we leave this as-is, as it's not really a change from the status quo in pata_buddha?


> +static int __init pata_buddha_late_init(void)
> +{
> +        struct zorro_dev *z = NULL;
> +
> +	pr_info("pata_buddha: Scanning for stand-alone IDE controllers...\n");
> +	zorro_register_driver(&pata_buddha_driver);
> +
> +	pr_info("pata_buddha: Scanning for X-Surf boards...\n");
> +        while ((z = zorro_find_device(ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, z))) {
> +		static struct zorro_device_id xsurf_ent =
> +			{ ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, BOARD_XSURF};
> +
> +		pata_buddha_probe(z, &xsurf_ent);
> +        }
> +
> +        return 0;
> +}

This is suboptimal, as we don't release memory in case pata_buddha_probe() fails. Any suggestions?


> +static void __exit pata_buddha_exit(void)
> +{
> +	struct zorro_dev *z = NULL;
> +
> +	pr_info("pata_buddha: Releasing X-Surf boards...\n");
> +        while ((z = zorro_find_device(ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF, z))) {
> +		struct ata_host *host = dev_get_drvdata(&z->dev);
> +
> +		if (host)
> +			ata_host_detach(host);
> +        }

I guess that here we also need to manually release the resources we allocated with devm_* above. Any ideas?


Thanks

Max
