From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu versions of sys_m68k.c
Date: Sat, 21 May 2011 22:05:27 +0200
Message-ID: <BANLkTinRtyuC3dFstd8e8CXuas9A2NeA3A@mail.gmail.com>
References: <1303354504-30085-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:57334 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab1EUUF3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 May 2011 16:05:29 -0400
Received: by bwz15 with SMTP id 15so3754383bwz.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 May 2011 13:05:28 -0700 (PDT)
In-Reply-To: <1303354504-30085-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Apr 21, 2011 at 04:55,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> There is a lot of common code in the sys_m68k.c files. The mmu and no=
n-mmu
> versions can easily be merged into a single file.
>
> There is really only 2 functions that differ in the 2 cases. A single
> ifdef on CONFIG_MMU can take care of this. Alternatively we could bre=
ak
> those 2 functions out and maintain sys_m68k_no.c and sys_m68k_mm.c wi=
th
> just this code in it (Makefile could then just build the right one).
> Does anyone have strong feelings on which way they want this done?

I prefer one file with a few ifdefs, as it's more localized.

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
