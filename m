From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Mon, 31 Dec 2018 11:47:25 +0100
Message-ID: <20181231104725.GA3239@lunn.ch>
References: <20181219222427.GA78871@MacBook.fritz.box>
 <20181220.161053.1268735869147094096.davem@davemloft.net>
 <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
 <20181228.124330.1798799446491889384.davem@davemloft.net>
 <6b725e37-4223-cef8-5430-aa05ddafb551@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6b725e37-4223-cef8-5430-aa05ddafb551@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: David Miller <davem@davemloft.net>, alex@kazik.de, netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

> >Having so many front end drivers for a chipset should be done in a
> >more modular manner, so that in fact they could all coexist if
> >necessary.
> 
> Not sure I follow your meaning ... are you suggesting to allow the back end
> driver to use run-time selectable IO accessors and other generic helper
> functions, so the drivers currenlty including lib8390.c directly could use
> the core code from the 8390 module instead?

Yes, David is suggesting you abstract the code so it can be built once
to support all the different interfaces and architectures.

   Andrew
