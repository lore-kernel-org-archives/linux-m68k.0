From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: patches not upstream
Date: Mon, 25 Oct 2010 13:09:27 +0000
Message-ID: <Pine.BSM.4.64L.1010251250280.10185@herc.mirbsd.org>
References: <251136a28833a299adc3df54c1e2bdf4.squirrel@naiad.marenka.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:40941 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750764Ab0JYNJq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Oct 2010 09:09:46 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1PAMo1-0005kv-30
	for linux-m68k@vger.kernel.org; Mon, 25 Oct 2010 15:09:41 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 25 Oct 2010 15:09:41 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 25 Oct 2010 15:09:41 +0200
In-Reply-To: <251136a28833a299adc3df54c1e2bdf4.squirrel@naiad.marenka.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: debian-68k@lists.debian.org

Stephen R. Marenka dixit:

>So I'm looking at the patches that are needed in the debian kernel and=
 I
>noticed quite a few haven't been sent upstream.
>
>git format-patch -o ../tmp v2.6.36..m68k-v2.6.36 lists 85 patches.
>
>Some of those are already marked for 2.6.37, but the atari/aranym patc=
hes
>seem to have been sitting around a while. Any chance they can go upstr=
eam?
>It would simplify debian kernel maintenance immensely.

Definitively. FWIW, I=E2=80=99m building all flavours of the following =
=2Edsc at
the moment (the m68k patches have no diff between the kernel I=E2=80=99=
m running
(linux-image-2.6.32-5+m68k.1-atari_2.6.32-24+m68k.1_m68k.deb) and that,
only the rest is rebased on a proper Debian sid released kernel):
https://www.freewrt.org/~tg/debs68k/notyet/linux-2.6_2.6.32-26+m68k.2.d=
sc
https://www.freewrt.org/~tg/debs68k/notyet/linux-2.6_2.6.32-26+m68k.2.d=
iff.gz

Stephen: Please do an SVN commit to the Debian repo, removing
bugfix/m68k/fp/0061-Keys-KEYCTL_SESSION_TO_PARENT-needs-TIF_NOTIFY_RESU=
=2Epatch
and taking over my 0026 and 0052 to make them apply again. As they=E2=80=
=99re
currently disabled, this should be okay with the other maintainers as
it=E2=80=99s a nop. Please look at the debdiff too:
https://www.freewrt.org/~tg/debs68k/notyet/linux-2.6_2.6.32-26+m68k.2.d=
ebdiff
Ignore 26-extra, it was just renamed; config/defines, which makes thing=
s
build for me and get rid of the gcc-4.3 dependency in the bootstrap rep=
o
I=E2=80=99m working on at the moment; config/i386/defines, which just m=
ade the
non-m68k part build faster (dpkg-buildpackage -A *still* does build the
binary-arch, it only doesn=E2=80=99t package them). The only other rele=
vant one
besides the three bugfix/m68k/fp/ ones above is patches/series/26+m68k.=
2
which enables them. Once I finished building and can boot into that ker=
-
nel image, and Ingo can boot into the amiga flavour, we can probably as=
k
Ben/waldi to allow them in (although waldi said 2.6.32 is of no interes=
t
any longer).

I suppose this also means that the ones listed in patches/series/26+m68=
k.2
will have been tested by me (or rather, actually are, just in a Debian
kernel, not a vanilla one).

=46WIW: I=E2=80=99ve built like three dozen packages in cowbuilder now,=
 satisfying
dependencies from debian-ports.org unstable+unreleased where needed, bu=
t
ordering them somewhat to get newer dependencies first, mostly. Another
half dozen needed for python2.6 and perl, but they all run the testsuit=
e
(openssl takes a LOT), and things look good, minus the gcc problems I
wrote about on the mailing list. debs68k/sources.txt if someone wants
to peek, but this is like unstable, and I regularly move packages aroun=
d
(to denote where a .deb came from: old sid, old unreleased, hand-built,
cowbuilder-built, or _all.deb copied from unstable), so apt-get update
is required relatively often.

bye,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
