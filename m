From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/4] fbdev: fix section mismatches in q40fb.c
Date: Mon, 13 Sep 2010 20:14:52 +0200
Message-ID: <AANLkTimHxWHfqh2hP8SPvTD7rcXwiC4Ar-adENM3phwu@mail.gmail.com>
References: <1282324404-3480-1-git-send-email-henne@nachtwindheim.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:63304 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754457Ab0IMSOx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Sep 2010 14:14:53 -0400
In-Reply-To: <1282324404-3480-1-git-send-email-henne@nachtwindheim.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Henrik Kretzschmar <henne@nachtwindheim.de>
Cc: linux-fbdev@vger.kernel.org, arnaud.patard@rtp-net.org, u.kleine-koenig@pengutronix.de, jayakumar.lkml@gmail.com, tj@kernel.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

On Fri, Aug 20, 2010 at 19:13, Henrik Kretzschmar
<henne@nachtwindheim.de> wrote:
> This patch moves the q40_fix and q40_var structures from .init.data
> to .devinit.data.
> This is where now the probe function resides, which only uses them.
>
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>

Applied

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
