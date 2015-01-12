From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 12 (build failures: m68k, ppc)
Date: Mon, 12 Jan 2015 09:59:20 -0800
Message-ID: <20150112175920.GC19868__27104.1898559362$1421085597$gmane$org@roeck-us.net>
References: <20150112180322.003b44f2@canb.auug.org.au>
 <20150112162438.GA18723@roeck-us.net>
 <CAMuHMdUYEe=L=H75AOYVjinRSW=okRJNrNJVy-bY1gshdVrO7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYEe=L=H75AOYVjinRSW=okRJNrNJVy-bY1gshdVrO7Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Jan 12, 2015 at 05:27:08PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 12, 2015 at 5:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On Mon, Jan 12, 2015 at 06:03:22PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20150109:
> >>
> >> The usb-gadget-fixes tree gained a conflict against the usb.current tree.
> >>
> >> The net-next tree gained a build failure for which I reverted a commit.
> >>
> >> The pinctrl tree gained a build failure so I used the version from
> >> next-20150109.
> >>
> >> The akpm tree lost a few patches that turned up elsewhere.
> >>
> >> Non-merge commits (relative to Linus' tree): 2202
> >>  2272 files changed, 69868 insertions(+), 38441 deletions(-)
> >>
> >
> > Build failures, seen since next-20150109:
> >         m68k:allmodconfig
> >         powerpc:ppc6xx_defconfig
> >
> > Due to:
> >         ERROR: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!
> >         make[1]: *** [__modpost] Error 1
> >
> > Caused by commit d34f20d6e2f (drm: Atomic modeset ioctl).
> 
> Yeah, it needs a get_user() that supports 64-bit data.
> 
Hi Geert,

I assume you mean m68k, where 64 bit support for get_user has been disabled.

The problem on powerpc is different though: __get_user_nocheck()
and __get_user_check() use
	unsigned long __gu_val;
followed by
	__get_user_size(__gu_val, __gu_addr, (size), __gu_err);

__get_user_size() fails in
	if (size > sizeof(x))
		 (x) = __get_user_bad();

Presumably "unsigned long" is 32 bit on 32 bit powerpc, not 64 bit.

Overall, the explicit 64-bit use of get_user() seems to be quite unusual.

Thanks,
Guenter
