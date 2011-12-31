From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sat, 31 Dec 2011 09:01:28 +0100
Message-ID: <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com>
References: <1325264773.13595.133.camel@deadeye>
	<9569.1325306817@jrobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:34193 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309Ab1LaIB3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Dec 2011 03:01:29 -0500
Received: by wgbdr13 with SMTP id dr13so24987418wgb.1
        for <linux-m68k@vger.kernel.org>; Sat, 31 Dec 2011 00:01:28 -0800 (PST)
In-Reply-To: <9569.1325306817@jrobl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: Ben Hutchings <ben@decadent.org.uk>, aufs-users@lists.sourceforge.net, Thorsten Glaser <tg@mirbsd.de>, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

On Sat, Dec 31, 2011 at 05:46,  <sfjro@users.sourceforge.net> wrote:
> +/* fs/aufs/Makefile refers this macro */
> +#define AUFS_NAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"a=
ufs"

If the Makefile refers to the macro, perhaps the Makefile should
define it, and pass it with -D?

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
