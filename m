From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/5 v2] m68k: merge mmu and non-mmu versions of time.c
Date: Wed, 22 Feb 2012 10:42:12 +0100
Message-ID: <CAMuHMdWwz8ou5fDKOb7Ef8fgn8aHCEzXigp1CBWqPc9w6+FUeg@mail.gmail.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
	<1329883136-9837-4-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:57402 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754939Ab2BVJmN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 04:42:13 -0500
Received: by wics10 with SMTP id s10so4066751wic.19
        for <linux-m68k@vger.kernel.org>; Wed, 22 Feb 2012 01:42:12 -0800 (PST)
In-Reply-To: <1329883136-9837-4-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Feb 22, 2012 at 04:58,  <gerg@snapgear.com> wrote:
> There is only trivial differences between the mmu time_mm.c and non-m=
mu
> time_no.c files. Merge them back into a single time.c.
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
