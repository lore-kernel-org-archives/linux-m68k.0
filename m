From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] m68k/sun3: Fix virtual addresses of clock and interrupt
 register
Date: Fri, 25 Sep 2015 12:45:53 +0200
Message-ID: <20150925104553.GA22917@alpha.franken.de>
References: <1442223611-30175-1-git-send-email-kuleshovmail@gmail.com>
 <CAMuHMdU-ZjWPw8D2KYjBgMdRM_k+BTfhKC81RcSkB_s8Mzjmwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdU-ZjWPw8D2KYjBgMdRM_k+BTfhKC81RcSkB_s8Mzjmwg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexander Kuleshov <kuleshovmail@gmail.com>, Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 25, 2015 at 09:21:34AM +0200, Geert Uytterhoeven wrote:
> On Mon, Sep 14, 2015 at 11:40 AM, Alexander Kuleshov
> <kuleshovmail@gmail.com> wrote:
> > The MMU base is 32 bits size - 0xfe000000, seems that we missed
> > one zero in the definition of the clock and interrupt register
> > addresses.
> 
> Thanks for your patch!
> 
> Have you tested this?
> 
> This means enabling/disabling interrupts never worked on Sun 3, which
> I find a bit difficult to believe.
> There are other 0x0f?????? addresses in arch/m68k/sun3/mmu_emu.c.

which are the correct one. Sun3 MMU doesn't even handle full 32bit
addresses, it's only capable of 28 bits. That's the reason why normal
m68k linux user space binaries can't work.

So this patch is broken. And I'm sure the unpatched version works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
