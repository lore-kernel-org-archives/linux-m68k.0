From: Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [PATCH net-next] net: Remove usage of net_device last_rx member
Date: Wed, 18 Jan 2017 09:39:52 -0800
Message-ID: <11021.1484761192__34558.2277318046$1484761244$gmane$org@famine>
References: <20170118164501.1934-1-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <20170118164501.1934-1-tklauser@distanz.ch>
Content-ID: <11020.1484761192.1@famine>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, intel-wired-lan@lists.osuosl.org, devel@driverdev.osuosl.org, b.a.t.m.a.n@lists.open-mesh.org, Eric Dumazet <eric.dumazet@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>

Tobias Klauser <tklauser@distanz.ch> wrote:

>The network stack no longer uses the last_rx member of struct net_device
>since the bonding driver switched to use its own private last_rx in
>commit 9f242738376d ("bonding: use last_arp_rx in slave_last_rx()").
>
>However, some drivers still (ab)use the field for their own purposes and
>some driver just update it without actually using it.
>
>Previously, there was an accompanying comment for the last_rx member
>added in commit 4dc89133f49b ("net: add a comment on netdev->last_rx")
>which asked drivers not to update is, unless really needed. However,
>this commend was removed in commit f8ff080dacec ("bonding: remove
>useless updating of slave->dev->last_rx"), so some drivers added later
>on still did update last_rx.
>
>Remove all usage of last_rx and switch three drivers (sky2, atp and
>smc91c92_cs) which actually read and write it to use their own private
>copy in netdev_priv.
>
>Compile-tested with allyesconfig and allmodconfig on x86 and arm.

Reviewed-by: Jay Vosburgh <jay.vosburgh@canonical.com>
