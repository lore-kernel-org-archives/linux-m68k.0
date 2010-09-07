From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Tue, 7 Sep 2010 22:35:40 +0200
Message-ID: <AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61320 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758277Ab0IGUfl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 16:35:41 -0400
Received: by iwn5 with SMTP id 5so5586673iwn.19
        for <linux-m68k@vger.kernel.org>; Tue, 07 Sep 2010 13:35:41 -0700 (PDT)
In-Reply-To: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

On Tue, Sep 7, 2010 at 06:52, Greg Ungerer <gerg@snapgear.com> wrote:
> m68k/m68knommu: merge MMU and non-MMU string.h
>
> The MMU and non-MMU string.h varients (string_no.h and string_mm.h)
> and almost the same. Switch to using the string_mm.h one, merging
> in the necessary ColdFire support.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/include/asm/{string_mm.h =3D> string.h} | =C2=A0 16 +=
+--
> =C2=A0arch/m68k/include/asm/string_no.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0126 -----------------------
> =C2=A02 files changed, 9 insertions(+), 133 deletions(-)
> =C2=A0rename arch/m68k/include/asm/{string_mm.h =3D> string.h} (98%)
> =C2=A0delete mode 100644 arch/m68k/include/asm/string_no.h
>
> diff --git a/arch/m68k/include/asm/string_mm.h b/arch/m68k/include/as=
m/string.h
> similarity index 98%
> rename from arch/m68k/include/asm/string_mm.h
> rename to arch/m68k/include/asm/string.h
> index 2eb7df1..2936dda 100644
> --- a/arch/m68k/include/asm/string_mm.h
> +++ b/arch/m68k/include/asm/string.h

Thanks!

How do you apply such renaming patches? I thought git can handle them, =
but
`git am' just says:

| Applying: m68k/m68knommu: merge MMU and non-MMU string.h
| error: arch/m68k/include/asm/string.h: already exists in index
| Patch failed at 0001 m68k/m68knommu: merge MMU and non-MMU string.h
| When you have resolved this problem run "git am --resolved".
| If you would prefer to skip this patch, instead run "git am --skip".
| To restore the original branch and stop patching run "git am --abort"=
=2E

And according to "git status" no files have conflicts??

I ended up editing the patch to modify string_mm.h, and did the rename =
manually.

I applied all patches (except the hardirq one) and am currently
building my test kernels.
Now I see:

| arch/m68k/kernel/entry.S: Assembler messages:
| arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS*
section} - `THREAD_SIZE' {*UND* section}
| arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND*
section} - `THREAD_SIZE' {*UND* section}
| arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND*
section} - `THREAD_SIZE' {*UND* section}
| arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND*
section} - `THREAD_SIZE' {*UND* section}
| arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND*
section} - `THREAD_SIZE' {*UND* section}
| arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND*
section} - `THREAD_SIZE' {*UND* section}

this is expanded from `GET_CURRENT'.

continuing...

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
