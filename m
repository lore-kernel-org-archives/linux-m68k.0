From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k,m68knommu: merge header files
Date: Fri, 16 Jan 2009 22:53:54 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901162242010.25319@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org>
 <20081213205251.GC27748@uranus.ravnborg.org> <20081213205828.GD27748@uranus.ravnborg.org>
 <49707AE0.1040803@opengear.com> <Pine.LNX.4.64.0901161354410.18756@anakin>
 <49709800.70009@snapgear.com> <20090116143429.GB22152@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20090116143429.GB22152@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, 16 Jan 2009, Sam Ravnborg wrote:
> > >>More review, testing, comments welcome...
> > >>Where to from here?
> > >
> > >I'll pull from it and give it some m68k test builds.
> > >After that, you can move it to for-next. If everything's well, it can go to
> > >Linus.
> > 
> > Sounds like a plan.
> > 
> > 
> > >Or should I amend and add my SoB and put it in m68k for-next?
> > 
> > I am happy to go either way.
> 
> For my part I like this to reach mainline ASAP. So whatever suits the
> two of you is fine with me.

I pulled from Greg's tree, and built atari_defconfig, multi_defconfig,
sun3_defconfig. Atari_defconfig runs fine under ARAnyM.

As I'll be on a business trip to Japan next week, I probably won't be able to
do a proper follow-up. So Greg, can you put it on your for-next branch and
send it to Linus if everything goes well?

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thx!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
