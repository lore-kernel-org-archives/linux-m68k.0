From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net v4 02/13] net/8390: Fix msg_enable patch snafu
Date: Wed, 14 Feb 2018 17:15:58 -0500 (EST)
Message-ID: <20180214.171558.1617880686804101923.davem@davemloft.net>
References: <alpine.LNX.2.21.1802131419540.8@nippy.intranet>
        <20180213.095820.761578588685460710.davem@davemloft.net>
        <alpine.LNX.2.21.1802150857480.8@nippy.intranet>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1802150857480.8@nippy.intranet>
Sender: linux-kernel-owner@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

From: Finn Thain <fthain@telegraphics.com.au>
Date: Thu, 15 Feb 2018 09:11:13 +1100 (AEDT)

> On Tue, 13 Feb 2018, David Miller wrote:
> 
>> > I think you have overlooked those modules which offer no way to set 
>> > p->msg_enable, i.e. ax88796, axnet_cs, etherh, hydra, mac8390, 
>> > mcf8390, pcnet_cs and zorro8390.
>> 
>> Then that's a bug, we have a very simple easy to implement interface for 
>> setting this (ethtool).
>> 
>> And by adding the simple hook, you will make these older drivers easier 
>> to debug for the few people still using them.
> 
> Have you considered that implementing the ethtool hooks in the core driver 
> might allow removal of all 8390 driver 'msg_enable' module parameters and 
> msglevel ethtool hooks added by c45f812f0280, excepting those in the core 
> driver? But even if we did that, it seems to me that we still need this 
> patch.

No, because the module parameter lets you set the default msg level at
the time the driver loads, so you can control messages printed very
early on before it is practical to invoke ethtool and set the msg
level.

This is why most drivers have this module parameter, and implement
such a scheme.
