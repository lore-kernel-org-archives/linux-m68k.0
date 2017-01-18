From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] net: Remove usage of net_device last_rx member
Date: Wed, 18 Jan 2017 17:27:50 -0500 (EST)
Message-ID: <20170118.172750.1394406967719526972.davem__25666.6849404157$1484779081$gmane$org@davemloft.net>
References: <20170118164501.1934-1-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170118164501.1934-1-tklauser@distanz.ch>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: tklauser@distanz.ch
Cc: netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, intel-wired-lan@lists.osuosl.org, devel@driverdev.osuosl.org, b.a.t.m.a.n@lists.open-mesh.org, eric.dumazet@gmail.com, j.vosburgh@gmail.com, vfalico@gmail.com, andy@greyhouse.net, mlindner@marvell.com, stephen@networkplumber.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 18 Jan 2017 17:45:01 +0100

> The network stack no longer uses the last_rx member of struct net_device
> since the bonding driver switched to use its own private last_rx in
> commit 9f242738376d ("bonding: use last_arp_rx in slave_last_rx()").
> 
> However, some drivers still (ab)use the field for their own purposes and
> some driver just update it without actually using it.
> 
> Previously, there was an accompanying comment for the last_rx member
> added in commit 4dc89133f49b ("net: add a comment on netdev->last_rx")
> which asked drivers not to update is, unless really needed. However,
> this commend was removed in commit f8ff080dacec ("bonding: remove
> useless updating of slave->dev->last_rx"), so some drivers added later
> on still did update last_rx.
> 
> Remove all usage of last_rx and switch three drivers (sky2, atp and
> smc91c92_cs) which actually read and write it to use their own private
> copy in netdev_priv.
> 
> Compile-tested with allyesconfig and allmodconfig on x86 and arm.
> 
> Cc: Eric Dumazet <eric.dumazet@gmail.com>
> Cc: Jay Vosburgh <j.vosburgh@gmail.com>
> Cc: Veaceslav Falico <vfalico@gmail.com>
> Cc: Andy Gospodarek <andy@greyhouse.net>
> Cc: Mirko Lindner <mlindner@marvell.com>
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied, thanks.
