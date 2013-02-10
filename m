From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 13/17] [m68k] Atari: implement 16 bit access macros for
 ROM port ISA
Date: Sun, 10 Feb 2013 23:51:16 +0100
Message-ID: <20130210225116.GD4977@mail.biophys.uni-duesseldorf.de>
References: <20130131002932.ABA9F360095@xplor.waratah.dyndns.org>
 <CAMuHMdWhD2TZGCkyiCRecGnyqxKpG0La6iuJn8g-Kp8yL2yG6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:42574
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756775Ab3BJWvR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Feb 2013 17:51:17 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdWhD2TZGCkyiCRecGnyqxKpG0La6iuJn8g-Kp8yL2yG6A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


> > +#define rom_out_be32(addr, l)  \
> > +        ({u32 __w, __v = (l);  u32 _addr = ((u32) (addr)); \
> > +        __w = ((*(__force volatile u32 *) ((_addr | 0x10000) + (__v<<1)))); })
> 
> This doesn't look correct to me: "__v << 1" will not fit in 32-bit, so
> you loose data.
> Are 32-bit writes (and reads) supported?

Reads maybe (if someone designs the hardware) - writes won't be 32 bit ever.
We can drop the 32 bit case I think. 

> 
> > +#define rom_out_le16(addr, w)  \
> > +        ({u16 __w, __v = cpu_to_le16(w); u32 _addr = ((u32) (addr)); \
> > +        __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
> > +        __w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
> 
> As you have to split the 16-bit data word in two bytes anyway, it's
> more efficient to
> hardcode the passing of the bytes than using cpu_to_le16().

OK, make sense. 

Cheers,

	Michael
