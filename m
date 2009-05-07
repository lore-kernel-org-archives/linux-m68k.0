From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Thu, 07 May 2009 04:37:42 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0905070419040.14061@zirkon.biophys.uni-duesseldorf.de>
References: <20090503072811.GB3179@luminet.net>
 <alpine.LNX.2.01.0905060843160.14304@firda.kolla.no>
 <20090506174538.GA8307@luminet.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <20090506174538.GA8307@luminet.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lance Tagliapietra <lancetag@Luminet.net>
Cc: Kolbj??rn Barmen <linux-m68k@kolla.no>, linux-m68k@lists.linux-m68k.org

Hi,

> > > b). My custom 2.4.30 kernel size is about 750K uncompressed. With setting the options to remove support for hardware 
> > > that I don't have and features that I don't need, I still came up with a kernel of 2.7M.  The goal is to have the 
> > > smallest footprint kernel possible.
> > 
> > My amiga kernel, which is not optimized for size, has ipv6 and lots of stuff,, is 2170192 bytes, stripped. I suspect 
> > you have not stripped yours?
> 
> Point of clarification: I was changing the .config to remove support for hardware (don't even make as a module) and 
> features that I don't need in the kernel.  Was there another method being referred to with the term 'stripped' above?

The 'strip' command (part of binutils) does remove symbol tables from the kernel 
image file. This does reduce the image file size. I am not sure that it does 
reduce the memory footprint. 

Part of the kernel code is now stored in sections of the image that are later 
freed if the corresponding code is no longer used. You should not expect a 
simple 1:1 correlation between kernel image file and memory footprint. 

	Michael
