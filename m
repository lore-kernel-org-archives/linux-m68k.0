From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sun, 1 Jan 2012 14:48:50 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201011442550.20109@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112312254400.14351@herc.mirbsd.org>
 <CAMuHMdWoJYkRJ8NnS8xLnmBF9+tyNYew+O9+0O=v6tD0MZzi8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:21367 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752588Ab2AAPBG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 10:01:06 -0500
In-Reply-To: <CAMuHMdWoJYkRJ8NnS8xLnmBF9+tyNYew+O9+0O=v6tD0MZzi8A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, sfjro@users.sourceforge.net, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>

Geert Uytterhoeven dixit:

>Sorry, static inline functions are preferred over macros, unless there=
's

Can I have reasons? (Also out of curiosity.)

>a really good reason. Out-of-tree kernel code doing stupid things does=
n't

I see it like this:

EVERY file that, directly or indirectly, includes hardirq.h has the
overhead of having GCC compile that static inline function, even if
it=E2=80=99s never used (and thus never emitted into the object file). =
Also,
redefining pr_fmt appears to be a desired thing, not a stupid thing;
if a static inline function uses pr_fmt in the timeframe between it
being redefined and the redefined one=E2=80=99s prerequisites being ava=
ilab-
le, it would necessarily fail.

In contrast to that, a cpp macro is only evaluated when it=E2=80=99s ac=
tual-
ly needed, and by then, the prerequisites would probably be availab-
le. It also has less compile-time overhead (in this case, since the
hardirq.h file is probably included in more files than it is needed,
whereas macros slow down when you use them more than once in all fi-
les they=E2=80=99re defined in.

bye,
//mirabilos
--=20
Sometimes they [people] care too much: pretty printers [and syntax high=
ligh-
ting, d.A.] mechanically produce pretty output that accentuates irrelev=
ant
detail in the program, which is as sensible as putting all the preposit=
ions
in English text in bold font.	-- Rob Pike in "Notes on Programming in C=
"
