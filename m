From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH for 2.6.28 stable] m68knommu: fix m68knommu defconfig
	can't build
Date: Mon, 12 Jan 2009 12:07:39 +0100
Message-ID: <20090112110739.GA17514@elte.hu>
References: <20081230193943.1281.KOSAKI.MOTOHIRO@jp.fujitsu.com> <48E9AE16.2000002@snapgear.com> <20090112104447.GG28564@linux-sh.org> <20090112105942.GA10936@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090112105942.GA10936@uranus.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Paul Mundt <lethal@linux-sh.org>, Greg Ungerer <gerg@snapgear.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, stable@kernel.org, LKML <linux-kernel@vger.kernel.org>


* Sam Ravnborg <sam@ravnborg.org> wrote:

> We just did the exercise with sparc/sparc64 unification and if you 
> forget the few times I broke sparc32 then it went well with only limited 
> problems.

We also had the x86 unification finished in the past year which went very 
well too, so i can only encourage similar efforts.

> One key factor why it went well was that patches were reviewed and 
> applied within a few days whch is why I stresses that the maintainer 
> needs spare time to support the effort.

Yes.

Unification is the Linux meme of the century i guess ;-)

There's two main unification themes:

 - per arch unification (x86, powerpc, sparc

 - cross-arch unification: the moving of useful stuff out of architectures 
   into the core kernel (genirq, gtod, etc.).

	Ingo
