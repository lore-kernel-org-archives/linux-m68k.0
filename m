From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 1/9] net: phy: new Asix Electronics PHY driver
Date: Wed, 18 Apr 2018 14:13:56 +0200
Message-ID: <20180418121356.GA31643@lunn.ch>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
 <1524025616-3722-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524025616-3722-2-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

> +
> +/**
> + * asix_soft_reset - software reset the PHY via BMCR_RESET bit
> + * @phydev: target phy_device struct
> + *
> + * Description: Perform a software PHY reset using the standard
> + * BMCR_RESET bit and poll for the reset bit to be cleared.
> + * Toggle BMCR_RESET bit off to accomodate broken PHY implementations
> + * such as used on the Individual Computers' X-Surf 100 Zorro card.
> + *
> + * Returns: 0 on success, < 0 on failure
> + */
> +static int asix_soft_reset(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* Asix PHY won't reset unless reset bit toggles */
> +	ret = phy_write(phydev, MII_BMCR, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	phy_write(phydev, MII_BMCR, BMCR_RESET);
> +
> +	return phy_poll_reset(phydev);
> +}

Why not simply:

static int asix_soft_reset(struct phy_device *phydev)
{
	int ret;

	/* Asix PHY won't reset unless reset bit toggles */
	ret = phy_write(phydev, MII_BMCR, 0);
	if (ret < 0)
		return ret;

	return genphy_soft_reset(phydev);
}

	Andrew
