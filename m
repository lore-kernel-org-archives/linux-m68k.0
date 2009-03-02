From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: debian kernel m68k patches for 2.6.28
Date: Mon, 2 Mar 2009 10:48:48 +0100
Message-ID: <10f740e80903020148i23db9424vd2fa529f6d7a4134@mail.gmail.com>
References: <20090301202823.GF13268@marenka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090301202823.GF13268@marenka.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: linux-m68k@lists.linux-m68k.org

On Sun, Mar 1, 2009 at 21:28, Stephen R Marenka <stephen@marenka.net> wrote:
> The debian 2.6.28 kernel has hit sid, so it's probably time to
> update the m68k patches.
>
> So how many of these [1] patches should go into the debian kernel?
> Everything that's not commented, POSTPONED, or PRIVATE?
>
> If anyone else wants the job, please jump right on it. ;)
>
> Thanks,
>
> Stephen
>
> [1] http://www.kernel.org/pub/linux/kernel/people/geert/linux-m68k-patches-2.6/series

Please note that I no longer maintain the quilt series file. I'm using
git only now.

For 2.6.28, there's a separate branch:
http://git.kernel.org/?p=linux/kernel/git/geert/linux-m68k.git;a=shortlog;h=m68k-v2.6.28

Hmm, I've just noticed this is Linus' v2.6.28 with only a few new m68k
patches applied, while I think
I intended it to be the master (m68k) branch just after I merged it
with v2.6.28, with newer
critical patches applied when needed. Oh well...

But even if it was what I had intended, you'd still have to use `git
cherry' to find the m68k-specific commits
and import them into Debian. So I should have all changes nicely
rebased (and reordered/squashed) against Linus' latest tree, so you
can easily export them. This would also help in keeping track what
needs to be submitted upstream.

I'll try to do it right when v2.6.29 is released...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
