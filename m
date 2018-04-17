From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/8] net: ax88796: Attach MII bus only when open
Date: Tue, 17 Apr 2018 15:19:14 +0200
Message-ID: <20180417131914.GH2591@lunn.ch>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523930895-6973-3-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523930895-6973-3-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Tue, Apr 17, 2018 at 02:08:09PM +1200, Michael Schmitz wrote:
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
