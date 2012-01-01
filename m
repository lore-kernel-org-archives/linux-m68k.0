From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sun, 1 Jan 2012 09:47:15 +0100
Message-ID: <CAMuHMdWoJYkRJ8NnS8xLnmBF9+tyNYew+O9+0O=v6tD0MZzi8A@mail.gmail.com>
References: <1325264773.13595.133.camel@deadeye>
	<Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
	<Pine.BSM.4.64L.1112312254400.14351@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:51935 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751360Ab2AAIrR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 03:47:17 -0500
Received: by wgbdr13 with SMTP id dr13so25688860wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 01 Jan 2012 00:47:15 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1112312254400.14351@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, sfjro@users.sourceforge.net, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>

Hi Thorsten,

On Sat, Dec 31, 2011 at 23:55, Thorsten Glaser <tg@mirbsd.de> wrote:
> Dixi quod=E2=80=A6
>
>>This one does work:
>>http://lists.debian.org/debian-kernel/2011/12/msg00474.html
>
> Geert, would you please apply the attached patch, independent of
> whether we are able to find a solution in aufs, as it avoids an
> entire problem class?

Sorry, static inline functions are preferred over macros, unless there'=
s
a really good reason. Out-of-tree kernel code doing stupid things doesn=
't
count.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
