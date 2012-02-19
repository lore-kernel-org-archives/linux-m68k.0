From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] m68k: merge mmu and non-mmu versions of time.c
Date: Sun, 19 Feb 2012 11:10:15 +0100
Message-ID: <CAMuHMdU5vcfBc=DSgv=2w-xiFVwoP7_4jG+F04v-J_jE3O31WQ@mail.gmail.com>
References: <1328584190-30827-1-git-send-email-gerg@snapgear.com>
	<1328584190-30827-3-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:61730 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753168Ab2BSKKR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Feb 2012 05:10:17 -0500
Received: by wics10 with SMTP id s10so2348709wic.19
        for <linux-m68k@vger.kernel.org>; Sun, 19 Feb 2012 02:10:16 -0800 (PST)
In-Reply-To: <1328584190-30827-3-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Feb 7, 2012 at 04:09,  <gerg@snapgear.com> wrote:
> +int update_persistent_clock(struct timespec now)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return set_rtc_mmss(now.tv_sec);
> +}

This adds update_persistent_clock() for MMU, which was not present befo=
re.
It's only called if CONFIG_GENERIC_CMOS_UPDATE is set, but
arch/m68k/Kconfig has:

config GENERIC_CMOS_UPDATE
        def_bool !MMU

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
