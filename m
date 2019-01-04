From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH net-next] Amiga PCMCIA 100 MBit card support
Date: Fri, 4 Jan 2019 13:41:36 +1300
Message-ID: <201e7069-a8c3-191f-501a-44fc6c46ae94@gmail.com>
References: <20181219222427.GA78871@MacBook.fritz.box>
 <20181220.161053.1268735869147094096.davem@davemloft.net>
 <2a960bfa-000a-eb14-814b-476da5c1f5df@gmail.com>
 <20181228.124330.1798799446491889384.davem@davemloft.net>
 <6b725e37-4223-cef8-5430-aa05ddafb551@gmail.com>
 <20181231104725.GA3239@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181231104725.GA3239@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>, alex@kazik.de, netdev@vger.kernel.org, linux-m68k@vger.kernel.org, rolf.anders@physik.uni-augsburg.de
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

On 31/12/18 11:47 PM, Andrew Lunn wrote:
>>> Having so many front end drivers for a chipset should be done in a
>>> more modular manner, so that in fact they could all coexist if
>>> necessary.
>> Not sure I follow your meaning ... are you suggesting to allow the back end
>> driver to use run-time selectable IO accessors and other generic helper
>> functions, so the drivers currenlty including lib8390.c directly could use
>> the core code from the 8390 module instead?
> Yes, David is suggesting you abstract the code so it can be built once
> to support all the different interfaces and architectures.

Thanks for clarifying - I'll see what I can come up with.

I can only test on ne.c and xsurf100.c though.

Cheers,

     Michael




>     Andrew
