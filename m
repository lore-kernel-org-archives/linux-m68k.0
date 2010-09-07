From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Tue, 7 Sep 2010 22:45:31 +0200
Message-ID: <AANLkTik_kr7mnVDCrSjVFArB1G6gtRVKHQ74+-NPbir9@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:43896 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758298Ab0IGUpc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 16:45:32 -0400
Received: by iwn5 with SMTP id 5so5593291iwn.19
        for <linux-m68k@vger.kernel.org>; Tue, 07 Sep 2010 13:45:31 -0700 (PDT)
In-Reply-To: <AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Tue, Sep 7, 2010 at 22:35, Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> I applied all patches (except the hardirq one) and am currently
> building my test kernels.
> Now I see:
>
> | arch/m68k/kernel/entry.S: Assembler messages:
> | arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS* sectio=
n} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND* sectio=
n} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND* secti=
on} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND* secti=
on} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND* secti=
on} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND* secti=
on} - `THREAD_SIZE' {*UND* section}
>
> this is expanded from `GET_CURRENT'.
>
> continuing...

Several of the *.S files now need to include <asm/thread_info.h>, I gue=
ss.
Will try to look more into it tomorrow, if no one beats me to it.

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
