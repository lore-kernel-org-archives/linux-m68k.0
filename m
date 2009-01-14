From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: mac68k serial
Date: Wed, 14 Jan 2009 12:50:52 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090114003245.GA4419@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: flameman mayer <flamemaniii@gmail.com>, linux-m68k@lists.linux-m68k.org



On Tue, 13 Jan 2009, Brad Boyer wrote:

> On Tue, Jan 13, 2009 at 09:49:59PM +0000, flameman mayer wrote:
>... 
> > i'm working with kernel-2.6.27 and i have this issue
> > 
> > macserial kernel panic
> > 
> > unable to handle kernel NULL pointer de reference at virtual address
> > 000004 modules linked in: m68k_handle_int+0x1c/0x36
> > 
> > call trace mac_scc_dispatch+0x3a/0x40 auto_irqhandler_fixup+0x4/0x6
> > 
> > also, i hacked the "emile-0.12" sources to build a monitor able to
> > serially talk: it works for both the 2 LC475 serial lines :P
> > 
> > is there anything about serial support for linux-m68k ?
> 
> The real driver for the serial ports on m68k Macintosh systems got 
> removed from the tree a long time ago and has not been replaced as of 
> this time. However, we still register mac_scc_dispatch as an interrupt 
> handler for the line that the SCC uses. This looks like you got an 
> interrupt for the serial chip and the interrupt code got confused trying 
> to dispatch to nothing. I've never seen it happen, but it does look like 
> that would be the expected behavior of the current code.

I've seen it happen. You should avoid sending anything to the mac serial 
port. But you can still capture kernel messages from the mac serial port 
without triggering the panic.

> 
> It's on my list to fix, but I honestly haven't had much time to work on 
> it. My plan is to either share or copy pmac_zilog.c which is the driver 
> for the serial on PowerMacs rather than start from the Atari driver as 
> mentioned in the web page above. It's not only the same chip but 
> attached to the system in mostly the same way.

It's on my list, too. But above it are frame buffer, Nubus, SCSI and PMU 
issues.

Finn

> 
> 	Brad Boyer
> 	flar@allandria.com
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
