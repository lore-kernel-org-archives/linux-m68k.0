From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 4/4] m68k: toward platform agnostic framebuffer debug
 logging
Date: Sun, 2 Mar 2014 22:25:28 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403022223310.25474@nippy.intranet>
References: <alpine.LNX.2.00.1402151534030.16321@nippy.intranet> <CAMuHMdWKS=OH69kU7T8OHc13Yw9M-CKEPZc4mtzaAtgo7=18dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWKS=OH69kU7T8OHc13Yw9M-CKEPZc4mtzaAtgo7=18dA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


On Sun, 2 Mar 2014, Geert Uytterhoeven wrote:

> On Sat, Feb 15, 2014 at 5:49 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> > Code subject to #ifdef CONSOLE is made more generic, as was apparently
> > intended by the original author of that code.
> >
> > Remove console_put_stats() routine. If it should be somehow useful, it
> > should also be useful on platforms without framebuffer debug logging. The
> > present implementation is only built #if defined CONFIG_MAC && defined
> > CONSOLE even though puts() works everywhere...
> 
> Looks fine to me. Can I add your SoB and take it?
> 

I have a new version that I will send.

Finn
