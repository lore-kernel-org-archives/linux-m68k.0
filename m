From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 08/10] net: ax88796: Make reset more robust on AX88796B
Date: Tue, 17 Apr 2018 01:12:23 +0200
Message-ID: <20180416231223.GB23474@lunn.ch>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-9-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523916285-6057-9-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Tue, Apr 17, 2018 at 10:04:43AM +1200, Michael Schmitz wrote:
> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> The AX88796B as installed on the X-Surf-100 does not recognize a MII reset
> request if the previous write to the MII control register also was a reset
> request. So a dummy write to the control register makes the soft reset in
> the PHY initialization code work.
> 
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
> ---
>  drivers/net/ethernet/8390/ax88796.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
> index 6af9aca..a2f9a09 100644
> --- a/drivers/net/ethernet/8390/ax88796.c
> +++ b/drivers/net/ethernet/8390/ax88796.c
> @@ -374,6 +374,10 @@ static int ax_mii_probe(struct net_device *dev)
>  		return -ENODEV;
>  	}
>  
> +	/* write a non-reset pattern to the control register to
> +	 * re-arm the reset request detection logic (needed on AX88796B)
> +	 */
> +	phy_write(phy_dev, MII_BMCR, 0);

This should really be fixed in the PHY driver, not the MAC.

     Andrew
