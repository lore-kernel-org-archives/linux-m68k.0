From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] net: add support for NS8390 based eth controllers on
 some ColdFire boards
Date: Mon, 25 Jun 2012 09:59:46 +0200
Message-ID: <CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com>
References: <1340587792-8596-1-git-send-email-gerg@snapgear.com>
	<1340587792-8596-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:42954 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709Ab2FYH7r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Jun 2012 03:59:47 -0400
Received: by gglu4 with SMTP id u4so2573855ggl.19
        for <linux-m68k@vger.kernel.org>; Mon, 25 Jun 2012 00:59:47 -0700 (PDT)
In-Reply-To: <1340587792-8596-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Mon, Jun 25, 2012 at 3:29 AM,  <gerg@snapgear.com> wrote:
> =C2=A0arch/m68k/include/asm/mcfne.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0129 =
+---------

mcf8390.h?
mcfne.h is queued for removal.

> =C2=A0drivers/net/ethernet/8390/Kconfig =C2=A0 | =C2=A0 14 +
> =C2=A0drivers/net/ethernet/8390/Makefile =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/net/ethernet/8390/mcf8390.c | =C2=A0477 +++++++++++++++=
++++++++++++++++++++

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
