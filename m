From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v6] ata/pata_buddha: Probe via modalias instead of
 initcall
Date: Fri, 23 Aug 2019 12:42:25 +0200
Message-ID: <7d3c4379-23bd-ef3a-e725-86516097850a@samsung.com>
References: <CGME20190820165731epcas2p340cc3421251987896b857da4ec42038e@epcas2p3.samsung.com>
        <20190820165715.15185-1-max@enpas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820165715.15185-1-max@enpas.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Max Staudt <max@enpas.org>
Cc: axboe@kernel.dk, linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de, schmitzmic@gmail.com, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org


Hi,

On 8/20/19 6:57 PM, Max Staudt wrote:
> Up until now, the pata_buddha driver would only check for cards on
> initcall time. Now, the kernel will call its probe function as soon
> as a compatible card is detected.
> 
> v6: Only do the drvdata workaround for X-Surf (remove breaks otherwise)
>     Style
> 
> v5: Remove module_exit(): There's no good way to handle the X-Surf hack.
>     Also include a workaround to save X-Surf's drvdata in case zorro8390
>     is active.
> 
> v4: Clean up pata_buddha_probe() by using ent->driver_data.
>     Support X-Surf via late_initcall()
> 
> v3: Clean up devm_*, implement device removal.
> 
> v2: Rename 'zdev' to 'z' to make the patch easy to analyse with
>     git diff --ignore-space-change
> 
> Signed-off-by: Max Staudt <max@enpas.org>
> ---
>  drivers/ata/pata_buddha.c | 231 +++++++++++++++++++++++++++-------------------
>  1 file changed, 138 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/ata/pata_buddha.c b/drivers/ata/pata_buddha.c
> index 11a8044ff..9e1b57866 100644
> --- a/drivers/ata/pata_buddha.c
> +++ b/drivers/ata/pata_buddha.c

[...]

> +static struct zorro_driver pata_buddha_driver = {
> +	.name           = "pata_buddha",
> +	.id_table       = pata_buddha_zorro_tbl,
> +	.probe          = pata_buddha_probe,
> +	.remove         = pata_buddha_remove,
> +	.driver  = {
> +		.suppress_bind_attrs = true,

I thought that we had agreed that this is not needed?

With that fixed:

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
