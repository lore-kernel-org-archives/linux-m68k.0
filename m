From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the MMU and non-MMU signal.c code
Date: Sun, 20 May 2012 10:55:18 +0200
Message-ID: <CAMuHMdWKfmY1cgeo9mMb7ctgmQ5gZb-b0S=QSkmQuNeLizGgWw@mail.gmail.com>
References: <1333428261-17382-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:59430 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982Ab2ETIzT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 May 2012 04:55:19 -0400
Received: by obbtb18 with SMTP id tb18so6434498obb.19
        for <linux-m68k@vger.kernel.org>; Sun, 20 May 2012 01:55:18 -0700 (PDT)
In-Reply-To: <1333428261-17382-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Apr 3, 2012 at 6:44 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The MMU (signal_mm.c) and non-MMU (signal_no.c) versions of the m68k
> architecture signal handling code are very similar. Most of there cod=
e is
> the same.
>
> Merge the two back into a single signal.c, and move some of the code =
around
> inside the file to minimize the number of #ifdefs required. Specifici=
ally
> we can group out the CONFIG_FPU and the CONFIG_MMU code. We end up ne=
eding
> a few other "#ifdef CONFIG_MMU" as well, but not too many.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

A bit late, but still
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
