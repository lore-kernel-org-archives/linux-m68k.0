From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 00/10] rcu: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 23:50:55 +0200
Message-ID: <20120823215052.GC19305__14824.6706267402$1345758710$gmane$org@somewhere.redhat.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
 <CAMuHMdUt62GsYsPMAPbUWZUtFL=c2VmYFintpDAQmSwQrWriuA@mail.gmail.com>
 <20120823110157.GC18835@somewhere.redhat.com>
 <CAMuHMdX5R_7EBGDu00zdy_P3q65BzKJbNeRwFcuwij8eHavTYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5R_7EBGDu00zdy_P3q65BzKJbNeRwFcuwij8eHavTYQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>

On Thu, Aug 23, 2012 at 10:23:22PM +0200, Geert Uytterhoeven wrote:
> Hi Frederic,
> 
> On Thu, Aug 23, 2012 at 1:02 PM, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > On Wed, Aug 22, 2012 at 07:18:04PM +0200, Geert Uytterhoeven wrote:
> >> On Wed, Aug 22, 2012 at 6:23 PM, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> >> > So this fixes some potential RCU stalls in a bunch of architectures.
> >> > When rcu_idle_enter()/rcu_idle_exit() became a requirement, we forgot
> >> > to handle the architectures that don't support CONFIG_NO_HZ.
> >> >
> >> > I guess the set should be dispatched into arch maintainer trees.
> >>
> >> I can take the m68k version, but are you sure you want it this way?
> >> Each of them must be in mainline before they can enter stable.
> >
> > Yeah, I was thinking the right route is for these patches to be
> > carried by arch maintainer who then push to Linus and then this goes
> > to stable.
> >
> > Is that ok for you?
> >
> > Otherwise I can carry the patches myself. In a tree of my own, or
> > Paul's or mmotm. As long as I have your ack.
> 
> I applied your patch to the m68k for-3.6/for-linus branch.
> I'll ask Linus to pull later in the rc cycle (right now I don't have
> anything else
> queued for 3.6).
> Still, I think it's better to just collect acks and send it to Linus
> in one shot,
> so it can go into stable in one shot too.

Sure I can do that if you prefer.

Thanks.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
