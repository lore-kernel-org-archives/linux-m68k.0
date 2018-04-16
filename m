From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 02/10] net: ax88796: Attach MII bus only when open
Date: Tue, 17 Apr 2018 00:59:00 +0200
Message-ID: <20180416225900.GA23474@lunn.ch>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-3-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523916285-6057-3-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Tue, Apr 17, 2018 at 10:04:37AM +1200, Michael Schmitz wrote:
> From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>
> 
> Call ax_mii_init in ax_open(), and unregister/remove mdiobus resources
> in ax_close().
> 
> This is needed to be able to unload the module, as the module is busy
> while the MII bus is attached.
> 
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> ---
>  drivers/net/ethernet/8390/ax88796.c |   13 +++++++++----
>  1 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
> index 2a256aa..f7b8911 100644
> --- a/drivers/net/ethernet/8390/ax88796.c
> +++ b/drivers/net/ethernet/8390/ax88796.c
> @@ -79,6 +79,8 @@
>  
>  static u32 ax_msg_enable;
>  
> +static int ax_mii_init(struct net_device *dev);

Hi Michael

We try to avoid forward declarations. Please can you move
ax_mii_init() so this is not needed.

> +
>  /* device private data */
>  
>  struct ax_device {
> @@ -396,6 +398,10 @@ static int ax_open(struct net_device *dev)
>  
>  	netdev_dbg(dev, "open\n");
>  
> +	ret = ax_mii_init(dev);
> +	if (ret)
> +		goto failed_request_irq;
> +
>  	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
>  			  dev->name, dev);
>  	if (ret)

You are missing some cleanup on error at the end of ax_open().
It was also missing before.

   Andrew
