From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 1/9] net-next: phy: new Asix Electronics PHY driver
Date: Thu, 19 Apr 2018 14:21:17 +0200
Message-ID: <20180419122117.GD17888@lunn.ch>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

On Thu, Apr 19, 2018 at 02:05:18PM +1200, Michael Schmitz wrote:
> The Asix Electronics PHY found on the X-Surf 100 Amiga Zorro network
> card by Individual Computers is buggy, and needs the reset bit toggled
> as workaround to make a PHY soft reset succeed.
> 
> Add workaround driver just for this special case.
> 
> Suggested in xsurf100 patch series review by Andrew Lunn <andrew@lunn.ch>
> 
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
