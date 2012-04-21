From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] m68k: delete unused MAX_NOINT_IPL definition
Date: Sat, 21 Apr 2012 22:18:44 +0200
Message-ID: <CAMuHMdV4CAMFK8krqfDwBnTi1Ow4C2qM+Rra_Bch30yvhz+baA@mail.gmail.com>
References: <20367.17967.190221.242729@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63420 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab2DUUSo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Apr 2012 16:18:44 -0400
Received: by iadi9 with SMTP id i9so277468iad.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 Apr 2012 13:18:44 -0700 (PDT)
In-Reply-To: <20367.17967.190221.242729@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-m68k@vger.kernel.org

On Thu, Apr 19, 2012 at 00:54, Mikael Pettersson <mikpe@it.uu.se> wrote=
:
> The MAX_NOINT_IPL macro is defined in m68k's <asm/entry.h> but not
> used anywhere in the kernel. =C2=A0Delete it. =C2=A0Tested on Atari.

Thanks, but I already had this removal queued for 3.5 anyway.

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
