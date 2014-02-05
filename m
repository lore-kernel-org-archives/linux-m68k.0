From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/3] m68k: Switch to asm-generic/barrier.h
Date: Wed, 5 Feb 2014 12:03:05 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402051145390.2188@nippy.intranet>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org> <1391544954-7422-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1391544954-7422-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org


On Tue, 4 Feb 2014, Geert Uytterhoeven wrote:

> The generic nop() implementation is fine for m68k.
> 

If the barrier in the old nop() implementation isn't needed anymore, 
perhaps we should also remove the nop() instances in macfb.c? One comment 
from this file says, "the nop's are there to order writes". (I don't know 
whether there is any timing issue here. Seeing the way nop() was sprinkled 
through macfb.c, I doubt that there is.) Is the volatile casting in 
nubus_writeb() aka raw_outb() aka out_8() equivalent to the old barrier?

Finn
