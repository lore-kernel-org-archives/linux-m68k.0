From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to
	arch/m68k/include/asm
Date: Tue, 9 Dec 2008 00:01:15 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812082359190.29640@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <20081208205814.GA22697@uranus.ravnborg.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, uclinux-dev <uclinux-dev@uclinux.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, 8 Dec 2008, Sam Ravnborg wrote:
> Following is a pseudo patch (a script + a patch) that merges
> the include files for m68k and m68knommu in one place at:
> 
>     arch/m68k/include/asm
> 
> The script was written by Arnd and I added a few modifications.

Thanks! I'll take a closer look when I'll find some spare time...

> I have used the following include guard:
> 
> #ifdef __uClinux__
> #include "atomic_no.h"
> #else
> #include "atomic_mm.h"
> #endif
> 
> gcc -E -dM for the two compilers revealed that this was the
> only symbol that differed.

I think you can share a toolchain for m68k and m68knommu, at least for the
kernel (I used my plain m68k toolchain when experimenting with m68knommu for
Amiga).

> With the above construct we do the "right thing" also for
> headers exported to userspace.
> But actually none of the headers using the above are
> subject for export at the moment so we could use a
> CONFIG_ symbol for the same.

So I prefer to just check CONFIG_MMU.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
