From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net v4 02/13] net/8390: Fix msg_enable patch snafu
Date: Tue, 13 Feb 2018 09:58:20 -0500 (EST)
Message-ID: <20180213.095820.761578588685460710.davem@davemloft.net>
References: <f697da2b2513e025688f6c48088536060575a249.1518397634.git.fthain@telegraphics.com.au>
        <20180212.103956.1262868827217051631.davem@davemloft.net>
        <alpine.LNX.2.21.1802131419540.8@nippy.intranet>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1802131419540.8@nippy.intranet>
Sender: netdev-owner@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

From: Finn Thain <fthain@telegraphics.com.au>
Date: Tue, 13 Feb 2018 16:03:09 +1100 (AEDT)

> I think you have overlooked those modules which offer no way to set 
> p->msg_enable, i.e. ax88796, axnet_cs, etherh, hydra, mac8390, mcf8390, 
> pcnet_cs and zorro8390.

Then that's a bug, we have a very simple easy to implement interface
for setting this (ethtool).

And by adding the simple hook, you will make these older drivers
easier to debug for the few people still using them.
