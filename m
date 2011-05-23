From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Mon, 23 May 2011 21:26:01 +0200
Message-ID: <BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
	<1303345491-27888-2-git-send-email-gerg@snapgear.com>
	<1303345491-27888-3-git-send-email-gerg@snapgear.com>
	<1303345491-27888-4-git-send-email-gerg@snapgear.com>
	<1303345491-27888-5-git-send-email-gerg@snapgear.com>
	<1303345491-27888-6-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50043 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932649Ab1EWT0E convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 May 2011 15:26:04 -0400
Received: by bwz15 with SMTP id 15so4994149bwz.19
        for <linux-m68k@vger.kernel.org>; Mon, 23 May 2011 12:26:02 -0700 (PDT)
In-Reply-To: <1303345491-27888-6-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Apr 21, 2011 at 02:24,  <gerg@snapgear.com> wrote:
> +#if defined(__mc68020__) || defined(__mc68030__) || \
> + =C2=A0 =C2=A0defined(__mc68040__) || defined(__mc68060__) || define=
d(__mcpu32__)

=46WIW, my m68k-linux-gnu-gcc (4.1.2 20061115 (prerelease)) always defi=
nes
__mc68000__ and __mc68020__, even when specifying -m68000 on the comman=
d
line.

__mc68030__, __mc68040__, __mc68060__, and __mcpu32__ are only defined
if -m68030, -m68040, -m68060, resp. -mcpu32 is specified on the command=
 line.

So the #ifdef always evaluates to true, and it tries to use the scale
factor for 68000,
which is rejected by the assembler.

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
