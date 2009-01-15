From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: 16bit pcmcia nic & pci bus board support - amiga
Date: Fri, 16 Jan 2009 00:11:51 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0901160007070.7149@firda.kolla.no>
References: <8259f0250901150528w1a57266fm4bc1f65bb7f1860d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <8259f0250901150528w1a57266fm4bc1f65bb7f1860d@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

On Thu, 15 Jan 2009, mike wrote:

> Hey,
> 
> So if i get this right, pcmcia network cards is disabled because it
> depends on config_pci and usb/usb net?
> Whats the progress on this front?
> And how is support for Mediator/Grex/Prometheus pci bus boards and or
> others, would that just autoconfig or?

Your problem is that you're looking at 3com cards, not NE2000 cards :)

Even though there is driver for 3Com389 (iirc) pcmcia cards in amigaos
(well, third party), there is only support NE2000 in Linux/m68k on amiga,
look for the "apne" driver.

-- kolla
