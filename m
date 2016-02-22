From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Mon, 22 Feb 2016 11:01:23 +0100
Message-ID: <CAMuHMdU0=hvrnoR60dgvrYZC6_OrupAYeugsEsrwCS5HhGhMRg@mail.gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
	<mvm1tuv6dhk.fsf@hawking.suse.de>
	<21426.40682.197715.245775@gargle.gargle.HOWL>
	<CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
	<21786.40688.53001.509365@gargle.gargle.HOWL>
	<22217.61083.254294.356622@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35708 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700AbcBVKBY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Feb 2016 05:01:24 -0500
Received: by mail-io0-f180.google.com with SMTP id g203so171579756iof.2
        for <linux-m68k@vger.kernel.org>; Mon, 22 Feb 2016 02:01:23 -0800 (PST)
In-Reply-To: <22217.61083.254294.356622@gargle.gargle.HOWL>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpelinux@gmail.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Mikael,

On Sun, Feb 21, 2016 at 6:06 PM, Mikael Pettersson <mikpelinux@gmail.com> wrote:
> Mikael Pettersson writes:
>  > Michael Schmitz writes:
>  >  > has anyone found a solution to this one?
>  >  >
>  >  > 3.18-rc5 has kswapd0 hogging the CPU - haven't seen ksoftirqd0 yet.
>  >  > Unpacking a large tarball tends to trigger this for me.
>  >
>  > Alas, no.  I went back to the 3.10.xx kernels and they work Ok for me
>  > (they tend to hang during shutdown, but I can live with that).
>  >
>  > I should do a git bisect...
>
> I've done two git bisects on this.  The first one was inconclusive
> (pointed to a harmless commit), but the second one ended up with:

Thanks a lot for doing this!

> # first bad commit: [ac4de9543aca59f2b763746647577302fbedd57e] Merge branch 'akpm' (patches from Andrew Morton)
>
> That's a big pile of VM changes, so I think it could be the culprit.

So git bisect pointed to the merge commit itself, not to any of the commits in
the akpm branch?

I redid that merge myself, and the result is the same as ac4de9543aca5.
There could still be a semantical merge conflict that cannot be detected by
git, though.

Could you try cherry-picking the 36 commits from the akpm branch and
bisecting that?
I.e.
    git checkout 26935fb06ee88f11
    git cherry-pick 26935fb06ee88f11..de32a8177f64bc62
    git bisect start
    git bisect bad
    git bisect good 26935fb06ee88f11

Thanks again!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
