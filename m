From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Tue, 2 Aug 2011 15:33:24 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1108021532260.256@ibook.intranet>
References: <4E369834.9070707@aalto.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E369834.9070707@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Mon, 1 Aug 2011, Tuomas Vainikka wrote:

> NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
...
> eth0: Tx timed out, lost interrupt? TSR=0x4, ISR=0x15, t=52.
> eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=33.
> eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=36.

This differs from the earlier bug report, where the kernel complained of 
"mismatched read page pointers". But the timeout is the same.

Perhaps you could build and test a new kernel with no DP8390-based driver 
except apne (probably easiest to disable all ethernet drivers except 
CONFIG_APNE).

Please let us know if that helps, as it may shed some light on the other 
bug too.

Finn
