From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] m68k: skip futex_atomic_cmpxchg_inatomic() test
Date: Wed, 5 Mar 2014 22:54:59 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403052254110.18573__2605.53576886213$1394056528$gmane$org@ionos.tec.linutronix.de>
References: <alpine.LNX.2.00.1403041740580.17377@nippy.intranet> <CAMuHMdU-5dw9mzJTf-29FAo1NBOnUnqCDv9GPfYRTvuRCS+9Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU-5dw9mzJTf-29FAo1NBOnUnqCDv9GPfYRTvuRCS+9Xw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@telegraphics.com.au>, Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 5 Mar 2014, Geert Uytterhoeven wrote:

> On Tue, Mar 4, 2014 at 8:28 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> > The futex_atomic_cmpxchg_inatomic() test in futex_init() causes a fatal
> > exception on 68030 (and presumably 68020 also).
> 
> Thanks!
> 
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> > ---
> >
> > Ingo Molnar has committed Heiko Carstens' patch to the -tip repo:
> 
> You mean Thomas Gleixner? ;-)
> 
> > http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=03b8c7b623c80af264c4c8d6111e5c6289933666
> >
> > I downloaded that patch and tested it along with the patch below, and
> > together these fix the boot crash.
> >
> > What's the best way to merge this? Perhaps it should be sent on to the
> > -tip maintainers?
> 
> Yes, please.

Just post it to LKML and cc me please.

Thanks,

	tglx
	
