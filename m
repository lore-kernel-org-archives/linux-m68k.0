From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux/m68k config again
Date: Sun, 29 Dec 2013 09:50:08 +0100
Message-ID: <CAMuHMdV+_EddXTX+5m9YCZ+ZaF0sQY5h0eqO9z4qKhOYO+g11g@mail.gmail.com>
References: <Pine.BSM.4.64L.1311211444360.11120@herc.mirbsd.org>
	<Pine.BSM.4.64L.1312231011210.24287@herc.mirbsd.org>
	<alpine.LNX.2.00.1312232231090.18343@nippy.intranet>
	<Pine.BSM.4.64L.1312231645470.2621@herc.mirbsd.org>
	<alpine.LNX.2.00.1312240849320.18824@nippy.intranet>
	<Pine.BSM.4.64L.1312232208350.2621@herc.mirbsd.org>
	<alpine.LNX.2.00.1312241042520.20898@nippy.intranet>
	<Pine.BSM.4.64L.1312241341210.29139@herc.mirbsd.org>
	<alpine.LNX.2.00.1312281358180.17160@nippy.intranet>
	<Pine.BSM.4.64L.1312281257570.21577@herc.mirbsd.org>
	<CAMuHMdXaXXaLRftPXfoVwbprJbFJSUjKeOkxFx7yZfWxebcYfQ@mail.gmail.com>
	<CAMuHMdVbzcyfHhdLBrdQgH-8T7Ofsmc0EXNodMZioDPp0w4OmA@mail.gmail.com>
	<Pine.BSM.4.64L.1312282243280.20525@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:33041 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751048Ab3L2IuJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Dec 2013 03:50:09 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so10574366pbc.7
        for <linux-m68k@vger.kernel.org>; Sun, 29 Dec 2013 00:50:08 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1312282243280.20525@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Dec 29, 2013 at 12:03 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> understand. But the question is, does the work you do there
> have any influence on the Debian configs? (Not that the work
> you were doing was useless, rather the contrary. But I think
> we need to get *both* the =E2=80=9CLinux defconfigs=E2=80=9D and what=
ever
> Debian uses into shape.)
>
>
> I=E2=80=99m trying again to understand how Debian generates its confi=
g.
>
> http://buildd.debian-ports.org/status/fetch.php?pkg=3Dlinux&arch=3Dm6=
8k&ver=3D3.12.6-1&stamp=3D1387760310
>
> This is the autobuilder log from the latest kernel build.
> Please look at the following lines:
>
>
>         python debian/bin/kconfig.py 'debian/build/config.m68k_none_m=
68k' \
>         debian/config/config debian/config/m68k/config
>
> This basically does the equivalent of:
>
>         cat debian/config/config debian/config/m68k/config \
>             >debian/build/config.m68k_none_m68k
>
> Except that when you have 'CONFIG_X=3Dy' followed by
> '# CONFIG_X is not set', only the latter will show up in
> the output, viceque versa.

IC.

So you need a file that
   - Explicitly enables what we need,
   - Explicitly disables what we don't want.

And the rest is defined by the base debian/config/config and
"make oldconfig" on top.

>         env -u ABINAME -u ABINAME_PART -u ARCH -u FEATURESET -u FLAVO=
UR \
>         -u VERSION -u LOCALVERSION DISTRIBUTION_OFFICIAL_BUILD=3D1 \
>         DISTRIBUTOR=3D"Debian" DISTRIBUTION_VERSION=3D"3.12.6-1" \
>         KBUILD_BUILD_TIMESTAMP=3D"Debian 3.12.6-1 (2013-12-21)" \
>         KBUILD_BUILD_USER=3D"debian-kernel" \
>         KBUILD_BUILD_HOST=3D"lists.debian.org" /usr/bin/make -C \
>         'debian/build/source_none' \
>         O=3D'/=C2=ABPKGBUILDDIR=C2=BB/debian/build/build_m68k_none_m6=
8k' V=3D1 \
>                 listnewconfig
>
> Immediately (after listnewconfig=E2=80=99s output) followed by:
>
>         yes "" | env -u ABINAME -u ABINAME_PART -u ARCH -u FEATURESET=
 \
>         -u FLAVOUR -u VERSION -u LOCALVERSION \
>         DISTRIBUTION_OFFICIAL_BUILD=3D1 DISTRIBUTOR=3D"Debian" \
>         DISTRIBUTION_VERSION=3D"3.12.6-1" \
>         KBUILD_BUILD_TIMESTAMP=3D"Debian 3.12.6-1 (2013-12-21)" \
>         KBUILD_BUILD_USER=3D"debian-kernel" \
>         KBUILD_BUILD_HOST=3D"lists.debian.org" /usr/bin/make -C \
>         'debian/build/source_none' \
>         O=3D'/=C2=ABPKGBUILDDIR=C2=BB/debian/build/build_m68k_none_m6=
8k' \
>                 oldconfig >/dev/null
> kernel/time/Kconfig:162:warning: range is invalid

Ugh, "yes", so everything else is enabled. Not silentoldconfig.

> These two lines are =E2=80=9Chow=E2=80=9D it generates the configurat=
ion that
> is actually used (in the immediately following gmake invocation)
> for the kernel.
>
>
> So basically, the mechanism of =E2=80=9Cdefine some stuff to y or m o=
r
> not set, leave the rest undefined, then run make oldconfig=E2=80=9D i=
s
> what Debian uses, the =E2=80=9Cdefconfigs=E2=80=9D you were talking a=
bout are
> *not* (and cannot) be involved.
>
> I hope this clears things up from my side. Is there anything
> from your side I can do, now?
>
> I=E2=80=99ve attached the debian/bin/kconfig.py output from the SVN f=
or
> sid (3.12.6-2~unreleased) and trunk (3.13~rc4-1~exp1~unreleased)
> so you can run both of these against =E2=80=9Cmake oldconfig=E2=80=9D=
 on your,
> or probably better torvalds=E2=80=99, tree then look at what comes ou=
t
> and send me deltas to tweak the output. Deltas should indicate,
> for each CONFIG_* option, in which Kconfig file they are, since
> we use that (in comments) for grouping in the Debian config, see:
> http://anonscm.debian.org/viewvc/kernel/dists/trunk/linux/debian/conf=
ig/m68k/config?revision=3D20825&view=3Dmarkup

Thanks, added to haystack of tasks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
