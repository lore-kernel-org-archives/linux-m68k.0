From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] mac8390: fix regression caused during net_device_ops
 conversion, take 2
Date: Wed, 27 May 2009 22:33:55 -0700 (PDT)
Message-ID: <20090527.223355.118242797.davem@davemloft.net>
References: <Pine.LNX.4.64.0905260116120.18180@loopy.telegraphics.com.au>
	<10f740e80905270149q2b906d53u8bf71b7d382a57a3@mail.gmail.com>
	<Pine.LNX.4.64.0905281454450.9036@loopy.telegraphics.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0905281454450.9036@loopy.telegraphics.com.au>
Sender: netdev-owner@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, geert.uytterhoeven@gmail.com, shemminger@vyatta.com
List-Id: linux-m68k@vger.kernel.org

From: Finn Thain <fthain@telegraphics.com.au>
Date: Thu, 28 May 2009 15:26:43 +1000 (EST)

> 
> Changeset ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc broke mac8390 by adding 
> 8390.o to the link. That meant that lib8390.c was included twice, once in 
> mac8390.c and once in 8390.c, subject to different macros. This patch 
> reverts that by avoiding the wrappers in 8390.c. They seem to be of no 
> value since COMPAT_NET_DEV_OPS is going away soon.
> 
> Tested with a Kinetics EtherPort card.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

I already applied your other patch, it's in Linus's tree already
in fact.

So you need to send something relative to that.
