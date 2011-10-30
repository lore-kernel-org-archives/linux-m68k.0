From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/36] m68k: modify user space access functions to support
 ColdFire CPUs
Date: Sun, 30 Oct 2011 14:02:53 +0100
Message-ID: <CAMuHMdVRvncpVWNa+2EUybv3+v+3PzQ4R_7-sqV71pVqQ67qoQ@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-7-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37755 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519Ab1J3NCy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:02:54 -0400
Received: by iaby12 with SMTP id y12so6084314iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:02:54 -0700 (PDT)
In-Reply-To: <1319527168-11166-7-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:18,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Modify the user space access functions to support the ColdFire V4e co=
res
> running with MMU enabled.
>
> The ColdFire processors do not support the "moves" instruction used b=
y
> the traditional 680x0 processors for moving data into and out of anot=
her
> address space. They only support the notion of a single address space=
,
> and you use the usual "move" instruction to access that.
>
> I am interrested in what others think if this approach. It is a littl=
e
> ugly, but it does mean that the same code is used, not a complete
> duplicate that is almost the same except for the "moves" instructions=
=2E
> It does also mean in this form that it is an either/or compile. It
> can't support both ColdFire and 680x0 in the same binary as it is.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

> +#ifdef CONFIG_COLDFIRE
> +/*
> + * The ColdFire processors do not support the moves instruction used=
 by
> + * the traditional 680x0 processors for moving data into and out of
> + * another address space. They only support the notion of a single a=
ddress
> + * space, and you use the usual move instruction to access that.
> + *
> + * All the user space access functions are otherwise the same on Col=
dFire
> + * as the other 680x0 processors. So lets keep the code simple and j=
ust
> + * define in what we need to use.
> + */
> +#define =C2=A0 =C2=A0 =C2=A0 =C2=A0MOVES =C2=A0 "move"
> +#else
> +#define =C2=A0 =C2=A0 =C2=A0 =C2=A0MOVES =C2=A0 "moves"
> +#endif /* CONFIG_COLDFIRE */

I did the same thing originally when trying to get uClinux running on
MMU-less Amigas, so it's fine for me.

If I'm not mistaken, this will also make it easier to merge uaccess.h a=
gain in
the long run, as the version with "move" should work on all MMU-less
platforms, right?

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
