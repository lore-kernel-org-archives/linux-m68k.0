From: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: rfc: remove early_printk from a few arches? (blackfin, m68k, mips)
Date: Wed, 17 Dec 2014 13:30:02 -0800
Message-ID: <CAJiQ=7DE1ojVRW6LqZg2LiqTQ0cgDY_a0nMGn=_Rs1mkuEgwoA__19469.7489067496$1418851849$gmane$org@mail.gmail.com>
References: <1418849927.28384.1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1418849927.28384.1.camel@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>

On Wed, Dec 17, 2014 at 12:58 PM, Joe Perches <joe@perches.com> wrote:
> It seems like early_printk can be configured into
> a few architectures but also appear not to be used.
>
> $ git grep -w "early_printk"
[snip]
> arch/mips/kernel/Makefile:obj-$(CONFIG_EARLY_PRINTK)    += early_printk.o

Nowadays I try to use OF_EARLYCON whenever possible, but when that has
been unavailable, I have used arch/mips/kernel/early_printk.c to get
console output before the serial driver is initialized.  It runs very
early in the boot sequence and has very few dependencies, which makes
it useful for board bringup.

At least on MIPS, the EARLY_PRINTK implementation registers itself as
a console and works with standard printk() calls.  It doesn't rely on
arch/driver code explicitly calling early_printk().

Side note: looking through kernel/printk/printk.c it looks like
there's a space missing in the description string:

MODULE_PARM_DESC(ignore_loglevel, "ignore loglevel setting, to"
        "print all kernel messages to the console.");

But since CONFIG_PRINTK is a bool option, I don't know if the
description string actually shows up anywhere.  Should it be converted
into a comment?
