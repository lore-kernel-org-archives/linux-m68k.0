From: Rob Landley <rob@landley.net>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Thu, 19 Mar 2009 03:41:53 -0500
Message-ID: <200903190341.54222.rob@landley.net>
References: <200903120437.03837.rob@landley.net> <200903181312.02047.rob@landley.net> <10f740e80903190059qae0629bs8658cad8f3ad8761@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <10f740e80903190059qae0629bs8658cad8f3ad8761@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Thursday 19 March 2009 02:59:45 Geert Uytterhoeven wrote:
> On Wed, Mar 18, 2009 at 19:12, Rob Landley <rob@landley.net> wrote:
> > On Wednesday 18 March 2009 00:34:43 Greg Ungerer wrote:
> >> Rob Landley wrote:
> >> > On Monday 16 March 2009 18:10:45 Greg Ungerer wrote:
> >> >>>> =C2=A0 =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/ge=
rg/m68knommu.git
> >> >>>> fix-includes
> >
> > ...
> >
> >> > What _should_ I have done?
> >>
> >> The git clone you have done will just get the master branch,
> >> and put it in a directory named fix-includes.
> >>
> >> Which is ok, but you still won't have the "fix-includes" branch.
> >> Do this after the clone:
> >>
> >> =C2=A0 =C2=A0git pull
> >> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> >> fix-includes
> >
> > Ah, that did something interesting... =C2=A0And the resulting heade=
rs built in
> > uClibc. =C2=A0(Works for me!)
> >
> > confirmed-uClibc-builds-with-it-by: Rob Landley <rob@landley.net>
>
> Does it boot on ARAnyM? ;-)

Dunno.  When I ran aranym it popped up a menu screen and asked me to co=
nfigure=20
it, so I tracked down a couple of howtos I haven't had time to read yet=
=20
(http://wiki.aranym.org/aranym_from_scratch and=20
http://wiki.aranym.org/afs/setup_linux).

At a glance the emulator doesn't seem to actually support a serial port=
, so no=20
serial console, which is a bit of a limiting factor for how I normally =
use=20
it...

Rob
