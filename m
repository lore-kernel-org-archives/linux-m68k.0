From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH] phy: remove irq param to fix crash in fixed_phy_add()
Date: Mon, 16 May 2016 15:11:35 +0200
Message-ID: <20160516131134.GA31094__45720.1348538094$1463404357$gmane$org@lnxartpec.se.axis.com>
References: <1463397356-5656-1-git-send-email-rabin.vincent@axis.com>
 <20160516122903.GA27725@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160516122903.GA27725@lunn.ch>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rabin Vincent <rabin.vincent@axis.com>, "David S. Miller" <davem@davemloft.net>, f.fainelli@gmail.com, netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, Rabin Vincent <rabinv@axis.com>

On Mon, May 16, 2016 at 02:29:03PM +0200, Andrew Lunn wrote:
> What i think is better is to make fixed_phy_add() return -EPROBE_DEFER
> if it is called before fixed_mdio_bus_init().

I don't see how this will work for platforms such as ar7 and bcm47xx
which call fixed_phy_add() from platform code.  There is no probe to
retry there so while the EPROBE_DEFER will certainly fix the crash it
will also leave the platforms without a phy.
