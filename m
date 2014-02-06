From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 2/3] m68k: Switch to asm-generic/barrier.h
Date: Thu, 6 Feb 2014 18:05:09 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1402061802270.13055@nippy.intranet>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org> <1391544954-7422-2-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1402051145390.2188@nippy.intranet> <CAMuHMdWdNtGaOAxhpBEJdb7VspRmd1bd_GwD8af1nzAuu7VfHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWdNtGaOAxhpBEJdb7VspRmd1bd_GwD8af1nzAuu7VfHA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


On Wed, 5 Feb 2014, Geert Uytterhoeven wrote:

> 
> #define barrier() __asm__ __volatile__("": : :"memory")
> 
> I.e. it prevents gcc from:
>   1. Reordering instructions due to the volatile,
>   2. Caching data in registers due to the "memory".
> 
> nop() still has the former, while the volatile casting in the I/O macros 
> should have the same effect as the latter.

OK. Thanks for clarifying that for me.

> 
> So yes, I think they can be removed. Can you test that, please?
> 

Yes, but I don't know how long it will take. Removing the nop() instances 
will affect the fb_setcolreg() routines for 3 types of nubus card and 4 
types of on-board framebuffer so it means testing on a range of hardware. 
Progress is slow because I can't access my Mac hardware except when I'm in 
Melbourne.

Finn
