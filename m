From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Mon, 13 Sep 2010 20:22:02 +0200
Message-ID: <AANLkTikTbVXQNJ0-e3JgKPZ5mxJkWsW0=uUbXF82QK_z@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:33071 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753989Ab0IMSWE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Sep 2010 14:22:04 -0400
Received: by pvg2 with SMTP id 2so2244104pvg.19
        for <linux-m68k@vger.kernel.org>; Mon, 13 Sep 2010 11:22:03 -0700 (PDT)
In-Reply-To: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Tue, Sep 7, 2010 at 06:52, Greg Ungerer <gerg@snapgear.com> wrote:
> m68k/m68knommu: merge MMU and non-MMU string.h

I've applied the whole series:
      m68k: move definition of THREAD_SIZE into thread_info_mm.h
      m68k/m68knommu: merge MMU and non-MMU string.h
      m68k/m68knommu: merge machdep.h files into a single file
      m68k/m68knommu: clean up page.h
      m68k/m68knommu: merge MMU and non-MMU atomic.h
      m68k/m68knommu: merge MMU and non-MMU thread_info.h
      m68k/m68knommu: merge the MMU and non-MMU traps.h

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
