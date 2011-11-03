From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: make fp register stores consistent for m68k and ColdFire
Date: Thu, 3 Nov 2011 09:23:05 +0100
Message-ID: <CAMuHMdVdwKG7jyTTi7Xbx11Avj=kLQL7wVV0gXwuZ71FQG5KPg@mail.gmail.com>
References: <1320299907-11410-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50627 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752238Ab1KCIXG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Nov 2011 04:23:06 -0400
Received: by faao14 with SMTP id o14so1245335faa.19
        for <linux-m68k@vger.kernel.org>; Thu, 03 Nov 2011 01:23:05 -0700 (PDT)
In-Reply-To: <1320299907-11410-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Nov 3, 2011 at 06:58,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> There is no reason we can't make the saved fp registers the same for =
all
> m68k types and ColdFire. There is a little wasted space, but the code
> consistentcy and cleanliness is a big win.

consistency

> sigcontext.h is an exported header, but currently there is no in-main=
line
> users of the !__uClinux__ and __mcoldfire__ case that this change eff=
ects.
> Even better this change actually makes this structure consistent with
> the out-of-mainline ColdFire/MMU code.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
