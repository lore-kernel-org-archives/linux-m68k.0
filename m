From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: allow ColdFire CPUs to use unaligned accesses
Date: Fri, 8 Jun 2012 09:19:15 +0200
Message-ID: <CAMuHMdWO2HsAP1Xe3cPbHAdUZsY4FyzgXFqy1Aud=ThGs2N=Mg@mail.gmail.com>
References: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:56109 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107Ab2FHHTQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 03:19:16 -0400
Received: by gglu4 with SMTP id u4so1042591ggl.19
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jun 2012 00:19:15 -0700 (PDT)
In-Reply-To: <1339134180-13630-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Jun 8, 2012 at 7:43 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> All current ColdFire CPUs are able to support unaligned memory access=
es.
> So remove the CONFIG_CPU_HAS_NO_UNALIGNED option selection for ColdFi=
re.
>
> It seems that the current restriction was inherrited from the early n=
on-MMU
> support for the basic 68000 proecssors - which do not support unalign=
ed
> accesses.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

I'll add this to my tree, as it depends on the other
CPU_HAS_NO_UNALIGNED patches.

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
