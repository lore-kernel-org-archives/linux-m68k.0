From: Brad Boyer <flar@allandria.com>
Subject: Re: mac68k serial
Date: Tue, 13 Jan 2009 16:32:46 -0800
Message-ID: <20090114003245.GA4419@cynthia.pants.nu>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: flameman mayer <flamemaniii@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

On Tue, Jan 13, 2009 at 09:49:59PM +0000, flameman mayer wrote:
> I'm Carlo Pisani, alias "flameman", and i'm running this little
> project: gentoo-m68k @ applem68k-LC475
> 
> ( http://elinux.org/Mac68k-Flameman )

That's a good summary of a lot of history, but most of us don't think
much about the 2.2 kernel anymore. It's nice to have all of that in
one place for browsing.

> i'm working with kernel-2.6.27 and i have this issue
> 
> macserial kernel panic
> 
> unable to handle kernel NULL pointer de reference at virtual address
> 000004 modules linked in: m68k_handle_int+0x1c/0x36
> 
> call trace mac_scc_dispatch+0x3a/0x40 auto_irqhandler_fixup+0x4/0x6
> 
> also, i hacked the "emile-0.12" sources to build a monitor able to
> serially talk: it works for both the 2 LC475 serial lines :P
> 
> is there anything about serial support for linux-m68k ?

The real driver for the serial ports on m68k Macintosh systems got
removed from the tree a long time ago and has not been replaced as
of this time. However, we still register mac_scc_dispatch as an
interrupt handler for the line that the SCC uses. This looks like
you got an interrupt for the serial chip and the interrupt code
got confused trying to dispatch to nothing. I've never seen it
happen, but it does look like that would be the expected behavior
of the current code.

It's on my list to fix, but I honestly haven't had much time to
work on it. My plan is to either share or copy pmac_zilog.c which
is the driver for the serial on PowerMacs rather than start from
the Atari driver as mentioned in the web page above. It's not only
the same chip but attached to the system in mostly the same way.

	Brad Boyer
	flar@allandria.com

