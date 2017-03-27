From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix warnings on use of test_bit()
Date: Mon, 27 Mar 2017 09:33:07 +0200
Message-ID: <CAMuHMdWog8m=DhqpKR5q2SqNn=8DGh2xuBX2M8Pgg26R9CVPEg@mail.gmail.com>
References: <1490584257-15959-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35168 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752043AbdC0HdV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Mar 2017 03:33:21 -0400
Received: by mail-it0-f68.google.com with SMTP id y18so9749245itc.2
        for <linux-m68k@vger.kernel.org>; Mon, 27 Mar 2017 00:33:15 -0700 (PDT)
In-Reply-To: <1490584257-15959-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Mon, Mar 27, 2017 at 5:10 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> Compiling for m68k targets will give the following warning:
>
> mm/filemap.c: In function =E2=80=98clear_bit_unlock_is_negative_byte=E2=
=80=99:
> mm/filemap.c:940:30: warning: passing argument 2 of =E2=80=98test_bit=E2=
=80=99 discards =E2=80=98volatile=E2=80=99 qualifier from pointer target ty=
pe [-Wdiscarded-qualifiers]
>   return test_bit(PG_waiters, mem);
>                               ^
> In file included from ./include/linux/bitops.h:36:0,
>                  from ./include/linux/kernel.h:10,
>                  from ./include/linux/list.h:8,
>                  from ./include/linux/wait.h:6,
>                  from ./include/linux/fs.h:5,
>                  from ./include/linux/dax.h:4,
>                  from mm/filemap.c:14:
> ./arch/m68k/include/asm/bitops.h:151:19: note: expected =E2=80=98const lo=
ng unsigned int *=E2=80=99 but argument is of type =E2=80=98volatile void *=
=E2=80=99
>  static inline int test_bit(int nr, const unsigned long *vaddr)
>                    ^
>
> (This is true at least for a gcc-5.4.0 based toolchain).
>
> The problem is that the m68k test_bit() arguments do not match the
> Documemtation/core-api/atomic_ops.rst defined one. (Most other
> architectures define it with "const volatile unsigned long *addr" too).
>
> Change the m68k test_bit() definition to more closely match the documente=
d
> definition. This cleans up the warning.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Already fixed and queued for v4.11, cfr. "[PATCH 2/2] m68k/bitops: Correct
signature of test_bit()" (https://lkml.org/lkml/2017/1/3/505).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
