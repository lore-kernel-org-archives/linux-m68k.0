From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/11] m68knommu: remove ColdFire sub-architecture directories
Date: Wed, 2 May 2012 11:16:11 +0200
Message-ID: <CAMuHMdWzjtD2C+AjxAi3v3B=aaMPX_RwNHpQZUt1U8jX6uC1cQ@mail.gmail.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61184 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740Ab2EBJQM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 May 2012 05:16:12 -0400
Received: by ghrr11 with SMTP id r11so423419ghr.19
        for <linux-m68k@vger.kernel.org>; Wed, 02 May 2012 02:16:12 -0700 (PDT)
In-Reply-To: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Greg,

On Wed, May 2, 2012 at 3:08 AM,  <gerg@snapgear.com> wrote:
> Move all the ColdFire sub-architecture code into the platform/coldfir=
e
> directory, and remove the sub-architecture directories. We already bu=
ild
> the common ColdFire components based on sub-architecture type anyway,
> so there is very little Makefile change required.

This looks like a weird diffstat:

> =C2=A0arch/m68k/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 10 ----------
> =C2=A0arch/m68k/platform/5206/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/520x/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
17 -----------------
> =C2=A0arch/m68k/platform/523x/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
17 -----------------
> =C2=A0arch/m68k/platform/5249/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/5272/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/527x/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/528x/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/5307/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
20 --------------------
> =C2=A0arch/m68k/platform/532x/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/5407/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
18 ------------------
> =C2=A0arch/m68k/platform/54xx/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
19 -------------------
> =C2=A0arch/m68k/platform/coldfire/Makefile =C2=A0 | =C2=A0 24 +++++++=
+++++++----------
> =C2=A0b/arch/m68k/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 --
> =C2=A0b/arch/m68k/platform/coldfire/Makefile | =C2=A0 =C2=A04 ++--

We already had these two files in the diffstat, with different values?

> =C2=A0b/arch/m68k/platform/coldfire/m5206.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m520x.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m523x.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m5249.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m5272.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m527x.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m528x.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m532x.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m5407.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/m54xx.c =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0b/arch/m68k/platform/coldfire/nettel.c | =C2=A0 =C2=A01 -

All of these are created, not deleted?

The actual patches look fine, though ;-)

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
